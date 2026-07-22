Instance: CdaCECSCDToCodeConceptMap
InstanceOf: ConceptMap
Usage: #definition
Title: "ConceptMap — CDA CE/CS/CD vers FHIR code et CodeableConcept"
Description: "Correspondances documentaires entre les datatypes CDA CE, CS et CD et les types FHIR code, CodeableConcept et Coding."

* url = "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/CdaCECSCDToCodeConceptMap"
* name = "CdaConceptCodesToFHIR"
* status = #draft
* experimental = true

// Groupe 0 : CDA CE vers FHIR code

* group[0].source = "http://hl7.org/cda/stds/core/StructureDefinition/CE"
* group[0].target = "http://hl7.org/fhir/StructureDefinition/code"

// CE.code vers code

* group[0].element[0].code = #CE.code
* group[0].element[0].display = "Code"
* group[0].element[0].target[0].code = #code
* group[0].element[0].target[0].display = "Primitive Type code"
* group[0].element[0].target[0].equivalence = #equivalent
* group[0].element[0].target[0].comment = "Le code CDA CE alimente directement le datatype primitif FHIR code."

// Groupe 1 : CDA CE vers FHIR CodeableConcept

* group[1].source = "http://hl7.org/cda/stds/core/StructureDefinition/CE"
* group[1].target = "http://hl7.org/fhir/StructureDefinition/CodeableConcept"

// CE.originalText vers CodeableConcept.text

* group[1].element[0].code = #CE.originalText
* group[1].element[0].display = "Original Text"
* group[1].element[0].target[0].code = #CodeableConcept.text
* group[1].element[0].target[0].display = "Plain text representation of the concept"
* group[1].element[0].target[0].equivalence = #equivalent
* group[1].element[0].target[0].comment = "Le texte original CDA CE alimente directement CodeableConcept.text."

// CE.translation vers CodeableConcept.coding

* group[1].element[1].code = #CE.translation
* group[1].element[1].display = "Translation"
* group[1].element[1].target[0].code = #CodeableConcept.coding
* group[1].element[1].target[0].display = "Code defined by a terminology system"
* group[1].element[1].target[0].equivalence = #relatedto
* group[1].element[1].target[0].comment = "Chaque translation CDA CE crée un Coding supplémentaire dans CodeableConcept.coding."

// Groupe 2 : composants de CDA CE vers FHIR Coding

* group[2].source = "http://hl7.org/cda/stds/core/StructureDefinition/CE"
* group[2].target = "http://hl7.org/fhir/StructureDefinition/Coding"

// CE.code vers Coding.code

* group[2].element[0].code = #CE.code
* group[2].element[0].display = "Code"
* group[2].element[0].target[0].code = #Coding.code
* group[2].element[0].target[0].display = "Symbol in syntax defined by the system"
* group[2].element[0].target[0].equivalence = #equivalent
* group[2].element[0].target[0].comment = "Le code principal CDA CE alimente Coding.code dans le CodeableConcept cible."

// CE.codeSystem vers Coding.system

* group[2].element[1].code = #CE.codeSystem
* group[2].element[1].display = "Code System"
* group[2].element[1].target[0].code = #Coding.system
* group[2].element[1].target[0].display = "Identity of the terminology system"
* group[2].element[1].target[0].equivalence = #relatedto
* group[2].element[1].target[0].comment = "Le codeSystem CDA CE est converti en URI, notamment sous la forme urn:oid:[codeSystem], pour alimenter Coding.system."

// CE.displayName vers Coding.display

* group[2].element[2].code = #CE.displayName
* group[2].element[2].display = "Display Name"
* group[2].element[2].target[0].code = #Coding.display
* group[2].element[2].target[0].display = "Representation defined by the system"
* group[2].element[2].target[0].equivalence = #equivalent
* group[2].element[2].target[0].comment = "Le libellé CDA CE displayName alimente Coding.display."

// Groupe 3 : CDA CS vers FHIR code

* group[3].source = "http://hl7.org/cda/stds/core/StructureDefinition/CS"
* group[3].target = "http://hl7.org/fhir/StructureDefinition/code"

// CS.code vers code

