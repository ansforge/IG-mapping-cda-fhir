Instance: CdaToDateTimeConceptMap
InstanceOf: ConceptMap
Usage: #definition
Title: "ConceptMap — CDA TS → FHIR instant/dateTime/date"
Description: "Correspondances CDA TS.value → instant, dateTime ou date selon contexte."

* url = "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/DataTypes/CdaTSToFHIR"
* name = "CdaTSToFHIR"
* status = #draft
* experimental = true

/* TS → instant */
* group[0].source = "http://hl7.org/cda/stds/core/StructureDefinition/TS"
* group[0].target = "http://hl7.org/fhir/StructureDefinition/instant"
* group[0].element[0].code = #TS_value
* group[0].element[0].target[0].code = #instant_value
* group[0].element[0].target[0].equivalence = #equivalent

/* TS → dateTime */
* group[1].source = "http://hl7.org/cda/stds/core/StructureDefinition/TS"
* group[1].target = "http://hl7.org/fhir/StructureDefinition/dateTime"
* group[1].element[0].code = #TS_value
* group[1].element[0].target[0].code = #dateTime_value
* group[1].element[0].target[0].equivalence = #equivalent

/* TS → date */
* group[2].source = "http://hl7.org/cda/stds/core/StructureDefinition/TS"
* group[2].target = "http://hl7.org/fhir/StructureDefinition/date"
* group[2].element[0].code = #TS_value
* group[2].element[0].target[0].code = #date_value
* group[2].element[0].target[0].equivalence = #equivalent