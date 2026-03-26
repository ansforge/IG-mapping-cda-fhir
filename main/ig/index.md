# Accueil - POC - Mapping CDA to FHIR v0.1.0

* [**Table of Contents**](toc.md)
* **Accueil**

## Accueil

| | |
| :--- | :--- |
| *Official URL*:https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ImplementationGuide/ans.fhir.fr.mappingcdafhir | *Version*:0.1.0 |
| Draft as of 2026-03-26 | *Computable Name*:CDA2FHIRMAP |

 **FHIR Mapping Language for CDA to FHIR transformation**
 Proof of concept for CDA to FHIR transformation 

> Cet Implementation Guide n'est pas la version courante, il s'agit de la version en intégration continue soumise à des changements fréquents uniquement destinée à suivre les travaux en cours. La version courante sera accessible via l'URL canonique suite à la première release : http://interop.esante.gouv.fr/ig/fhir/[code - ig]

### Introduction

Dans le cadre de l'Espace Européen des Données de Santé, l'ANS a entrepris des travaux pour anticiper la transition CDA vers FHIR dans le cadre des 5 cas d'usages priorisés par l'Europe : le compte rendu de biologie, la ePrescription et eDispensiation, le compte rendu d'hospitalisation, le résumé patient et le compte rendu d'imagerie.

Les travaux de l'ANS se distinguent en deux parties :

