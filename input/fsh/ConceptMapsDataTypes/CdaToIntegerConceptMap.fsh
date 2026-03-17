Instance: CdaToIntegerConceptMap
InstanceOf: ConceptMap
Usage: #definition
Title: "ConceptMap — CDA INT → FHIR integer"
Description: "Correspondances documentaires INT.value → integer."

* url = "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/DataTypes/CdaINTToInteger"
* name = "CdaINTToInteger"
* status = #draft
* experimental = true

* group[0].source = "http://hl7.org/cda/stds/core/StructureDefinition/INT"
* group[0].target = "http://hl7.org/fhir/StructureDefinition/integer"

/* INT.value → integer.value */
* group[0].element[0].code = #INT_value
* group[0].element[0].target[0].code = #integer_value
* group[0].element[0].target[0].equivalence = #equivalent