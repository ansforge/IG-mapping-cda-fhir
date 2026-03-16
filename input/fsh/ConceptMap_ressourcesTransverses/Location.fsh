Instance: CM-CDA-HealthCareFacility-To-Location
InstanceOf: ConceptMap
Title: "ConceptMap — CDA HealthCareFacility → FHIR Location"
Usage: #definition

* url = "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/ressourcesTransverses/Location"
* name = "HealthCareFacilityToLocation"
* status = #draft
* experimental = true
* description = "Correspondances entre HealthCareFacility CDA et Location FHIR"

* source = "http://hl7.org/cda/stds/core/StructureDefinition/HealthCareFacility"
* target = "http://hl7.org/fhir/StructureDefinition/Location"

* group[0].source = "http://hl7.org/cda/stds/core/StructureDefinition/HealthCareFacility"
* group[0].target = "http://hl7.org/fhir/StructureDefinition/Location"

* group[0].element[0].code = #CDA001
* group[0].element[0].display = "ClinicalDocument.componentOf.encompassingEncounter.location.healthCareFacility.id"
* group[0].element[0].target[0].code = #FHIR001
* group[0].element[0].target[0].display = "Location.identifier"
* group[0].element[0].target[0].equivalence = #equal

* group[0].element[1].code = #CDA002
* group[0].element[1].display = "ClinicalDocument.componentOf.encompassingEncounter.location.healthCareFacility.code"
* group[0].element[1].target[0].code = #FHIR002
* group[0].element[1].target[0].display = "Location.type"
* group[0].element[1].target[0].equivalence = #equal

* group[0].element[2].code = #CDA003
* group[0].element[2].display = "ClinicalDocument.componentOf.encompassingEncounter.location.healthCareFacility.location.addr"
* group[0].element[2].target[0].code = #FHIR003
* group[0].element[2].target[0].display = "Location.address"
* group[0].element[2].target[0].equivalence = #equal