# Mécanisme du Mapping - POC - Mapping CDA to FHIR v0.1.0

* [**Table of Contents**](toc.md)
* **Mécanisme du Mapping**

## Mécanisme du Mapping

Cette page explique les différents mécanismes utilisés pour transformer des documents CDA (Clinical Document Architecture) en ressources FHIR à l'aide du FHIR Mapping Language (FML).

### Vue d'ensemble du FHIR Mapping Language

Le FHIR Mapping Language (FML) est un langage déclaratif développé par HL7 pour transformer des données structurées d'un format à un autre. Il permet de définir des règles de transformation complexes de manière lisible et maintenable.

#### Caractéristiques principales

* **Déclaratif** : On décrit **ce que** l'on veut obtenir plutôt que **comment** le faire
* **Modulaire** : Possibilité d'importer et de réutiliser des mappings existants
* **Type-safe** : Vérification des types lors de la compilation
* **Navigation XML/JSON** : Support natif pour parcourir des structures hiérarchiques

### Organisation des mappings en couches

#### Structure générale

Les mappings CDA vers FHIR sont organisés en couches afin de séparer les responsabilités et de faciliter la réutilisation des transformations. Chaque couche couvre un niveau précis du mapping et s’appuie sur les couches inférieure.

```
┌──────────────────────────────────────────────────┐
│   Mappings métier spécifiques                    │
│   (ex. CdaFrMDEToBundle, …)                      │
│   ← Traitement du corps du document CDA          │
│     selon le type de document                    │
└──────────────────────────────────────────────────┘
                    ↓ imports
┌──────────────────────────────────────────────────┐
│   CdaFrToBundle.fml                              │
│   ← Spécifications françaises                    │
│     (INS, IDNPS, profils AS, MOS, FINESS, etc.)  │
└──────────────────────────────────────────────────┘
                    ↓ imports
┌──────────────────────────────────────────────────┐
│   CdaToBundle.fml                                │
│   ← Mapping générique CDA → Bundle FHIR          │
│     (en‑tête CDA : Composition, Patient,         │
│      Encounter, Organization, Location…)         │        
└──────────────────────────────────────────────────┘
                    ↓ imports
┌──────────────────────────────────────────────────┐
│   CdaToFHIRTypes.fml                             │
│   ← Conversions des types de données CDA v3      │
│     (II, EN, AD, CD, PQ, TS, … → types FHIR)     │
└──────────────────────────────────────────────────┘

```

#### Description des couches de mapping

##### Mappings de conversion des types

Le fichier principal de cette couche est CdaToFHIRTypes.fml. Cette couche regroupe les mappings de conversion des types de données CDA v3 vers les types de données FHIR. Dans le contexte CDA, les datatypes représentent les structures élémentaires utilisées pour porter l’information dans le document : identifiants, noms, adresses, codes, dates, quantités, coordonnées de contact, etc. Avant de transformer un document CDA en ressources FHIR, il est donc nécessaire de convertir correctement ces types sources vers leurs équivalents FHIR. Cette couche contient ainsi les transformations de bas niveau permettant, par exemple, de convertir : II vers Identifier EN / PN vers HumanName AD vers Address TEL vers ContactPoint CD / CE / CS vers CodeableConcept ou code PQ vers Quantity TS / IVL_TS vers date, dateTime ou Period Elle constitue le socle commun de l’ensemble des autres mappings. Elle ne contient ni logique métier, ni logique nationale, ni navigation dans la structure du document CDA : son objectif est uniquement d’assurer la correspondance entre les types techniques manipulés dans les mappings.

À compléter : un tableau de correspondance entre les principaux datatypes CDA et les types FHIR associés pourra être ajouté ici pour faciliter la lecture et la réutilisation des mappings.

##### Mappings CDA génériques

Le fichier principal de cette couche est `CdaToBundle.fml`.

Cette couche regroupe les mappings génériques permettant de transformer la structure commune d’un document CDA en un `Bundle` FHIR. Elle couvre principalement les éléments de l’en-tête CDA, c’est-à-dire les informations documentaires et contextuelles présentes quel que soit le type de document traité.

Les transformations implémentées dans cette couche concernent notamment : *la création du `Bundle` ; *la création de la `Composition` ; *le mapping du `Patient` ; *le mapping du contexte de prise en charge (`Encounter`, `Location`) ; *le mapping des acteurs et des structures (`Practitioner`, `PractitionerRole`, `Organization`) ; *la gestion des identifiants techniques et des références internes au Bundle.

