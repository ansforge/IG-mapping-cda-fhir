
Instance: CM-CDA-BL-To-Boolean
InstanceOf: ConceptMap
Title: "ConceptMap — CDA BL → FHIR boolean / negation"
Usage: #definition

* url = "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/DataTypes/CdaBLToFHIR"
* name = "CdaBLToFHIR"
* status = #draft
* experimental = true
* description = "Correspondances BL.value → boolean ; BL.negationInd → boolean (modifierExtension)."

* group[0].source = "http://hl7.org/cda/stds/core/StructureDefinition/BL"
* group[0].target = "http://hl7.org/fhir/StructureDefinition/boolean"

/* élément minimal pour respecter la cardinalité */
* group[0].element[0].code = "BL.value"
* group[0].element[0].target.code = "boolean"
* group[0].element[0].target.relationship = #related-to
