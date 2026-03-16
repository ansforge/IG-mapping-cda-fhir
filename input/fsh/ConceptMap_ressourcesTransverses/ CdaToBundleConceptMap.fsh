Instance:  CdaToBundleConceptMap
InstanceOf: ConceptMap
Title: "ConceptMap — CDA ClinicalDocument → FHIR Bundle"
Usage: #definition

* url = "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/ressourcesTransverses/Bundle"
* name = "ClinicalDocumentToBundle"
* status = #draft
* experimental = true
* description = "Correspondances CDA ClinicalDocument → FHIR Bundle"

* source = "http://hl7.org/cda/stds/core/StructureDefinition/ClinicalDocument"
* target = "http://hl7.org/fhir/StructureDefinition/Bundle"

* group[0].source = "http://hl7.org/cda/stds/core/StructureDefinition/ClinicalDocument"
* group[0].target = "http://hl7.org/fhir/StructureDefinition/Bundle"

* group[0].element[0].code = #CDA001
* group[0].element[0].display = "ClinicalDocument.id"
* group[0].element[0].target[0].code = #FHIR001
* group[0].element[0].target[0].display = "Bundle.identifier"
* group[0].element[0].target[0].equivalence = #equal

* group[0].element[1].code = #CDA002
* group[0].element[1].display = "ClinicalDocument.effectiveTime"
* group[0].element[1].target[0].code = #FHIR002
* group[0].element[1].target[0].display = "Bundle.timestamp"
* group[0].element[1].target[0].equivalence = #equal

* group[0].element[2].code = #CDA003
* group[0].element[2].display = "ClinicalDocument"
* group[0].element[2].target[0].code = #FHIR003
* group[0].element[2].target[0].display = "Bundle.entry"
* group[0].element[2].target[0].equivalence = #equal