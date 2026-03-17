# ConceptMap — CDA IVL_TS → FHIR Period/dateTime - POC - Mapping CDA to FHIR v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ConceptMap — CDA IVL_TS → FHIR Period/dateTime**

## ConceptMap: ConceptMap — CDA IVL_TS → FHIR Period/dateTime (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/DataTypes/CdaIVL_TSToFHIR | *Version*:0.1.0 |
| Draft as of 2026-03-17 | *Computable Name*:CdaIVL_TSToFHIR |

 
Correspondances CDA IVL_TS (low/high) vers Period.start/end ou dateTime. 



## Resource Content

```json
{
  "resourceType" : "ConceptMap",
  "id" : "CdaToPeriodConceptMap",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/DataTypes/CdaIVL_TSToFHIR",
  "version" : "0.1.0",
  "name" : "CdaIVL_TSToFHIR",
  "title" : "ConceptMap — CDA IVL_TS → FHIR Period/dateTime",
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
  "description" : "Correspondances CDA IVL_TS (low/high) vers Period.start/end ou dateTime.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "FR",
      "display" : "FRANCE"
    }]
  }],
  "group" : [{
    "source" : "http://hl7.org/cda/stds/core/StructureDefinition/IVL_TS",
    "target" : "http://hl7.org/fhir/StructureDefinition/Period",
    "element" : [{
      "code" : "IVL_TS_low",
      "target" : [{
        "code" : "Period_start",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "IVL_TS_high",
      "target" : [{
        "code" : "Period_end",
        "equivalence" : "equivalent"
      }]
    }]
  },
  {
    "source" : "http://hl7.org/cda/stds/core/StructureDefinition/IVL_TS",
    "target" : "http://hl7.org/fhir/StructureDefinition/dateTime",
    "element" : [{
      "code" : "IVL_TS_low",
      "target" : [{
        "code" : "dateTime_value",
        "equivalence" : "wider"
      }]
    }]
  }]
}

```
