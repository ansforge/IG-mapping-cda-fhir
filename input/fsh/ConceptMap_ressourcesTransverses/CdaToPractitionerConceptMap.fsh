Instance: CdaToPractitionerConceptMap
InstanceOf: ConceptMap
Usage: #definition
Title: "ConceptMap — CDA AssignedAuthor → FHIR Practitioner"
Description: "Correspondances entre AssignedAuthor CDA et Practitioner FHIR"

* url = "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/ressourcesTransverses/Practitioner"
* name = "AssignedAuthorToPractitioner"
* status = #draft
* experimental = true


* sourceUri = "http://hl7.org/cda/stds/core/StructureDefinition/AssignedAuthor"
* targetUri = "http://hl7.org/fhir/StructureDefinition/Practitioner"


* group[0].source = "http://hl7.org/cda/stds/core/StructureDefinition/AssignedAuthor"
* group[0].target = "http://hl7.org/fhir/StructureDefinition/Practitioner"

/* identifier */
* group[0].element[0].code = #ClinicalDocument_author_assignedAuthor_id
* group[0].element[0].target[0].code = #Practitioner_identifier
* group[0].element[0].target[0].equivalence = #equivalent

/* address */
* group[0].element[1].code = #ClinicalDocument_author_assignedAuthor_addr
* group[0].element[1].target[0].code = #Practitioner_address
* group[0].element[1].target[0].equivalence = #equivalent

/* telecom */
* group[0].element[2].code = #ClinicalDocument_author_assignedAuthor_telecom
* group[0].element[2].target[0].code = #Practitioner_telecom
* group[0].element[2].target[0].equivalence = #equivalent

/* name */
* group[0].element[3].code = #ClinicalDocument_author_assignedAuthor_assignedPerson_name
* group[0].element[3].target[0].code = #Practitioner_name
* group[0].element[3].target[0].equivalence = #equivalent