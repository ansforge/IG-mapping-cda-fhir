# ConceptMap — CDA CE/CS/CD → FHIR code/CodeableConcept - POC - Mapping CDA to FHIR v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ConceptMap — CDA CE/CS/CD → FHIR code/CodeableConcept**

## ConceptMap: ConceptMap — CDA CE/CS/CD → FHIR code/CodeableConcept (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/DataTypes/CdaConceptCodesToFHIR | *Version*:0.1.0 |
| Draft as of 2026-03-17 | *Computable Name*:CdaConceptCodesToFHIR |

 
Correspondances documentaires code/codeSystem/displayName/originalText/translations → code/CodeableConcept. 



## Resource Content

```json
{
  "resourceType" : "ConceptMap",
  "id" : "CdaToCodeConceptMap",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/DataTypes/CdaConceptCodesToFHIR",
  "version" : "0.1.0",
  "name" : "CdaConceptCodesToFHIR",
  "title" : "ConceptMap — CDA CE/CS/CD → FHIR code/CodeableConcept",
  "status" : "draft",
  "experimental" : true,
  "date" : "2026-03-17T13:21:46+00:00",
  "publisher" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
  "contact" : [{
    "name" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
    "telecom" : [{
      "system" : "url",
      "value" : "https://esante.gouv.fr"
    }]
  }],
  "description" : "Correspondances documentaires code/codeSystem/displayName/originalText/translations → code/CodeableConcept.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "FR",
      "display" : "FRANCE"
    }]
  }],
  "group" : [{
    "source" : "http://hl7.org/cda/stds/core/StructureDefinition/CE",
    "target" : "http://hl7.org/fhir/StructureDefinition/code",
    "element" : [{
      "code" : "CE_code",
      "target" : [{
        "code" : "FHIR_code",
        "equivalence" : "equivalent"
      }]
    }]
  },
  {
    "source" : "http://hl7.org/cda/stds/core/StructureDefinition/CE",
    "target" : "http://hl7.org/fhir/StructureDefinition/CodeableConcept",
    "element" : [{
      "code" : "CE",
      "target" : [{
        "code" : "FHIR_CodeableConcept",
        "equivalence" : "equivalent"
      }]
    }]
  },
  {
    "source" : "http://hl7.org/cda/stds/core/StructureDefinition/CS",
    "target" : "http://hl7.org/fhir/StructureDefinition/code",
    "element" : [{
      "code" : "CS_code",
      "target" : [{
        "code" : "FHIR_code",
        "equivalence" : "equivalent"
      }]
    }]
  },
  {
    "source" : "http://hl7.org/cda/stds/core/StructureDefinition/CD",
    "target" : "http://hl7.org/fhir/StructureDefinition/code",
    "element" : [{
      "code" : "CD_code",
      "target" : [{
        "code" : "FHIR_code",
        "equivalence" : "equivalent"
      }]
    }]
  }]
}

```
