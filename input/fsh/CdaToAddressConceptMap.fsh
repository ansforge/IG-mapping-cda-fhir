Instance: CdaToAddressConceptMap
InstanceOf: ConceptMap
Usage: #definition
Title: "ConceptMap — CDA AD vers FHIR Address"
Description: "Correspondances documentaires des composants AD vers Address."

* url = "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/DataTypes/CdaAddressToFHIR"
* name = "CdaAddressToFHIR"
* status = #draft
* experimental = true

* group[0].source = "http://hl7.org/cda/stds/core/StructureDefinition/AD"
* group[0].target = "http://hl7.org/fhir/StructureDefinition/Address"

/* AD.item.country -> Address.country */
* group[0].element[0].code = #AD.item.country
* group[0].element[0].display = "AD.item.country"
* group[0].element[0].target[0].code = #Address.country
* group[0].element[0].target[0].display = "Address.country"
* group[0].element[0].target[0].equivalence = #equivalent
* group[0].element[0].target[0].comment = "Le composant country de l’adresse CDA alimente directement Address.country."

/* AD.item.state -> Address.state */
* group[0].element[1].code = #AD.item.state
* group[0].element[1].display = "AD.item.state"
* group[0].element[1].target[0].code = #Address.state
* group[0].element[1].target[0].display = "Address.state"
* group[0].element[1].target[0].equivalence = #equivalent
* group[0].element[1].target[0].comment = "Le composant state de l’adresse CDA alimente directement Address.state."

/* AD.item.county -> Address.district */
* group[0].element[2].code = #AD.item.county
* group[0].element[2].display = "AD.item.county"
* group[0].element[2].target[0].code = #Address.district
* group[0].element[2].target[0].display = "Address.district"
* group[0].element[2].target[0].equivalence = #relatedto
* group[0].element[2].target[0].comment = "Le composant county de CDA est rapproché de Address.district dans FHIR."

/* AD.item.city -> Address.city */
* group[0].element[3].code = #AD.item.city
* group[0].element[3].display = "AD.item.city"
* group[0].element[3].target[0].code = #Address.city
* group[0].element[3].target[0].display = "Address.city"
* group[0].element[3].target[0].equivalence = #equivalent
* group[0].element[3].target[0].comment = "Le composant city de l’adresse CDA alimente directement Address.city."

/* AD.item.postalCode -> Address.postalCode */
* group[0].element[4].code = #AD.item.postalCode
* group[0].element[4].display = "AD.item.postalCode"
* group[0].element[4].target[0].code = #Address.postalCode
* group[0].element[4].target[0].display = "Address.postalCode"
* group[0].element[4].target[0].equivalence = #equivalent
* group[0].element[4].target[0].comment = "Le code postal CDA alimente directement Address.postalCode."

/* AD.item.streetAddressLine -> Address.line */
* group[0].element[5].code = #AD.item.streetAddressLine
* group[0].element[5].display = "AD.item.streetAddressLine"
* group[0].element[5].target[0].code = #Address.line
* group[0].element[5].target[0].display = "Address.line"
* group[0].element[5].target[0].equivalence = #equivalent
* group[0].element[5].target[0].comment = "Chaque streetAddressLine CDA alimente une ligne d’adresse FHIR."

/* AD.item.streetName -> Address.line.extension[iso21090-ADXP-streetName].valueString */
* group[0].element[6].code = #AD.item.streetName
* group[0].element[6].display = "AD.item.streetName"
* group[0].element[6].target[0].code = #Address.line.extension[iso21090-ADXP-streetName].valueString
* group[0].element[6].target[0].display = "Address.line.extension[http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName].valueString"
* group[0].element[6].target[0].equivalence = #equivalent
* group[0].element[6].target[0].comment = "Le nom de rue CDA alimente la valeur de l’extension officielle HL7 iso21090-ADXP-streetName portée par Address.line."

/* AD.item.houseNumber -> Address.line.extension[iso21090-ADXP-houseNumber].valueString */
* group[0].element[7].code = #AD.item.houseNumber
* group[0].element[7].display = "AD.item.houseNumber"
* group[0].element[7].target[0].code = #Address.line.extension[iso21090-ADXP-houseNumber].valueString
* group[0].element[7].target[0].display = "Address.line.extension[http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber].valueString"
* group[0].element[7].target[0].equivalence = #equivalent
* group[0].element[7].target[0].comment = "Le numéro de voie CDA alimente la valeur de l’extension officielle HL7 iso21090-ADXP-houseNumber portée par Address.line."

/* AD.useablePeriod -> Address.period */
* group[0].element[8].code = #AD.useablePeriod
* group[0].element[8].display = "AD.useablePeriod"
* group[0].element[8].target[0].code = #Address.period
* group[0].element[8].target[0].display = "Address.period"
* group[0].element[8].target[0].equivalence = #relatedto
* group[0].element[8].target[0].comment = "La période d’utilisation de l’adresse CDA alimente Address.period."
