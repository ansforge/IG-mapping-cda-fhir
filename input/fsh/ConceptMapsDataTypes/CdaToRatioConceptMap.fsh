Instance: CdaToRatioConceptMap
InstanceOf: ConceptMap
Usage: #definition
Title: "ConceptMap — CDA RTO_PQ_PQ → FHIR Ratio"
Description: "Correspondances documentaires numerator/denominator CDA → numerator/denominator FHIR."

* url = "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/DataTypes/CdaRTOPQPQToFHIR"
* name = "CdaRTOPQPQToFHIR"
* status = #draft
* experimental = true

* group[0].source = "http://hl7.org/cda/stds/core/StructureDefinition/RTO_PQ_PQ"
* group[0].target = "http://hl7.org/fhir/StructureDefinition/Ratio"

/* numerator */
* group[0].element[0].code = #RTO_PQ_PQ_numerator
* group[0].element[0].target[0].code = #Ratio_numerator
* group[0].element[0].target[0].equivalence = #equivalent

/* denominator */
* group[0].element[1].code = #RTO_PQ_PQ_denominator
* group[0].element[1].target[0].code = #Ratio_denominator
* group[0].element[1].target[0].equivalence = #equivalent