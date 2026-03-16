

Title: "ConceptMap — CDA TS → FHIR instant/dateTime/date"
Usage: #definition

* url = "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/DataTypes/CdaTSToFHIR"
* name = "CdaTSToFHIR"
* status = #draft
* experimental = true
* description = "Correspondances CDA TS.value → instant, dateTime ou date selon contexte."

/* TS → instant */
* group[0].source = "http://hl7.org/cda/stds/core/StructureDefinition/TS"
* group[0].target = "http://hl7.org/fhir/StructureDefinition/instant"
* group[0].element[0].code = "TS.value"
* group[0].element[0].target.code = "instant"
* group[0].element[0].target.relationship = #related-to

/* TS → dateTime */
* group[1].source = "http://hl7.org/cda/stds/core/StructureDefinition/TS"
* group[1].target = "http://hl7.org/fhir/StructureDefinition/dateTime"
* group[1].element[0].code = "TS.value"
* group[1].element[0].target.code = "dateTime"
* group[1].element[0].target.relationship = #related-to

/* TS → date */
* group[2].source = "http://hl7.org/cda/stds/core/StructureDefinition/TS"
* group[2].target = "http://hl7.org/fhir/StructureDefinition/date"
* group[2].element[0].code = "TS.value"
* group[2].element[0].target.code = "date"
* group[2].element[0].target.relationship = #related-to
