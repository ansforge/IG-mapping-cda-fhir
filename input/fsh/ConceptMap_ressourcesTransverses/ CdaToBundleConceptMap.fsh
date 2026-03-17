Instance: CdaToBundleConceptMap
InstanceOf: ConceptMap
Usage: #definition
Title: "ConceptMap — CDA ClinicalDocument → FHIR Bundle"
Description: "Correspondances CDA ClinicalDocument → FHIR Bundle"

* url = "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/ressourcesTransverses/Bundle"
* name = "ClinicalDocumentToBundle"
* status = #draft
* experimental = true

* sourceUri = "http://hl7.org/cda/stds/core/StructureDefinition/ClinicalDocument"
* targetUri = "http://hl7.org/fhir/StructureDefinition/Bundle"

* group[0].source = "http://hl7.org/cda/stds/core/StructureDefinition/ClinicalDocument"
* group[0].target = "http://hl7.org/fhir/StructureDefinition/Bundle"

/* id */
* group[0].element[0].code = #ClinicalDocument_id
* group[0].element[0].target[0].code = #Bundle_identifier
* group[0].element[0].target[0].equivalence = #equivalent

/* effectiveTime */
* group[0].element[1].code = #ClinicalDocument_effectiveTime
* group[0].element[1].target[0].code = #Bundle_timestamp
* group[0].element[1].target[0].equivalence = #equivalent

/* root */
* group[0].element[2].code = #ClinicalDocument_root
* group[0].element[2].target[0].code = #Bundle_entry
* group[0].element[2].target[0].equivalence = #equivalent