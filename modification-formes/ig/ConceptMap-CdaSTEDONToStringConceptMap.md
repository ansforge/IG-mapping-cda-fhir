# ConceptMap — CDA ST/ED/ON vers FHIR string - POC - Mapping CDA to FHIR v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ConceptMap — CDA ST/ED/ON vers FHIR string**

## ConceptMap: ConceptMap — CDA ST/ED/ON vers FHIR string (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/DataTypes/CdaStringTypesToFHIR | *Version*:0.1.0 |
| Draft as of 2026-05-12 | *Computable Name*:CdaStringTypesToFHIR |

 
Correspondances documentaires entre les datatypes CDA ST, ED et ON et le datatype FHIR string. 



## Resource Content

```json
{
  "resourceType" : "ConceptMap",
  "id" : "CdaSTEDONToStringConceptMap",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/DataTypes/CdaStringTypesToFHIR",
  "version" : "0.1.0",
  "name" : "CdaStringTypesToFHIR",
  "title" : "ConceptMap — CDA ST/ED/ON vers FHIR string",
  "status" : "draft",
  "experimental" : true,
  "date" : "2026-05-12T15:26:31+00:00",
  "publisher" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
  "contact" : [{
    "name" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
    "telecom" : [{
      "system" : "url",
      "value" : "https://esante.gouv.fr"
    }]
  }],
  "description" : "Correspondances documentaires entre les datatypes CDA ST, ED et ON et le datatype FHIR string.",
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
      "code" : "ST.xmlText",
      "display" : "ST.xmlText",
      "target" : [{
        "code" : "string",
        "display" : "string",
        "equivalence" : "equivalent",
        "comment" : "Le texte CDA ST (xmlText) alimente directement un string FHIR."
      }]
    }]
  },
  {
    "source" : "http://hl7.org/cda/stds/core/StructureDefinition/ED",
    "target" : "http://hl7.org/fhir/StructureDefinition/string",
    "element" : [{
      "code" : "ED.xmlText",
      "display" : "ED.xmlText",
      "target" : [{
        "code" : "string",
        "display" : "string",
        "equivalence" : "relatedto",
        "comment" : "Le contenu textuel CDA ED (xmlText) peut être converti en string FHIR selon le contexte (texte, base64, etc.)."
      }]
    }]
  },
  {
    "source" : "http://hl7.org/cda/stds/core/StructureDefinition/ON",
    "target" : "http://hl7.org/fhir/StructureDefinition/string",
    "element" : [{
      "code" : "ON.xmlText",
      "display" : "ON.xmlText",
      "target" : [{
        "code" : "string",
        "display" : "string",
        "equivalence" : "equivalent",
        "comment" : "Le texte CDA ON (xmlText) alimente directement un string FHIR."
      }]
    }]
  }]
}

```
