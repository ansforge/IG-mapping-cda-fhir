---
title: Mécanismes de mapping
layout: default
active: mapping-mechanisms
---

# Mécanismes de mapping CDA vers FHIR

Cette page explique les différents mécanismes utilisés pour transformer des documents CDA (Clinical Document Architecture) en ressources FHIR à l'aide du FHIR Mapping Language (FML).

## Vue d'ensemble du FHIR Mapping Language

Le FHIR Mapping Language (FML) est un langage déclaratif développé par HL7 pour transformer des données structurées d'un format à un autre. Il permet de définir des règles de transformation complexes de manière lisible et maintenable.

### Caractéristiques principales

* **Déclaratif** : On décrit *ce que* l'on veut obtenir plutôt que *comment* le faire
* **Modulaire** : Possibilité d'importer et de réutiliser des mappings existants
* **Type-safe** : Vérification des types lors de la compilation
* **Navigation XML/JSON** : Support natif pour parcourir des structures hiérarchiques

## Architecture des mappings

### Structure en couches

Les mappings sont organisés en couches de réutilisabilité :

```
┌─────────────────────────────────────┐
│   CDAFrMDEToBundle.fml              │  ← Mappings spécifiques métier
│   (Carnet de Santé Enfant)         │
└─────────────────────────────────────┘
              ↓ uses
┌─────────────────────────────────────┐
│   CDAFrToBundle.fml                 │  ← Mappings français génériques
│   (Identifiants INS-NIR, etc.)     │
└─────────────────────────────────────┘
              ↓ uses
┌─────────────────────────────────────┐
│   CdaToBundle.fml                   │  ← Mappings CDA de base
│   (Patient, Composition, etc.)     │
└─────────────────────────────────────┘
              ↓ uses
┌─────────────────────────────────────┐
│   CdaToFHIRTypes.fml                │  ← Conversions de types primitifs
│   (HumanName, CodeableConcept, etc.)│
└─────────────────────────────────────┘
```

### Principe de réutilisation

Chaque couche :
* **Importe** les mappings des couches inférieures via `uses`
* **Réutilise** les fonctions existantes pour éviter la duplication
* **Ajoute** des règles spécifiques pour son contexte métier

## Mécanismes de transformation

### 1. Navigation dans l'arbre CDA

Le FML permet de naviguer dans la structure hiérarchique XML du document CDA :

```fml
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
Les datatypes représentent les types de données fondamentaux utilisés dans CDA et FHIR pour décrire des informations élémentaires, telles qu’un texte, une date, un identifiant, une quantité ou un code. Comme les deux standards reposent sur des modèles de datatypes différents — souvent plus riches et complexes en CDA, plus simples et modulaires en FHIR — il est nécessaire d’établir une correspondance claire entre eux avant toute transformation.

Le mapping des datatypes constitue ainsi une étape essentielle : il garantit la cohérence des conversions, évite la perte d’information et fournit la base technique sur laquelle reposent toutes les étapes suivantes du mapping CDA → FHIR. Une fois cette correspondance définie, il devient possible de générer un tableau CDA → FHIR fiable et réutilisable pour la suite du processus.


{% sql conceptmapsDataTypes %}
SELECT 
  CM.id AS "ConceptMap",
  E.display AS "CDA (source)",
  T.display AS "FHIR (cible)",
  T.equivalence AS "Equivalence"
FROM ConceptMap CM
JOIN group G ON G.ConceptMap = CM._row
JOIN element E ON E.group = G._row
JOIN target T ON T.element = E._row
ORDER BY CM.id, E.display;
{% endsql %}


#### les éléments transverses CDA → FHIR
les éléments transverses
La deuxième étape du mapping consiste à traiter les éléments transverses du document CDA, c’est à dire toutes les informations structurantes présentes dans l’en tête et dans certaines parties organisées du corps du document.

Le but de cette étape est de convertir ces éléments transverses en ressources FHIR équivalentes, de manière cohérente et fidèle. Cette opération permet de reconstruire la structure logique du document dans FHIR, en préservant son contexte administratif, clinique et organisationnel. Elle assure que les informations indispensables à la compréhension globale du document — telles que l’identité du patient, les acteurs impliqués, le contexte de production ou les structures narratives — soient correctement représentées dans le modèle cible.


{% sql conceptmapsTransverses %}
SELECT 
  CM.id AS "ConceptMap",
  E.display AS "CDA (source)",
  T.display AS "FHIR (cible)",
  T.equivalence AS "Equivalence"
FROM ConceptMap CM
JOIN group G ON G.ConceptMap = CM._row
JOIN element E ON E.group = G._row
JOIN target T ON T.element = E._row
ORDER BY CM.id, E.display;
{% endsql %}


#### Conversion de codes terminologiques

Deux approches sont utilisées :

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

### 3. Création de ressources FHIR

#### Création avec référence

Les ressources sont créées dans le Bundle et référencées entre elles :

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

// Référence au Patient depuis la Composition
patient -> composition.subject = create('Reference') as reference,
           reference.reference = ('urn:uuid:' + pid)
```

