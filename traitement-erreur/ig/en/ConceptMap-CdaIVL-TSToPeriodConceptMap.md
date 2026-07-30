# ConceptMap — CDA IVL_TS vers FHIR Period et dateTime - Mapping CDA to FHIR (Preuve de concept) v0.1.0

## ConceptMap: ConceptMap — CDA IVL_TS vers FHIR Period et dateTime (Experimental) 

 
Correspondances documentaires entre le datatype CDA IVL_TS, ses bornes IVXB_TS et les types FHIR Period et dateTime. 



## Resource Content

```json
{
  "resourceType" : "ConceptMap",
  "id" : "CdaIVL-TSToPeriodConceptMap",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/CdaIVL-TSToPeriodConceptMap",
  "version" : "0.1.0",
  "name" : "CdaIVL_TSToFHIR",
  "title" : "ConceptMap — CDA IVL_TS vers FHIR Period et dateTime",
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
  "description" : "Correspondances documentaires entre le datatype CDA IVL_TS, ses bornes IVXB_TS et les types FHIR Period et dateTime.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "FR",
      "display" : "France (la)"
    }]
  }],
  "group" : [{
    "source" : "http://hl7.org/cda/stds/core/StructureDefinition/IVL-TS",
    "sourceVersion" : "2.0.0-sd",
    "target" : "http://hl7.org/fhir/StructureDefinition/Period",
    "targetVersion" : "4.0.1",
    "element" : [{
      "code" : "IVL_TS.low",
      "display" : "Low Boundary",
      "target" : [{
        "code" : "Period.start",
        "display" : "Starting time with inclusive boundary",
        "equivalence" : "relatedto",
        "comment" : "La valeur de la borne basse IVL_TS.low, portée par IVXB_TS.value, est convertie en dateTime puis affectée à Period.start."
      }]
    },
    {
      "code" : "IVL_TS.high",
      "display" : "High Boundary",
      "target" : [{
        "code" : "Period.end",
        "display" : "End time with inclusive boundary, if not ongoing",
        "equivalence" : "relatedto",
        "comment" : "La valeur de la borne haute IVL_TS.high, portée par IVXB_TS.value, est convertie en dateTime puis affectée à Period.end."
      }]
    }]
  },
  {
    "source" : "http://hl7.org/cda/stds/core/StructureDefinition/IVXB-TS",
    "sourceVersion" : "2.0.0-sd",
    "target" : "http://hl7.org/fhir/StructureDefinition/dateTime",
    "targetVersion" : "4.0.1",
    "element" : [{
      "code" : "IVXB_TS.value",
      "display" : "IVXB_TS.value",
      "target" : [{
        "code" : "dateTime",
        "display" : "Primitive Type dateTime",
        "equivalence" : "relatedto",
        "comment" : "La valeur temporelle d’une borne CDA IVXB_TS est convertie vers le datatype primitif FHIR dateTime."
      }]
    }]
  }]
}

```
