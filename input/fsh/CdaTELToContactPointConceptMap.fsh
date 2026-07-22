Instance: CdaTELToContactPointConceptMap
InstanceOf: ConceptMap
Usage: #definition
Title: "ConceptMap — CDA TEL vers FHIR ContactPoint"
Description: "Correspondances documentaires entre le datatype CDA TEL et les éléments FHIR ContactPoint."

* url = "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/CdaTELToContactPointConceptMap"
* name = "CdaTELToFHIR"
* status = #draft
* experimental = true

// CDA TEL vers FHIR ContactPoint

* group[0].source = "http://hl7.org/cda/stds/core/StructureDefinition/TEL"
* group[0].target = "http://hl7.org/fhir/StructureDefinition/ContactPoint"

// TEL.value vers ContactPoint.value et ContactPoint.system

* group[0].element[0].code = #TEL.value
* group[0].element[0].display = "TEL.value"

// TEL.value vers ContactPoint.value

* group[0].element[0].target[0].code = #ContactPoint.value
* group[0].element[0].target[0].display = "The actual contact point details"
* group[0].element[0].target[0].equivalence = #relatedto
* group[0].element[0].target[0].comment = "La valeur TEL alimente ContactPoint.value après suppression du préfixe technique tel:, fax:, mailto:, http: ou https:."

// TEL.value vers ContactPoint.system

* group[0].element[0].target[1].code = #ContactPoint.system
* group[0].element[0].target[1].display = "phone | fax | email | pager | url | sms | other"
* group[0].element[0].target[1].equivalence = #relatedto
* group[0].element[0].target[1].comment = "Le système cible est déterminé à partir du préfixe de TEL.value : tel vers phone, fax vers fax, mailto vers email et http ou https vers url."

// TEL.use vers ContactPoint.use

* group[0].element[1].code = #TEL.use
* group[0].element[1].display = "Use Code"
* group[0].element[1].target[0].code = #ContactPoint.use
* group[0].element[1].target[0].display = "home | work | temp | old | mobile - purpose of this contact point"
* group[0].element[1].target[0].equivalence = #relatedto
* group[0].element[1].target[0].comment = "Les usages CDA sont convertis vers les usages FHIR : H vers home ; WP, DIR ou PUB vers work ; BAD vers old ; TMP vers temp ; MC vers mobile."

// TEL.useablePeriod vers ContactPoint.period

* group[0].element[2].code = #TEL.useablePeriod
* group[0].element[2].display = "Useable Period"
* group[0].element[2].target[0].code = #ContactPoint.period
* group[0].element[2].target[0].display = "Time period when the contact point was/is in use"
* group[0].element[2].target[0].equivalence = #equivalent
* group[0].element[2].target[0].comment = "La période d’utilisation du point de contact CDA alimente directement ContactPoint.period."
