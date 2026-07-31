Instance: CdaTSToDateTimeConceptMap
InstanceOf: ConceptMap
Usage: #definition
Title: "ConceptMap — CDA TS vers FHIR instant, dateTime et date"
Description: "Correspondances documentaires entre le datatype CDA TS et les types FHIR instant, dateTime et date."

* url = "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/CdaTSToDateTimeConceptMap"
* name = "CdaTSToFHIR"
* status = #draft
* experimental = true

// Groupe 0 : CDA TS vers FHIR instant

* group[0].source = "http://hl7.org/cda/stds/core/StructureDefinition/TS"
* group[0].target = "http://hl7.org/fhir/StructureDefinition/instant"

// TS.value vers instant

* group[0].element[0].code = #TS.value
* group[0].element[0].display = "TS.value"
* group[0].element[0].target[0].code = #instant
* group[0].element[0].target[0].display = "Primitive Type instant"
* group[0].element[0].target[0].equivalence = #relatedto
* group[0].element[0].target[0].comment = "TS.value est converti en valeur FHIR instant (précision jour ou partielle : AAAA, AAAA-MM ou AAAA-MM-JJ)."

// Groupe 1 : CDA TS vers FHIR dateTime

* group[1].source = "http://hl7.org/cda/stds/core/StructureDefinition/TS"
* group[1].target = "http://hl7.org/fhir/StructureDefinition/dateTime"

// TS.value vers dateTime

* group[1].element[0].code = #TS.value
* group[1].element[0].display = "TS.value"
* group[1].element[0].target[0].code = #dateTime
* group[1].element[0].target[0].display = "Primitive Type dateTime"
* group[1].element[0].target[0].equivalence = #relatedto
* group[1].element[0].target[0].comment = "TS.value est converti en valeur FHIR dateTime (précision variable autorisée : année/mois/jour ou date-heure)."

// Groupe 2 : CDA TS vers FHIR date

* group[2].source = "http://hl7.org/cda/stds/core/StructureDefinition/TS"
* group[2].target = "http://hl7.org/fhir/StructureDefinition/date"

// TS.value vers date

* group[2].element[0].code = #TS.value
* group[2].element[0].display = "TS.value"
* group[2].element[0].target[0].code = #date
* group[2].element[0].target[0].display = "Primitive Type date"
* group[2].element[0].target[0].equivalence = #relatedto
* group[2].element[0].target[0].comment = "TS.value est converti en valeur FHIR date (précision jour ou partielle : AAAA ou AAAA-MM ou AAAA-MM-JJ)."
