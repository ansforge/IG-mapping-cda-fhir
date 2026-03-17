Instance: CdaToHumanNameConceptMap
InstanceOf: ConceptMap
Usage: #definition
Title: "ConceptMap — CDA EN/PN → FHIR HumanName"
Description: "Correspondances documentaires des composants EN/PN vers HumanName (family/given/prefix/suffix/period)."

* url = "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/DataTypes/CdaNamesToFHIR"
* name = "CdaNamesToFHIR"
* status = #draft
* experimental = true

/* EN → HumanName */
* group[0].source = "http://hl7.org/cda/stds/core/StructureDefinition/EN"
* group[0].target = "http://hl7.org/fhir/StructureDefinition/HumanName"

* group[0].element[0].code = #EN_family
* group[0].element[0].target[0].code = #HumanName_family
* group[0].element[0].target[0].equivalence = #equivalent

/* PN → HumanName */
* group[1].source = "http://hl7.org/cda/stds/core/StructureDefinition/PN"
* group[1].target = "http://hl7.org/fhir/StructureDefinition/HumanName"

* group[1].element[0].code = #PN_given
* group[1].element[0].target[0].code = #HumanName_given
* group[1].element[0].target[0].equivalence = #equivalent