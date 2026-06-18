---
title: Mécanismes de mapping
layout: default
active: mapping-mechanisms
---

Cette page explique les mécanismes de transformation d'un document CDA de type Patient Summary vers des ressources FHIR à l'aide du FHIR Mapping Language (FML).

### Vue d'ensemble du FHIR Mapping Language

Le FHIR Mapping Language (FML) est un langage déclaratif développé par HL7 pour transformer des données structurées d'un format à un autre. Il permet de définir des règles de transformation complexes de manière lisible et maintenable.

#### Caractéristiques principales

* **Déclaratif** : On décrit *ce que* l'on veut obtenir plutôt que *comment* le faire
* **Modulaire** : Possibilité d'importer et de réutiliser des mappings existants
* **Type-safe** : Vérification des types nécessaires pour permettre la transformation
* **Navigation XML/JSON** : Support natif pour parcourir des structures hiérarchiques


### Organisation des mappings en couches

#### Structure générale

Les mappings CDA vers FHIR sont organisés en couches afin de séparer les responsabilités et de faciliter la réutilisation des transformations.
Chaque couche couvre un niveau précis du mapping et s’appuie sur les couches inférieure.
```
┌──────────────────────────────────────────────────┐
│   CdaPatientSummaryToBundle.fml                  │
│   ← Mapping du corps structuré du document       │
│      Patient Summary                             │
│                                                  │
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

Le fichier principal de cette couche est CdaToFHIRTypes.fml.
Cette couche regroupe les mappings de conversion des types de données CDA v3 vers les types de données FHIR.
Dans le contexte CDA, les datatypes représentent les structures élémentaires utilisées pour porter l’information dans le document : identifiants, noms, adresses, codes, dates, quantités, coordonnées de contact, etc. Avant de transformer un document CDA en ressources FHIR, il est donc nécessaire de convertir correctement ces types sources vers leurs équivalents FHIR.
Cette couche contient ainsi les transformations de bas niveau permettant, par exemple, de convertir :
II vers Identifier
EN / PN vers HumanName
AD vers Address
TEL vers ContactPoint
CD / CE / CS vers CodeableConcept ou code
PQ vers Quantity
TS / IVL_TS vers date, dateTime ou Period
Elle constitue le socle commun de l’ensemble des autres mappings.
Elle ne contient ni logique métier, ni logique nationale, ni navigation dans la structure du document CDA : son objectif est uniquement d’assurer la correspondance entre les types techniques manipulés dans les mappings.

## Vérification des ConceptMap générés

{% sql {
  "query": "
SELECT
  json_extract(r.json, '$.id') AS id,
  json_extract(r.json, '$.name') AS name
FROM Resources r
WHERE r.Type = 'ConceptMap'
ORDER BY id
",
  "class": "grid",
  "columns": [
    { "name": "ID", "source": "id" },
    { "name": "Name", "source": "name" }
  ]
} %}

##### Mappings CDA génériques

Le fichier principal de cette couche est `CdaToBundle.fml`.

Cette couche porte le mapping générique de la structure commune d’un document CDA vers un Bundle FHIR, en s’appuyant sur les transformations de types définies dans la couche inférieure (`CdaToFHIRTypes`).

Elle traite principalement les éléments transverses du document, en particulier l’en-tête CDA, ainsi qu’une structure de base du corps du document.

Les transformations couvertes dans cette couche incluent notamment :

* la création du `Bundle` ;
* la création de la `Composition` ;
* le mapping de `documentIdentity`, c’est-à-dire les identifiants permettant de reconnaître le document et sa version ;
* le mapping de `documentDescription`, notamment son type, son titre, sa date, sa langue ou encore ses métadonnées principales ;
* le mapping de `recordTarget`, qui correspond au patient concerné par le document ;
* le mapping de `custodian`, c’est-à-dire l’organisation responsable de la conservation et de la mise à disposition du document ;
* le mapping de `author`, qui peut correspondre au professionnel ou à l’acteur ayant produit le document ;
* le mapping de `legalAuthenticator`, c’est-à-dire la personne qui valide officiellement le document ;
* le mapping de `encounterContext`, notamment le contexte de soin, à travers les ressources `Encounter` et `Location` ;
* le mapping de `documentationOf`, qui permet de relier le document à l’acte, au séjour ou à l’événement clinique documenté ;
* le mapping de `emergencyContact`, qui correspond aux contacts d’urgence du patient ;
* le mapping de `trustedPerson`, qui correspond aux personnes de confiance ;
* le mapping de `guardian`, qui correspond aux représentants légaux ;
* le mapping de `relatedDocument`, par exemple un document remplacé, complété ou associé ;
* le mapping des acteurs et des structures impliqués dans le document, notamment `Practitioner`, `PractitionerRole` et `Organization` ;
* la gestion des identifiants techniques et des références internes au `Bundle` ;
* la reprise de la structure des sections du document dans `Composition.section`.

Cette couche implémente donc le socle commun de transformation CDA → FHIR, indépendant des contraintes nationales et des règles métier spécifiques.

<div style="text-align:center; margin: 2rem auto 2.5rem auto; max-width:950px;">
{% include schema-etape2.svg %}
</div>
<br clear="all"/>

##### Spécifications européennes et françaises

Le fichier principal de cette couche est `CdaFrToBundle.fml`.

Cette couche reprend le mapping documentaire générique produit par `CdaToBundle.fml` afin d’y intégrer les spécifications européennes et françaises applicables au `Patient Summary`.

Les spécifications européennes concernent principalement les ressources documentaires structurantes, à savoir le `Bundle` et la `Composition`. L’objectif est de rapprocher la structure FHIR produite des exigences du profil européen `HL7 Europe Patient Summary (EPS)`, actuellement en cours de concertation . 

Les spécifications françaises s’appliquent aux ressources génériques déjà produites à partir de l’en-tête CDA et référencées par le `Bundle` ou la `Composition`. Elles s’appuient principalement sur les guides d’implémentation français `FR Core` et `Annuaire Santé`, afin d’ajouter les profils, identifiants, terminologies et extensions requis dans le contexte français.

Cette couche complète donc le socle commun CDA vers FHIR sans redéfinir le mapping générique réalisé dans la couche précédente. Elle ne traite pas le corps du document CDA. Les sections cliniques seront prises en charge dans la couche de mappings spécifiques métier.

Cette couche constitue une étape d’enrichissement du socle commun CDA vers FHIR. Elle complète le mapping générique établi à l’étape 2 en y intégrant les spécifications françaises et européennes. Le mapping des sections cliniques sera, quant à lui, abordé lors de l’étape 4.

<div style="text-align:center; margin: 2rem auto 2.5rem auto; max-width:950px;">
{% include schema-etape3.svg %}
</div>
<br clear="all"/>

##### Mappings spécifiques métier : Patient Summary

Le fichier principal de cette couche est `CdaPatientSummaryToBundle.fml`.

Cette couche correspond au mapping spécifique métier du `Patient Summary`. Elle réutilise le socle documentaire générique déjà enrichi par les spécifications françaises et européennes, notamment pour l’en-tête CDA, puis ajoute les règles nécessaires au mapping du contenu clinique porté par le corps du document.

Pour le corps CDA, cette couche s’appuie sur la structure documentaire initialisée dans les couches précédentes, en particulier la reprise des sections dans `Composition.section`. Elle complète ce premier niveau descriptif par le mapping des contenus cliniques présents dans les sections du `Patient Summary`.

Le mapping réalisé à ce niveau concerne notamment :

* l’identification des sections propres au `Patient Summary`, comme les problèmes de santé, les allergies et intolérances, les traitements, les antécédents familiaux, les vaccinations, les actes, les effets indésirables, les signes vitaux, le mode de vie, les risques professionnels et les résultats ;
* l’accès aux `entry` présentes dans ces sections ;
* le mapping des éléments cliniques contenus dans ces `entry` ;
* l’extraction des données cliniques portées par ces éléments ;
* le mapping de ces données vers les ressources FHIR métier adaptées, par exemple `Condition`, `AllergyIntolerance`, `MedicationStatement`, `Procedure`, `Immunization` ou `Observation` ;
* le rattachement des ressources métier aux sections correspondantes de la `Composition`, afin de conserver l’organisation documentaire du `Patient Summary` ;

Cette couche complète ainsi le mapping du corps du document CDA en ajoutant les règles nécessaires à la représentation FHIR des données cliniques propres au `Patient Summary`.

<div style="text-align:center; margin: 2rem auto 2.5rem auto; max-width:1050px;">
{% include schema-etape4.svg %}
</div>
<br clear="all"/>

> Remarque : Pour les couches — mappings CDA génériques, spécifications françaises et mappings spécifiques métier — les correspondances détaillées CDA et FHIR sont à consulter dans le guide d’implémentation Document Core : `https://ansforge.github.io/interop-IG-document-core/main/ig/`. Ce guide présente de manière structurée les correspondances entre modèle logique, CDA et FHIR

