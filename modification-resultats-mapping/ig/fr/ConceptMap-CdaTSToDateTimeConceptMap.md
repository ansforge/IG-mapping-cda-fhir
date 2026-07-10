# ConceptMap — CDA TS vers FHIR instant, dateTime et date - Mapping CDA to FHIR (Preuve de concept) v0.1.0

## ConceptMap: ConceptMap — CDA TS vers FHIR instant, dateTime et date (Expérimental) 

 
Correspondances documentaires entre le datatype CDA TS et les types FHIR instant, dateTime et date. 



## Resource Content

```json
{
  "resourceType" : "ConceptMap",
  "id" : "CdaTSToDateTimeConceptMap",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/DataTypes/CdaTSToFHIR",
  "version" : "0.1.0",
  "name" : "CdaTSToFHIR",
  "title" : "ConceptMap — CDA TS vers FHIR instant, dateTime et date",
  "status" : "draft",
  "experimental" : true,
  "date" : "2026-07-10T12:16:02+00:00",
  "publisher" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
  "contact" : [{
    "name" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
    "telecom" : [{
      "system" : "url",
      "value" : "https://esante.gouv.fr"
    }]
  }],
  "description" : "Correspondances documentaires entre le datatype CDA TS et les types FHIR instant, dateTime et date.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "FR",
      "display" : "France (la)"
    }]
  }],
  "group" : [{
    "source" : "http://hl7.org/cda/stds/core/StructureDefinition/TS",
    "sourceVersion" : "2.0.0-sd",
    "target" : "http://hl7.org/fhir/StructureDefinition/instant",
    "targetVersion" : "4.0.1",
    "element" : [{
      "code" : "TS.value",
      "display" : "TS.value",
      "target" : [{
        "code" : "instant",
        "display" : "instant",
        "equivalence" : "relatedto",
        "comment" : "TS.value est converti en valeur FHIR instant (précision jour ou partielle : AAAA, AAAA-MM ou AAAA-MM-JJ)."
      }]
    }]
  },
  {
    "source" : "http://hl7.org/cda/stds/core/StructureDefinition/TS",
    "sourceVersion" : "2.0.0-sd",
    "target" : "http://hl7.org/fhir/StructureDefinition/dateTime",
    "targetVersion" : "4.0.1",
    "element" : [{
      "code" : "TS.value",
      "display" : "TS.value",
      "target" : [{
        "code" : "dateTime",
        "display" : "dateTime",
        "equivalence" : "relatedto",
        "comment" : "TS.value est converti en valeur FHIR dateTime (précision variable autorisée : année/mois/jour ou date-heure)."
      }]
    }]
  },
  {
    "source" : "http://hl7.org/cda/stds/core/StructureDefinition/TS",
    "sourceVersion" : "2.0.0-sd",
    "target" : "http://hl7.org/fhir/StructureDefinition/date",
    "targetVersion" : "4.0.1",
    "element" : [{
      "code" : "TS.value",
      "display" : "TS.value",
      "target" : [{
        "code" : "date",
        "display" : "date",
        "equivalence" : "relatedto",
        "comment" : "TS.value est converti en valeur FHIR date (précision jour ou partielle : AAAA ou AAAA-MM ou AAAA-MM-JJ)."
      }]
    }]
  }]
}

```
