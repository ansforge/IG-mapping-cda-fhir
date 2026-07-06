# Résultats de mapping - POC - Mapping CDA to FHIR v0.1.0

## Résultats de mapping

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

