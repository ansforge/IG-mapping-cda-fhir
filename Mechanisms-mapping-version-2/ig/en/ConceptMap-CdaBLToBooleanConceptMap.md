# ConceptMap — CDA BL vers FHIR boolean - POC - Mapping CDA to FHIR v0.1.0

## ConceptMap: ConceptMap — CDA BL vers FHIR boolean (Experimental) 

 
Correspondance documentaire entre le datatype CDA BL et le datatype FHIR boolean. 



## Resource Content

```json
{
  "resourceType" : "ConceptMap",
  "id" : "CdaBLToBooleanConceptMap",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/DataTypes/CdaBLToFHIR",
  "version" : "0.1.0",
  "name" : "CdaBLToFHIR",
  "title" : "ConceptMap — CDA BL vers FHIR boolean",
  "status" : "draft",
  "experimental" : true,
  "date" : "2026-06-11T08:11:11+00:00",
  "publisher" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
  "contact" : [{
    "name" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
    "telecom" : [{
      "system" : "url",
      "value" : "https://esante.gouv.fr"
    }]
  }],
  "description" : "Correspondance documentaire entre le datatype CDA BL et le datatype FHIR boolean.",
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
      "code" : "BL.value",
      "display" : "BL.value",
      "target" : [{
        "code" : "boolean",
        "display" : "boolean",
        "equivalence" : "equivalent",
        "comment" : "La valeur BL CDA alimente directement le datatype primitif FHIR boolean."
      }]
    }]
  }]
}

```
