Instance: CdaToEncounterConceptMap
InstanceOf: ConceptMap
Usage: #definition
Title: "ConceptMap — CDA EncompassingEncounter → FHIR Encounter"
Description: "Correspondances entre EncompassingEncounter CDA et Encounter FHIR"

* url = "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/ressourcesTransverses/Encounter"
* name = "EncompassingEncounterToEncounter"
* status = #draft
* experimental = true


* sourceUri = "http://hl7.org/cda/stds/core/StructureDefinition/EncompassingEncounter"
* targetUri = "http://hl7.org/fhir/StructureDefinition/Encounter"


* group[0].source = "http://hl7.org/cda/stds/core/StructureDefinition/EncompassingEncounter"
* group[0].target = "http://hl7.org/fhir/StructureDefinition/Encounter"

/* id */
* group[0].element[0].code = #ClinicalDocument_componentOf_encompassingEncounter_id
* group[0].element[0].target[0].code = #Encounter_identifier
* group[0].element[0].target[0].equivalence = #equivalent

/* code */
* group[0].element[1].code = #ClinicalDocument_componentOf_encompassingEncounter_code
* group[0].element[1].target[0].code = #Encounter_class
* group[0].element[1].target[0].equivalence = #equivalent

/* effectiveTime */
* group[0].element[2].code = #ClinicalDocument_componentOf_encompassingEncounter_effectiveTime
* group[0].element[2].target[0].code = #Encounter_period
* group[0].element[2].target[0].equivalence = #equivalent

/* location */
* group[0].element[3].code = #ClinicalDocument_componentOf_encompassingEncounter_location
* group[0].element[3].target[0].code = #Encounter_location
* group[0].element[3].target[0].equivalence = #equivalent