* créer les spécifications françaises en FHIR qui reprend l'historique CDA tout en s'alignant avec les contraintes européennes (cf. https://github.com/ansforge/IG-document-core)
* tester le FHIR Mapping Language, outil permettant la transformation des documents CDA vers FHIR.

### Guide de démarrage rapide (Quick Start)

Ce guide vous permet de tester rapidement la transformation de documents CDA vers FHIR en utilisant matchbox et les exemples fournis.

#### Prérequis

* Docker installé sur votre machine
* Un client REST (ex: VS Code avec l'extension REST Client, IntelliJ IDEA, ou curl)
* Accès au repository IG-mapping-cda-fhir

#### Étape 1 : Télécharger l'image Docker matchbox

```
docker pull europe-west6-docker.pkg.dev/ahdis-ch/ahdis/matchbox:v4.0.12

```

#### Étape 2 : Lancer le conteneur Docker

**Important** : Adaptez le chemin selon votre installation locale. Le chemin doit pointer vers le dossier `input/with-all` de votre projet.

```
docker run -d --name matchbox -p 8080:8080 \
  -v /chemin/absolu/vers/IG-mapping-cda-fhir/input/with-all:/config \
  europe-west6-docker.pkg.dev/ahdis-ch/ahdis/matchbox:v4.0.12

```

**Ou utilisez le script de démarrage automatique** :

```
./start-matchbox.sh

```

#### Étape 3 : Vérifier le démarrage

Pour suivre les logs de matchbox :

```
docker logs --follow matchbox

```

Attendez que matchbox ait terminé son démarrage. L'interface sera accessible sur : `http://localhost:8080/matchbox`

#### Étape 4 : Charger les ConceptMaps

Certains StructureMaps utilisent des ConceptMaps externes pour la traduction de codes terminologiques. Il faut les charger **avant** les StructureMaps.

```
# Charger le ConceptMap pour le genre (administrative-gender)
curl -X POST http://localhost:8080/matchbox/fhir/ConceptMap \
  -H "Content-Type: application/fhir+json" \
  --data-binary @input/resources/ConceptMap-cm-v3-administrative-gender.json

```

#### Étape 5 : Charger les StructureMaps et lancer les transformations

Les fichiers HTTP de test se trouvent dans le dossier `http-test/`. Utilisez le fichier `fr_cdatofhir_mde.http` avec votre client REST.

**Avec VS Code et l'extension REST Client** :

1. Ouvrez le fichier`http-test/fr_cdatofhir_mde.http`
1. Exécutez séquentiellement les requêtes HTTP dans l'ordre suivant :
* **Requête 0** : Charger ConceptMap-cm-v3-administrative-gender.json
* **Requête 1** : Charger CDAtoFHIRTypes.fml
* **Requête 2** : Charger CdaToBundle.fml
* **Requête 3** : Charger CDAFrToBundle.fml
* **Requête 4** : Charger CDAFrMDEToBundle.fml
* **Requête 5** : Transformer CSE-MDE_2023.01.xml (sortie JSON)

1. Cliquez sur "Send Request" au-dessus de chaque requête

**Avec curl** (exemple complet) :

```
# 1. Charger les ConceptMaps nécessaires
curl -X POST http://localhost:8080/matchbox/fhir/ConceptMap \
  -H "Content-Type: application/fhir+json" \
  --data-binary @input/resources/ConceptMap-cm-v3-administrative-gender.json

# 2. Charger les StructureMaps dans l'ordre
curl -X POST http://localhost:8080/matchbox/fhir/StructureMap \
  -H "Accept: application/fhir+xml;fhirVersion=4.0" \
  -H "Content-Type: text/fhir-mapping" \
  --data-binary @input/fml/CDAtoFHIRTypes.fml

curl -X POST http://localhost:8080/matchbox/fhir/StructureMap \
  -H "Accept: application/fhir+xml;fhirVersion=4.0" \
  -H "Content-Type: text/fhir-mapping" \
  --data-binary @input/fml/CdaToBundle.fml

curl -X POST http://localhost:8080/matchbox/fhir/StructureMap \
  -H "Accept: application/fhir+xml;fhirVersion=4.0" \
  -H "Content-Type: text/fhir-mapping" \
  --data-binary @input/fml/CDAFrToBundle.fml

curl -X POST http://localhost:8080/matchbox/fhir/StructureMap \
  -H "Accept: application/fhir+xml;fhirVersion=4.0" \
  -H "Content-Type: text/fhir-mapping" \
  --data-binary @input/fml/CDAFrMDEToBundle.fml

# 3. Transformer un document CDA
curl -X POST "http://localhost:8080/matchbox/fhir/StructureMap/\$transform?source=https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/StructureMap/CdaFrMDEToBundle" \
  -H "Accept: application/fhir+json;fhirVersion=4.0" \
  -H "Content-Type: application/fhir+xml;fhirVersion=4.0" \
  --data-binary @input/attachments/CSE-MDE_2023.01.xml

```

#### Exemple CDA disponible

Le dossier `input/attachments/` contient un exemple de document CDA français :

* **CSE-MDE_2023.01.xml** : Carnet de santé de l'enfant - Mesures (3 observations : Poids, Taille, Périmètre crânien)

#### Résultat attendu

Si la transformation réussit, vous obtiendrez un Bundle FHIR contenant les ressources converties depuis le document CDA.

**Note importante** : Il peut y avoir des erreurs dans les fichiers FML lors de la transformation. L'objectif de ce POC est de valider le processus de transformation. Les erreurs dans les mappings seront traitées ultérieurement.

### Résultats des transformations

Les transformations CDA-FHIR ont été exécutées avec les résultats suivants :

#### Transformation réussie

| | | | | | |
| :--- | :--- | :--- | :--- | :--- | :--- |
| CSE-MDE_2023.01.xml | [CdaFrMDEToBundle](StructureMap-CdaFrMDEToBundle.md) | [Bundle-fe569e1f-32d4-4ba4-b5ad-88082bf5470a.json](Bundle-fe569e1f-32d4-4ba4-b5ad-88082bf5470a.md) | 11 | 3 | ✅ Succès complet |

**Détails de la transformation :**

**Document CSE-MDE (Carnet de Santé de l'Enfant - Mesures)** :

* **StructureMap utilisé** : `CdaFrMDEToBundle` - Mapping spécifique pour le contexte français
* **Imports** : Utilise `CdaToFHIRTypes`, `CdaToBundle` et `CdaFrToBundle`
* **Ressources générées** (11 au total) : 
* 1 Composition (métadonnées du document)
* 1 Patient (avec identifiant INS-NIR, nom, genre, date de naissance)
* 1 Encounter (contexte de la rencontre)
* 1 Location (lieu de la consultation)
* 2 Practitioner (praticiens impliqués)
* 2 Organization (organisations de santé)
* 3 Observations : 
* Poids (29463-7) = 3900 g
* Taille (8302-2) = 52 cm
* Périmètre crânien (8287-5) = 35 cm
 
 

### Architecture du mapping CdaFrMDEToBundle

Le mapping `CdaFrMDEToBundle.fml` est un mapping spécialisé pour les documents CSE-MDE français qui combine :

**Architecture du mapping :**

* **Imports** : Utilise les mappings de base (`CdaToFHIRTypes`, `CdaToBundle`, `CdaFrToBundle`)
* **Réutilisation** : Exploite les fonctions existantes pour Patient, Composition, Encounter, Location, etc.
* **Navigation personnalisée** : Implémente une navigation spécifique pour extraire les observations imbriquées dans les organizers
* **Traitement complet** : Gère toutes les ressources nécessaires pour un document CSE-MDE

**Résultats obtenus :**

* ✅ Génération du Bundle FHIR avec structure document complète
* ✅ Transformation du Patient avec identifiant INS-NIR, nom, genre, date de naissance
* ✅ Création de la Composition avec métadonnées et sections
* ✅ Génération automatique des ressources contextuelles (Encounter, Location, Practitioner, Organization)
* ✅ **Extraction des Observations** depuis `organizer > component > observation`
* ✅ Transformation des codes LOINC et valeurs quantitatives avec unités

**Exemple d'Observation générée :**

```
{
  "resourceType": "Observation",
  "status": "final",
  "category": [{
    "coding": [{
      "system": "http://terminology.hl7.org/CodeSystem/observation-category",
      "code": "vital-signs"
    }]
  }],
  "code": {
    "coding": [{
      "system": "http://loinc.org",
      "code": "29463-7",
      "display": "Poids"
    }]
  },
  "subject": {
    "reference": "urn:uuid:..."
  },
  "effectiveDateTime": "2023-01-06",
  "valueQuantity": {
    "value": 3900,
    "unit": "g",
    "system": "http://unitsofmeasure.org",
    "code": "g"
  }
}

```

**Améliorations récentes apportées au mapping :**

* ✅ **Ajout de `Observation.category`** : Toutes les observations sont catégorisées comme `vital-signs` conformément au package ANS [ans.fhir.fr.mesures#3.1.0](https://interop.esante.gouv.fr/ig/fhir/mesures/3.1.0/)
* ✅ **Ajout de `Observation.effectiveDateTime`** : Extrait depuis `effectiveTime` de l'observation CDA (si présent et non `nullFlavor`)
* ✅ **Correction de `Observation.status`** : Mapping de CDA "completed" vers FHIR "final"
* ✅ **Ajout du système UCUM aux quantités** : Toutes les `valueQuantity` incluent `system: "http://unitsofmeasure.org"` et `code` en plus de `unit`
* ✅ **Conversion des codes LOINC** : Système correctement mappé vers `http://loinc.org`
* ✅ **Ajout de `Encounter.status`** : Défini à `finished` pour les rencontres terminées
* ✅ **Ajout de `Encounter.class`** : Extrait du code CDA de la rencontre
* ✅ **Correction de `Patient.birthDate`** : Format date simple conforme FHIR
* ✅ **Correction de `Composition.confidentiality`** : Code simple au lieu d'objet complexe
* ✅ **Correction de `attester.time`** : Format dateTime conforme FHIR
* ✅ **Ajout de `meta.profile`** : Profils ANS ajoutés selon le code LOINC (mesures-fr-observation-body-weight, mesures-fr-observation-bodyheight, mesures-observation-head-circumference)

**Limitations identifiées dans les données CDA source :**

Les exemples CDA fournis présentent certaines limitations qui génèrent des warnings FHIR (non bloquants) :

1. ⚠️**Absence de timezone sur `Encounter.period`**: Les dates/heures de la rencontre dans le CDA n'incluent pas de timezone

```
<!-- CDA source -->
<effectiveTime>
  <low value="20250106111510"/>  <!-- Pas de timezone +0100 -->
  <high value="20250106113623"/> <!-- Pas de timezone +0100 -->
</effectiveTime>

```

**Impact** : Warning FHIR "If a date has a time, it must have a timezone"**Solution** : Ajouter le timezone dans le CDA source (ex: `20250106111510+0100`)
1. ⚠️**Absence de `Observation.effectiveDateTime`**: Les observations CDA utilisent`nullFlavor="NASK"`(Not Asked)

```
<!-- CDA source -->
<observation>
  <code code="29463-7" displayName="Poids" codeSystem="2.16.840.1.113883.6.1"/>
  <effectiveTime nullFlavor="NASK"/>  <!-- Pas de date effective -->
  <value xsi:type="PQ" value="3900" unit="g"/>
</observation>

```

**Impact** : Warning FHIR "Best Practice Recommendation: In general, all observations should have an effective[x]"**Solution** : Fournir une date/heure effective dans le CDA source (ex: `<effectiveTime value="20230106"/>`)

**Note** : Ces limitations proviennent des données CDA d'exemple et non du mapping FML. Le mapping transforme fidèlement les données CDA disponibles.

### Difficultés identifiées dans le mapping automatique CDA-FHIR

Le processus de transformation automatique CDA vers FHIR présente certaines difficultés inhérentes aux différences de modélisation entre les deux standards :

#### 1. Ambiguïté sémantique des structures CDA

**Problème identifié** : `healthCareFacility` et `serviceProviderOrganization`

Dans le CDA, la structure `componentOf > encompassingEncounter > location > healthCareFacility` contient :

* Un `code` décrivant le type d'établissement (ex: SA05 "Centre de santé" du TRE_R02-SecteurActivite)
* Une `location` (lieu physique avec adresse)
* Optionnellement un `serviceProviderOrganization` (organisation gestionnaire)

**Difficulté de mapping** :

Le code SA05 du `healthCareFacility` devrait logiquement être mappé vers :

1. ✅`Location.type`- pour indiquer le type de lieu physique
1. ❓`Organization.type:secteurActiviteRASS`- pour indiquer le secteur d'activité de l'organisation

Cependant, il existe une **ambiguïté sémantique** :

* Le `serviceProviderOrganization` dans le CDA peut représenter : 
* L'organisation qui opère directement le centre de santé (dans ce cas, SA05 s'applique bien)
* Une organisation parente ou gestionnaire différente (dans ce cas, SA05 pourrait ne pas s'appliquer)
 

**Impact** :

* Un mapping automatique qui copie systématiquement le code du `healthCareFacility` vers l'`Organization` peut introduire des **incohérences sémantiques**
* Il n'existe pas de règle universelle dans le CDA pour distinguer ces deux cas
* Cette ambiguïté nécessite souvent une **analyse contextuelle manuelle** ou des **règles métier spécifiques** au projet

**Solutions possibles** :

1. **Mapping conservateur**: Ne mapper que vers`Location.type`(approche actuelle)
1. **Mapping avec hypothèse**: Copier vers`Organization.type`en documentant l'hypothèse que le`serviceProviderOrganization`est l'établissement lui-même
1. **Mapping conditionnel**: Définir des règles métier basées sur le contexte du document (type de document, type d'établissement, etc.)

Cette difficulté illustre que **le mapping CDA-FHIR n'est pas toujours une transformation mécanique 1:1**, mais nécessite parfois des choix d'implémentation basés sur la compréhension du contexte métier.

### Arrêter et redémarrer

Pour arrêter le conteneur :

```
docker stop matchbox

```

Pour redémarrer :

```
docker start matchbox

```

Pour supprimer le conteneur (et repartir de zéro) :

```
docker rm -f matchbox

```

### Configuration avancée

Le fichier `input/with-all/application.yaml` configure matchbox avec :

* Les packages FHIR de base (R4 core, terminologies, extensions)
* Le package CDA (hl7.cda.uv.core)
* Le package ANS FHIR EDS

Pour modifier la configuration, éditez `application.yaml` puis supprimez et recréez le conteneur Docker.

### Auteurs et contributeurs

| | | | |
| :--- | :--- | :--- | :--- |
| **Primary Editor** | Prenom Nom | Agence du Numérique en Santé | prenom.nom@address.email |

Merci à Oliver Egger (Ahdis, HL7 Suisse) qui a travaillé sur la première brique sur laquelle repose ces travaux et sur l'outil matchbox permettant d'effectuer la transformation.

https://github.com/hl7ch/cda-fhir-maps

### Dépendances








### Propriété intellectuelle

Certaines ressources sémantiques de ce guide sont protégées par des droits de propriété intellectuelle couverte par les déclarations ci-dessous. L’utilisation de ces ressources est soumise à l’acceptation et au respect des conditions précisées dans la licence d’utilisation de chacune d’entre elle.

* ISO maintains the copyright on the country codes, and controls its use carefully. For further details see the ISO 3166 web page: [https://www.iso.org/iso-3166-country-codes.html](https://www.iso.org/iso-3166-country-codes.html)

* [ISO 3166-1 Codes for the representation of names of countries and their subdivisions — Part 1: Country code](http://terminology.hl7.org/6.2.0/CodeSystem-ISO3166Part1.html): [CDA2FHIRMAP](index.md), [CdaFrMDEToBundle](StructureMap-CdaFrMDEToBundle.md)... Show 6 more, [CdaFrToBundle](StructureMap-CdaFrToBundle.md), [CdaToBundle](StructureMap-CdaToBundle.md), [CdaToFHIRTypes](StructureMap-CdaToFHIRTypes.md), [CdaToFhirAdministrativeGender](ConceptMap-cm-v3-administrative-gender.md), [ConceptMapOidSpecialiteOrdinale](ConceptMap-cm-oid-specialite-ordinale.md) and [OID2URIConceptMapANS](ConceptMap-oid2uri-ans.md)


* The UCUM codes, UCUM table (regardless of format), and UCUM Specification are copyright 1999-2009, Regenstrief Institute, Inc. and the Unified Codes for Units of Measures (UCUM) Organization. All rights reserved. [https://ucum.org/trac/wiki/TermsOfUse](https://ucum.org/trac/wiki/TermsOfUse)

* [Unified Code for Units of Measure (UCUM)](http://terminology.hl7.org/6.2.0/CodeSystem-v3-ucum.html): [Bundle/fe569e1f-32d4-4ba4-b5ad-88082bf5470a](Bundle-fe569e1f-32d4-4ba4-b5ad-88082bf5470a.md)


* This material derives from the HL7 Terminology (THO). THO is copyright ©1989+ Health Level Seven International and is made available under the CC0 designation. For more licensing information see: [https://terminology.hl7.org/license.html](https://terminology.hl7.org/license.html)

* [Observation Category Codes](http://terminology.hl7.org/7.1.0/CodeSystem-observation-category.html): [Bundle/fe569e1f-32d4-4ba4-b5ad-88082bf5470a](Bundle-fe569e1f-32d4-4ba4-b5ad-88082bf5470a.md)
* [identifierType](http://terminology.hl7.org/7.1.0/CodeSystem-v2-0203.html): [Bundle/fe569e1f-32d4-4ba4-b5ad-88082bf5470a](Bundle-fe569e1f-32d4-4ba4-b5ad-88082bf5470a.md)
* [ActCode](http://terminology.hl7.org/7.1.0/CodeSystem-v3-ActCode.html): [Bundle/fe569e1f-32d4-4ba4-b5ad-88082bf5470a](Bundle-fe569e1f-32d4-4ba4-b5ad-88082bf5470a.md)




## Resource Content

```json
{
  "resourceType" : "ImplementationGuide",
  "id" : "ans.fhir.fr.mappingcdafhir",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ImplementationGuide/ans.fhir.fr.mappingcdafhir",
  "version" : "0.1.0",
  "name" : "CDA2FHIRMAP",
  "title" : "POC - Mapping CDA to FHIR",
  "status" : "draft",
  "date" : "2026-03-26T12:56:02+00:00",
  "publisher" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
  "contact" : [{
    "name" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
    "telecom" : [{
      "system" : "url",
      "value" : "https://esante.gouv.fr"
    }]
  }],
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "FR",
      "display" : "FRANCE"
    }]
  }],
  "packageId" : "ans.fhir.fr.mappingcdafhir",
  "license" : "CC0-1.0",
  "fhirVersion" : ["4.0.1"],
  "dependsOn" : [{
    "id" : "hl7tx",
    "extension" : [{
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/implementationguide-dependency-comment",
      "valueMarkdown" : "Automatically added as a dependency - all IGs depend on HL7 Terminology"
    }],
    "uri" : "http://terminology.hl7.org/ImplementationGuide/hl7.terminology",
    "packageId" : "hl7.terminology.r4",
    "version" : "7.1.0"
  },
  {
    "id" : "hl7ext",
    "extension" : [{
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/implementationguide-dependency-comment",
      "valueMarkdown" : "Automatically added as a dependency - all IGs depend on the HL7 Extension Pack"
    }],
    "uri" : "http://hl7.org/fhir/extensions/ImplementationGuide/hl7.fhir.uv.extensions",
    "packageId" : "hl7.fhir.uv.extensions.r4",
    "version" : "5.2.0"
  },
  {
    "id" : "hl7_cda_uv_core",
    "uri" : "http://hl7.org/cda/stds/core/ImplementationGuide/hl7.cda.uv.core",
    "packageId" : "hl7.cda.uv.core",
    "version" : "2.0.0-sd"
  },
  {
    "id" : "ans_fhir_fr_annuaire",
    "uri" : "https://interop.esante.gouv.fr/ig/fhir/annuaire/ImplementationGuide/ans.fhir.fr.annuaire",
    "packageId" : "ans.fhir.fr.annuaire",
    "version" : "1.1.0"
  },
  {
    "id" : "hl7_fhir_fr_core",
    "uri" : "https://hl7.fr/ig/fhir/core/ImplementationGuide/hl7.fhir.fr.core",
    "packageId" : "hl7.fhir.fr.core",
    "version" : "2.1.0"
  }],
  "definition" : {
    "extension" : [{
      "extension" : [{
        "url" : "code",
        "valueString" : "copyrightyear"
      },
      {
        "url" : "value",
        "valueString" : "2020+"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "releaselabel"
      },
      {
        "url" : "value",
        "valueString" : "ci-build"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "shownav"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-binary"
      },
      {
        "url" : "value",
        "valueString" : "input/attachments"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-expansion-params"
      },
      {
        "url" : "value",
        "valueString" : "../../expansion-params.json"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "autoload-resources"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-liquid"
      },
      {
        "url" : "value",
        "valueString" : "template/liquid"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-liquid"
      },
      {
        "url" : "value",
        "valueString" : "input/liquid"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-qa"
      },
      {
        "url" : "value",
        "valueString" : "temp/qa"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-temp"
      },
      {
        "url" : "value",
        "valueString" : "temp/pages"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-output"
      },
      {
        "url" : "value",
        "valueString" : "output"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-suppressed-warnings"
      },
      {
        "url" : "value",
        "valueString" : "input/ignoreWarnings.txt"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-history"
      },
      {
        "url" : "value",
        "valueString" : "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/history.html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "template-html"
      },
      {
        "url" : "value",
        "valueString" : "template-page.html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "template-md"
      },
      {
        "url" : "value",
        "valueString" : "template-page-md.html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-contact"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-context"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-copyright"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-jurisdiction"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-license"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-publisher"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-version"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-wg"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "active-tables"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "fmm-definition"
      },
      {
        "url" : "value",
        "valueString" : "http://hl7.org/fhir/versions.html#maturity"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "propagate-status"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "excludelogbinaryformat"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "tabbed-snapshots"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/expansion-parameters",
      "valueReference" : {
        "reference" : "Parameters/expansion-parameters"
      }
    },
    {
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-internal-dependency",
      "valueCode" : "hl7.fhir.uv.tools.r4#1.1.2"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "copyrightyear"
      },
      {
        "url" : "value",
        "valueString" : "2020+"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "releaselabel"
      },
      {
        "url" : "value",
        "valueString" : "ci-build"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "shownav"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-binary"
      },
      {
        "url" : "value",
        "valueString" : "input/attachments"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-expansion-params"
      },
      {
        "url" : "value",
        "valueString" : "../../expansion-params.json"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "autoload-resources"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-liquid"
      },
      {
        "url" : "value",
        "valueString" : "template/liquid"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-liquid"
      },
      {
        "url" : "value",
        "valueString" : "input/liquid"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-qa"
      },
      {
        "url" : "value",
        "valueString" : "temp/qa"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-temp"
      },
      {
        "url" : "value",
        "valueString" : "temp/pages"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-output"
      },
      {
        "url" : "value",
        "valueString" : "output"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-suppressed-warnings"
      },
      {
        "url" : "value",
        "valueString" : "input/ignoreWarnings.txt"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-history"
      },
      {
        "url" : "value",
        "valueString" : "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/history.html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "template-html"
      },
      {
        "url" : "value",
        "valueString" : "template-page.html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "template-md"
      },
      {
        "url" : "value",
        "valueString" : "template-page-md.html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-contact"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-context"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-copyright"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-jurisdiction"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-license"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-publisher"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-version"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-wg"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "active-tables"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "fmm-definition"
      },
      {
        "url" : "value",
        "valueString" : "http://hl7.org/fhir/versions.html#maturity"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "propagate-status"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "excludelogbinaryformat"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "tabbed-snapshots"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    }],
    "resource" : [{
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ConceptMap"
      }],
      "reference" : {
        "reference" : "ConceptMap/cm-v3-administrative-gender"
      },
      "name" : "CDA to FHIR Administrative Gender Mapping",
      "description" : "Mapping between CDA v3 Administrative Gender codes and FHIR Administrative Gender codes",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ConceptMap"
      }],
      "reference" : {
        "reference" : "ConceptMap/cm-oid-specialite-ordinale"
      },
      "name" : "ConceptMap - OID to URL for TRE_R38-SpecialiteOrdinale",
      "description" : "Mapping from OID urn:oid:1.2.250.1.213.1.1.4.5 to URL https://mos.esante.gouv.fr/NOS/TRE_R38-SpecialiteOrdinale/FHIR/TRE-R38-SpecialiteOrdinale",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Bundle"
      }],
      "reference" : {
        "reference" : "Bundle/fe569e1f-32d4-4ba4-b5ad-88082bf5470a"
      },
      "name" : "fe569e1f-32d4-4ba4-b5ad-88082bf5470a",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ConceptMap"
      }],
      "reference" : {
        "reference" : "ConceptMap/oid2uri-ans"
      },
      "name" : "OID to URI Mapping for ANS terminologies",
      "description" : "Mapping from OID to URI for ANS terminologies",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Binary"
      }],
      "reference" : {
        "reference" : "Binary/CSE-MDE2023.01"
      }
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureMap"
      }],
      "reference" : {
        "reference" : "StructureMap/CdaFrMDEToBundle"
      },
      "name" : "Mapping CSE-MDE vers FHIR Bundle - Contexte Français",
      "description" : "Mapping CSE-MDE vers FHIR Bundle - Contexte Français"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureMap"
      }],
      "reference" : {
        "reference" : "StructureMap/CdaFrToBundle"
      },
      "name" : "Mapping de CDAFr vers FHIR Bundle (A partir des sources de Oliver Egger)",
      "description" : "Mapping de CDAFr vers FHIR Bundle (A partir des sources de Oliver Egger)"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureMap"
      }],
      "reference" : {
        "reference" : "StructureMap/CdaToFHIRTypes"
      },
      "name" : "Mapping de CDA vers les FHIR Types (A partir des sources de Oliver Egger)",
      "description" : "Mapping de CDA vers les FHIR Types (A partir des sources de Oliver Egger)"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureMap"
      }],
      "reference" : {
        "reference" : "StructureMap/CdaToBundle"
      },
      "name" : "Mapping de CDA vers FHIR Bundle (A partir des sources de Oliver Egger)",
      "description" : "Mapping de CDA vers FHIR Bundle (A partir des sources de Oliver Egger)"
    }],
    "page" : {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
        "valueUrl" : "toc.html"
      }],
      "nameUrl" : "toc.html",
      "title" : "Table of Contents",
      "generation" : "html",
      "page" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "index.html"
        }],
        "nameUrl" : "index.html",
        "title" : "Accueil",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "change-log.html"
        }],
        "nameUrl" : "change-log.html",
        "title" : "Historique des versions",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "mapping-cda-fhir.html"
        }],
        "nameUrl" : "mapping-cda-fhir.html",
        "title" : "Mapping CDA vers FHIR",
        "generation" : "markdown",
        "page" : [{
          "extension" : [{
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
            "valueUrl" : "mapping-mechanisms.html"
          }],
          "nameUrl" : "mapping-mechanisms.html",
          "title" : "Mécanisme du Mapping",
          "generation" : "markdown"
        },
        {
          "extension" : [{
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
            "valueUrl" : "guide-demarrage.html"
          }],
          "nameUrl" : "guide-demarrage.html",
          "title" : "Guide de démarrage",
          "generation" : "markdown"
        },
        {
          "extension" : [{
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
            "valueUrl" : "outils-mapping.html"
          }],
          "nameUrl" : "outils-mapping.html",
          "title" : "Outils de Mapping",
          "generation" : "markdown"
        }]
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "initiatives-internationales.html"
        }],
        "nameUrl" : "initiatives-internationales.html",
        "title" : "Initiatives internationales",
        "generation" : "markdown"
      }]
    },
    "parameter" : [{
      "code" : "path-resource",
      "value" : "input/fml"
    },
    {
      "code" : "path-resource",
      "value" : "input/resources"
    },
    {
      "code" : "path-resource",
      "value" : "input/attachments"
    },
    {
      "code" : "path-resource",
      "value" : "input/capabilities"
    },
    {
      "code" : "path-resource",
      "value" : "input/examples"
    },
    {
      "code" : "path-resource",
      "value" : "input/extensions"
    },
    {
      "code" : "path-resource",
      "value" : "input/models"
    },
    {
      "code" : "path-resource",
      "value" : "input/operations"
    },
    {
      "code" : "path-resource",
      "value" : "input/profiles"
    },
    {
      "code" : "path-resource",
      "value" : "input/vocabulary"
    },
    {
      "code" : "path-resource",
      "value" : "input/testing"
    },
    {
      "code" : "path-resource",
      "value" : "input/history"
    },
    {
      "code" : "path-resource",
      "value" : "fsh-generated/resources"
    },
    {
      "code" : "path-pages",
      "value" : "template/config"
    },
    {
      "code" : "path-pages",
      "value" : "input/images"
    },
    {
      "code" : "path-tx-cache",
      "value" : "input-cache/txcache"
    }]
  }
}

```
