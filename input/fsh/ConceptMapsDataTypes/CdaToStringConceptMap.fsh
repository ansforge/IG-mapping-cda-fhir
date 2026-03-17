Instance: CdaToStringConceptMap
InstanceOf: ConceptMap
Usage: #definition
Title: "ConceptMap — CDA ST/ED/ON → FHIR string"
Description: "Correspondances CDA ST/ED/ON → FHIR string."

* url = "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/DataTypes/CdaStringTypesToFHIR"
* name = "CdaStringTypesToFHIR"
* status = #draft
* experimental = true

/* ST → string */
* group[0].source = "http://hl7.org/cda/stds/core/StructureDefinition/ST"
* group[0].target = "http://hl7.org/fhir/StructureDefinition/string"

* group[0].element[0].code = #ST_value
* group[0].element[0].target[0].code = #string_value
* group[0].element[0].target[0].equivalence = #equivalent

/* ED → string */
* group[1].source = "http://hl7.org/cda/stds/core/StructureDefinition/ED"
* group[1].target = "http://hl7.org/fhir/StructureDefinition/string"

* group[1].element[0].code = #ED_value
* group[1].element[0].target[0].code = #string_value
* group[1].element[0].target[0].equivalence = #equivalent

/* ON → string */
* group[2].source = "http://hl7.org/cda/stds/core/StructureDefinition/ON"
* group[2].target = "http://hl7.org/fhir/StructureDefinition/string"

* group[2].element[0].code = #ON_value
* group[2].element[0].target[0].code = #string_value
* group[2].element[0].target[0].equivalence = #equivalent