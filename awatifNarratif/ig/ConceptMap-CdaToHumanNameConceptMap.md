# ConceptMap — CDA EN/PN → FHIR HumanName - POC - Mapping CDA to FHIR v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ConceptMap — CDA EN/PN → FHIR HumanName**

## ConceptMap: ConceptMap — CDA EN/PN → FHIR HumanName (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/DataTypes/CdaNamesToFHIR | *Version*:0.1.0 |
| Draft as of 2026-03-17 | *Computable Name*:CdaNamesToFHIR |

 
Correspondances documentaires des composants EN/PN vers HumanName (family/given/prefix/suffix/period). 



## Resource Content

```json
{
  "resourceType" : "ConceptMap",
  "id" : "CdaToHumanNameConceptMap",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/DataTypes/CdaNamesToFHIR",
  "version" : "0.1.0",
  "name" : "CdaNamesToFHIR",
  "title" : "ConceptMap — CDA EN/PN → FHIR HumanName",
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
  "description" : "Correspondances documentaires des composants EN/PN vers HumanName (family/given/prefix/suffix/period).",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "FR",
      "display" : "FRANCE"
    }]
  }],
  "group" : [{
    "source" : "http://hl7.org/cda/stds/core/StructureDefinition/EN",
    "target" : "http://hl7.org/fhir/StructureDefinition/HumanName",
    "element" : [{
      "code" : "EN_family",
      "target" : [{
        "code" : "HumanName_family",
        "equivalence" : "equivalent"
      }]
    }]
  },
  {
    "source" : "http://hl7.org/cda/stds/core/StructureDefinition/PN",
    "target" : "http://hl7.org/fhir/StructureDefinition/HumanName",
    "element" : [{
      "code" : "PN_given",
      "target" : [{
        "code" : "HumanName_given",
        "equivalence" : "equivalent"
      }]
    }]
  }]
}

```
