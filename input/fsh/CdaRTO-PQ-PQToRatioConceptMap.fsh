Instance: CdaRTO-PQ-PQToRatioConceptMap
InstanceOf: ConceptMap
Usage: #definition
Title: "ConceptMap — CDA RTO_PQ_PQ vers FHIR Ratio"
Description: "Correspondances documentaires entre le datatype CDA RTO_PQ_PQ et le datatype FHIR Ratio."

* url = "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/CdaRTO-PQ-PQToRatioConceptMap"
* name = "CdaRTOPQPQToFHIR"
* status = #draft
* experimental = true

// CDA RTO_PQ_PQ vers FHIR Ratio

* group[0].source = "http://hl7.org/cda/stds/core/StructureDefinition/RTO-PQ-PQ"
* group[0].target = "http://hl7.org/fhir/StructureDefinition/Ratio"

// RTO_PQ_PQ.numerator vers Ratio.numerator

* group[0].element[0].code = #RTO_PQ_PQ.numerator
* group[0].element[0].display = "Numerator"
* group[0].element[0].target[0].code = #Ratio.numerator
* group[0].element[0].target[0].display = "Numerator value"
* group[0].element[0].target[0].equivalence = #relatedto
* group[0].element[0].target[0].comment = "Le numérateur CDA est converti en Quantity à l’aide du mapping PQ vers Quantity, puis affecté à Ratio.numerator."

// RTO_PQ_PQ.denominator vers Ratio.denominator

* group[0].element[1].code = #RTO_PQ_PQ.denominator
* group[0].element[1].display = "Denominator"
* group[0].element[1].target[0].code = #Ratio.denominator
* group[0].element[1].target[0].display = "Denominator value"
* group[0].element[1].target[0].equivalence = #relatedto
* group[0].element[1].target[0].comment = "Le dénominateur CDA est converti en Quantity à l’aide du mapping PQ vers Quantity, puis affecté à Ratio.denominator."
