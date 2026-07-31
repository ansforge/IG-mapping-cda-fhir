Instance: CdaENPNToHumanNameConceptMap
InstanceOf: ConceptMap
Usage: #definition
Title: "ConceptMap — CDA EN/PN vers FHIR HumanName"
Description: "Correspondances documentaires des composants CDA EN et PN vers FHIR HumanName."

* url = "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/CdaENPNToHumanNameConceptMap"
* name = "CdaNamesToFHIR"
* status = #draft
* experimental = true

// Groupe 0 : CDA EN vers FHIR HumanName

* group[0].source = "http://hl7.org/cda/stds/core/StructureDefinition/EN"
* group[0].target = "http://hl7.org/fhir/StructureDefinition/HumanName"

// EN.item.family vers HumanName.family

* group[0].element[0].code = #EN.item.family
* group[0].element[0].display = "Family"
* group[0].element[0].target[0].code = #HumanName.family
* group[0].element[0].target[0].display = "Family name (often called 'Surname')"
* group[0].element[0].target[0].equivalence = #equivalent
* group[0].element[0].target[0].comment = "Le composant family du nom CDA EN alimente directement HumanName.family."

// EN.item.given vers HumanName.given

* group[0].element[1].code = #EN.item.given
* group[0].element[1].display = "Given"
* group[0].element[1].target[0].code = #HumanName.given
* group[0].element[1].target[0].display = "Given names (not always 'first'). Includes middle names"
* group[0].element[1].target[0].equivalence = #equivalent
* group[0].element[1].target[0].comment = "Le composant given du nom CDA EN alimente directement HumanName.given."

// EN.item.prefix vers HumanName.prefix

* group[0].element[2].code = #EN.item.prefix
* group[0].element[2].display = "Prefix"
* group[0].element[2].target[0].code = #HumanName.prefix
* group[0].element[2].target[0].display = "Parts that come before the name"
* group[0].element[2].target[0].equivalence = #equivalent
* group[0].element[2].target[0].comment = "Le composant prefix du nom CDA EN alimente directement HumanName.prefix."

// EN.item.suffix vers HumanName.suffix

* group[0].element[3].code = #EN.item.suffix
* group[0].element[3].display = "Suffix"
* group[0].element[3].target[0].code = #HumanName.suffix
* group[0].element[3].target[0].display = "Parts that come after the name"
* group[0].element[3].target[0].equivalence = #equivalent
* group[0].element[3].target[0].comment = "Le composant suffix du nom CDA EN alimente directement HumanName.suffix."

// EN.item.xmlText vers HumanName.text

* group[0].element[4].code = #EN.item.xmlText
* group[0].element[4].display = "Allows for mixed text content"
* group[0].element[4].target[0].code = #HumanName.text
* group[0].element[4].target[0].display = "Text representation of the full name"
* group[0].element[4].target[0].equivalence = #relatedto
* group[0].element[4].target[0].comment = "La forme textuelle complète du nom CDA EN alimente HumanName.text."

// EN.validTime vers HumanName.period

* group[0].element[5].code = #EN.validTime
* group[0].element[5].display = "Valid Time"
* group[0].element[5].target[0].code = #HumanName.period
* group[0].element[5].target[0].display = "Time period when name was/is in use"
* group[0].element[5].target[0].equivalence = #relatedto
* group[0].element[5].target[0].comment = "La période de validité du nom CDA EN alimente HumanName.period."

// Groupe 1 : CDA PN vers FHIR HumanName

* group[1].source = "http://hl7.org/cda/stds/core/StructureDefinition/PN"
* group[1].target = "http://hl7.org/fhir/StructureDefinition/HumanName"

// PN.item.family vers HumanName.family

* group[1].element[0].code = #PN.item.family
* group[1].element[0].display = "Family"
* group[1].element[0].target[0].code = #HumanName.family
* group[1].element[0].target[0].display = "Family name (often called 'Surname')"
* group[1].element[0].target[0].equivalence = #equivalent
* group[1].element[0].target[0].comment = "Par héritage du mapping EN vers HumanName, le composant family du nom CDA PN alimente HumanName.family."

// PN.item.given vers HumanName.given

* group[1].element[1].code = #PN.item.given
* group[1].element[1].display = "Given"
* group[1].element[1].target[0].code = #HumanName.given
* group[1].element[1].target[0].display = "Given names (not always 'first'). Includes middle names"
* group[1].element[1].target[0].equivalence = #equivalent
* group[1].element[1].target[0].comment = "Par héritage du mapping EN vers HumanName, le composant given du nom CDA PN alimente HumanName.given."

// PN.item.prefix vers HumanName.prefix

* group[1].element[2].code = #PN.item.prefix
* group[1].element[2].display = "Prefix"
* group[1].element[2].target[0].code = #HumanName.prefix
* group[1].element[2].target[0].display = "Parts that come before the name"
* group[1].element[2].target[0].equivalence = #equivalent
* group[1].element[2].target[0].comment = "Par héritage du mapping EN vers HumanName, le composant prefix du nom CDA PN alimente HumanName.prefix."

// PN.item.suffix vers HumanName.suffix

* group[1].element[3].code = #PN.item.suffix
* group[1].element[3].display = "Suffix"
* group[1].element[3].target[0].code = #HumanName.suffix
* group[1].element[3].target[0].display = "Parts that come after the name"
* group[1].element[3].target[0].equivalence = #equivalent
* group[1].element[3].target[0].comment = "Par héritage du mapping EN vers HumanName, le composant suffix du nom CDA PN alimente HumanName.suffix."

// PN.item.xmlText vers HumanName.text

* group[1].element[4].code = #PN.item.xmlText
* group[1].element[4].display = "Allows for mixed text content"
* group[1].element[4].target[0].code = #HumanName.text
* group[1].element[4].target[0].display = "Text representation of the full name"
* group[1].element[4].target[0].equivalence = #relatedto
* group[1].element[4].target[0].comment = "La forme textuelle complète du nom CDA PN alimente HumanName.text."

// PN.validTime vers HumanName.period

* group[1].element[5].code = #PN.validTime
* group[1].element[5].display = "Valid Time"
* group[1].element[5].target[0].code = #HumanName.period
* group[1].element[5].target[0].display = "Time period when name was/is in use"
* group[1].element[5].target[0].equivalence = #equivalent
* group[1].element[5].target[0].comment = "Par héritage du mapping EN vers HumanName, la période de validité du nom CDA PN alimente HumanName.period."
