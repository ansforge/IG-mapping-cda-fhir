Instance: CdaADToAddressConceptMap
InstanceOf: ConceptMap
Usage: #definition
Title: "ConceptMap — CDA AD vers FHIR Address"
Description: "Correspondances documentaires des composants du type CDA AD vers le type FHIR Address et les extensions associées."

* url = "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/CdaADToAddressConceptMap"
* name = "CdaAddressToFHIR"
* status = #draft
* experimental = true

// Groupe 0 : CDA AD vers FHIR Address

* group[0].source = "http://hl7.org/cda/stds/core/StructureDefinition/AD"
* group[0].target = "http://hl7.org/fhir/StructureDefinition/Address"

// AD.item.country vers Address.country

* group[0].element[0].code = #AD.item.country
* group[0].element[0].display = "Country"
* group[0].element[0].target[0].code = #Address.country
* group[0].element[0].target[0].display = "Country (e.g. can be ISO 3166 2 or 3 letter code)"
* group[0].element[0].target[0].equivalence = #equivalent
* group[0].element[0].target[0].comment = "Le composant country de l’adresse CDA alimente directement Address.country."

// AD.item.state vers Address.state

* group[0].element[1].code = #AD.item.state
* group[0].element[1].display = "State"
* group[0].element[1].target[0].code = #Address.state
* group[0].element[1].target[0].display = "Sub-unit of country (abbreviations ok)"
* group[0].element[1].target[0].equivalence = #equivalent
* group[0].element[1].target[0].comment = "Le composant state de l’adresse CDA alimente directement Address.state."

// AD.item.county vers Address.district

* group[0].element[2].code = #AD.item.county
* group[0].element[2].display = "County"
* group[0].element[2].target[0].code = #Address.district
* group[0].element[2].target[0].display = "District name (aka county)"
* group[0].element[2].target[0].equivalence = #relatedto
* group[0].element[2].target[0].comment = "Le composant county de l’adresse CDA est rapproché de Address.district dans FHIR."

// AD.item.city vers Address.city

* group[0].element[3].code = #AD.item.city
* group[0].element[3].display = "City"
* group[0].element[3].target[0].code = #Address.city
* group[0].element[3].target[0].display = "Name of city, town etc."
* group[0].element[3].target[0].equivalence = #equivalent
* group[0].element[3].target[0].comment = "Le composant city de l’adresse CDA alimente directement Address.city."

// AD.item.postalCode vers Address.postalCode

* group[0].element[4].code = #AD.item.postalCode
* group[0].element[4].display = "Postal Code"
* group[0].element[4].target[0].code = #Address.postalCode
* group[0].element[4].target[0].display = "Postal code for area"
* group[0].element[4].target[0].equivalence = #equivalent
* group[0].element[4].target[0].comment = "Le code postal de l’adresse CDA alimente directement Address.postalCode."

// AD.item.streetAddressLine vers Address.line

* group[0].element[5].code = #AD.item.streetAddressLine
* group[0].element[5].display = "Street Address Line"
* group[0].element[5].target[0].code = #Address.line
* group[0].element[5].target[0].display = "Street name, number, direction & P.O. Box etc."
* group[0].element[5].target[0].equivalence = #equivalent
* group[0].element[5].target[0].comment = "Chaque composant streetAddressLine de l’adresse CDA alimente une occurrence de Address.line."

// AD.useablePeriod vers Address.period

* group[0].element[6].code = #AD.useablePeriod
* group[0].element[6].display = "Useable Period"
* group[0].element[6].target[0].code = #Address.period
* group[0].element[6].target[0].display = "Time period when address was/is in use"
* group[0].element[6].target[0].equivalence = #relatedto
* group[0].element[6].target[0].comment = "La période d’utilisation de l’adresse CDA alimente Address.period."

// Groupe 1 : AD.item.streetName vers l’extension iso21090-ADXP-streetName

* group[1].source = "http://hl7.org/cda/stds/core/StructureDefinition/AD"
* group[1].target = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"

// AD.item.streetName vers Extension.value[x]

* group[1].element[0].code = #AD.item.streetName
* group[1].element[0].display = "Street Name"
* group[1].element[0].target[0].code = #Extension.value[x]
* group[1].element[0].target[0].display = "Value of extension"
* group[1].element[0].target[0].equivalence = #equivalent
* group[1].element[0].target[0].comment = "Le nom de la voie CDA alimente la valeur de l’extension iso21090-ADXP-streetName portée par Address.line."

// Groupe 2 : AD.item.houseNumber vers l’extension iso21090-ADXP-houseNumber

* group[2].source = "http://hl7.org/cda/stds/core/StructureDefinition/AD"
* group[2].target = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"

// AD.item.houseNumber vers Extension.value[x]

* group[2].element[0].code = #AD.item.houseNumber
* group[2].element[0].display = "House Number"
* group[2].element[0].target[0].code = #Extension.value[x]
* group[2].element[0].target[0].display = "Value of extension"
* group[2].element[0].target[0].equivalence = #equivalent
* group[2].element[0].target[0].comment = "Le numéro de voie CDA alimente la valeur de l’extension iso21090-ADXP-houseNumber portée par Address.line."
