# ConceptMap — CDA AD → FHIR Address - POC - Mapping CDA to FHIR v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ConceptMap — CDA AD → FHIR Address**

## ConceptMap: ConceptMap — CDA AD → FHIR Address (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/DataTypes/CdaAddressToFHIR | *Version*:0.1.0 |
| Draft as of 2026-03-17 | *Computable Name*:CdaAddressToFHIR |

 
Correspondances documentaires des composants AD vers Address. 



## Resource Content

```json
{
  "resourceType" : "ConceptMap",
  "id" : "CdaToAddressConceptMap",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/DataTypes/CdaAddressToFHIR",
  "version" : "0.1.0",
  "name" : "CdaAddressToFHIR",
  "title" : "ConceptMap — CDA AD → FHIR Address",
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
  "description" : "Correspondances documentaires des composants AD vers Address.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "FR",
      "display" : "FRANCE"
    }]
  }],
  "group" : [{
    "source" : "http://hl7.org/cda/stds/core/StructureDefinition/AD",
    "target" : "http://hl7.org/fhir/StructureDefinition/Address",
    "element" : [{
      "code" : "AD_part",
      "target" : [{
        "code" : "Address_line",
        "equivalence" : "equivalent"
      }]
    }]
  }]
}

```
