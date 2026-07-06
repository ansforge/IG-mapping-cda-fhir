# Démarrage Matchbox - POC - Mapping CDA to FHIR v0.1.0

## Démarrage Matchbox

Ce guide décrit les étapes permettant de lancer rapidement un environnement local de transformation CDA vers FHIR et de tester l’exécution du mapping sur un document d’exemple de type Patient Summary.

### Qu’est-ce que Matchbox ?

Matchbox est un serveur FHIR basé sur HAPI FHIR, utilisé pour charger, gérer et exécuter des artefacts FHIR dans un environnement local. Il permet notamment de manipuler des ressources telles que les StructureMap, les ConceptMap, les profils et les packages d’implémentation nécessaires à l’exécution et à la validation des transformations. Dans le cadre de cette preuve de concept, Matchbox est utilisé comme moteur d’exécution du mapping CDA vers FHIR. Les règles définies en FHIR Mapping Language sont chargées sous forme de StructureMap, puis appliquées à un document CDA source à l’aide de l’opération $transform, afin de générer une sortie FHIR.

### Exécution des transformations

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

1. Ouvrez le fichier `http-test/fr_cdatofhir_mde.http`
1. Exécutez séquentiellement les requêtes HTTP dans l'ordre suivant :
* **Requête 0** : Charger ConceptMap-cm-v3-administrative-gender.json
* **Requête 1** : Charger CDAtoFHIRTypes.fml
* **Requête 2** : Charger CdaToBundle.fml
* **Requête 3** : Charger CDAFrToBundle.fml
* **Requête 4** : Charger CdaPatientSummaryToBundle.fml
* **Requête 5** : Transformer patient-summary.xml avec le mapping générique (sortie JSON)
* **Requête 6** : Transformer patient-summary.xml avec le mapping générique enrichi (sortie JSON)
* **Requête 7** : Transformer patient-summary.xml avec le mapping complet du document Patient Summary (sortie JSON)

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
  --data-binary @input/fml/CdaPatientSummaryToBundle.fml


# 3. lancer les transformations
#3.1 : transformations génériques
curl -X POST "http://localhost:8080/matchbox/fhir/StructureMap/\$transform?source=https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/StructureMap/CdaToBundle" \
  -H "Accept: application/fhir+json;fhirVersion=4.0" \
  -H "Content-Type: application/fhir+xml;fhirVersion=4.0" \
  --data-binary @input/attachments/patient-summary.xml

#3.2 : transformations génériques enrichies
curl -X POST "http://localhost:8080/matchbox/fhir/StructureMap/\$transform?source=https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/StructureMap/CdaFrToBundle" \
  -H "Accept: application/fhir+json;fhirVersion=4.0" \
  -H "Content-Type: application/fhir+xml;fhirVersion=4.0" \
  --data-binary @input/attachments/patient-summary.xml

#3.3 : transformation complète du document Patient Summary
curl -X POST "http://localhost:8080/matchbox/fhir/StructureMap/\$transform?source=https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/StructureMap/CdaPatientSummaryToBundle" \
  -H "Accept: application/fhir+json;fhirVersion=4.0" \
  -H "Content-Type: application/fhir+xml;fhirVersion=4.0" \
  --data-binary @input/attachments/patient-summary.xml


```

**Remarque :** Les requêtes doivent être adaptées au niveau de transformation souhaité. Pour une transformation générique, seules les ressources nécessaires au mapping générique doivent être chargées, et les étapes d’enrichissement français et de mapping Patient Summary ne sont pas requises. Pour une transformation générique enrichie, la StructureMap spécifique au Patient Summary, correspondant à la requête 4, n’a pas besoin d’être chargée.

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

### Ressources complémentaires

* [FHIR StructureMap Resource](https://www.hl7.org/fhir/structuremap.html)
* [Matchbox Documentation](https://github.com/ahdis/matchbox)

