# Transformation FML - POC - Mapping CDA to FHIR v0.1.0

## Transformation FML

### Introduction

La transformation CDA vers FHIR avec le FHIR Mapping Language repose sur un ensemble de règles permettant de parcourir le document source, d’en extraire les informations utiles et de les convertir vers les ressources FHIR attendues. Les principes de construction de ces règles, ainsi que les principaux patterns, limites et bonnes pratiques identifiés lors de leur implémentation, sont présentés ci-dessous.

### Vue d'ensemble du FHIR Mapping Language

Le FHIR Mapping Language (FML) est un langage déclaratif développé par HL7 pour transformer des données structurées d'un format à un autre. Il permet de définir des règles de transformation complexes de manière lisible et maintenable.

#### Caractéristiques principales

* **Déclaratif** : On décrit **ce que** l'on veut obtenir plutôt que **comment** le faire
* **Modulaire** : Possibilité d'importer et de réutiliser des mappings existants
* **Type-safe** : Vérification des types nécessaires pour permettre la transformation
* **Navigation XML/JSON** : Support natif pour parcourir des structures hiérarchiques

### Implémentation des transformations CDA vers FHIR en FHIR Mapping Language

Dans la continuité de la structuration en couches présentée précédemment, cette section décrit les principaux mécanismes utilisés pour implémenter les transformations CDA vers FHIR dans les fichiers FML. Elle présente concrètement la manière dont les règles de mapping permettent de parcourir la structure CDA, d’organiser les groupes de transformation, de convertir les données et de produire les ressources FHIR cibles.

#### Navigation dans la structure CDA

En FML, les règles de mapping permettent de parcourir la structure hiérarchique XML du document CDA à différents niveaux, depuis les composants principaux jusqu’aux entrées cliniques les plus imbriquées. Ce parcours peut être direct, conditionné par un filtrage, ou réalisé de manière plus profonde selon l’organisation interne des sections et des observations :

```
// Parcours simple
src.component as component -> tgt.section as section

// Parcours imbriqué avec filtrage
src.component.structuredBody.component as comp then {
  comp.section where(code.code = '11450-4') as section
    -> bundle.entry as entry, entry.resource = create('Observation') as obs
}

// Parcours profond des observations imbriquées
section.entry as entry then {
  entry.organizer as organizer then {
    organizer.component as orgComp then {
      orgComp.observation as observation -> ProcessObservation(observation, bundle)
    }
  }
}

```

#### Organisation des groupes de mapping et orchestration des transformations

En FML, les transformations sont structurées en groupes de mapping. Chaque groupe prend en charge une partie précise du traitement, tandis qu’un groupe principal orchestre l’ensemble de la transformation en appelant des groupes plus spécialisés. Cette organisation permet de séparer les responsabilités et de rendre le mapping plus lisible et plus facile à maintenir :

```
// Groupe principal : point d'entrée de la transformation
group CdaToBundle(source cda : ClinicalDocument, target bundle : Bundle) {
  cda -> bundle.type = 'document';
  cda -> bundle.id = uuid();

  // Orchestration des sous-groupes principaux
  cda then ClinicalDocumentComposition(cda, bundle);
  cda.recordTarget as recordTarget then PatientRoleToPatient(recordTarget, bundle);
  cda.component as component then StructuredBodyToSections(component, bundle);
}

// Sous-groupe dédié à la transformation du patient
group PatientRoleToPatient(source recordTarget, target bundle : Bundle) {
  recordTarget.patientRole as patientRole
    -> bundle.entry as entry, entry.resource = create('Patient') as patient then {
      patientRole -> patient;
    };
}

// Sous-groupe dédié au traitement des sections du document
group StructuredBodyToSections(source component, target bundle : Bundle) {
  component.structuredBody.component as comp then {
    comp.section as section then SectionToResource(section, bundle);
  };
}

```

#### Conversion des types de données et des terminologies

La transformation CDA vers FHIR implique également l’adaptation des types de données du modèle source vers les structures attendues dans les ressources FHIR. Cette conversion concerne notamment les éléments codés, dont les attributs doivent être réorganisés pour alimenter les objets FHIR correspondants, comme `CodeableConcept` :

```
// Conversion d'un code CDA (CD) vers CodeableConcept
group CDCodeableConcept(source src : CD, target tgt : CodeableConcept) {
  src -> tgt.coding as coding then {
    src.code as code -> coding.code = code;
    src.codeSystem as system -> coding.system = translate(system, '#oid2uri', 'uri');
    src.displayName as display -> coding.display = display;
  };
}

```

La même logique s’applique aux autres types CDA, comme les noms, les identifiants ou les quantités. Elle concerne également les terminologies, lorsqu’un code CDA doit être converti vers une valeur conforme aux jeux de codes attendus dans FHIR. Dans ce cas, deux approches peuvent être mises en œuvre :

