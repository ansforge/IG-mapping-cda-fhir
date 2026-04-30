Instance: CdaPQToQuantityConceptMap
InstanceOf: ConceptMap
Usage: #definition
Title: "ConceptMap — CDA PQ vers FHIR Quantity"
Description: "Correspondances documentaires entre le datatype CDA PQ et le datatype FHIR Quantity."

* url = "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/DataTypes/CdaPQToFHIR"
* name = "CdaPQToFHIR"
* status = #draft
* experimental = true

* group[0].source = "http://hl7.org/cda/stds/core/StructureDefinition/PQ"
* group[0].target = "http://hl7.org/fhir/StructureDefinition/Quantity"

/* PQ.value -> Quantity.value */
* group[0].element[0].code = #PQ.value
* group[0].element[0].display = "PQ.value"
* group[0].element[0].target[0].code = #Quantity.value
* group[0].element[0].target[0].display = "Quantity.value"
* group[0].element[0].target[0].equivalence = #equivalent
* group[0].element[0].target[0].comment = "PQ.value alimente directement Quantity.value."

/* PQ.unit -> Quantity.code / Quantity.unit / Quantity.system */
* group[0].element[1].code = #PQ.unit
* group[0].element[1].display = "PQ.unit"

/* PQ.unit -> Quantity.code (code UCUM) */
* group[0].element[1].target[0].code = #Quantity.code
* group[0].element[1].target[0].display = "Quantity.code"
* group[0].element[1].target[0].equivalence = #equivalent
* group[0].element[1].target[0].comment = "PQ.unit (UCUM) alimente Quantity.code."

/* PQ.unit -> Quantity.unit (forme lisible) */
* group[0].element[1].target[1].code = #Quantity.unit
* group[0].element[1].target[1].display = "Quantity.unit"
* group[0].element[1].target[1].equivalence = #relatedto
* group[0].element[1].target[1].comment = "PQ.unit peut être réutilisé comme libellé d’unité dans Quantity.unit selon la stratégie d’affichage."

/* PQ.unit -> Quantity.system (URI UCUM) */
* group[0].element[1].target[2].code = #Quantity.system
* group[0].element[1].target[2].display = "Quantity.system"
* group[0].element[1].target[2].equivalence = #relatedto
* group[0].element[1].target[2].comment = "Si PQ.unit est UCUM, Quantity.system est fixé à http://unitsofmeasure.org."
