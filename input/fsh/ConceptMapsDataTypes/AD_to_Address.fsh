
Instance: CM-CDA-AD-To-Address
InstanceOf: ConceptMap
Title: "ConceptMap — CDA AD → FHIR Address"
Usage: #definition

* url = "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/DataTypes/CdaAddressToFHIR"
* name = "CdaAddressToFHIR"
* status = #draft
* experimental = true
* description = "Correspondances documentaires des composants AD vers Address."

* group[0].source = "http://hl7.org/cda/stds/core/StructureDefinition/AD"
* group[0].target = "http://hl7.org/fhir/StructureDefinition/Address"

* group[0].element[0].code = "AD.part"
* group[0].element[0].target.code = "Address.line"
* group[0].element[0].target.relationship = #related-to
