Instance: CdaToQuantityConceptMap
InstanceOf: ConceptMap
Usage: #definition
Title: "ConceptMap — CDA PQ → FHIR Quantity"
Description: "Correspondances PQ.value / PQ.unit → Quantity (value, unit, system, code)."

* url = "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/DataTypes/CdaPQToFHIR"
* name = "CdaPQToFHIR"
* status = #draft
* experimental = true

* group[0].source = "http://hl7.org/cda/stds/core/StructureDefinition/PQ"
* group[0].target = "http://hl7.org/fhir/StructureDefinition/Quantity"

/* PQ.value → Quantity.value */
* group[0].element[0].code = #PQ_value
* group[0].element[0].target[0].code = #Quantity_value
* group[0].element[0].target[0].equivalence = #equivalent

/* PQ.unit → Quantity.unit */
* group[0].element[1].code = #PQ_unit
* group[0].element[1].target[0].code = #Quantity_unit
* group[0].element[1].target[0].equivalence = #equivalent