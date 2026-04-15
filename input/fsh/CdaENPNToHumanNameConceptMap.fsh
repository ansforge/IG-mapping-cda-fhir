Instance: CdaENPNToHumanNameConceptMap
InstanceOf: ConceptMap
Usage: #definition
Title: "ConceptMap — CDA EN/PN vers FHIR HumanName"
Description: "Correspondances documentaires des composants CDA EN et PN vers FHIR HumanName."

* url = "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/DataTypes/CdaNamesToFHIR"
* name = "CdaNamesToFHIR"
* status = #draft
* experimental = true


// Group 0 — EN -> HumanName
* group[0].source = "http://hl7.org/cda/stds/core/StructureDefinition/EN"
* group[0].target = "http://hl7.org/fhir/StructureDefinition/HumanName"

/* EN.family -> HumanName.family */
* group[0].element[0].code = #EN.family
* group[0].element[0].display = "EN.family"
* group[0].element[0].target[0].code = #HumanName.family
* group[0].element[0].target[0].display = "HumanName.family"
* group[0].element[0].target[0].equivalence = #equivalent
* group[0].element[0].target[0].comment = "Le composant family du nom CDA EN alimente directement HumanName.family."

/* EN.given -> HumanName.given */
* group[0].element[1].code = #EN.given
* group[0].element[1].display = "EN.given"
* group[0].element[1].target[0].code = #HumanName.given
* group[0].element[1].target[0].display = "HumanName.given"
* group[0].element[1].target[0].equivalence = #equivalent
* group[0].element[1].target[0].comment = "Le composant given du nom CDA EN alimente directement HumanName.given."

/* EN.prefix -> HumanName.prefix */
* group[0].element[2].code = #EN.prefix
* group[0].element[2].display = "EN.prefix"
* group[0].element[2].target[0].code = #HumanName.prefix
* group[0].element[2].target[0].display = "HumanName.prefix"
* group[0].element[2].target[0].equivalence = #equivalent
* group[0].element[2].target[0].comment = "Le composant prefix du nom CDA EN alimente directement HumanName.prefix."

/* EN.suffix -> HumanName.suffix */
* group[0].element[3].code = #EN.suffix
* group[0].element[3].display = "EN.suffix"
* group[0].element[3].target[0].code = #HumanName.suffix
* group[0].element[3].target[0].display = "HumanName.suffix"
* group[0].element[3].target[0].equivalence = #equivalent
* group[0].element[3].target[0].comment = "Le composant suffix du nom CDA EN alimente directement HumanName.suffix."

/* EN.xmlText -> HumanName.text */
* group[0].element[4].code = #EN.xmlText
* group[0].element[4].display = "EN.xmlText"
* group[0].element[4].target[0].code = #HumanName.text
* group[0].element[4].target[0].display = "HumanName.text"
* group[0].element[4].target[0].equivalence = #relatedto
* group[0].element[4].target[0].comment = "La forme textuelle du nom (EN.xmlText) alimente HumanName.text."

/* EN.validTime -> HumanName.period */
* group[0].element[5].code = #EN.validTime
* group[0].element[5].display = "EN.validTime"
* group[0].element[5].target[0].code = #HumanName.period
* group[0].element[5].target[0].display = "HumanName.period"
* group[0].element[5].target[0].equivalence = #relatedto
* group[0].element[5].target[0].comment = "La période de validité du nom CDA EN alimente HumanName.period."


// Group 1 — PN -> HumanName
* group[1].source = "http://hl7.org/cda/stds/core/StructureDefinition/PN"
* group[1].target = "http://hl7.org/fhir/StructureDefinition/HumanName"

/* PN.family -> HumanName.family */
* group[1].element[0].code = #PN.family
* group[1].element[0].display = "PN.family"
* group[1].element[0].target[0].code = #HumanName.family
* group[1].element[0].target[0].display = "HumanName.family"
* group[1].element[0].target[0].equivalence = #equivalent
* group[1].element[0].target[0].comment = "Par héritage du mapping EN -> HumanName, le composant family du nom CDA PN alimente HumanName.family."

/* PN.given -> HumanName.given */
* group[1].element[1].code = #PN.given
* group[1].element[1].display = "PN.given"
* group[1].element[1].target[0].code = #HumanName.given
* group[1].element[1].target[0].display = "HumanName.given"
* group[1].element[1].target[0].equivalence = #equivalent
* group[1].element[1].target[0].comment = "Par héritage du mapping EN -> HumanName, le composant given du nom CDA PN alimente HumanName.given."

/* PN.prefix -> HumanName.prefix */
* group[1].element[2].code = #PN.prefix
* group[1].element[2].display = "PN.prefix"
* group[1].element[2].target[0].code = #HumanName.prefix
* group[1].element[2].target[0].display = "HumanName.prefix"
* group[1].element[2].target[0].equivalence = #equivalent
* group[1].element[2].target[0].comment = "Par héritage du mapping EN -> HumanName, le composant prefix du nom CDA PN alimente HumanName.prefix."

/* PN.suffix -> HumanName.suffix */
* group[1].element[3].code = #PN.suffix
* group[1].element[3].display = "PN.suffix"
* group[1].element[3].target[0].code = #HumanName.suffix
* group[1].element[3].target[0].display = "HumanName.suffix"
* group[1].element[3].target[0].equivalence = #equivalent
* group[1].element[3].target[0].comment = "Par héritage du mapping EN -> HumanName, le composant suffix du nom CDA PN alimente HumanName.suffix."

/* PN.xmlText -> HumanName.text */
* group[1].element[4].code = #PN.xmlText
* group[1].element[4].display = "PN.xmlText"
* group[1].element[4].target[0].code = #HumanName.text
* group[1].element[4].target[0].display = "HumanName.text"
* group[1].element[4].target[0].equivalence = #relatedto
* group[1].element[4].target[0].comment = "La forme textuelle du nom (PN.xmlText) alimente HumanName.text."

/* PN.validTime -> HumanName.period */
* group[1].element[5].code = #PN.validTime
* group[1].element[5].display = "PN.validTime"
* group[1].element[5].target[0].code = #HumanName.period
* group[1].element[5].target[0].display = "HumanName.period"
* group[1].element[5].target[0].equivalence = #equivalent
* group[1].element[5].target[0].comment = "Par héritage du mapping EN -> HumanName, la période de validité du nom CDA PN alimente HumanName.period."
