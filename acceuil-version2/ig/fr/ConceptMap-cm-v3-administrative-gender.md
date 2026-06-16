# CDA to FHIR Administrative Gender Mapping - POC - Mapping CDA to FHIR v0.1.0

## ConceptMap: CDA to FHIR Administrative Gender Mapping 

 
Mapping between CDA v3 Administrative Gender codes and FHIR Administrative Gender codes 



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
  "date" : "2026-06-16T12:31:45+00:00",
  "publisher" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
  "contact" : [{
    "name" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
    "telecom" : [{
      "system" : "url",
      "value" : "https://esante.gouv.fr"
    }]
  }],
  "description" : "Mapping between CDA v3 Administrative Gender codes and FHIR Administrative Gender codes",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "FR",
      "display" : "France (la)"
    }]
  }],
  "purpose" : "Used in CDA to FHIR transformations to map gender codes",
  "sourceCanonical" : "http://terminology.hl7.org/ValueSet/v3-AdministrativeGender|3.0.0",
  "targetCanonical" : "http://hl7.org/fhir/ValueSet/administrative-gender|4.0.1",
  "group" : [{
    "source" : "http://terminology.hl7.org/CodeSystem/v3-AdministrativeGender",
    "sourceVersion" : "4.0.0",
    "target" : "http://hl7.org/fhir/administrative-gender",
    "targetVersion" : "4.0.1",
    "element" : [{
      "code" : "M",
      "display" : "Male",
      "target" : [{
        "code" : "male",
        "display" : "Male",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "F",
      "display" : "Female",
      "target" : [{
        "code" : "female",
        "display" : "Female",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "UN",
      "display" : "Undifferentiated",
      "target" : [{
        "code" : "other",
        "display" : "Other",
        "equivalence" : "equivalent",
        "comment" : "CDA 'Undifferentiated' maps to FHIR 'other'"
      }]
    },
    {
      "code" : "UNK",
      "display" : "Unknown",
      "target" : [{
        "code" : "unknown",
        "display" : "Unknown",
        "equivalence" : "equivalent"
      }]
    }]
  }]
}

```
