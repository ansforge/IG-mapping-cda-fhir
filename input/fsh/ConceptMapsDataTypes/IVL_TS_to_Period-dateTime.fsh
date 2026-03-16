* url = "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/DataTypes/CdaIVL_TSToFHIR"
* name = "CdaIVL_TSToFHIR"
* status = #draft
* experimental = true
* description = "Correspondances CDA IVL_TS (low/high) vers Period.start/end ou dateTime."

 
/* IVL_TS → Period */
* group[0].source = "http://hl7.org/cda/stds/core/StructureDefinition/IVL-TS"
* group[0].target = "http://hl7.org/fhir/StructureDefinition/Period"
* group[0].element[0].code = "IVL_TS.low"
* group[0].element[0].target.code = "Period.start"
* group[0].element[0].target.relationship = #related-to

* group[0].element[1].code = "IVL_TS.high"
* group[0].element[1].target.code = "Period.end"
* group[0].element[1].target.relationship = #related-to

/* IVL_TS → dateTime */
* group[1].source = "http://hl7.org/cda/stds/core/StructureDefinition/IVL-TS"
* group[1].target = "http://hl7.org/fhir/StructureDefinition/dateTime"
* group[1].element[0].code = "IVL_TS.low"
* group[1].element[0].target.code = "dateTime"
* group[1].element[0].target.relationship = #source-is-broader-than-target
