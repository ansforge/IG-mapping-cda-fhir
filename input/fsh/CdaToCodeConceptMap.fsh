Instance: CdaToCodeConceptMap
InstanceOf: ConceptMap
Usage: #definition
Title: "ConceptMap — CDA CE/CS/CD vers FHIR code et CodeableConcept"
Description: "Correspondances documentaires entre les datatypes CDA CE, CS et CD et les types FHIR code et CodeableConcept."

* url = "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/DataTypes/CdaConceptCodesToFHIR"
* name = "CdaConceptCodesToFHIR"
* status = #draft
* experimental = true


// Group 0 — CE -> code
* group[0].source = "http://hl7.org/cda/stds/core/StructureDefinition/CE"
* group[0].target = "http://hl7.org/fhir/StructureDefinition/code"


/* CE.code -> code */
* group[0].element[0].code = #CE.code
* group[0].element[0].display = "CE.code"
* group[0].element[0].target[0].code = #code
* group[0].element[0].target[0].display = "code"
* group[0].element[0].target[0].equivalence = #equivalent
* group[0].element[0].target[0].comment = "Le code CDA alimente directement le datatype primitif FHIR code."


// Group 1 — CE -> CodeableConcept
* group[1].source = "http://hl7.org/cda/stds/core/StructureDefinition/CE"
* group[1].target = "http://hl7.org/fhir/StructureDefinition/CodeableConcept"

/* CE.originalText -> CodeableConcept.text */
* group[1].element[0].code = #CE.originalText
* group[1].element[0].display = "CE.originalText"
* group[1].element[0].target[0].code = #CodeableConcept.text
* group[1].element[0].target[0].display = "CodeableConcept.text"
* group[1].element[0].target[0].equivalence = #equivalent
* group[1].element[0].target[0].comment = "Le texte original CDA alimente directement CodeableConcept.text."


/* CE.code -> CodeableConcept.coding.code */
* group[1].element[1].code = #CE.code
* group[1].element[1].display = "CE.code"
* group[1].element[1].target[0].code = #CodeableConcept.coding.code
* group[1].element[1].target[0].display = "CodeableConcept.coding.code"
* group[1].element[1].target[0].equivalence = #equivalent
* group[1].element[1].target[0].comment = "Le code principal CDA CE alimente coding.code."

/* CE.codeSystem -> CodeableConcept.coding.system */
* group[1].element[2].code = #CE.codeSystem
* group[1].element[2].display = "CE.codeSystem"
* group[1].element[2].target[0].code = #CodeableConcept.coding.system
* group[1].element[2].target[0].display = "CodeableConcept.coding.system"
* group[1].element[2].target[0].equivalence = #relatedto
* group[1].element[2].target[0].comment = "Le codeSystem CDA est transformé en URI de type urn:oid:[codeSystem] pour alimenter coding.system."

/* CE.displayName -> CodeableConcept.coding.display */
* group[1].element[3].code = #CE.displayName
* group[1].element[3].display = "CE.displayName"
* group[1].element[3].target[0].code = #CodeableConcept.coding.display
* group[1].element[3].target[0].display = "CodeableConcept.coding.display"
* group[1].element[3].target[0].equivalence = #equivalent
* group[1].element[3].target[0].comment = "Le libellé CDA displayName alimente coding.display."

/* CE.translation -> CodeableConcept.coding */
* group[1].element[4].code = #CE.translation
* group[1].element[4].display = "CE.translation"
* group[1].element[4].target[0].code = #CodeableConcept.coding
* group[1].element[4].target[0].display = "CodeableConcept.coding (translation)"
* group[1].element[4].target[0].equivalence = #relatedto
* group[1].element[4].target[0].comment = "Chaque translation CDA crée un coding supplémentaire dans le CodeableConcept cible."


// Group 2 — CS -> code
* group[2].source = "http://hl7.org/cda/stds/core/StructureDefinition/CS"
* group[2].target = "http://hl7.org/fhir/StructureDefinition/code"

