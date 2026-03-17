Instance: CdaToOrganisationConceptMap
InstanceOf: ConceptMap
Usage: #definition
Title: "ConceptMap — CDA CustodianOrganization → FHIR Organization"
Description: "Correspondances entre CustodianOrganization CDA et Organization FHIR"

* url = "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/ressourcesTransverses/Organization"
* name = "CustodianOrganizationToOrganization"
* status = #draft
* experimental = true

* sourceUri = "http://hl7.org/cda/stds/core/StructureDefinition/CustodianOrganization"
* targetUri = "http://hl7.org/fhir/StructureDefinition/Organization"

* group[0].source = "http://hl7.org/cda/stds/core/StructureDefinition/CustodianOrganization"
* group[0].target = "http://hl7.org/fhir/StructureDefinition/Organization"

/* id */
* group[0].element[0].code = #ClinicalDocument_custodian_assignedCustodian_representedCustodianOrganization_id
* group[0].element[0].target[0].code = #Organization_identifier
* group[0].element[0].target[0].equivalence = #equivalent

/* name */
* group[0].element[1].code = #ClinicalDocument_custodian_assignedCustodian_representedCustodianOrganization_name
* group[0].element[1].target[0].code = #Organization_name
* group[0].element[1].target[0].equivalence = #equivalent

/* address */
* group[0].element[2].code = #ClinicalDocument_custodian_assignedCustodian_representedCustodianOrganization_addr
* group[0].element[2].target[0].code = #Organization_address
* group[0].element[2].target[0].equivalence = #equivalent

/* telecom */
* group[0].element[3].code = #ClinicalDocument_custodian_assignedCustodian_representedCustodianOrganization_telecom
* group[0].element[3].target[0].code = #Organization_telecom
* group[0].element[3].target[0].equivalence = #equivalent