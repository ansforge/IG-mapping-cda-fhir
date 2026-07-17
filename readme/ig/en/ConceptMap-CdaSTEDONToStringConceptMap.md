# ConceptMap — CDA ST/ED/ON vers FHIR string - Mapping CDA to FHIR (Preuve de concept) v0.1.0

## ConceptMap: ConceptMap — CDA ST/ED/ON vers FHIR string (Experimental) 

 
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
  "date" : "2026-07-17T13:52:17+00:00",
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
    "sourceVersion" : "2.0.0-sd",
    "target" : "http://hl7.org/fhir/StructureDefinition/string",
    "targetVersion" : "4.0.1",
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
    "sourceVersion" : "2.0.0-sd",
    "target" : "http://hl7.org/fhir/StructureDefinition/string",
    "targetVersion" : "4.0.1",
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
