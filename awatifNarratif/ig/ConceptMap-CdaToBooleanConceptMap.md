# ConceptMap — CDA BL → FHIR boolean / negation - POC - Mapping CDA to FHIR v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ConceptMap — CDA BL → FHIR boolean / negation**

## ConceptMap: ConceptMap — CDA BL → FHIR boolean / negation (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/DataTypes/CdaBLToFHIR | *Version*:0.1.0 |
| Draft as of 2026-03-17 | *Computable Name*:CdaBLToFHIR |

 
Correspondances BL.value → boolean ; BL.negationInd → boolean (modifierExtension). 



## Resource Content

```json
{
  "resourceType" : "ConceptMap",
  "id" : "CdaToBooleanConceptMap",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/DataTypes/CdaBLToFHIR",
  "version" : "0.1.0",
  "name" : "CdaBLToFHIR",
  "title" : "ConceptMap — CDA BL → FHIR boolean / negation",
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
  "description" : "Correspondances BL.value → boolean ; BL.negationInd → boolean (modifierExtension).",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "FR",
      "display" : "FRANCE"
    }]
  }],
  "group" : [{
    "source" : "http://hl7.org/cda/stds/core/StructureDefinition/BL",
    "target" : "http://hl7.org/fhir/StructureDefinition/boolean",
    "element" : [{
      "code" : "BL_value",
      "target" : [{
        "code" : "boolean_value",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "BL_negationInd",
      "target" : [{
        "code" : "boolean_negationInd",
        "equivalence" : "equivalent"
      }]
    }]
  }]
}

```
