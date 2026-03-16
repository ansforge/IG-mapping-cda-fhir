Instance: CM-CDA-CustodianOrganization-To-Organization
InstanceOf: ConceptMap
Title: "ConceptMap — CDA CustodianOrganization → FHIR Organization"
Usage: #definition

* url = "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/ressourcesTransverses/Organization"
* name = "CustodianOrganizationToOrganization"
* status = #draft
* experimental = true
* description = "Correspondances entre CustodianOrganization CDA et Organization FHIR"

* source = "http://hl7.org/cda/stds/core/StructureDefinition/CustodianOrganization"
* target = "http://hl7.org/fhir/StructureDefinition/Organization"

* group[0].source = "http://hl7.org/cda/stds/core/StructureDefinition/CustodianOrganization"
* group[0].target = "http://hl7.org/fhir/StructureDefinition/Organization"

* group[0].element[0].code = #CDA001
* group[0].element[0].display = "ClinicalDocument.custodian.assignedCustodian.representedCustodianOrganization.id"
* group[0].element[0].target[0].code = #FHIR001
* group[0].element[0].target[0].display = "Organization.identifier"
* group[0].element[0].target[0].equivalence = #equal

* group[0].element[1].code = #CDA002
* group[0].element[1].display = "ClinicalDocument.custodian.assignedCustodian.representedCustodianOrganization.name"
* group[0].element[1].target[0].code = #FHIR002
* group[0].element[1].target[0].display = "Organization.name"
* group[0].element[1].target[0].equivalence = #equal

* group[0].element[2].code = #CDA003
* group[0].element[2].display = "ClinicalDocument.custodian.assignedCustodian.representedCustodianOrganization.addr"
* group[0].element[2].target[0].code = #FHIR003
* group[0].element[2].target[0].display = "Organization.address"
* group[0].element[2].target[0].equivalence = #equal

* group[0].element[3].code = #CDA004
* group[0].element[3].display = "ClinicalDocument.custodian.assignedCustodian.representedCustodianOrganization.telecom"
* group[0].element[3].target[0].code = #FHIR004
* group[0].element[3].target[0].display = "Organization.telecom"
* group[0].element[3].target[0].equivalence = #equal