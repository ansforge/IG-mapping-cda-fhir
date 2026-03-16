
Instance: CM-CDA-PQ-To-Quantity
InstanceOf: ConceptMap
Title: "ConceptMap — CDA PQ → FHIR Quantity"
Usage: #definition

* url = "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/DataTypes/CdaRTOPQPQToFHIR"
* name = "CdaPQToFHIR"
* status = #draft
* experimental = true
* description = "Correspondances documentaires PQ.value/PQ.unit → Quantity.value/Quantity.unit."

/* FHIR R4 n'accepte pas sourceScopeUri / targetScopeUri → supprimés */

* group[0].source = "http://hl7.org/cda/stds/core/StructureDefinition/PQ"
* group[0].target = "http://hl7.org/fhir/StructureDefinition/Quantity"

/* Élément minimal obligatoire */
* group[0].element[0].code = "PQ.value"
* group[0].element[0].target.code = "Quantity.value"
* group[0].element[0].target.relationship = #related-to

* group[0].element[1].code = "PQ.unit"
* group[0].element[1].target.code = "Quantity.unit"
* group[0].element[1].target.relationship = #related-to
