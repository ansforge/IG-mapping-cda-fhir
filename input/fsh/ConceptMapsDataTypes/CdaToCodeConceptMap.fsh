Instance: CdaToCodeConceptMap
InstanceOf: ConceptMap
Usage: #definition
Title: "ConceptMap — CDA CE/CS/CD → FHIR code/CodeableConcept"
Description: "Correspondances documentaires code/codeSystem/displayName/originalText/translations → code/CodeableConcept."

* url = "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/DataTypes/CdaConceptCodesToFHIR"
* name = "CdaConceptCodesToFHIR"
* status = #draft
* experimental = true

/* CE → code */
* group[0].source = "http://hl7.org/cda/stds/core/StructureDefinition/CE"
* group[0].target = "http://hl7.org/fhir/StructureDefinition/code"

* group[0].element[0].code = #CE_code
* group[0].element[0].target[0].code = #FHIR_code
* group[0].element[0].target[0].equivalence = #equivalent

/* CE → CodeableConcept */
* group[1].source = "http://hl7.org/cda/stds/core/StructureDefinition/CE"
* group[1].target = "http://hl7.org/fhir/StructureDefinition/CodeableConcept"

* group[1].element[0].code = #CE
* group[1].element[0].target[0].code = #FHIR_CodeableConcept
* group[1].element[0].target[0].equivalence = #equivalent

/* CS → code */
* group[2].source = "http://hl7.org/cda/stds/core/StructureDefinition/CS"
* group[2].target = "http://hl7.org/fhir/StructureDefinition/code"

* group[2].element[0].code = #CS_code
* group[2].element[0].target[0].code = #FHIR_code
* group[2].element[0].target[0].equivalence = #equivalent

/* CD → code */
* group[3].source = "http://hl7.org/cda/stds/core/StructureDefinition/CD"
* group[3].target = "http://hl7.org/fhir/StructureDefinition/code"

* group[3].element[0].code = #CD_code
* group[3].element[0].target[0].code = #FHIR_code
* group[3].element[0].target[0].equivalence = #equivalent