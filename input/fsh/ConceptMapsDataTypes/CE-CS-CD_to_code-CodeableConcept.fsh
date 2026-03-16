
Instance: CM-CDA-CE-CS-CD-To-FHIR
InstanceOf: ConceptMap
Title: "ConceptMap — CDA CE/CS/CD → FHIR code/CodeableConcept"
Usage: #definition

* url = "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/DataTypes/CdaConceptCodesToFHIR"
* name = "CdaConceptCodesToFHIR"
* status = #draft
* experimental = true
* description = "Correspondances documentaires code/codeSystem/displayName/originalText/translations → code/CodeableConcept."

/* CE → code */
* group[0].source = "http://hl7.org/cda/stds/core/StructureDefinition/CE"
* group[0].target = "http://hl7.org/fhir/StructureDefinition/code"
* group[0].element[0].code = "CE.code"
* group[0].element[0].target.code = "code"
* group[0].element[0].target.relationship = #related-to

/* CE → CodeableConcept */
* group[1].source = "http://hl7.org/cda/stds/core/StructureDefinition/CE"
* group[1].target = "http://hl7.org/fhir/StructureDefinition/CodeableConcept"
* group[1].element[0].code = "CE"
* group[1].element[0].target.code = "CodeableConcept"
* group[1].element[0].target.relationship = #related-to

/* CS → code */
* group[2].source = "http://hl7.org/cda/stds/core/StructureDefinition/CS"
* group[2].target = "http://hl7.org/fhir/StructureDefinition/code"
* group[2].element[0].code = "CS.code"
* group[2].element[0].target.code = "code"
* group[2].element[0].target.relationship = #related-to

/* CD → code */
* group[3].source = "http://hl7.org/cda/stds/core/StructureDefinition/CD"
* group[3].target = "http://hl7.org/fhir/StructureDefinition/code"
* group[3].element[0].code = "CD.code"
* group[3].element[0].target.code = "code"
* group[3].element[0].target.relationship = #related-to