Cette couche implémente le mapping générique des éléments communs du document CDA vers FHIR. Elle réutilise les conversions de types déjà définies dans la couche inférieure et n’intègre ni logique nationale ni logique métier spécifique.

##### Spécifications françaises

Le fichier principal de cette couche est `CdaFrToBundle.fml`.

Cette couche applique les spécifications françaises au mapping générique CDA vers FHIR. Elle permet d’enrichir les ressources FHIR produites avec les profils, identifiants, terminologies et extensions attendus dans le cadre d’implémentation français.

Les adaptations portées par cette couche concernent notamment : *l’application de profils français, par exemple `FR-Core` et `Annuaire Santé` ; *la gestion des identifiants nationaux, tels que `INS-NIR` pour le patient, `IDNPS` pour les professionnels de santé et `FINESS` pour les organisations ; *l’utilisation de terminologies nationales, notamment les jeux de valeurs `MOS` ; *l’ajout d’extensions ou de spécialisations propres au contexte français.

Cette couche s’applique aux ressources génériques déjà produites à partir de l’en-tête du document CDA. Elle ne redéfinit pas le mapping générique, mais complète les groupes existants lorsque cela est nécessaire afin d’isoler clairement les spécificités françaises.

Elle ne traite pas le corps du document CDA. Les sections cliniques, organizers, observations et autres contenus métier restent pris en charge dans la couche de mappings spécifiques métier.

##### Mappings spécifiques métier

Cette couche regroupe plusieurs fichiers de mapping, chacun correspondant à un type de document CDA ou à un contexte métier particulier. Le fichier `CdaFrMDEToBundle` constitue l’un de ces mappings et est utilisé dans ce guide comme exemple de mapping métier.

Contrairement aux couches précédentes, cette couche traite le corps du document CDA. Elle implémente la navigation dans les sections cliniques et transforme les structures métier du document en ressources FHIR adaptées.

Les traitements réalisés à ce niveau concernent notamment : *la navigation dans les `section` ; *l’accès aux `entry`, `organizer` et `observation` ; *l’extraction des données cliniques propres au document traité ; *la création des ressources FHIR métier correspondantes, par exemple `Observation`.

Cette couche réutilise les mappings génériques et nationaux déjà définis pour l’en-tête du document, puis ajoute les règles spécifiques nécessaires au contenu clinique du document concerné.

Chaque fichier de cette couche correspond donc à une implémentation ciblée, construite à partir du même socle commun mais adaptée à un besoin métier précis.

> Remarque : Pour les couches — mappings CDA génériques, spécifications françaises et mappings spécifiques métier — les correspondances détaillées CDA et FHIR sont à consulter dans le guide d’implémentation Document Core : `https://ansforge.github.io/interop-IG-document-core/main/ig/`. Ce guide présente de manière structurée les correspondances entre modèle logique, CDA et FHIR

#### Réutilisation entre les couches

Les couches de mapping sont construites de manière progressive. Chaque couche réutilise les mappings définis dans les couches inférieures à l’aide du mécanisme `imports`, puis ajoute les transformations correspondant à son propre niveau de spécialisation.

Cette organisation permet : *de mutualiser les transformations communes ; *d’éviter la duplication des règles ; *d’isoler les spécificités génériques, nationales et métier dans des couches distinctes.

### Implémentation des transformations CDA vers FHIR en FHIR Mapping Language

Cette section décrit les principaux mécanismes utilisés pour implémenter les transformations CDA vers FHIR dans les fichiers FML. Elle se concentre sur la mise en œuvre concrète des règles de mapping, notamment la navigation dans la structure CDA, la conversion des données, la création des ressources FHIR et l’orchestration des groupes de transformation.

#### Navigation dans la structure CDA

#### Groupes de mapping et orchestration des transformations

#### Conversion des types de données et des terminologies

#### Création des ressources FHIR et gestion des références

#### Filtrage, conditions et variations de mapping

## Mécanismes de transformation

### 1. Navigation dans l'arbre CDA

Le FML permet de naviguer dans la structure hiérarchique XML du document CDA :

```
// Navigation simple
src.component as component -> tgt.section as section

// Navigation imbriquée avec filtrage
src.component.structuredBody.component as comp then {
  comp.section where(code.code = '11450-4') as section
    -> bundle.entry as entry, entry.resource = create('Observation') as obs
}

// Navigation profonde pour observations imbriquées
section.entry as entry then {
  entry.organizer as organizer then {
    organizer.component as orgComp then {
      orgComp.observation as observation -> ProcessObservation(observation, bundle)
    }
  }
}

```