#### Réutilisation entre les couches

Les couches de mapping sont construites de manière progressive. Chaque couche réutilise les mappings définis dans les couches inférieures à l’aide du mécanisme `imports`, puis ajoute les transformations correspondant à son propre niveau de spécialisation.

Cette organisation permet :
*de mutualiser les transformations communes ;
*d’éviter la duplication des règles ;
*d’isoler les spécificités génériques, nationales et métier dans des couches distinctes.




### Implémentation des transformations CDA vers FHIR en FHIR Mapping Language

Dans la continuité de la structuration en couches présentée précédemment, cette section décrit les principaux mécanismes utilisés pour implémenter les transformations CDA vers FHIR dans les fichiers FML. Elle présente concrètement la manière dont les règles de mapping permettent de parcourir la structure CDA, d’organiser les groupes de transformation, de convertir les données et de produire les ressources FHIR cibles.

#### Navigation dans la structure CDA

En FML, les règles de mapping permettent de parcourir la structure hiérarchique XML du document CDA à différents niveaux, depuis les composants principaux jusqu’aux entrées cliniques les plus imbriquées. Ce parcours peut être direct, conditionné par un filtrage, ou réalisé de manière plus profonde selon l’organisation interne des sections et des observations :

```fml
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

```fml
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

```fml
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

```fml
// Référence à un ConceptMap chargé dans matchbox
src.administrativeGenderCode as gender
  -> tgt.gender = translate(gender,
     'http://example.org/ConceptMap/gender',
     'code')
