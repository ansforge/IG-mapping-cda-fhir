# Guide de démarrage - POC - Mapping CDA to FHIR v0.1.0

## Guide de démarrage

 
There is no translation page available for the current page, so it has been rendered in the default language 

## Guide de démarrage rapide (Quick Start)

Ce guide vous permet de tester rapidement la transformation de documents CDA de type Patient Summary vers FHIR en utilisant Matchbox, à partir d’un exemple fourni.

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

**Résultats obtenus de la transformation complète :**

* génération d’un Bundle FHIR documentaire contenant 97 ressources dans `Bundle.entry`, soit 98 ressources au total en incluant le Bundle lui-même ;
* organisation de la sortie autour d’une `Composition`, qui structure le document Patient Summary et référence les ressources FHIR générées ;
* production des principales ressources administratives et contextuelles ;
* production de ressources cliniques couvrant plusieurs sections du Patient Summary ;
* prise en compte des profils européens et français mobilisés dans la preuve de concept ;
* structuration des ressources générées à l’aide d’identifiants techniques de type UUID et de références internes au Bundle.

****Exemple de ressource générée : Patient**:**

```
{
  "fullUrl": "urn:uuid:4b3f518b-cf54-4508-8a30-d600cbbf528a",
  "resource": {
    "resourceType": "Patient",
    "id": "4b3f518b-cf54-4508-8a30-d600cbbf528a",
    "meta": {
      "profile": [
        "https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-patient-ins"
      ]
    },
    "extension": [
      {
        "url": "http://hl7.org/fhir/StructureDefinition/patient-birthPlace",
        "valueAddress": {
          "extension": [
            {
              "url": "https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-address-insee-code",
              "valueCoding": {
                "code": "51215"
              }
            }
          ],
          "city": "DOMPREMY",
          "district": "51215"
        }
      },
      {
        "extension": [
          {
            "url": "identityStatus",
            "valueCoding": {
              "system": "https://hl7.fr/ig/fhir/core/CodeSystem/fr-core-v2-0445",
              "code": "VALI"
            }
          }
        ],
        "url": "https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-identity-reliability"
      }
    ],
    "identifier": [
      {
        "use": "official",
        "type": {
          "coding": [
            {
              "system": "https://hl7.fr/ig/fhir/core/CodeSystem/fr-core-cs-v2-0203",
              "code": "INS-NIR-TEST"
            }
          ]
        },
        "system": "urn:oid:1.2.250.1.213.1.4.10",
        "value": "279035121518989"
      }
    ],
    "name": [
      {
        "extension": [
          {
            "url": "https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-patient-birth-list-given-name",
            "valueString": "DOMINIQUE MARIE-LOUISE"
          }
        ],
        "use": "official",
        "family": "PAT-TROIS",
        "given": [
          "DOMINIQUE"
        ]
      }
    ],
    "telecom": [
      {
        "system": "phone",
        "value": "0144534551",
        "use": "home"
      },
      {
        "system": "phone",
        "value": "0647151010",
        "use": "mobile"
      },
      {
        "system": "email",
        "value": "279035121518989@patient.mssante.fr"
      }
    ],
    "gender": "female",
    "birthDate": "1979-03-28",
    "address": [
      {
        "line": [
          "28",
          "Avenue de Breteuil"
        ],
        "city": "PARIS",
        "postalCode": "75007",
        "country": "FRANCE"
      }
    ]
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

