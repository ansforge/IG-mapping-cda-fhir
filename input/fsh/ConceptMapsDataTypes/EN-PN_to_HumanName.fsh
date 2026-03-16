
Instance: CM-CDA-EN-PN-To-HumanName
InstanceOf: ConceptMap
Title: "ConceptMap — CDA EN/PN → FHIR HumanName"
Usage: #definition

* url = "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/DataTypes/CdaNamesToFHIR"
* name = "CdaNamesToFHIR"
* status = #draft
* experimental = true
* description = "Correspondances documentaires des composants EN/PN vers HumanName (family/given/prefix/suffix/period)."

/* EN → HumanName */
* group[0].source = "http://hl7.org/cda/stds/core/StructureDefinition/EN"
* group[0].target = "http://hl7.org/fhir/StructureDefinition/HumanName"
* group[0].element[0].code = "EN.family"
* group[0].element[0].target.code = "HumanName.family"
* group[0].element[0].target.relationship = #related-to

/* PN → HumanName */
* group[1].source = "http://hl7.org/cda/stds/core/StructureDefinition/PN"
* group[1].target = "http://hl7.org/fhir/StructureDefinition/HumanName"
* group[1].element[0].code = "PN.given"
* group[1].element[0].target.code = "HumanName.given"
* group[1].element[0].target.relationship = #related-to
