# ConceptMap — CDA AssignedAuthor → FHIR Practitioner - POC - Mapping CDA to FHIR v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ConceptMap — CDA AssignedAuthor → FHIR Practitioner**

## ConceptMap: ConceptMap — CDA AssignedAuthor → FHIR Practitioner (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/ressourcesTransverses/Practitioner | *Version*:0.1.0 |
| Draft as of 2026-03-17 | *Computable Name*:AssignedAuthorToPractitioner |

 
Correspondances entre AssignedAuthor CDA et Practitioner FHIR 



## Resource Content

```json
{
  "resourceType" : "ConceptMap",
  "id" : "CdaToPractitionerConceptMap",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/ressourcesTransverses/Practitioner",
  "version" : "0.1.0",
  "name" : "AssignedAuthorToPractitioner",
  "title" : "ConceptMap — CDA AssignedAuthor → FHIR Practitioner",
  "status" : "draft",
  "experimental" : true,
  "date" : "2026-03-17T13:08:47+00:00",
  "publisher" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
  "contact" : [{
    "name" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
    "telecom" : [{
      "system" : "url",
      "value" : "https://esante.gouv.fr"
    }]
  }],
  "description" : "Correspondances entre AssignedAuthor CDA et Practitioner FHIR",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "FR",
      "display" : "FRANCE"
    }]
  }],
  "sourceUri" : "http://hl7.org/cda/stds/core/StructureDefinition/AssignedAuthor",
  "targetUri" : "http://hl7.org/fhir/StructureDefinition/Practitioner",
  "group" : [{
    "source" : "http://hl7.org/cda/stds/core/StructureDefinition/AssignedAuthor",
    "target" : "http://hl7.org/fhir/StructureDefinition/Practitioner",
    "element" : [{
      "code" : "ClinicalDocument_author_assignedAuthor_id",
      "target" : [{
        "code" : "Practitioner_identifier",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "ClinicalDocument_author_assignedAuthor_addr",
      "target" : [{
        "code" : "Practitioner_address",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "ClinicalDocument_author_assignedAuthor_telecom",
      "target" : [{
        "code" : "Practitioner_telecom",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "ClinicalDocument_author_assignedAuthor_assignedPerson_name",
      "target" : [{
        "code" : "Practitioner_name",
        "equivalence" : "equivalent"
      }]
    }]
  }]
}

```
