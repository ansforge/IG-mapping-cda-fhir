Instance: CdaToContactPointConceptMap
InstanceOf: ConceptMap
Usage: #definition
Title: "ConceptMap — CDA TEL vers FHIR ContactPoint"
Description: "Correspondances documentaires entre le datatype CDA TEL et les éléments FHIR ContactPoint."

* url = "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/DataTypes/CdaTELToFHIR"
* name = "CdaTELToFHIR"
* status = #draft
* experimental = true

* group[0].source = "http://hl7.org/cda/stds/core/StructureDefinition/TEL"
* group[0].target = "http://hl7.org/fhir/StructureDefinition/ContactPoint"

/* TEL.value -> ContactPoint.value / ContactPoint.system */
* group[0].element[0].code = #TEL.value
* group[0].element[0].display = "TEL.value"
* group[0].element[0].target[0].code = #ContactPoint.value
* group[0].element[0].target[0].display = "ContactPoint.value"
* group[0].element[0].target[0].equivalence = #relatedto
* group[0].element[0].target[0].comment = "La valeur TEL alimente ContactPoint.value après suppression du préfixe technique tel:, fax:, mailto:, http: ou https:."

* group[0].element[0].target[1].code = #ContactPoint.system
* group[0].element[0].target[1].display = "ContactPoint.system"
* group[0].element[0].target[1].equivalence = #relatedto
* group[0].element[0].target[1].comment = "Le système cible est déterminé à partir du préfixe de TEL.value : tel -> phone, fax -> fax, mailto -> email, http/https -> url."

/* TEL.use -> ContactPoint.use */
* group[0].element[1].code = #TEL.use
* group[0].element[1].display = "TEL.use"
* group[0].element[1].target[0].code = #ContactPoint.use
* group[0].element[1].target[0].display = "ContactPoint.use"
* group[0].element[1].target[0].equivalence = #relatedto
* group[0].element[1].target[0].comment = "Les usages CDA sont convertis vers les usages FHIR : H -> home ; WP, DIR ou PUB -> work ; BAD -> old ; TMP -> temp ; MC -> mobile."

/* TEL.useablePeriod -> ContactPoint.period */
* group[0].element[2].code = #TEL.useablePeriod
* group[0].element[2].display = "TEL.useablePeriod"
* group[0].element[2].target[0].code = #ContactPoint.period
* group[0].element[2].target[0].display = "ContactPoint.period"
* group[0].element[2].target[0].equivalence = #equivalent
* group[0].element[2].target[0].comment = "La période d’utilisation du point de contact CDA alimente directement ContactPoint.period."
