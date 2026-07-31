Instance: CdaIIToIdentifierConceptMap
InstanceOf: ConceptMap
Usage: #definition
Title: "ConceptMap — CDA II vers FHIR Identifier"
Description: "Correspondances entre les éléments du datatype CDA II et les éléments FHIR Identifier et Reference."

* url = "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/CdaIIToIdentifierConceptMap"
* name = "CdaIIToIdentifier"
* status = #draft
* experimental = true

// Groupe 0 : CDA II vers FHIR Identifier

* group[0].source = "http://hl7.org/cda/stds/core/StructureDefinition/II"
* group[0].target = "http://hl7.org/fhir/StructureDefinition/Identifier"

// II.extension vers Identifier.value

* group[0].element[0].code = #II.extension
* group[0].element[0].display = "Extension"
* group[0].element[0].target[0].code = #Identifier.value
* group[0].element[0].target[0].display = "The value that is unique"
* group[0].element[0].target[0].equivalence = #equivalent
* group[0].element[0].target[0].comment = "Lorsque II.extension est présent, il alimente directement Identifier.value."

// II.root vers Identifier.system

* group[0].element[1].code = #II.root
* group[0].element[1].display = "Root"
* group[0].element[1].target[0].code = #Identifier.system
* group[0].element[1].target[0].display = "The namespace for the identifier value"
* group[0].element[1].target[0].equivalence = #relatedto
* group[0].element[1].target[0].comment = "II.root alimente Identifier.system après transformation en URI, par exemple sous la forme urn:oid:[II.root] ou urn:uuid:[II.root]."

// II.root vers Identifier.value en l’absence de II.extension

* group[0].element[1].target[1].code = #Identifier.value
* group[0].element[1].target[1].display = "The value that is unique"
* group[0].element[1].target[1].equivalence = #relatedto
* group[0].element[1].target[1].comment = "En l’absence de II.extension, Identifier.value peut être dérivé de II.root, notamment lorsqu’il porte directement l’identifiant."

// II.assigningAuthorityName vers Identifier.assigner

* group[0].element[2].code = #II.assigningAuthorityName
* group[0].element[2].display = "Assigning Authority Name"
* group[0].element[2].target[0].code = #Identifier.assigner
* group[0].element[2].target[0].display = "Organization that issued id (may be just text)"
* group[0].element[2].target[0].equivalence = #relatedto
* group[0].element[2].target[0].comment = "II.assigningAuthorityName permet de renseigner l’organisme ayant attribué l’identifiant dans Identifier.assigner."

// II.displayable vers Identifier.extension

* group[0].element[3].code = #II.displayable
* group[0].element[3].display = "Displayable"
* group[0].element[3].target[0].code = #Identifier.extension
* group[0].element[3].target[0].display = "Additional content defined by implementations"
* group[0].element[3].target[0].equivalence = #relatedto
* group[0].element[3].target[0].comment = "La valeur II.displayable peut être conservée dans une extension FHIR spécifique portée par Identifier."

// Groupe 1 : II.assigningAuthorityName vers Reference.display

* group[1].source = "http://hl7.org/cda/stds/core/StructureDefinition/II"
* group[1].target = "http://hl7.org/fhir/StructureDefinition/Reference"

// II.assigningAuthorityName vers Reference.display

* group[1].element[0].code = #II.assigningAuthorityName
* group[1].element[0].display = "Assigning Authority Name"
* group[1].element[0].target[0].code = #Reference.display
* group[1].element[0].target[0].display = "Text alternative for the resource"
* group[1].element[0].target[0].equivalence = #relatedto
* group[1].element[0].target[0].comment = "Le nom de l’autorité d’attribution CDA alimente Reference.display dans la référence Identifier.assigner."
