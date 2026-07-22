Instance: CdaIVL-TSToPeriodConceptMap
InstanceOf: ConceptMap
Usage: #definition
Title: "ConceptMap — CDA IVL_TS vers FHIR Period et dateTime"
Description: "Correspondances documentaires entre le datatype CDA IVL_TS, ses bornes IVXB_TS et les types FHIR Period et dateTime."

* url = "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/CdaIVL-TSToPeriodConceptMap"
* name = "CdaIVL_TSToFHIR"
* status = #draft
* experimental = true

// Groupe 0 : CDA IVL_TS vers FHIR Period

* group[0].source = "http://hl7.org/cda/stds/core/StructureDefinition/IVL-TS"
* group[0].target = "http://hl7.org/fhir/StructureDefinition/Period"

// IVL_TS.low vers Period.start

* group[0].element[0].code = #IVL_TS.low
* group[0].element[0].display = "Low Boundary"
* group[0].element[0].target[0].code = #Period.start
* group[0].element[0].target[0].display = "Starting time with inclusive boundary"
* group[0].element[0].target[0].equivalence = #relatedto
* group[0].element[0].target[0].comment = "La valeur de la borne basse IVL_TS.low, portée par IVXB_TS.value, est convertie en dateTime puis affectée à Period.start."

// IVL_TS.high vers Period.end

* group[0].element[1].code = #IVL_TS.high
* group[0].element[1].display = "High Boundary"
* group[0].element[1].target[0].code = #Period.end
* group[0].element[1].target[0].display = "End time with inclusive boundary, if not ongoing"
* group[0].element[1].target[0].equivalence = #relatedto
* group[0].element[1].target[0].comment = "La valeur de la borne haute IVL_TS.high, portée par IVXB_TS.value, est convertie en dateTime puis affectée à Period.end."

// Groupe 1 : CDA IVXB_TS vers FHIR dateTime

* group[1].source = "http://hl7.org/cda/stds/core/StructureDefinition/IVXB-TS"
* group[1].target = "http://hl7.org/fhir/StructureDefinition/dateTime"

// IVXB_TS.value vers dateTime

* group[1].element[0].code = #IVXB_TS.value
* group[1].element[0].display = "IVXB_TS.value"
* group[1].element[0].target[0].code = #dateTime
* group[1].element[0].target[0].display = "Primitive Type dateTime"
* group[1].element[0].target[0].equivalence = #relatedto
* group[1].element[0].target[0].comment = "La valeur temporelle d’une borne CDA IVXB_TS est convertie vers le datatype primitif FHIR dateTime."
