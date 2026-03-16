Instance: CM-CDA-EncompassingEncounter-To-Encounter
InstanceOf: ConceptMap
Title: "ConceptMap — CDA EncompassingEncounter → FHIR Encounter"
Usage: #definition

* url = "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/ressourcesTransverses/Encounter"
* name = "EncompassingEncounterToEncounter"
* status = #draft
* experimental = true
* description = "Correspondances entre EncompassingEncounter CDA et Encounter FHIR"

* source = "http://hl7.org/cda/stds/core/StructureDefinition/EncompassingEncounter"
* target = "http://hl7.org/fhir/StructureDefinition/Encounter"

* group[0].source = "http://hl7.org/cda/stds/core/StructureDefinition/EncompassingEncounter"
* group[0].target = "http://hl7.org/fhir/StructureDefinition/Encounter"

* group[0].element[0].code = #CDA001
* group[0].element[0].display = "ClinicalDocument.componentOf.encompassingEncounter.id"
* group[0].element[0].target[0].code = #FHIR001
* group[0].element[0].target[0].display = "Encounter.identifier"
* group[0].element[0].target[0].equivalence = #equal

* group[0].element[1].code = #CDA002
* group[0].element[1].display = "ClinicalDocument.componentOf.encompassingEncounter.code"
* group[0].element[1].target[0].code = #FHIR002
* group[0].element[1].target[0].display = "Encounter.class"
* group[0].element[1].target[0].equivalence = #equal

* group[0].element[2].code = #CDA003
* group[0].element[2].display = "ClinicalDocument.componentOf.encompassingEncounter.effectiveTime"
* group[0].element[2].target[0].code = #FHIR003
* group[0].element[2].target[0].display = "Encounter.period"
* group[0].element[2].target[0].equivalence = #equal

* group[0].element[3].code = #CDA004
* group[0].element[3].display = "ClinicalDocument.componentOf.encompassingEncounter.location"
* group[0].element[3].target[0].code = #FHIR004
* group[0].element[3].target[0].display = "Encounter.location"
* group[0].element[3].target[0].equivalence = #equal