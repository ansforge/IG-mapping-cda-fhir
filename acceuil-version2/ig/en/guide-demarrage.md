# Guide de démarrage - POC - Mapping CDA to FHIR v0.1.0

## Guide de démarrage

 
There is no translation page available for the current page, so it has been rendered in the default language 

## Guide de démarrage rapide (Quick Start)

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

#### Étape 4 : Importer les ConceptMap et StructureMap puis lancer les transformations

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

Merci à Oliver Egger (Ahdis, HL7 Suisse) qui a travaillé sur la première brique sur laquelle repose ces travaux et sur l'outil matchbox permettant d'effectuer la transformation. https://github.com/hl7ch/cda-fhir-maps

