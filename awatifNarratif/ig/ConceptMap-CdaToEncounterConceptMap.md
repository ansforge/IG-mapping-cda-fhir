# ConceptMap — CDA EncompassingEncounter → FHIR Encounter - POC - Mapping CDA to FHIR v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ConceptMap — CDA EncompassingEncounter → FHIR Encounter**

## ConceptMap: ConceptMap — CDA EncompassingEncounter → FHIR Encounter (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/ressourcesTransverses/Encounter | *Version*:0.1.0 |
| Draft as of 2026-03-17 | *Computable Name*:EncompassingEncounterToEncounter |

 
Correspondances entre EncompassingEncounter CDA et Encounter FHIR 



## Resource Content

```json
{
  "resourceType" : "ConceptMap",
  "id" : "CdaToEncounterConceptMap",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/ressourcesTransverses/Encounter",
  "version" : "0.1.0",
  "name" : "EncompassingEncounterToEncounter",
  "title" : "ConceptMap — CDA EncompassingEncounter → FHIR Encounter",
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
  "description" : "Correspondances entre EncompassingEncounter CDA et Encounter FHIR",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "FR",
      "display" : "FRANCE"
    }]
  }],
  "sourceUri" : "http://hl7.org/cda/stds/core/StructureDefinition/EncompassingEncounter",
  "targetUri" : "http://hl7.org/fhir/StructureDefinition/Encounter",
  "group" : [{
    "source" : "http://hl7.org/cda/stds/core/StructureDefinition/EncompassingEncounter",
    "target" : "http://hl7.org/fhir/StructureDefinition/Encounter",
    "element" : [{
      "code" : "ClinicalDocument_componentOf_encompassingEncounter_id",
      "target" : [{
        "code" : "Encounter_identifier",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "ClinicalDocument_componentOf_encompassingEncounter_code",
      "target" : [{
        "code" : "Encounter_class",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "ClinicalDocument_componentOf_encompassingEncounter_effectiveTime",
      "target" : [{
        "code" : "Encounter_period",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "ClinicalDocument_componentOf_encompassingEncounter_location",
      "target" : [{
        "code" : "Encounter_location",
        "equivalence" : "equivalent"
      }]
    }]
  }]
}

```