* group[3].element[0].code = #CS.code
* group[3].element[0].display = "Code"
* group[3].element[0].target[0].code = #code
* group[3].element[0].target[0].display = "Primitive Type code"
* group[3].element[0].target[0].equivalence = #equivalent
* group[3].element[0].target[0].comment = "Le code CDA CS alimente directement le datatype primitif FHIR code."

// Groupe 4 : CDA CS vers FHIR Coding

* group[4].source = "http://hl7.org/cda/stds/core/StructureDefinition/CS"
* group[4].target = "http://hl7.org/fhir/StructureDefinition/Coding"

// CS.code vers Coding.code

* group[4].element[0].code = #CS.code
* group[4].element[0].display = "Code"
* group[4].element[0].target[0].code = #Coding.code
* group[4].element[0].target[0].display = "Symbol in syntax defined by the system"
* group[4].element[0].target[0].equivalence = #relatedto
* group[4].element[0].target[0].comment = "Le code CDA CS alimente Coding.code dans le CodeableConcept cible."

// Groupe 5 : CDA CD vers FHIR code

* group[5].source = "http://hl7.org/cda/stds/core/StructureDefinition/CD"
* group[5].target = "http://hl7.org/fhir/StructureDefinition/code"

// CD.code vers code

* group[5].element[0].code = #CD.code
* group[5].element[0].display = "Code"
* group[5].element[0].target[0].code = #code
* group[5].element[0].target[0].display = "Primitive Type code"
* group[5].element[0].target[0].equivalence = #relatedto
* group[5].element[0].target[0].comment = "Le code CDA CD alimente le datatype primitif FHIR code."

// Groupe 6 : CDA CD vers FHIR CodeableConcept

* group[6].source = "http://hl7.org/cda/stds/core/StructureDefinition/CD"
* group[6].target = "http://hl7.org/fhir/StructureDefinition/CodeableConcept"

// CD.originalText vers CodeableConcept.text

* group[6].element[0].code = #CD.originalText
* group[6].element[0].display = "Original Text"
* group[6].element[0].target[0].code = #CodeableConcept.text
* group[6].element[0].target[0].display = "Plain text representation of the concept"
* group[6].element[0].target[0].equivalence = #relatedto
* group[6].element[0].target[0].comment = "Le texte original CDA CD peut alimenter CodeableConcept.text."

// CD.translation vers CodeableConcept.coding

* group[6].element[1].code = #CD.translation
* group[6].element[1].display = "Translation"
* group[6].element[1].target[0].code = #CodeableConcept.coding
* group[6].element[1].target[0].display = "Code defined by a terminology system"
* group[6].element[1].target[0].equivalence = #relatedto
* group[6].element[1].target[0].comment = "Chaque translation CDA CD crée un Coding supplémentaire dans CodeableConcept.coding."

// Groupe 7 : composants de CDA CD vers FHIR Coding

* group[7].source = "http://hl7.org/cda/stds/core/StructureDefinition/CD"
* group[7].target = "http://hl7.org/fhir/StructureDefinition/Coding"

// CD.code vers Coding.code

* group[7].element[0].code = #CD.code
* group[7].element[0].display = "Code"
* group[7].element[0].target[0].code = #Coding.code
* group[7].element[0].target[0].display = "Symbol in syntax defined by the system"
* group[7].element[0].target[0].equivalence = #relatedto
* group[7].element[0].target[0].comment = "Le code principal CDA CD alimente Coding.code dans le CodeableConcept cible."

// CD.codeSystem vers Coding.system

* group[7].element[1].code = #CD.codeSystem
* group[7].element[1].display = "Code System"
* group[7].element[1].target[0].code = #Coding.system
* group[7].element[1].target[0].display = "Identity of the terminology system"
* group[7].element[1].target[0].equivalence = #relatedto
* group[7].element[1].target[0].comment = "Le codeSystem CDA CD est converti en URI, notamment sous la forme urn:oid:[codeSystem], pour alimenter Coding.system."

// CD.displayName vers Coding.display

* group[7].element[2].code = #CD.displayName
* group[7].element[2].display = "Display Name"
* group[7].element[2].target[0].code = #Coding.display
* group[7].element[2].target[0].display = "Representation defined by the system"
* group[7].element[2].target[0].equivalence = #relatedto
* group[7].element[2].target[0].comment = "Le libellé CDA CD displayName alimente Coding.display."
