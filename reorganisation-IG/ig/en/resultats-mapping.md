# Résultats de mapping - POC - Mapping CDA to FHIR v0.1.0

## Résultats de mapping

 
There is no translation page available for the current page, so it has been rendered in the default language 

### introduction

L’exécution des règles de mapping avec Matchbox a permis de générer un Bundle FHIR documentaire à partir d’un document CDA de type Patient Summary. La transformation porte sur l’en-tête du document, les informations administratives et contextuelles ainsi que sur les données cliniques contenues dans ses différentes sections.

Cette page présente les résultats globaux de la transformation, les sections prises en compte, les principales ressources FHIR générées ainsi que les précautions nécessaires pour vérifier la conservation des informations du document source.

Les résultats présentés correspondent à une preuve de concept et ne permettent pas, à eux seuls, de garantir que l’ensemble des informations du CDA a été repris sans perte.

### Résultats globaux de la transformation

À l’issue de la transformation complète :

* un Bundle FHIR de type document a été généré avec 97 ressources dans Bundle.entry, soit 98 ressources au total en incluant le Bundle lui-même ;
* les informations de l’en-tête CDA ont été transformées en ressources FHIR administratives et contextuelles ;
* les sections cliniques du Patient Summary ont été prises en compte et associées aux ressources FHIR correspondantes ;
* les profils européens et français retenus dans le cadre de la preuve de concept ont été appliqués aux ressources concernées ;
* les ressources générées ont été intégrées au Bundle à l’aide d’identifiants techniques de type UUID et de références internes au format urn:uuid.

### Mapping de l’en-tête du document

Le mapping de l’en-tête prend en compte les principales informations du document CDA nécessaires à la construction du document FHIR, notamment les métadonnées du document, l’identité du patient, les acteurs impliqués, les organisations associées ainsi que le contexte de prise en charge.

Ces éléments CDA sont mappés vers les ressources administratives et contextuelles correspondantes du `Bundle` FHIR, telles que `Composition`, `Patient`, `Practitioner`, `PractitionerRole`, `Organization`, `RelatedPerson`, `Encounter` et `Location`, en tenant compte des spécifications françaises mobilisées dans la preuve de concept.

Les éléments optionnels de l’en-tête CDA ne sont mappés vers FHIR que lorsqu’ils sont présents dans le document source.

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

#### Conservation du document CDA source

Afin de garantir la traçabilité de la transformation, le document CDA original peut être conservé directement dans le `Bundle` FHIR généré.

Pour cela, le contenu XML du CDA est encodé en Base64 à l’aide d’un traitement externe (par exemple en Python ou en Java), puis intégré dans une ressource FHIR `Binary`. Cette ressource est conçue pour transporter des contenus bruts (comme un fichier XML) sans les modifier.

Ce traitement d’encodage n’est pas réalisé en FML, mais en amont ou en aval du mapping.

```
{
  "resourceType": "Binary",
  "id": "cda-source",
  "contentType": "application/xml",
  "data": "Base64(CDA)"
}

```

Une ressource Provenance est ensuite utilisée pour relier les ressources FHIR produites au document CDA source :

```
{
  "resourceType": "Provenance",
  "target": [
    { "reference": "urn:uuid:composition-id" },
    { "reference": "urn:uuid:patient-id" }
  ],
  "entity": [
    {
      "role": "source",
      "what": {
        "reference": "urn:uuid:cda-source"
      }
    }
  ]
}

```

Dans cette approche :

* la ressource `Binary` contient le CDA original encodé en Base64 ;
* La ressource `Provenance` établit le lien entre les ressources FHIR générées et leur source ;
* L’encodage Base64 est réalisé en dehors du mapping FML