#### Gestion des identifiants

**Identifiants temporaires (UUID)** :
```fml
// Génération d'UUID pour les références internes au Bundle
entry.resource = create('Patient') as patient,
patient.id = uuid() as pid

// Utilisation de l'UUID dans une référence
reference.reference = ('urn:uuid:' + pid)
```

**Identifiants métier** :
```fml
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

```fml
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

```fml
// Filtrer une section par son code LOINC
comp.section where(code.code = '11450-4') as section
  -> ProcessVitalSigns(section, bundle)

// Filtrer un identifiant par son OID
patientRole.id as id where(root = '1.2.250.1.213.1.4.8')
  -> patient.identifier as identifier then INSIdentifier(id, identifier)
```

#### Conditions imbriquées

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

## Patterns de mapping courants

### Pattern 1 : Document CDA → Bundle FHIR

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

```fml
group MapGender(source src : CS, target tgt : code)
  src where(value = 'M') -> tgt.value = 'male'
  src where(value = 'F') -> tgt.value = 'female'
  // etc.
```

### 3. Ordre de chargement

**Contrainte** : Les ressources doivent être chargées dans matchbox dans un ordre spécifique :

1. ConceptMaps (si utilisés)
2. StructureMaps de base (CdaToFHIRTypes)
3. StructureMaps intermédiaires (CdaToBundle)
4. StructureMaps spécifiques (CdaFrToBundle, CdaFrMDEToBundle)

**Raison** : Les dépendances entre mappings doivent être résolues lors du chargement.

### 4. Gestion des extensions

**Limitation** : Les extensions FHIR doivent être créées explicitement et ne sont pas automatiquement générées.

**Exemple** :
```fml
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

```fml
map "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/StructureMap/CdaFrMDEToBundle"
  = "CdaFrMDEToBundle"

uses "http://hl7.org/fhir/cda/StructureDefinition/ClinicalDocument" alias ClinicalDocument as source
uses "http://hl7.org/fhir/StructureDefinition/Bundle" alias Bundle as target

imports "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/StructureMap/CdaToFHIRTypes"
imports "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/StructureMap/CdaToBundle"
imports "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/StructureMap/CdaFrToBundle"
```

### Stratégie de transformation

1. **Réutilisation des mappings de base** :
   * `ClinicalDocumentComposition` : Crée la Composition et les ressources contextuelles
   * `ClinicalDocumentPatientRole` : Transforme le Patient avec identifiant INS-NIR

2. **Navigation personnalisée** :
   * Parcours de `component > structuredBody > component > section > entry > organizer > component > observation`
   * Extraction des observations de mesures (poids, taille, périmètre crânien)

3. **Conversion de types** :
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
* [Notes techniques de développement](claude.html)

## Conclusion

Le FHIR Mapping Language offre un mécanisme puissant et déclaratif pour transformer des documents CDA en ressources FHIR. La clé du succès réside dans :

* Une architecture modulaire en couches
* La réutilisation intelligente des mappings existants
* Une navigation ciblée pour les structures spécifiques
* La gestion appropriée des limitations du parser XML

Cette approche permet de créer des mappings maintenables, testables et évolutifs pour supporter la transition CDA vers FHIR dans le contexte de l'Espace Européen des Données de Santé.