**Approche 1 : ConceptMap externe**

```
// Référence à un ConceptMap chargé dans matchbox
src.administrativeGenderCode as gender
  -> tgt.gender = translate(gender,
     'http://example.org/ConceptMap/gender',
     'code')

```

**Approche 2 : Groupe de mapping personnalisé**

```
group MapGender(source src : CS, target tgt : code)
  src where(value = 'M') -> tgt.value = 'male'
  src where(value = 'F') -> tgt.value = 'female'
  src where(value = 'UN') -> tgt.value = 'other'
  src where(value = 'UNK') -> tgt.value = 'unknown'

```

#### Création des ressources FHIR et gestion des références

Les règles FML permettent de créer les ressources FHIR à partir des données extraites du CDA et de les ajouter au `Bundle` cible. Cette création s’accompagne généralement de l’attribution d’un identifiant interne, qui servira ensuite à construire les références entre les ressources produites.

```
// Création du Patient dans le Bundle
src.recordTarget as recordTarget then {
  recordTarget.patientRole as patientRole then {
    patientRole -> bundle.entry as entry,
                   entry.resource = create('Patient') as patient,
                   patient.id = uuid() as pid then {
      patientRole -> patient, bundle, pid, composition then
        ClinicalDocumentPatientRole(cda, patientRole, patient, bundle)
    }
  }
}

```

Pour assurer la cohérence des liens internes au `Bundle`, l’implémentation s’appuie souvent sur des identifiants temporaires générés dynamiquement, comme des UUID. Ces identifiants permettent de relier entre elles les ressources créées au cours de la transformation.

```
// Génération d'UUID pour les références internes au Bundle
entry.resource = create('Patient') as patient,
patient.id = uuid() as pid

// Utilisation de l'UUID dans une référence
reference.reference = ('urn:uuid:' + pid)

```

Ces identifiants sont ensuite réutilisés pour construire explicitement les références FHIR, par exemple lorsqu’une `Composition` doit désigner le `Patient` correspondant.

```
// Référence au Patient depuis la Composition
patient -> composition.subject = create('Reference') as reference,
           reference.reference = ('urn:uuid:' + pid)

```

Lorsque le document CDA contient des identifiants métier exploitables, ceux-ci peuvent également être repris dans les ressources FHIR. Cela permet de conserver les identifiants source utiles à l’interopérabilité, en complément des identifiants techniques utilisés pour les références internes.

```
// Identifiant INS-NIR (France)
patientRole.id as id where(root = '1.2.250.1.213.1.4.8') then {
  id -> patient.identifier as identifier then {
    id.extension as v -> identifier.value = v
    id.root as r -> identifier.system = translate(r, '#oid2uri', 'uri')
  }
}

```

#### Filtrage, conditions et adaptation des règles de mapping

Les règles FML intègrent des mécanismes de filtrage permettant de restreindre la transformation à certains éléments du document CDA. Ce filtrage peut s’appuyer, par exemple, sur la valeur d’un code de section ou sur un identifiant précis, afin de n’appliquer le mapping qu’aux données pertinentes.

```
// Filtrage d'une section par son code LOINC
comp.section where(code.code = '11450-4') as section
  -> ProcessVitalSigns(section, bundle)

// Filtrage d'un identifiant par son OID
patientRole.id as id where(root = '1.2.250.1.213.1.4.8')
  -> patient.identifier as identifier then INSIdentifier(id, identifier)

```

L’implémentation peut également reposer sur des conditions imbriquées, afin de tenir compte de la structure effective du document CDA. Cette logique permet de vérifier la présence de certains éléments avant d’appliquer une transformation plus spécifique, et de rendre ainsi le mapping plus robuste face aux variations de structure.

```
src.component as component then {
  component.structuredBody as body then {
    body.component as comp where(comp.section.exists()) then {
      comp.section where(code.code = '11450-4') as section
        -> ProcessSection(section, bundle)
    }
  }
}

```

### Patterns de mapping courants

#### Pattern 1 : Document CDA → Bundle FHIR

**Objectif** : Transformer un document CDA en Bundle de type document

```
group CdaToBundle(source cda : ClinicalDocument, target bundle : Bundle)
  cda -> bundle.type = 'document'
  cda -> bundle.id = uuid()
  cda -> bundle.entry as entry,
         entry.resource = create('Composition') as composition,
         composition.id = uuid() as cid then {
    cda then ClinicalDocumentComposition(cda, composition, bundle)
  }

```

### Pattern 2 : Réutilisation de fonctions importées

**Objectif** : Éviter la duplication en appelant des fonctions existantes

