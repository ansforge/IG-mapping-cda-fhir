Instance: CdaToPeriodConceptMap
InstanceOf: ConceptMap
Usage: #definition
Title: "ConceptMap — CDA IVL_TS → FHIR Period/dateTime"
Description: "Correspondances CDA IVL_TS (low/high) vers Period.start/end ou dateTime."

* url = "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/DataTypes/CdaIVL_TSToFHIR"
* name = "CdaIVL_TSToFHIR"
* status = #draft
* experimental = true

/* IVL_TS → Period */
* group[0].source = "http://hl7.org/cda/stds/core/StructureDefinition/IVL_TS"
* group[0].target = "http://hl7.org/fhir/StructureDefinition/Period"

* group[0].element[0].code = #IVL_TS_low
* group[0].element[0].target[0].code = #Period_start
* group[0].element[0].target[0].equivalence = #equivalent

* group[0].element[1].code = #IVL_TS_high
* group[0].element[1].target[0].code = #Period_end
* group[0].element[1].target[0].equivalence = #equivalent

/* IVL_TS → dateTime */
* group[1].source = "http://hl7.org/cda/stds/core/StructureDefinition/IVL_TS"
* group[1].target = "http://hl7.org/fhir/StructureDefinition/dateTime"

* group[1].element[0].code = #IVL_TS_low
* group[1].element[0].target[0].code = #dateTime_value
* group[1].element[0].target[0].equivalence = #wider