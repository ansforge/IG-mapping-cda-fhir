# ConceptMap — CDA ClinicalDocument → FHIR Composition - POC - Mapping CDA to FHIR v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ConceptMap — CDA ClinicalDocument → FHIR Composition**

## ConceptMap: ConceptMap — CDA ClinicalDocument → FHIR Composition (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/ressourcesTransverses/Composition | *Version*:0.1.0 |
| Draft as of 2026-03-17 | *Computable Name*:ClinicalDocumentToComposition |

 
Correspondances entre ClinicalDocument CDA et Composition FHIR 



## Resource Content

```json
{
  "resourceType" : "ConceptMap",
  "id" : "CdaToCompositionConceptMap",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/ressourcesTransverses/Composition",
  "version" : "0.1.0",
  "name" : "ClinicalDocumentToComposition",
  "title" : "ConceptMap — CDA ClinicalDocument → FHIR Composition",
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
  "description" : "Correspondances entre ClinicalDocument CDA et Composition FHIR",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "FR",
      "display" : "FRANCE"
    }]
  }],
  "sourceUri" : "http://hl7.org/cda/stds/core/StructureDefinition/ClinicalDocument",
  "targetUri" : "http://hl7.org/fhir/StructureDefinition/Composition",
  "group" : [{
    "source" : "http://hl7.org/cda/stds/core/StructureDefinition/ClinicalDocument",
    "target" : "http://hl7.org/fhir/StructureDefinition/Composition",
    "element" : [{
      "code" : "ClinicalDocument_id",
      "target" : [{
        "code" : "Composition_identifier",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "ClinicalDocument_code",
      "target" : [{
        "code" : "Composition_type",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "ClinicalDocument_title",
      "target" : [{
        "code" : "Composition_title",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "ClinicalDocument_effectiveTime",
      "target" : [{
        "code" : "Composition_date",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "ClinicalDocument_author",
      "target" : [{
        "code" : "Composition_author",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "ClinicalDocument_confidentialityCode",
      "target" : [{
        "code" : "Composition_confidentiality",
        "equivalence" : "equivalent"
      }]
    }]
  }]
}

```
