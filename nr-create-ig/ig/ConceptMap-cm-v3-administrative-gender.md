# CDA to FHIR Administrative Gender Mapping - POC - Mapping CDA to FHIR v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **CDA to FHIR Administrative Gender Mapping**

## ConceptMap: CDA to FHIR Administrative Gender Mapping 

| | |
| :--- | :--- |
| *Official URL*:https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/cm-v3-administrative-gender | *Version*:0.1.0 |
| Active as of 2025-10-31 | *Computable Name*:CdaToFhirAdministrativeGender |

 
Mapping between CDA v3 Administrative Gender codes and FHIR Administrative Gender codes 

 
Used in CDA to FHIR transformations to map gender codes 

Mapping de [AdministrativeGender](http://terminology.hl7.org/6.5.0/ValueSet-v3-AdministrativeGender.html) vers [AdministrativeGender](http://hl7.org/fhir/R4/valueset-administrative-gender.html)

**Groupe 1**Mapping de [AdministrativeGender](http://terminology.hl7.org/6.5.0/CodeSystem-v3-AdministrativeGender.html) to [AdministrativeGender](http://hl7.org/fhir/R4/codesystem-administrative-gender.html)

* **Code source**: M (Male)
  * **relation**: [is equivalent to](http://hl7.org/fhir/R5/codesystem-concept-map-relationship.html#equivalent)
  * **Code cible**: male
  * **Commentaire**: 
* **Code source**: F (Female)
  * **relation**: [is equivalent to](http://hl7.org/fhir/R5/codesystem-concept-map-relationship.html#equivalent)
  * **Code cible**: female
  * **Commentaire**: 
* **Code source**: UN (Undifferentiated)
  * **relation**: [is equivalent to](http://hl7.org/fhir/R5/codesystem-concept-map-relationship.html#equivalent)
  * **Code cible**: other
  * **Commentaire**: CDA 'Undifferentiated' maps to FHIR 'other'
* **Code source**: UNK (Unknown)
  * **relation**: [is equivalent to](http://hl7.org/fhir/R5/codesystem-concept-map-relationship.html#equivalent)
  * **Code cible**: unknown
  * **Commentaire**: 



## Resource Content

```json
{
  "resourceType" : "ConceptMap",
  "id" : "cm-v3-administrative-gender",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/cm-v3-administrative-gender",
  "version" : "0.1.0",
  "name" : "CdaToFhirAdministrativeGender",
  "title" : "CDA to FHIR Administrative Gender Mapping",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-10-31T16:31:50+00:00",
  "publisher" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
  "contact" : [
    {
      "name" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
      "telecom" : [
        {
          "system" : "url",
          "value" : "https://esante.gouv.fr"
        }
      ]
    }
  ],
  "description" : "Mapping between CDA v3 Administrative Gender codes and FHIR Administrative Gender codes",
  "jurisdiction" : [
    {
      "coding" : [
        {
          "system" : "urn:iso:std:iso:3166",
          "code" : "FR",
          "display" : "FRANCE"
        }
      ]
    }
  ],
  "purpose" : "Used in CDA to FHIR transformations to map gender codes",
  "sourceCanonical" : "http://terminology.hl7.org/ValueSet/v3-AdministrativeGender",
  "targetCanonical" : "http://hl7.org/fhir/ValueSet/administrative-gender",
  "group" : [
    {
      "source" : "http://terminology.hl7.org/CodeSystem/v3-AdministrativeGender",
      "target" : "http://hl7.org/fhir/administrative-gender",
      "element" : [
        {
          "code" : "M",
          "display" : "Male",
          "target" : [
            {
              "code" : "male",
              "display" : "Male",
              "equivalence" : "equivalent"
            }
          ]
        },
        {
          "code" : "F",
          "display" : "Female",
          "target" : [
            {
              "code" : "female",
              "display" : "Female",
              "equivalence" : "equivalent"
            }
          ]
        },
        {
          "code" : "UN",
          "display" : "Undifferentiated",
          "target" : [
            {
              "code" : "other",
              "display" : "Other",
              "equivalence" : "equivalent",
              "comment" : "CDA 'Undifferentiated' maps to FHIR 'other'"
            }
          ]
        },
        {
          "code" : "UNK",
          "display" : "Unknown",
          "target" : [
            {
              "code" : "unknown",
              "display" : "Unknown",
              "equivalence" : "equivalent"
            }
          ]
        }
      ]
    }
  ]
}

```
