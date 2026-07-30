# ConceptMap — CDA ST/ED/ON vers FHIR string - Mapping CDA to FHIR (Preuve de concept) v0.1.0

## ConceptMap: ConceptMap — CDA ST/ED/ON vers FHIR string (Expérimental) 

 
Correspondances documentaires entre les datatypes CDA ST, ED et ON et le datatype FHIR string. 



## Resource Content

```json
{
  "resourceType" : "ConceptMap",
  "id" : "CdaSTEDONToStringConceptMap",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/CdaSTEDONToStringConceptMap",
  "version" : "0.1.0",
  "name" : "CdaStringTypesToFHIR",
  "title" : "ConceptMap — CDA ST/ED/ON vers FHIR string",
  "status" : "draft",
  "experimental" : true,
  "date" : "2026-07-30T13:49:22+00:00",
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
      "display" : "France (la)"
    }]
  }],
  "group" : [{
    "source" : "http://hl7.org/cda/stds/core/StructureDefinition/ST",
    "sourceVersion" : "2.0.0-sd",
    "target" : "http://hl7.org/fhir/StructureDefinition/string",
    "targetVersion" : "4.0.1",
    "element" : [{
      "code" : "ST.xmlText",
      "display" : "Allows for mixed text content",
      "target" : [{
        "code" : "string",
        "display" : "Primitive Type string",
        "equivalence" : "equivalent",
        "comment" : "Le contenu textuel du datatype CDA ST alimente directement le datatype primitif FHIR string."
      }]
    }]
  },
  {
    "source" : "http://hl7.org/cda/stds/core/StructureDefinition/ED",
    "sourceVersion" : "2.0.0-sd",
    "target" : "http://hl7.org/fhir/StructureDefinition/string",
    "targetVersion" : "4.0.1",
    "element" : [{
      "code" : "ED.xmlText",
      "display" : "Allows for mixed text content. If @representation='B64', this SHALL be a base64binary string.",
      "target" : [{
        "code" : "string",
        "display" : "Primitive Type string",
        "equivalence" : "relatedto",
        "comment" : "Le contenu textuel du datatype CDA ED peut être converti vers un string FHIR lorsque sa représentation est textuelle. Une représentation B64 nécessite une conversion adaptée au contenu encodé."
      }]
    }]
  },
  {
    "source" : "http://hl7.org/cda/stds/core/StructureDefinition/ON",
    "sourceVersion" : "2.0.0-sd",
    "target" : "http://hl7.org/fhir/StructureDefinition/string",
    "targetVersion" : "4.0.1",
    "element" : [{
      "code" : "ON.item.xmlText",
      "display" : "Allows for mixed text content",
      "target" : [{
        "code" : "string",
        "display" : "Primitive Type string",
        "equivalence" : "equivalent",
        "comment" : "Le contenu textuel du nom d’organisation CDA ON alimente directement le datatype primitif FHIR string."
      }]
    }]
  }]
}

```
