Instance: CdaIIToIdentifierConceptMap
InstanceOf: ConceptMap
Usage: #definition
Title: "ConceptMap — CDA II vers FHIR Identifier"
Description: "Correspondances entre les éléments du datatype CDA II et les éléments FHIR Identifier"

* url = "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/DataTypes/CdaIIToIdentifier"
* name = "CdaIIToIdentifier"
* status = #draft
* experimental = true

* group[0].source = "http://hl7.org/cda/stds/core/StructureDefinition/II"
* group[0].target = "http://hl7.org/fhir/StructureDefinition/Identifier"

/* II.extension -> Identifier.value */
* group[0].element[0].code = #II.extension
* group[0].element[0].display = "II.extension"
* group[0].element[0].target[0].code = #Identifier.value
* group[0].element[0].target[0].display = "Identifier.value"
* group[0].element[0].target[0].equivalence = #equivalent
* group[0].element[0].target[0].comment = "Lorsque II.extension est présent, il alimente directement Identifier.value."

/* II.root -> Identifier.system / Identifier.value */
* group[0].element[1].code = #II.root
* group[0].element[1].display = "II.root"
* group[0].element[1].target[0].code = #Identifier.system
* group[0].element[1].target[0].display = "Identifier.system"
* group[0].element[1].target[0].equivalence = #relatedto
* group[0].element[1].target[0].comment = "Utilisé pour alimenter Identifier.system, généralement avec transformation vers un URI."

* group[0].element[1].target[1].code = #Identifier.value
* group[0].element[1].target[1].display = "Identifier.value"
* group[0].element[1].target[1].equivalence = #relatedto
* group[0].element[1].target[1].comment = "En l’absence de II.extension, Identifier.value peut être dérivé de II.root, par exemple sous la forme urn:uuid:[II.root] si II.root est un UUID, ou urn:oid:[II.root] si II.root est un OID."

/* II.assigningAuthorityName -> Identifier.assigner.display */
* group[0].element[2].code = #II.assigningAuthorityName
* group[0].element[2].display = "II.assigningAuthorityName"
* group[0].element[2].target[0].code = #Identifier.assigner.display
* group[0].element[2].target[0].display = "Identifier.assigner.display"
* group[0].element[2].target[0].equivalence = #relatedto

/* II.displayable -> Identifier.extension(displayable) */
* group[0].element[3].code = #II.displayable
* group[0].element[3].display = "II.displayable"
* group[0].element[3].target[0].code = #Identifier.extension
* group[0].element[3].target[0].display = "Identifier.extension(displayable)"
* group[0].element[3].target[0].equivalence = #relatedto
* group[0].element[3].target[0].comment = "Porté dans une extension FHIR spécifique."