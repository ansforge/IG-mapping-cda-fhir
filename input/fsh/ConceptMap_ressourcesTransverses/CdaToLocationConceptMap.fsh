Instance: CdaToLocationConceptMap
InstanceOf: ConceptMap
Usage: #definition
Title: "ConceptMap — CDA HealthCareFacility → FHIR Location"
Description: "Correspondances entre HealthCareFacility CDA et Location FHIR"

* url = "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/ressourcesTransverses/Location"
* name = "HealthCareFacilityToLocation"
* status = #draft
* experimental = true

* sourceUri = "http://hl7.org/cda/stds/core/StructureDefinition/HealthCareFacility"
* targetUri = "http://hl7.org/fhir/StructureDefinition/Location"

* group[0].source = "http://hl7.org/cda/stds/core/StructureDefinition/HealthCareFacility"
* group[0].target = "http://hl7.org/fhir/StructureDefinition/Location"

/* id */
* group[0].element[0].code = #ClinicalDocument_componentOf_encompassingEncounter_location_healthCareFacility_id
* group[0].element[0].target[0].code = #Location_identifier
* group[0].element[0].target[0].equivalence = #equivalent

/* code */
* group[0].element[1].code = #ClinicalDocument_componentOf_encompassingEncounter_location_healthCareFacility_code
* group[0].element[1].target[0].code = #Location_type
* group[0].element[1].target[0].equivalence = #equivalent

/* address */
* group[0].element[2].code = #ClinicalDocument_componentOf_encompassingEncounter_location_healthCareFacility_location_addr
* group[0].element[2].target[0].code = #Location_address
* group[0].element[2].target[0].equivalence = #equivalent