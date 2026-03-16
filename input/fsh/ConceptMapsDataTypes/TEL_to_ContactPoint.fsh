
Instance: CM-CDA-TEL-To-ContactPoint
InstanceOf: ConceptMap
Title: "ConceptMap — CDA TEL → FHIR ContactPoint"
Usage: #definition

* url = "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/DataTypes/CdaTELToFHIR"
* name = "CdaTELToFHIR"
* status = #draft
* experimental = true
* description = "Correspondances documentaires TEL.value (tel:/fax:/mailto:/http:/https:) + use + useablePeriod → ContactPoint."

* group[0].source = "http://hl7.org/cda/stds/core/StructureDefinition/TEL"
* group[0].target = "http://hl7.org/fhir/StructureDefinition/ContactPoint"

/* Élément minimal obligatoire */
* group[0].element[0].code = "TEL.value"
* group[0].element[0].target.code = "ContactPoint.value"
* group[0].element[0].target.relationship = #related-to
