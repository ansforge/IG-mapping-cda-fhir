
Instance: CdaToBooleanConceptMap
InstanceOf: ConceptMap
Usage: #definition
Title: "ConceptMap — CDA BL → FHIR boolean / negation"
Description: "Correspondances BL.value → boolean ; BL.negationInd → boolean (modifierExtension)."

* url = "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/DataTypes/CdaBLToFHIR"
* name = "CdaBLToFHIR"
* status = #draft
* experimental = true

* group[0].source = "http://hl7.org/cda/stds/core/StructureDefinition/BL"
* group[0].target = "http://hl7.org/fhir/StructureDefinition/boolean"

/* BL.value → boolean.value */
* group[0].element[0].code = #BL_value
* group[0].element[0].target[0].code = #boolean_value
* group[0].element[0].target[0].equivalence = #equivalent

/* BL.negationInd → boolean.extension:negationInd */
* group[0].element[1].code = #BL_negationInd
* group[0].element[1].target[0].code = #boolean_negationInd
* group[0].element[1].target[0].equivalence = #equivalent
