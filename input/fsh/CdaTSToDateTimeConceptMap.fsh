Instance: CdaTSToDateTimeConceptMap
InstanceOf: ConceptMap
Usage: #definition
Title: "ConceptMap — CDA TS vers FHIR instant, dateTime et date"
Description: "Correspondances documentaires entre le datatype CDA TS et les types FHIR instant, dateTime et date."

* url = "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/DataTypes/CdaTSToFHIR"
* name = "CdaTSToFHIR"
* status = #draft
* experimental = true

// Group 0 — TS -> instant
* group[0].source = "http://hl7.org/cda/stds/core/StructureDefinition/TS"
* group[0].target = "http://hl7.org/fhir/StructureDefinition/instant"

/* TS.value -> instant */
* group[0].element[0].code = #TS.value
* group[0].element[0].display = "TS.value"
* group[0].element[0].target[0].code = #instant
* group[0].element[0].target[0].display = "instant"
* group[0].element[0].target[0].equivalence = #relatedto
* group[0].element[0].target[0].comment = "TS.value est converti en valeur FHIR instant (précision jour ou partielle : AAAA, AAAA-MM ou AAAA-MM-JJ)."

// Group 1 — TS -> dateTime
* group[1].source = "http://hl7.org/cda/stds/core/StructureDefinition/TS"
* group[1].target = "http://hl7.org/fhir/StructureDefinition/dateTime"

/* TS.value -> dateTime */
* group[1].element[0].code = #TS.value
* group[1].element[0].display = "TS.value"
* group[1].element[0].target[0].code = #dateTime
* group[1].element[0].target[0].display = "dateTime"
* group[1].element[0].target[0].equivalence = #relatedto
* group[1].element[0].target[0].comment = "TS.value est converti en valeur FHIR dateTime (précision variable autorisée : année/mois/jour ou date-heure)."

// Group 2 — TS -> date
* group[2].source = "http://hl7.org/cda/stds/core/StructureDefinition/TS"
* group[2].target = "http://hl7.org/fhir/StructureDefinition/date"

/* TS.value -> date */
* group[2].element[0].code = #TS.value
* group[2].element[0].display = "TS.value"
* group[2].element[0].target[0].code = #date
* group[2].element[0].target[0].display = "date"
* group[2].element[0].target[0].equivalence = #relatedto
* group[2].element[0].target[0].comment = "TS.value est converti en valeur FHIR date (précision jour ou partielle : AAAA ou AAAA-MM ou AAAA-MM-JJ)."