/* CS.code -> code */
* group[2].element[0].code = #CS.code
* group[2].element[0].display = "CS.code"
* group[2].element[0].target[0].code = #code
* group[2].element[0].target[0].display = "code"
* group[2].element[0].target[0].equivalence = #equivalent
* group[2].element[0].target[0].comment = "Le code CDA CS alimente directement le datatype primitif FHIR code."


// Group 3 — CS -> CodeableConcept
* group[3].source = "http://hl7.org/cda/stds/core/StructureDefinition/CS"
* group[3].target = "http://hl7.org/fhir/StructureDefinition/CodeableConcept"

/* CS.code -> CodeableConcept.coding.code */
* group[3].element[0].code = #CS.code
* group[3].element[0].display = "CS.code"
* group[3].element[0].target[0].code = #CodeableConcept.coding.code
* group[3].element[0].target[0].display = "CodeableConcept.coding.code"
* group[3].element[0].target[0].equivalence = #relatedto
* group[3].element[0].target[0].comment = "Par héritage du mapping CE -> CodeableConcept, le code CS alimente coding.code."


// Group 4 — CD -> code
* group[4].source = "http://hl7.org/cda/stds/core/StructureDefinition/CD"
* group[4].target = "http://hl7.org/fhir/StructureDefinition/code"

/* CD.code -> code */
* group[4].element[0].code = #CD.code
* group[4].element[0].display = "CD.code"
* group[4].element[0].target[0].code = #code
* group[4].element[0].target[0].display = "code"
* group[4].element[0].target[0].equivalence = #relatedto
* group[4].element[0].target[0].comment = "Le code CDA CD alimente le datatype primitif FHIR code, conformément au mapping hérité de CS -> code."

// Group 5 — CD -> CodeableConcept
* group[5].source = "http://hl7.org/cda/stds/core/StructureDefinition/CD"
* group[5].target = "http://hl7.org/fhir/StructureDefinition/CodeableConcept"

/* CD.originalText -> CodeableConcept.text */
* group[5].element[0].code = #CD.originalText
* group[5].element[0].display = "CD.originalText"
* group[5].element[0].target[0].code = #CodeableConcept.text
* group[5].element[0].target[0].display = "CodeableConcept.text"
* group[5].element[0].target[0].equivalence = #relatedto
* group[5].element[0].target[0].comment = "Par héritage du mapping CE -> CodeableConcept, le texte original CDA peut alimenter CodeableConcept.text."

/* CD.code -> CodeableConcept.coding.code */
* group[5].element[1].code = #CD.code
* group[5].element[1].display = "CD.code"
* group[5].element[1].target[0].code = #CodeableConcept.coding.code
* group[5].element[1].target[0].display = "CodeableConcept.coding.code"
* group[5].element[1].target[0].equivalence = #relatedto
* group[5].element[1].target[0].comment = "Le code principal CDA CD alimente coding.code."

/* CD.codeSystem -> CodeableConcept.coding.system */
* group[5].element[2].code = #CD.codeSystem
* group[5].element[2].display = "CD.codeSystem"
* group[5].element[2].target[0].code = #CodeableConcept.coding.system
* group[5].element[2].target[0].display = "CodeableConcept.coding.system"
* group[5].element[2].target[0].equivalence = #relatedto
* group[5].element[2].target[0].comment = "Le codeSystem CDA est transformé en URI de type urn:oid:[codeSystem]."

/* CD.displayName -> CodeableConcept.coding.display */
* group[5].element[3].code = #CD.displayName
* group[5].element[3].display = "CD.displayName"
* group[5].element[3].target[0].code = #CodeableConcept.coding.display
* group[5].element[3].target[0].display = "CodeableConcept.coding.display"
* group[5].element[3].target[0].equivalence = #relatedto
* group[5].element[3].target[0].comment = "Le libellé CDA displayName alimente coding.display."

/* CD.translation -> CodeableConcept.coding */
* group[5].element[4].code = #CD.translation
* group[5].element[4].display = "CD.translation"
* group[5].element[4].target[0].code = #CodeableConcept.coding
* group[5].element[4].target[0].display = "CodeableConcept.coding (translation)"
* group[5].element[4].target[0].equivalence = #relatedto
* group[5].element[4].target[0].comment = "Chaque translation CDA crée un coding supplémentaire dans le CodeableConcept cible."