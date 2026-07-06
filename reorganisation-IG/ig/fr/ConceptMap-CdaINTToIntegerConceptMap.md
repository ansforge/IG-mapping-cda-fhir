# ConceptMap — CDA INT vers FHIR integer - POC - Mapping CDA to FHIR v0.1.0

## ConceptMap: ConceptMap — CDA INT vers FHIR integer (Expérimental) 

 
Correspondances documentaires entre le datatype CDA INT et le datatype FHIR integer. 



## Resource Content

```json
{
  "resourceType" : "ConceptMap",
  "id" : "CdaINTToIntegerConceptMap",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/DataTypes/CdaINTToInteger",
  "version" : "0.1.0",
  "name" : "CdaINTToInteger",
  "title" : "ConceptMap — CDA INT vers FHIR integer",
  "status" : "draft",
  "experimental" : true,
  "date" : "2026-07-06T08:48:45+00:00",
  "publisher" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
  "contact" : [{
    "name" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
    "telecom" : [{
      "system" : "url",
      "value" : "https://esante.gouv.fr"
    }]
  }],
  "description" : "Correspondances documentaires entre le datatype CDA INT et le datatype FHIR integer.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "FR",
      "display" : "France (la)"
    }]
  }],
  "group" : [{
    "source" : "http://hl7.org/cda/stds/core/StructureDefinition/INT",
    "sourceVersion" : "2.0.0-sd",
    "target" : "http://hl7.org/fhir/StructureDefinition/integer",
    "targetVersion" : "4.0.1",
    "element" : [{
      "code" : "INT.value",
      "display" : "INT.value",
      "target" : [{
        "code" : "integer",
        "display" : "integer",
        "equivalence" : "equivalent",
        "comment" : "INT.value alimente directement un integer FHIR."
      }]
    }]
  }]
}

```
