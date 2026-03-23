# ConceptMap — CDA PQ → FHIR Quantity - POC - Mapping CDA to FHIR v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ConceptMap — CDA PQ → FHIR Quantity**

## ConceptMap: ConceptMap — CDA PQ → FHIR Quantity (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/DataTypes/CdaPQToFHIR | *Version*:0.1.0 |
| Draft as of 2026-03-23 | *Computable Name*:CdaPQToFHIR |

 
Correspondances PQ.value / PQ.unit → Quantity (value, unit, system, code). 



## Resource Content

```json
{
  "resourceType" : "ConceptMap",
  "id" : "CdaToQuantityConceptMap",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/DataTypes/CdaPQToFHIR",
  "version" : "0.1.0",
  "name" : "CdaPQToFHIR",
  "title" : "ConceptMap — CDA PQ → FHIR Quantity",
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
  "description" : "Correspondances PQ.value / PQ.unit → Quantity (value, unit, system, code).",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "FR",
      "display" : "FRANCE"
    }]
  }],
  "group" : [{
    "source" : "http://hl7.org/cda/stds/core/StructureDefinition/PQ",
    "target" : "http://hl7.org/fhir/StructureDefinition/Quantity",
    "element" : [{
      "code" : "PQ_value",
      "target" : [{
        "code" : "Quantity_value",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "PQ_unit",
      "target" : [{
        "code" : "Quantity_unit",
        "equivalence" : "equivalent"
      }]
    }]
  }]
}

```
