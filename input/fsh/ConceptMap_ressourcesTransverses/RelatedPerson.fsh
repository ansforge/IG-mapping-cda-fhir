Instance: CM-CDA-RelatedEntity-To-RelatedPerson
InstanceOf: ConceptMap
Title: "ConceptMap — CDA RelatedEntity → FHIR RelatedPerson"
Usage: #definition

* url = "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/ressourcesTransverses/RelatedPerson"
* name = "RelatedEntityToRelatedPerson"
* status = #draft
* experimental = true
* description = "Correspondances entre RelatedEntity CDA et RelatedPerson FHIR"

* source = "http://hl7.org/cda/stds/core/StructureDefinition/RelatedEntity"
* target = "http://hl7.org/fhir/StructureDefinition/RelatedPerson"

* group[0].source = "http://hl7.org/cda/stds/core/StructureDefinition/RelatedEntity"
* group[0].target = "http://hl7.org/fhir/StructureDefinition/RelatedPerson"

* group[0].element[0].code = #CDA001
* group[0].element[0].display = "ClinicalDocument.informant.relatedEntity.code"
* group[0].element[0].target[0].code = #FHIR001
* group[0].element[0].target[0].display = "RelatedPerson.relationship"
* group[0].element[0].target[0].equivalence = #equal

* group[0].element[1].code = #CDA002
* group[0].element[1].display = "ClinicalDocument.informant.relatedEntity.addr"
* group[0].element[1].target[0].code = #FHIR002
* group[0].element[1].target[0].display = "RelatedPerson.address"
* group[0].element[1].target[0].equivalence = #equal

* group[0].element[2].code = #CDA003
* group[0].element[2].display = "ClinicalDocument.informant.relatedEntity.telecom"
* group[0].element[2].target[0].code = #FHIR003
* group[0].element[2].target[0].display = "RelatedPerson.telecom"
* group[0].element[2].target[0].equivalence = #equal

* group[0].element[3].code = #CDA004
* group[0].element[3].display = "ClinicalDocument.informant.relatedEntity.relatedPerson.name"
* group[0].element[3].target[0].code = #FHIR004
* group[0].element[3].target[0].display = "RelatedPerson.name"
* group[0].element[3].target[0].equivalence = #equal