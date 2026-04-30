Instance: CdaRTO-PQ-PQToRatioConceptMap
InstanceOf: ConceptMap
Usage: #definition
Title: "ConceptMap — CDA RTO_PQ_PQ vers FHIR Ratio"
Description: "Correspondances documentaires entre le datatype CDA RTO_PQ_PQ et le datatype FHIR Ratio."

* url = "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/DataTypes/CdaRTOPQPQToFHIR"
* name = "CdaRTOPQPQToFHIR"
* status = #draft
* experimental = true

* group[0].source = "http://hl7.org/cda/stds/core/StructureDefinition/RTO_PQ_PQ"
* group[0].target = "http://hl7.org/fhir/StructureDefinition/Ratio"

/* RTO_PQ_PQ.numerator -> Ratio.numerator */
* group[0].element[0].code = #RTO_PQ_PQ.numerator
* group[0].element[0].display = "RTO_PQ_PQ.numerator"
* group[0].element[0].target[0].code = #Ratio.numerator
* group[0].element[0].target[0].display = "Ratio.numerator"
* group[0].element[0].target[0].equivalence = #relatedto
* group[0].element[0].target[0].comment = "Le numérateur CDA est converti en Quantity via le mapping PQ -> Quantity, puis affecté à Ratio.numerator."

/* RTO_PQ_PQ.denominator -> Ratio.denominator */
* group[0].element[1].code = #RTO_PQ_PQ.denominator
* group[0].element[1].display = "RTO_PQ_PQ.denominator"
* group[0].element[1].target[0].code = #Ratio.denominator
* group[0].element[1].target[0].display = "Ratio.denominator"
* group[0].element[1].target[0].equivalence = #relatedto
* group[0].element[1].target[0].comment = "Le dénominateur CDA est converti en Quantity via le mapping PQ -> Quantity, puis affecté à Ratio.denominator."