### 2. Conversion de types de données

#### Types primitifs CDA → FHIR

Le mapping `CdaToFHIRTypes.fml` fournit des fonctions de conversion pour les types de données CDA v3 :

**Nom de personne (EN → HumanName)** :

```
group ENHumanName(source src : EN, target tgt : HumanName)
  src.given as v -> tgt.given = v
  src.family as v -> tgt.family = v
  src.prefix as v -> tgt.prefix = v
  src.suffix as v -> tgt.suffix = v

```

**Code (CD → CodeableConcept)** :

```
group CDCodeableConcept(source src : CD, target tgt : CodeableConcept)
  src -> tgt.coding as coding then {
    src.code as code -> coding.code = code
    src.codeSystem as system -> coding.system = translate(system, '#oid2uri', 'uri')
    src.displayName as display -> coding.display = display
  }

```

**Quantité physique (PQ → Quantity)** :

```
group PQQuantity(source src : PQ, target tgt : Quantity)
  src.value as v -> tgt.value = v
  src.unit as u -> tgt.unit = u, tgt.code = u

```

#### Conversion de codes terminologiques

Deux approches sont utilisées :

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

### 3. Création de ressources FHIR

#### Création avec référence

Les ressources sont créées dans le Bundle et référencées entre elles :

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

// Référence au Patient depuis la Composition
patient -> composition.subject = create('Reference') as reference,
           reference.reference = ('urn:uuid:' + pid)

```

#### Gestion des identifiants

**Identifiants temporaires (UUID)** :

```
// Génération d'UUID pour les références internes au Bundle
entry.resource = create('Patient') as patient,
patient.id = uuid() as pid

// Utilisation de l'UUID dans une référence
reference.reference = ('urn:uuid:' + pid)

```

**Identifiants métier** :

```
// Identifiant INS-NIR (France)
patientRole.id as id where(root = '1.2.250.1.213.1.4.8') then {
  id -> patient.identifier as identifier then {
    id.extension as v -> identifier.value = v
    id.root as r -> identifier.system = translate(r, '#oid2uri', 'uri')
  }
}

```

### 4. Groupes de mapping

Les groupes sont l'unité fonctionnelle de base du FML :

```
// Groupe principal (point d'entrée)
group CdaToBundle(source cda : ClinicalDocument, target bundle : Bundle)
  cda -> bundle.type = 'document'
  cda -> bundle.id = uuid()

  // Appel de sous-groupes
  cda then ClinicalDocumentComposition(cda, bundle)
  cda.recordTarget as recordTarget then PatientRole(recordTarget, bundle)

```

**Types de groupes** :

* **Groupe principal** : Point d'entrée de la transformation
* **Groupes réutilisables** : Fonctions appelées par d'autres mappings
* **Groupes conditionnels** : Appliqués selon des critères

### 5. Filtrage et conditions

#### Filtrage par code

```
// Filtrer une section par son code LOINC
comp.section where(code.code = '11450-4') as section
  -> ProcessVitalSigns(section, bundle)

// Filtrer un identifiant par son OID
patientRole.id as id where(root = '1.2.250.1.213.1.4.8')
  -> patient.identifier as identifier then INSIdentifier(id, identifier)

```

#### Conditions imbriquées

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

## Patterns de mapping courants

### Pattern 1 : Document CDA → Bundle FHIR

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

## Limitations et contraintes

### 1. Navigation XML et état du parser

**Problème** : Le parser XML peut rencontrer des conflits lorsque plusieurs fonctions tentent de parcourir les mêmes éléments du document CDA.

**Erreur typique** :

```
HAPI-0389: Failed to call access method: org.hl7.fhir.exceptions.FHIRFormatError:
The QName 'urn:hl7-org:v3::ClinicalDocument' does not match the expected QName

```

**Solution** :

* Éviter de parcourir les mêmes éléments XML depuis plusieurs groupes de mapping
* Privilégier la réutilisation de fonctions de conversion de types plutôt que de navigation
* Créer une navigation personnalisée pour les structures non couvertes par les mappings de base

### 2. Support de translate()

**Problème** : La fonction `translate()` pour les ConceptMaps peut ne pas être supportée dans toutes les versions de matchbox.

**Solution** : Utiliser des groupes de mapping personnalisés pour les conversions de codes simples :

```
group MapGender(source src : CS, target tgt : code)
  src where(value = 'M') -> tgt.value = 'male'
  src where(value = 'F') -> tgt.value = 'female'
  // etc.

