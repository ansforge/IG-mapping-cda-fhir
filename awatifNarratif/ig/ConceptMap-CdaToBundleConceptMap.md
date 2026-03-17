# ConceptMap — CDA ClinicalDocument → FHIR Bundle - POC - Mapping CDA to FHIR v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ConceptMap — CDA ClinicalDocument → FHIR Bundle**

## ConceptMap: ConceptMap — CDA ClinicalDocument → FHIR Bundle (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/ressourcesTransverses/Bundle | *Version*:0.1.0 |
| Draft as of 2026-03-17 | *Computable Name*:ClinicalDocumentToBundle |

 
Correspondances CDA ClinicalDocument → FHIR Bundle 



## Resource Content

```json
{
  "resourceType" : "ConceptMap",
  "id" : "CdaToBundleConceptMap",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/ressourcesTransverses/Bundle",
  "version" : "0.1.0",
  "name" : "ClinicalDocumentToBundle",
  "title" : "ConceptMap — CDA ClinicalDocument → FHIR Bundle",
  "status" : "draft",
  "experimental" : true,
  "date" : "2026-03-17T16:14:56+00:00",
  "publisher" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
  "contact" : [{
    "name" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
    "telecom" : [{
      "system" : "url",
      "value" : "https://esante.gouv.fr"
    }]
  }],
  "description" : "Correspondances CDA ClinicalDocument → FHIR Bundle",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "FR",
      "display" : "FRANCE"
    }]
  }],
  "sourceUri" : "http://hl7.org/cda/stds/core/StructureDefinition/ClinicalDocument",
  "targetUri" : "http://hl7.org/fhir/StructureDefinition/Bundle",
  "group" : [{
    "source" : "http://hl7.org/cda/stds/core/StructureDefinition/ClinicalDocument",
    "target" : "http://hl7.org/fhir/StructureDefinition/Bundle",
    "element" : [{
      "code" : "ClinicalDocument_id",
      "target" : [{
        "code" : "Bundle_identifier",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "ClinicalDocument_effectiveTime",
      "target" : [{
        "code" : "Bundle_timestamp",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "ClinicalDocument_root",
      "target" : [{
        "code" : "Bundle_entry",
        "equivalence" : "equivalent"
      }]
    }]
  }]
}

```
