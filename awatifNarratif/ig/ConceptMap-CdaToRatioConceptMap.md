# ConceptMap — CDA RTO_PQ_PQ → FHIR Ratio - POC - Mapping CDA to FHIR v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ConceptMap — CDA RTO_PQ_PQ → FHIR Ratio**

## ConceptMap: ConceptMap — CDA RTO_PQ_PQ → FHIR Ratio (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/DataTypes/CdaRTOPQPQToFHIR | *Version*:0.1.0 |
| Draft as of 2026-03-17 | *Computable Name*:CdaRTOPQPQToFHIR |

 
Correspondances documentaires numerator/denominator CDA → numerator/denominator FHIR. 



## Resource Content

```json
{
  "resourceType" : "ConceptMap",
  "id" : "CdaToRatioConceptMap",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/DataTypes/CdaRTOPQPQToFHIR",
  "version" : "0.1.0",
  "name" : "CdaRTOPQPQToFHIR",
  "title" : "ConceptMap — CDA RTO_PQ_PQ → FHIR Ratio",
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
  "description" : "Correspondances documentaires numerator/denominator CDA → numerator/denominator FHIR.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "FR",
      "display" : "FRANCE"
    }]
  }],
  "group" : [{
    "source" : "http://hl7.org/cda/stds/core/StructureDefinition/RTO_PQ_PQ",
    "target" : "http://hl7.org/fhir/StructureDefinition/Ratio",
    "element" : [{
      "code" : "RTO_PQ_PQ_numerator",
      "target" : [{
        "code" : "Ratio_numerator",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "RTO_PQ_PQ_denominator",
      "target" : [{
        "code" : "Ratio_denominator",
        "equivalence" : "equivalent"
      }]
    }]
  }]
}

```