```

**Approche 2 : Groupe de mapping personnalisé**

```fml
group MapGender(source src : CS, target tgt : code)
  src where(value = 'M') -> tgt.value = 'male'
  src where(value = 'F') -> tgt.value = 'female'
  src where(value = 'UN') -> tgt.value = 'other'
  src where(value = 'UNK') -> tgt.value = 'unknown'
```

#### Création des ressources FHIR et gestion des références

Les règles FML permettent de créer les ressources FHIR à partir des données extraites du CDA et de les ajouter au `Bundle` cible. Cette création s’accompagne généralement de l’attribution d’un identifiant interne, qui servira ensuite à construire les références entre les ressources produites.

```fml
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

```fml
// Génération d'UUID pour les références internes au Bundle
entry.resource = create('Patient') as patient,
patient.id = uuid() as pid

// Utilisation de l'UUID dans une référence
reference.reference = ('urn:uuid:' + pid)
```

Ces identifiants sont ensuite réutilisés pour construire explicitement les références FHIR, par exemple lorsqu’une `Composition` doit désigner le `Patient` correspondant.

```fml
// Référence au Patient depuis la Composition
patient -> composition.subject = create('Reference') as reference,
           reference.reference = ('urn:uuid:' + pid)
```

Lorsque le document CDA contient des identifiants métier exploitables, ceux-ci peuvent également être repris dans les ressources FHIR. Cela permet de conserver les identifiants source utiles à l’interopérabilité, en complément des identifiants techniques utilisés pour les références internes.

```fml
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

```fml
// Filtrage d'une section par son code LOINC
comp.section where(code.code = '11450-4') as section
  -> ProcessVitalSigns(section, bundle)

// Filtrage d'un identifiant par son OID
patientRole.id as id where(root = '1.2.250.1.213.1.4.8')
  -> patient.identifier as identifier then INSIdentifier(id, identifier)
```

L’implémentation peut également reposer sur des conditions imbriquées, afin de tenir compte de la structure effective du document CDA. Cette logique permet de vérifier la présence de certains éléments avant d’appliquer une transformation plus spécifique, et de rendre ainsi le mapping plus robuste face aux variations de structure.

```fml
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

```fml
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

```fml
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

```fml
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

```fml
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

### Limitations et contraintes

#### 2. Support de `translate()`

La fonction `translate()`, utilisée pour exploiter des `ConceptMap`, peut ne pas être disponible ou pleinement supportée selon la version du moteur de transformation utilisée. Cette dépendance peut limiter la portabilité de certains mappings.

**Conséquence** :
* certaines conversions terminologiques échouent ou nécessitent une solution alternative.

**Recommandation** :
pour les correspondances simples et stables, il est souvent préférable d’utiliser des groupes de mapping personnalisés :

