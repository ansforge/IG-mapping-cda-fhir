# ConceptMap — CDA TS → FHIR instant/dateTime/date - POC - Mapping CDA to FHIR v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ConceptMap — CDA TS → FHIR instant/dateTime/date**

## ConceptMap: ConceptMap — CDA TS → FHIR instant/dateTime/date (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/DataTypes/CdaTSToFHIR | *Version*:0.1.0 |
| Draft as of 2026-03-23 | *Computable Name*:CdaTSToFHIR |

 
Correspondances CDA TS.value → instant, dateTime ou date selon contexte. 



## Resource Content

```json
{
  "resourceType" : "ConceptMap",
  "id" : "CdaToDateTimeConceptMap",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/DataTypes/CdaTSToFHIR",
  "version" : "0.1.0",
  "name" : "CdaTSToFHIR",
  "title" : "ConceptMap — CDA TS → FHIR instant/dateTime/date",
  "status" : "draft",
  "experimental" : true,
  "date" : "2026-03-23T12:01:33+00:00",
  "publisher" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
  "contact" : [{
    "name" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
    "telecom" : [{
      "system" : "url",
      "value" : "https://esante.gouv.fr"
    }]
  }],
  "description" : "Correspondances CDA TS.value → instant, dateTime ou date selon contexte.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "FR",
      "display" : "FRANCE"
    }]
  }],
  "group" : [{
    "source" : "http://hl7.org/cda/stds/core/StructureDefinition/TS",
    "target" : "http://hl7.org/fhir/StructureDefinition/instant",
    "element" : [{
      "code" : "TS_value",
      "target" : [{
        "code" : "instant_value",
        "equivalence" : "equivalent"
      }]
    }]
  },
  {
    "source" : "http://hl7.org/cda/stds/core/StructureDefinition/TS",
    "target" : "http://hl7.org/fhir/StructureDefinition/dateTime",
    "element" : [{
      "code" : "TS_value",
      "target" : [{
        "code" : "dateTime_value",
        "equivalence" : "equivalent"
      }]
    }]
  },
  {
    "source" : "http://hl7.org/cda/stds/core/StructureDefinition/TS",
    "target" : "http://hl7.org/fhir/StructureDefinition/date",
    "element" : [{
      "code" : "TS_value",
      "target" : [{
        "code" : "date_value",
        "equivalence" : "equivalent"
      }]
    }]
  }]
}

```
