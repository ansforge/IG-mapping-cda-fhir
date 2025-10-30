Instance: cm-v3-administrative-gender
InstanceOf: ConceptMap
Usage: #definition
* url = "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/cm-v3-administrative-gender"
* name = "CdaToFhirAdministrativeGender"
* title = "CDA to FHIR Administrative Gender Mapping"
* status = #active
* experimental = false
* description = "Mapping between CDA v3 Administrative Gender codes and FHIR Administrative Gender codes"
* purpose = "Used in CDA to FHIR transformations to map gender codes"

* sourceCanonical = "http://terminology.hl7.org/ValueSet/v3-AdministrativeGender"
* targetCanonical = "http://hl7.org/fhir/ValueSet/administrative-gender"

* group[0].source = "http://terminology.hl7.org/CodeSystem/v3-AdministrativeGender"
* group[0].target = "http://hl7.org/fhir/administrative-gender"

// Male
* group[0].element[0].code = #M
* group[0].element[0].display = "Male"
* group[0].element[0].target[0].code = #male
* group[0].element[0].target[0].display = "Male"
* group[0].element[0].target[0].equivalence = #equivalent

// Female
* group[0].element[1].code = #F
* group[0].element[1].display = "Female"
* group[0].element[1].target[0].code = #female
* group[0].element[1].target[0].display = "Female"
* group[0].element[1].target[0].equivalence = #equivalent

// Undifferentiated (mapped to 'other')
* group[0].element[2].code = #UN
* group[0].element[2].display = "Undifferentiated"
* group[0].element[2].target[0].code = #other
* group[0].element[2].target[0].display = "Other"
* group[0].element[2].target[0].equivalence = #equivalent
* group[0].element[2].target[0].comment = "CDA 'Undifferentiated' maps to FHIR 'other'"

// Unknown
* group[0].element[3].code = #UNK
* group[0].element[3].display = "Unknown"
* group[0].element[3].target[0].code = #unknown
* group[0].element[3].target[0].display = "Unknown"
* group[0].element[3].target[0].equivalence = #equivalent
