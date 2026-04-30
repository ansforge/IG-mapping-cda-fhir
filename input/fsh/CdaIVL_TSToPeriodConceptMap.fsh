Instance: CdaIVL_TSToPeriodConceptMap
InstanceOf: ConceptMap
Usage: #definition
Title: "ConceptMap — CDA IVL_TS vers FHIR Period et dateTime"
Description: "Correspondances documentaires entre le datatype CDA IVL_TS et les types FHIR Period et dateTime."

* url = "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/DataTypes/CdaIVL_TSToFHIR"
* name = "CdaIVL_TSToFHIR"
* status = #draft
* experimental = true

// Group 0 — IVL_TS -> Period
* group[0].source = "http://hl7.org/cda/stds/core/StructureDefinition/IVL-TS"
* group[0].target = "http://hl7.org/fhir/StructureDefinition/Period"

/* IVL_TS.low.value -> Period.start */
* group[0].element[0].code = #IVL_TS.low.value
* group[0].element[0].display = "IVL_TS.low.value"
* group[0].element[0].target[0].code = #Period.start
* group[0].element[0].target[0].display = "Period.start"
* group[0].element[0].target[0].equivalence = #relatedto
* group[0].element[0].target[0].comment = "La valeur de la borne low (IVXB_TS.value) est convertie en dateTime puis affectée à Period.start."

/* IVL_TS.high.value -> Period.end */
* group[0].element[1].code = #IVL_TS.high.value
* group[0].element[1].display = "IVL_TS.high.value"
* group[0].element[1].target[0].code = #Period.end
* group[0].element[1].target[0].display = "Period.end"
* group[0].element[1].target[0].equivalence = #relatedto
* group[0].element[1].target[0].comment = "La valeur de la borne high (IVXB_TS.value) est convertie en dateTime puis affectée à Period.end."


// Group 1 — IVL_TS -> dateTime
* group[1].source = "http://hl7.org/cda/stds/core/StructureDefinition/IVL-TS"
* group[1].target = "http://hl7.org/fhir/StructureDefinition/dateTime"

/* IVL_TS.low.value -> dateTime */
* group[1].element[0].code = #IVL_TS.low.value
* group[1].element[0].display = "IVL_TS.low.value"
* group[1].element[0].target[0].code = #dateTime
* group[1].element[0].target[0].display = "dateTime"
* group[1].element[0].target[0].equivalence = #relatedto
* group[1].element[0].target[0].comment = "La valeur de la borne low est utilisée comme date représentative et convertie en dateTime."
