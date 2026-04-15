Instance: CdaINTToIntegerConceptMap
InstanceOf: ConceptMap
Usage: #definition
Title: "ConceptMap — CDA INT vers FHIR integer"
Description: "Correspondances documentaires entre le datatype CDA INT et le datatype FHIR integer."

* url = "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/DataTypes/CdaINTToInteger"
* name = "CdaINTToInteger"
* status = #draft
* experimental = true

* group[0].source = "http://hl7.org/cda/stds/core/StructureDefinition/INT"
* group[0].target = "http://hl7.org/fhir/StructureDefinition/integer"

/* INT.value -> integer */
* group[0].element[0].code = #INT.value
* group[0].element[0].display = "INT.value"
* group[0].element[0].target[0].code = #integer
* group[0].element[0].target[0].display = "integer"
* group[0].element[0].target[0].equivalence = #equivalent
* group[0].element[0].target[0].comment = "INT.value alimente directement un integer FHIR."
