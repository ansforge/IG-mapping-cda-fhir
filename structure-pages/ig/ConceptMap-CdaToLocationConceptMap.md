# ConceptMap — CDA HealthCareFacility → FHIR Location - POC - Mapping CDA to FHIR v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ConceptMap — CDA HealthCareFacility → FHIR Location**

## ConceptMap: ConceptMap — CDA HealthCareFacility → FHIR Location (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/ressourcesTransverses/Location | *Version*:0.1.0 |
| Draft as of 2026-03-20 | *Computable Name*:HealthCareFacilityToLocation |

 
Correspondances entre HealthCareFacility CDA et Location FHIR 



## Resource Content

```json
{
  "resourceType" : "ConceptMap",
  "id" : "CdaToLocationConceptMap",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/ressourcesTransverses/Location",
  "version" : "0.1.0",
  "name" : "HealthCareFacilityToLocation",
  "title" : "ConceptMap — CDA HealthCareFacility → FHIR Location",
  "status" : "draft",
  "experimental" : true,
  "date" : "2026-03-20T13:38:30+00:00",
  "publisher" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
  "contact" : [{
    "name" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
    "telecom" : [{
      "system" : "url",
      "value" : "https://esante.gouv.fr"
    }]
  }],
  "description" : "Correspondances entre HealthCareFacility CDA et Location FHIR",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "FR",
      "display" : "FRANCE"
    }]
  }],
  "sourceUri" : "http://hl7.org/cda/stds/core/StructureDefinition/HealthCareFacility",
  "targetUri" : "http://hl7.org/fhir/StructureDefinition/Location",
  "group" : [{
    "source" : "http://hl7.org/cda/stds/core/StructureDefinition/HealthCareFacility",
    "target" : "http://hl7.org/fhir/StructureDefinition/Location",
    "element" : [{
      "code" : "ClinicalDocument_componentOf_encompassingEncounter_location_healthCareFacility_id",
      "target" : [{
        "code" : "Location_identifier",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "ClinicalDocument_componentOf_encompassingEncounter_location_healthCareFacility_code",
      "target" : [{
        "code" : "Location_type",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "ClinicalDocument_componentOf_encompassingEncounter_location_healthCareFacility_location_addr",
      "target" : [{
        "code" : "Location_address",
        "equivalence" : "equivalent"
      }]
    }]
  }]
}

```