```
map "http://example.org/fml/CdaFrToBundle" = "CdaFrToBundle"

uses "http://example.org/fml/CdaToBundle" alias cdab as source
uses "http://example.org/fml/CdaToFHIRTypes" alias cdatyp as source

// Réutilisation de ClinicalDocumentComposition
cda then cdab.ClinicalDocumentComposition(cda, composition, bundle)

// Réutilisation de ENHumanName
patientRole.patient.name as name
  -> patient.name as pname then cdatyp.ENHumanName(name, pname)

```

### Pattern 3 : Navigation personnalisée pour structures complexes

**Objectif** : Extraire des observations imbriquées dans des organizers

```
group ExtractObservations(source section, target bundle)
  section.entry as entry then {
    entry.organizer as organizer then {
      organizer.component as orgComp then {
        orgComp.observation as obs
          -> bundle.entry as entry,
             entry.resource = create('Observation') as observation then {
          obs.code as code -> observation.code = create('CodeableConcept') as cc
            then CDCodeableConcept(code, cc)
          obs.value as value where(value.is(PQ))
            -> observation.value = create('Quantity') as qty
            then PQQuantity(value, qty)
        }
      }
    }
  }

```

### Pattern 4 : Mapping conditionnel selon le type

**Objectif** : Appliquer des transformations différentes selon le type de valeur

```
// Valeur quantitative
obs.value as value where(value.is(PQ))
  -> observation.value = create('Quantity') as qty then PQQuantity(value, qty)

// Valeur codée
obs.value as value where(value.is(CD))
  -> observation.value = create('CodeableConcept') as cc
  then CDCodeableConcept(value, cc)

// Valeur texte
obs.value as value where(value.is(ST))
  -> observation.value = create('string') as str, str.value = value

```

### Bonnes pratiques

#### Structurer une architecture de mapping modulaire

L’organisation du mapping CDA vers FHIR en couches permet de séparer les différents niveaux de transformation et de rendre l’architecture plus évolutive. Une première couche peut être consacrée aux types de données, une deuxième au squelette générique du document, puis des couches complémentaires peuvent porter sur les spécificités européennes, nationales et les cas métier. Cette structuration rend les règles FML plus lisibles, plus faciles à tester et plus simples à maintenir. Elle facilite également l’intégration progressive des évolutions des profils français et européens, en permettant d’adapter uniquement les couches concernées sans remettre en cause l’ensemble du mapping.

#### Définir une stratégie d’identification et de gestion des références

La définition d’une stratégie d’identification permet de générer des ressources FHIR avec des identifiants cohérents et des références internes fiables. Dans un Bundle, les ressources comme Composition, Patient, Organization, Practitioner ou Encounter doivent pouvoir être reliées correctement afin de préserver les liens issus du document CDA source. Cette stratégie contribue à limiter les références cassées, les doublons inutiles et les incohérences entre ressources.

#### Configurer et utiliser correctement l’environnement de validation

La validation des ressources FHIR produites repose sur un environnement configuré avec les profils, les extensions, les ValueSet et les systèmes de codes nécessaires. Elle permet de vérifier que le résultat du mapping respecte les contraintes structurelles et terminologiques attendues par les profils cibles. Cette étape aide à distinguer les erreurs liées aux règles de mapping, les erreurs liées aux contraintes des profils et les problèmes liés à la configuration de l’environnement de validation. Elle permet également d’identifier les écarts à corriger avant toute réutilisation ou généralisation du mapping.

#### Tester les groupes de mapping de manière progressive

Le test progressif des groupes de mapping permet de vérifier chaque niveau de transformation avant l’exécution complète du mapping. Cette approche facilite l’identification de l’origine des erreurs et limite le risque qu’un problème soit masqué par l’exécution globale de la transformation. Elle permet également de sécuriser progressivement chaque partie du processus avant de tester la génération complète du Bundle FHIR.

#### Documenter les choix de mapping, les hypothèses et les cas non couverts

La documentation des choix de mapping permet de rendre explicites les décisions prises pendant la transformation. Elle peut préciser les correspondances retenues, les hypothèses appliquées, les cas particuliers ainsi que les éléments non pris en charge. Cette traçabilité facilite la compréhension du comportement du mapping, la justification des choix effectués et la reprise du travail par d’autres personnes. Elle contribue également à éviter les interprétations implicites et à préparer les évolutions futures.

### Synthèse

Le FHIR Mapping Language présente un intérêt important pour formaliser une transformation CDA vers FHIR de manière explicite, structurée et réutilisable. Il permet d’organiser les règles de mapping, de produire les ressources FHIR attendues et de conserver la cohérence des liens entre les ressources générées.

### Ressources complémentaires

* [FHIR Mapping Language Specification](https://www.hl7.org/fhir/mapping-language.html)

