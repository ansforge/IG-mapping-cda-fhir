Instance: CdaPQToQuantityConceptMap
InstanceOf: ConceptMap
Usage: #definition
Title: "ConceptMap — CDA PQ vers FHIR Quantity"
Description: "Correspondances documentaires entre le datatype CDA PQ et le datatype FHIR Quantity."

* url = "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/CdaPQToQuantityConceptMap"
* name = "CdaPQToFHIR"
* status = #draft
* experimental = true

// CDA PQ vers FHIR Quantity

* group[0].source = "http://hl7.org/cda/stds/core/StructureDefinition/PQ"
* group[0].target = "http://hl7.org/fhir/StructureDefinition/Quantity"

// PQ.value vers Quantity.value

* group[0].element[0].code = #PQ.value
* group[0].element[0].display = "Maginitude Value"
* group[0].element[0].target[0].code = #Quantity.value
* group[0].element[0].target[0].display = "Numerical value (with implicit precision)"
* group[0].element[0].target[0].equivalence = #equivalent
* group[0].element[0].target[0].comment = "PQ.value alimente directement Quantity.value."

// PQ.unit vers Quantity.code, Quantity.unit et Quantity.system

* group[0].element[1].code = #PQ.unit
* group[0].element[1].display = "Unit of Measure"

// PQ.unit vers Quantity.code

* group[0].element[1].target[0].code = #Quantity.code
* group[0].element[1].target[0].display = "Coded form of the unit"
* group[0].element[1].target[0].equivalence = #equivalent
* group[0].element[1].target[0].comment = "Lorsque PQ.unit contient un code UCUM, il alimente Quantity.code."

// PQ.unit vers Quantity.unit

* group[0].element[1].target[1].code = #Quantity.unit
* group[0].element[1].target[1].display = "Unit representation"
* group[0].element[1].target[1].equivalence = #relatedto
* group[0].element[1].target[1].comment = "PQ.unit peut être réutilisé comme représentation lisible de l’unité dans Quantity.unit selon la stratégie d’affichage retenue."

// PQ.unit vers Quantity.system

* group[0].element[1].target[2].code = #Quantity.system
* group[0].element[1].target[2].display = "System that defines coded unit form"
* group[0].element[1].target[2].equivalence = #relatedto
* group[0].element[1].target[2].comment = "Lorsque PQ.unit utilise UCUM, Quantity.system est fixé à http://unitsofmeasure.org."
