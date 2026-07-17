# ConceptMap — CDA IVL_TS vers FHIR Period et dateTime - Mapping CDA to FHIR (Preuve de concept) v0.1.0

## ConceptMap: ConceptMap — CDA IVL_TS vers FHIR Period et dateTime (Expérimental) 

 
Correspondances documentaires entre le datatype CDA IVL_TS et les types FHIR Period et dateTime. 



## Resource Content

```json
{
  "resourceType" : "ConceptMap",
  "id" : "CdaIVL-TSToPeriodConceptMap",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/DataTypes/CdaIVL_TSToFHIR",
  "version" : "0.1.0",
  "name" : "CdaIVL_TSToFHIR",
  "title" : "ConceptMap — CDA IVL_TS vers FHIR Period et dateTime",
  "status" : "draft",
  "experimental" : true,
  "date" : "2026-07-17T08:13:58+00:00",
  "publisher" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
  "contact" : [{
    "name" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
    "telecom" : [{
      "system" : "url",
      "value" : "https://esante.gouv.fr"
    }]
  }],
  "description" : "Correspondances documentaires entre le datatype CDA IVL_TS et les types FHIR Period et dateTime.",
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
      "code" : "IVL_TS.low.value",
      "display" : "IVL_TS.low.value",
      "target" : [{
        "code" : "Period.start",
        "display" : "Period.start",
        "equivalence" : "relatedto",
        "comment" : "La valeur de la borne low (IVXB_TS.value) est convertie en dateTime puis affectée à Period.start."
      }]
    },
    {
      "code" : "IVL_TS.high.value",
      "display" : "IVL_TS.high.value",
      "target" : [{
        "code" : "Period.end",
        "display" : "Period.end",
        "equivalence" : "relatedto",
        "comment" : "La valeur de la borne high (IVXB_TS.value) est convertie en dateTime puis affectée à Period.end."
      }]
    }]
  },
  {
    "source" : "http://hl7.org/cda/stds/core/StructureDefinition/IVL-TS",
    "sourceVersion" : "2.0.0-sd",
    "target" : "http://hl7.org/fhir/StructureDefinition/dateTime",
    "targetVersion" : "4.0.1",
    "element" : [{
      "code" : "IVL_TS.low.value",
      "display" : "IVL_TS.low.value",
      "target" : [{
        "code" : "dateTime",
        "display" : "dateTime",
        "equivalence" : "relatedto",
        "comment" : "La valeur de la borne low est utilisée comme date représentative et convertie en dateTime."
      }]
    }]
  }]
}

```