```fml
group MapGender(source src : CS, target tgt : code)
  src where(value = 'M') -> tgt.value = 'male'
  src where(value = 'F') -> tgt.value = 'female'
  src where(value = 'UN') -> tgt.value = 'other'
  src where(value = 'UNK') -> tgt.value = 'unknown'
```


#### 3. Absence d’équivalence terminologique dans la cible

La conversion terminologique repose sur l’existence d’une correspondance exploitable entre le code source CDA et la terminologie cible attendue en FHIR. Or, dans certains cas, aucun code strictement équivalent n’existe dans le système cible, ou bien la correspondance disponible reste partielle, ambiguë ou dépendante du contexte métier.

**Conséquences** :
* impossibilité de produire un codage cible strictement équivalent ;
* risque de perte sémantique lors de la transformation ;
* nécessité de conserver uniquement le code source, un libellé textuel, ou une représentation partiellement structurée ;
* hétérogénéité possible dans les ressources FHIR produites selon les cas de mapping retenus.

**Recommandations** :
* documenter explicitement les cas dans lesquels aucune équivalence terminologique n’est disponible ;
* définir une stratégie de repli, par exemple en conservant le codage source, en renseignant uniquement `CodeableConcept.text`, ou en utilisant une correspondance plus large lorsque cela est acceptable ;

#### 4. Ordre de chargement des ressources

Le chargement des ressources nécessaires à l’exécution des mappings doit respecter un ordre précis afin que les dépendances soient correctement résolues lors de l’initialisation dans le moteur de transformation.

**Ordre recommandé** :
1. `ConceptMap` (si utilisés) ;
2. `StructureMap` de base (par exemple `CdaToFHIRTypes`) ;
3. `StructureMap` intermédiaires (par exemple `CdaToBundle`) ;
4. `StructureMap` spécifiques (par exemple `CdaFrToBundle`, `CdaFrMDEToBundle`).

**Conséquence** :
* un ordre de chargement incorrect peut empêcher la résolution des dépendances entre mappings et bloquer l’exécution.

#### 5. Gestion des extensions

Les extensions FHIR ne sont pas générées automatiquement au cours de la transformation. Lorsqu’une information CDA doit être portée dans une extension, celle-ci doit être créée explicitement dans les règles FML.

**Conséquence** :
* l’absence de création explicite d’une extension peut entraîner une perte d’information dans la ressource FHIR cible.

**Exemple** :
```fml
// Ajout d'une extension personnalisée
patient -> patient.extension as ext then {
  ext -> ext.url = 'http://example.org/fhir/Extension/customField'
  src.customValue as val -> ext.value = create('string') as v, v.value = val
}
```

#### 6. Gestion des valeurs absentes et des `nullFlavor`

Les documents CDA peuvent contenir des éléments présents dans la structure XML mais dépourvus de valeur exploitable, notamment lorsque l’attribut `nullFlavor` est utilisé. Cette situation complique la transformation, car l’élément existe, mais ne peut pas toujours être converti directement vers un élément FHIR pertinent.

**Conséquences** :
* création de ressources ou de champs incomplets ;
* ambiguïté sur la manière de représenter l’absence d’information ;
* risque de produire des sorties FHIR peu cohérentes si ces cas ne sont pas filtrés.

**Recommandations** :
* filtrer les éléments non exploitables avant transformation ;
* documenter la stratégie retenue pour le traitement des `nullFlavor` ;
* éviter de produire des ressources partielles lorsque l’information source est insuffisante.

#### 7. Conformité aux profils FHIR cibles

La validation par rapport aux ressources FHIR internationale n'est pas suffisante pour garantir l'interopérabilité.
La transformation doit respecter les profils cibles utilisés dans le projet. Elle doit notamment se conformer aux profils nationaux définis dans le cadre d'interopérabilité et dont l'usage est rendu obligatoire par le code de la santé publique imposent des contraintes supplémentaires sur les cardinalités, les terminologies ou les extensions.

**Conséquences** :
* une ressource techniquement conforme aux ressources génériques internationales FHIR peut rester non conforme au profil cible ;
* des règles complémentaires peuvent être nécessaires pour satisfaire certaines obligations métier ou nationales.

**Recommandations** :
* vérifier dès la conception du mapping les contraintes des profils cibles ;
* valider systématiquement les ressources générées contre les profils attendus ;
* documenter les écarts éventuels entre les données CDA disponibles et les exigences du profil FHIR.



### Bonnes pratiques

#### 1. Modularité

Une implémentation modulaire facilite la maintenance, la réutilisation et l’évolution des mappings. Il est recommandé de découper la transformation en groupes spécialisés, chacun étant responsable d’une fonction bien identifiée.

