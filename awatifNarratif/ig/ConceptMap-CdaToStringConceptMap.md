# ConceptMap — CDA ST/ED/ON → FHIR string - POC - Mapping CDA to FHIR v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ConceptMap — CDA ST/ED/ON → FHIR string**

## ConceptMap: ConceptMap — CDA ST/ED/ON → FHIR string (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/DataTypes/CdaStringTypesToFHIR | *Version*:0.1.0 |
| Draft as of 2026-03-17 | *Computable Name*:CdaStringTypesToFHIR |

 
Correspondances CDA ST/ED/ON → FHIR string. 



## Resource Content

```json
{
  "resourceType" : "ConceptMap",
  "id" : "CdaToStringConceptMap",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/DataTypes/CdaStringTypesToFHIR",
  "version" : "0.1.0",
  "name" : "CdaStringTypesToFHIR",
  "title" : "ConceptMap — CDA ST/ED/ON → FHIR string",
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
  "description" : "Correspondances CDA ST/ED/ON → FHIR string.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "FR",
      "display" : "FRANCE"
    }]
  }],
  "group" : [{
    "source" : "http://hl7.org/cda/stds/core/StructureDefinition/ST",
    "target" : "http://hl7.org/fhir/StructureDefinition/string",
    "element" : [{
      "code" : "ST_value",
      "target" : [{
        "code" : "string_value",
        "equivalence" : "equivalent"
      }]
    }]
  },
  {
    "source" : "http://hl7.org/cda/stds/core/StructureDefinition/ED",
    "target" : "http://hl7.org/fhir/StructureDefinition/string",
    "element" : [{
      "code" : "ED_value",
      "target" : [{
        "code" : "string_value",
        "equivalence" : "equivalent"
      }]
    }]
  },
  {
    "source" : "http://hl7.org/cda/stds/core/StructureDefinition/ON",
    "target" : "http://hl7.org/fhir/StructureDefinition/string",
    "element" : [{
      "code" : "ON_value",
      "target" : [{
        "code" : "string_value",
        "equivalence" : "equivalent"
      }]
    }]
  }]
}

```
