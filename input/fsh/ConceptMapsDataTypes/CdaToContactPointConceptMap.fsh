Instance: CdaToContactPointConceptMap
InstanceOf: ConceptMap
Usage: #definition
Title: "ConceptMap — CDA TEL → FHIR ContactPoint"
Description: "Correspondances documentaires TEL.value (tel:/fax:/mailto:/http:/https:) + use + useablePeriod → ContactPoint."

* url = "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/DataTypes/CdaTELToFHIR"
* name = "CdaTELToFHIR"
* status = #draft
* experimental = true

* group[0].source = "http://hl7.org/cda/stds/core/StructureDefinition/TEL"
* group[0].target = "http://hl7.org/fhir/StructureDefinition/ContactPoint"

/* TEL.value → ContactPoint.value */
* group[0].element[0].code = #TEL_value
* group[0].element[0].target[0].code = #ContactPoint_value
* group[0].element[0].target[0].equivalence = #equivalent