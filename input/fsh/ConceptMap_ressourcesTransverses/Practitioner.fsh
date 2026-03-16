Instance: CM-CDA-AssignedAuthor-To-Practitioner
InstanceOf: ConceptMap
Title: "ConceptMap — CDA AssignedAuthor → FHIR Practitioner"
Usage: #definition

* url = "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/ressourcesTransverses/Practitioner"
* name = "AssignedAuthorToPractitioner"
* status = #draft
* experimental = true
* description = "Correspondances entre AssignedAuthor CDA et Practitioner FFHIR"

* source = "http://hl7.org/cda/stds/core/StructureDefinition/AssignedAuthor"
* target = "http://hl7.org/fhir/StructureDefinition/Practitioner"

* group[0].source = "http://hl7.org/cda/stds/core/StructureDefinition/AssignedAuthor"
* group[0].target = "http://hl7.org/fhir/StructureDefinition/Practitioner"

* group[0].element[0].code = #CDA001
* group[0].element[0].display = "ClinicalDocument.author.assignedAuthor.id"
* group[0].element[0].target[0].code = #FHIR001
* group[0].element[0].target[0].display = "Practitioner.identifier"
* group[0].element[0].target[0].equivalence = #equal

* group[0].element[1].code = #CDA002
* group[0].element[1].display = "ClinicalDocument.author.assignedAuthor.addr"
* group[0].element[1].target[0].code = #FHIR002
* group[0].element[1].target[0].display = "Practitioner.address"
* group[0].element[1].target[0].equivalence = #equal

* group[0].element[2].code = #CDA003
* group[0].element[2].display = "ClinicalDocument.author.assignedAuthor.telecom"
* group[0].element[2].target[0].code = #FHIR003
* group[0].element[2].target[0].display = "Practitioner.telecom"
* group[0].element[2].target[0].equivalence = #equal

* group[0].element[3].code = #CDA004
* group[0].element[3].display = "ClinicalDocument.author.assignedAuthor.assignedPerson.name"
* group[0].element[3].target[0].code = #FHIR004
* group[0].element[3].target[0].display = "Practitioner.name"
* group[0].element[3].target[0].equivalence = #equal