**Recommandations** :
* créer des groupes réutilisables pour chaque type de transformation ;
* séparer les conversions de types des transformations métier ;
* documenter les dépendances entre mappings ;
* utiliser les `imports` pour mutualiser les règles déjà définies dans d’autres fichiers FML.

#### 2. Nommage

Un nommage clair améliore la lisibilité du mapping et facilite le débogage. Les groupes, variables et paramètres doivent refléter le rôle qu’ils jouent dans la transformation.

**Recommandations** :
* utiliser des noms explicites pour les groupes (`ClinicalDocumentComposition` plutôt que `Transform1`) ;
* conserver des conventions homogènes pour les paramètres (`src` pour la source, `tgt` pour la cible) ;
* suivre les conventions de nommage FHIR pour les ressources et leurs éléments.

#### 3. Gestion des erreurs

La robustesse d’un mapping dépend en grande partie de sa capacité à filtrer les cas non conformes ou incomplets avant transformation. Il est donc important d’anticiper les erreurs de structure ou de contenu dans le document source.

**Recommandations** :
* utiliser `where()` pour filtrer les valeurs avant transformation ;
* vérifier l’existence des éléments avec `.exists()` ;
* documenter les cas non gérés ;
* prévoir une stratégie explicite pour les données absentes ou ambiguës.

#### 4. Performance

La performance d’un mapping FML dépend fortement du nombre de parcours effectués sur le document source et du niveau de duplication de certaines règles. Une implémentation trop fragmentée ou redondante peut dégrader les temps de traitement.

**Recommandations** :
* minimiser les parcours multiples du document source ;
* regrouper les transformations liées dans un même groupe lorsque cela est pertinent ;
* réutiliser les conversions existantes au lieu de réimplémenter des logiques équivalentes ;
* limiter les dépendances inutiles entre fichiers.

#### 5. Testabilité

La qualité d’une transformation repose sur la capacité à la tester sur des cas représentatifs et à valider les sorties produites. Une stratégie de test explicite facilite également l’identification des régressions.

**Recommandations** :
* créer des exemples CDA représentatifs des cas attendus ;
* tester chaque couche de mapping indépendamment ;
* vérifier les cas limites et les structures incomplètes ;
* valider les `Bundle` FHIR générés à l’aide d’un validateur.

#### 6. Traçabilité et débogage

Lorsque la transformation mobilise plusieurs groupes répartis dans différents fichiers, il peut devenir difficile d’identifier la règle à l’origine d’un comportement inattendu. Une bonne lisibilité des groupes et des règles facilite alors l’analyse des erreurs et le débogage du mapping.

**Recommandations** :
* structurer les groupes de manière lisible ;
* conserver des noms explicites pour les groupes et les variables ;
* isoler les cas de test permettant d’identifier rapidement un comportement erroné ;
* documenter les hypothèses de transformation et les choix d’implémentation.

#### 7. Stabilité des identifiants générés

L’utilisation d’identifiants techniques tels que des UUID facilite la gestion des références internes, mais peut rendre les sorties moins stables d’une exécution à l’autre. Cette instabilité peut compliquer la comparaison de résultats ou certains scénarios de test.

**Recommandations** :
* réserver les UUID aux références internes lorsque cela est nécessaire ;
* réutiliser les identifiants métier dès qu’ils sont disponibles ;
* documenter la stratégie de génération et de réutilisation des identifiants dans les ressources produites.

### Ressources complémentaires

* [FHIR Mapping Language Specification](https://www.hl7.org/fhir/mapping-language.html)
* [FHIR StructureMap Resource](https://www.hl7.org/fhir/structuremap.html)
* [Matchbox Documentation](https://github.com/ahdis/matchbox)
* [CDA to FHIR Maps (HL7 Suisse)](https://github.com/hl7ch/cda-fhir-maps)
* [Notes techniques de développement](claude.html)

### Conclusion

Le FHIR Mapping Language offre un mécanisme puissant et déclaratif pour transformer des documents CDA en ressources FHIR. La clé du succès réside dans :

* Une architecture modulaire en couches
* La réutilisation intelligente des mappings existants
* Une navigation ciblée pour les structures spécifiques
* La gestion appropriée des limitations du parser XML

Cette approche permet de créer des mappings maintenables, testables et évolutifs pour supporter la transition CDA vers FHIR dans le contexte de l'Espace Européen des Données de Santé.
