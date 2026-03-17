Instance: CdaToCompositionConceptMap
InstanceOf: ConceptMap
Usage: #definition
Title: "ConceptMap — CDA ClinicalDocument → FHIR Composition"
Description: "Correspondances entre ClinicalDocument CDA et Composition FHIR"

* url = "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/ressourcesTransverses/Composition"
* name = "ClinicalDocumentToComposition"
* status = #draft
* experimental = true


* sourceUri = "http://hl7.org/cda/stds/core/StructureDefinition/ClinicalDocument"
* targetUri = "http://hl7.org/fhir/StructureDefinition/Composition"


* group[0].source = "http://hl7.org/cda/stds/core/StructureDefinition/ClinicalDocument"
* group[0].target = "http://hl7.org/fhir/StructureDefinition/Composition"

/* id */
* group[0].element[0].code = #ClinicalDocument_id
* group[0].element[0].target[0].code = #Composition_identifier
* group[0].element[0].target[0].equivalence = #equivalent

/* code */
* group[0].element[1].code = #ClinicalDocument_code
* group[0].element[1].target[0].code = #Composition_type
* group[0].element[1].target[0].equivalence = #equivalent

/* title */
* group[0].element[2].code = #ClinicalDocument_title
* group[0].element[2].target[0].code = #Composition_title
* group[0].element[2].target[0].equivalence = #equivalent

/* effectiveTime */
* group[0].element[3].code = #ClinicalDocument_effectiveTime
* group[0].element[3].target[0].code = #Composition_date
* group[0].element[3].target[0].equivalence = #equivalent

/* author */
* group[0].element[4].code = #ClinicalDocument_author
* group[0].element[4].target[0].code = #Composition_author
* group[0].element[4].target[0].equivalence = #equivalent

/* confidentiality */
* group[0].element[5].code = #ClinicalDocument_confidentialityCode
* group[0].element[5].target[0].code = #Composition_confidentiality
* group[0].element[5].target[0].equivalence = #equivalent