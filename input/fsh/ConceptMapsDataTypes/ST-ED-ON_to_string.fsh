
Instance: CM-CDA-ST-ED-ON-To-String
InstanceOf: ConceptMap
Title: "ConceptMap — CDA ST/ED/ON → FHIR string"
Usage: #definition

* url = "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/DataTypes/CdaStringTypesToFHIR"
* name = "CdaStringTypesToFHIR"
* status = #draft
* experimental = true
* description = "Correspondances CDA ST/ED/ON → FHIR string."

/* ST → string */
* group[0].source = "http://hl7.org/cda/stds/core/StructureDefinition/ST"
* group[0].target = "http://hl7.org/fhir/StructureDefinition/string"
* group[0].element[0].code = "ST.value"
* group[0].element[0].target.code = "string"
* group[0].element[0].target.relationship = #related-to

/* ED → string */
* group[1].source = "http://hl7.org/cda/stds/core/StructureDefinition/ED"
* group[1].target = "http://hl7.org/fhir/StructureDefinition/string"
* group[1].element[0].code = "ED.value"
* group[1].element[0].target.code = "string"
* group[1].element[0].target.relationship = #related-to

/* ON → string */
* group[2].source = "http://hl7.org/cda/stds/core/StructureDefinition/ON"
* group[2].target = "http://hl7.org/fhir/StructureDefinition/string"
* group[2].element[0].code = "ON.value"
* group[2].element[0].target.code = "string"
* group[2].element[0].target.relationship = #related-to
