Instance: CM-CDA-ClinicalDocument-To-Composition
InstanceOf: ConceptMap
Title: "ConceptMap — CDA ClinicalDocument → FHIR Composition"
Usage: #definition

* url = "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/ressourcesTransverses/Composition"
* name = "ClinicalDocumentToComposition"
* status = #draft
* experimental = true
* description = "Correspondances entre ClinicalDocument CDA et Composition FHIR"

* source = "http://hl7.org/cda/stds/core/StructureDefinition/ClinicalDocument"
* target = "http://hl7.org/fhir/StructureDefinition/Composition"

* group[0].source = "http://hl7.org/cda/stds/core/StructureDefinition/ClinicalDocument"
* group[0].target = "http://hl7.org/fhir/StructureDefinition/Composition"

* group[0].element[0].code = #CDA001
* group[0].element[0].display = "ClinicalDocument.id"
* group[0].element[0].target[0].code = #FHIR001
* group[0].element[0].target[0].display = "Composition.identifier"
* group[0].element[0].target[0].equivalence = #equal

* group[0].element[1].code = #CDA002
* group[0].element[1].display = "ClinicalDocument.code"
* group[0].element[1].target[0].code = #FHIR002
* group[0].element[1].target[0].display = "Composition.type"
* group[0].element[1].target[0].equivalence = #equal

* group[0].element[2].code = #CDA003
* group[0].element[2].display = "ClinicalDocument.title"
* group[0].element[2].target[0].code = #FHIR003
* group[0].element[2].target[0].display = "Composition.title"
* group[0].element[2].target[0].equivalence = #equal

* group[0].element[3].code = #CDA004
* group[0].element[3].display = "ClinicalDocument.effectiveTime"
* group[0].element[3].target[0].code = #FHIR004
* group[0].element[3].target[0].display = "Composition.date"
* group[0].element[3].target[0].equivalence = #equal

* group[0].element[4].code = #CDA005
* group[0].element[4].display = "ClinicalDocument.author"
* group[0].element[4].target[0].code = #FHIR005
* group[0].element[4].target[0].display = "Composition.author"
* group[0].element[4].target[0].equivalence = #equal

* group[0].element[5].code = #CDA006
* group[0].element[5].display = "ClinicalDocument.confidentialityCode"
* group[0].element[5].target[0].code = #FHIR006
* group[0].element[5].target[0].display = "Composition.confidentiality"
* group[0].element[5].target[0].equivalence = #equal