# ConceptMap — CDA TEL → FHIR ContactPoint - POC - Mapping CDA to FHIR v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ConceptMap — CDA TEL → FHIR ContactPoint**

## ConceptMap: ConceptMap — CDA TEL → FHIR ContactPoint (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/DataTypes/CdaTELToFHIR | *Version*:0.1.0 |
| Draft as of 2026-03-23 | *Computable Name*:CdaTELToFHIR |

 
Correspondances documentaires TEL.value (tel:/fax:/mailto:/http:/https:) + use + useablePeriod → ContactPoint. 



## Resource Content

```json
{
  "resourceType" : "ConceptMap",
  "id" : "CdaToContactPointConceptMap",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/DataTypes/CdaTELToFHIR",
  "version" : "0.1.0",
  "name" : "CdaTELToFHIR",
  "title" : "ConceptMap — CDA TEL → FHIR ContactPoint",
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
  "description" : "Correspondances documentaires TEL.value (tel:/fax:/mailto:/http:/https:) + use + useablePeriod → ContactPoint.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "FR",
      "display" : "FRANCE"
    }]
  }],
  "group" : [{
    "source" : "http://hl7.org/cda/stds/core/StructureDefinition/TEL",
    "target" : "http://hl7.org/fhir/StructureDefinition/ContactPoint",
    "element" : [{
      "code" : "TEL_value",
      "target" : [{
        "code" : "ContactPoint_value",
        "equivalence" : "equivalent"
      }]
    }]
  }]
}

```