```

### 3. Ordre de chargement

**Contrainte** : Les ressources doivent être chargées dans matchbox dans un ordre spécifique :

1. ConceptMaps (si utilisés)
1. StructureMaps de base (CdaToFHIRTypes)
1. StructureMaps intermédiaires (CdaToBundle)
1. StructureMaps spécifiques (CdaFrToBundle, CdaFrMDEToBundle)

**Raison** : Les dépendances entre mappings doivent être résolues lors du chargement.

### 4. Gestion des extensions

**Limitation** : Les extensions FHIR doivent être créées explicitement et ne sont pas automatiquement générées.

**Exemple** :

```
// Ajout d'une extension personnalisée
patient -> patient.extension as ext then {
  ext -> ext.url = 'http://example.org/fhir/Extension/customField'
  src.customValue as val -> ext.value = create('string') as v, v.value = val
}

```

## Bonnes pratiques

### 1. Modularité

* Créer des groupes réutilisables pour chaque type de transformation
* Séparer les conversions de types des transformations métier
* Documenter les dépendances entre mappings

### 2. Nommage

* Utiliser des noms explicites pour les groupes (`ClinicalDocumentComposition` plutôt que `Transform1`)
* Préfixer les paramètres : `src` pour source, `tgt` pour target
* Suivre les conventions de nommage FHIR pour les ressources

### 3. Gestion des erreurs

* Utiliser `where()` pour filtrer les valeurs avant transformation
* Vérifier l'existence des éléments avec `.exists()`
* Documenter les cas non gérés

### 4. Performance

* Minimiser les parcours multiples du document source
* Regrouper les transformations liées dans un même groupe
* Utiliser les imports pour éviter la duplication

### 5. Testabilité

* Créer des exemples CDA représentatifs
* Tester chaque couche de mapping indépendamment
* Valider les Bundles FHIR générés avec un validateur

## Exemple complet : CdaFrMDEToBundle

Le mapping `CdaFrMDEToBundle.fml` illustre l'application de ces mécanismes pour transformer un document CSE-MDE (Carnet de Santé de l'Enfant - Mesures) français en Bundle FHIR.

### Architecture

```
map "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/StructureMap/CdaFrMDEToBundle"
  = "CdaFrMDEToBundle"

uses "http://hl7.org/fhir/cda/StructureDefinition/ClinicalDocument" alias ClinicalDocument as source
uses "http://hl7.org/fhir/StructureDefinition/Bundle" alias Bundle as target

imports "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/StructureMap/CdaToFHIRTypes"
imports "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/StructureMap/CdaToBundle"
imports "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/StructureMap/CdaFrToBundle"

```

### Stratégie de transformation

1. **Réutilisation des mappings de base**:
* `ClinicalDocumentComposition` : Crée la Composition et les ressources contextuelles
* `ClinicalDocumentPatientRole` : Transforme le Patient avec identifiant INS-NIR

1. **Navigation personnalisée**:
* Parcours de `component > structuredBody > component > section > entry > organizer > component > observation`
* Extraction des observations de mesures (poids, taille, périmètre crânien)

1. **Conversion de types**:
* Utilisation de `CDCodeableConcept` pour les codes LOINC
* Utilisation de `PQQuantity` pour les valeurs avec unités

### Résultat

Pour un document CSE-MDE avec 3 observations, le mapping génère :

* 1 Bundle de type document
* 1 Composition (métadonnées)
* 1 Patient (avec INS-NIR)
* 1 Encounter (contexte)
* 1 Location
* 2 Practitioner
* 2 Organization
* 3 Observation (Poids, Taille, Périmètre crânien)

Total : **11 ressources FHIR**

## Ressources complémentaires

* [FHIR Mapping Language Specification](https://www.hl7.org/fhir/mapping-language.html)
* [FHIR StructureMap Resource](https://www.hl7.org/fhir/structuremap.html)
* [Matchbox Documentation](https://github.com/ahdis/matchbox)
* [CDA to FHIR Maps (HL7 Suisse)](https://github.com/hl7ch/cda-fhir-maps)
* [Notes techniques de développement](claude.md)

## Conclusion

Le FHIR Mapping Language offre un mécanisme puissant et déclaratif pour transformer des documents CDA en ressources FHIR. La clé du succès réside dans :

* Une architecture modulaire en couches
* La réutilisation intelligente des mappings existants
* Une navigation ciblée pour les structures spécifiques
* La gestion appropriée des limitations du parser XML

Cette approche permet de créer des mappings maintenables, testables et évolutifs pour supporter la transition CDA vers FHIR dans le contexte de l'Espace Européen des Données de Santé.

