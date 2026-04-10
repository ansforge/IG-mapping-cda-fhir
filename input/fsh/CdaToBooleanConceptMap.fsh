Instance: CdaToBooleanConceptMap
InstanceOf: ConceptMap
Usage: #definition
Title: "ConceptMap — CDA BL vers FHIR boolean"
Description: "Correspondance documentaire entre le datatype CDA BL et le datatype FHIR boolean."

* url = "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/DataTypes/CdaBLToFHIR"
* name = "CdaBLToFHIR"
* status = #draft
* experimental = true

* group[0].source = "http://hl7.org/cda/stds/core/StructureDefinition/BL"
* group[0].target = "http://hl7.org/fhir/StructureDefinition/boolean"

/* BL.value -> boolean.value */
* group[0].element[0].code = #BL.value
* group[0].element[0].display = "BL.value"
* group[0].element[0].target[0].code = #boolean.value
* group[0].element[0].target[0].display = "boolean.value"
* group[0].element[0].target[0].equivalence = #equivalent
* group[0].element[0].target[0].comment = "La valeur du datatype CDA BL est reportée directement dans la valeur FHIR boolean."