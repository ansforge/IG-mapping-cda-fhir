Instance: CdaToPatientConceptMap
InstanceOf: ConceptMap
Usage: #definition
Title: "ConceptMap — CDA PatientRole → FHIR Patient"
Description: "Correspondances CDA PatientRole → FHIR Patient"

* url = "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/ressourcesTransverses/Patient"
* name = "PatientRoleToPatient"
* status = #draft
* experimental = true


* sourceUri = "http://hl7.org/cda/stds/core/StructureDefinition/PatientRole"
* targetUri = "http://hl7.org/fhir/StructureDefinition/Patient"

* group[0].source = "http://hl7.org/cda/stds/core/StructureDefinition/PatientRole"
* group[0].target = "http://hl7.org/fhir/StructureDefinition/Patient"

/* IDENTIFIER */
* group[0].element[0].code = #ClinicalDocument_recordTarget_patientRole_id
* group[0].element[0].target[0].code = #Patient_identifier
* group[0].element[0].target[0].equivalence = #equivalent

/* NAME */
* group[0].element[1].code = #ClinicalDocument_recordTarget_patientRole_patient_name
* group[0].element[1].target[0].code = #Patient_name
* group[0].element[1].target[0].equivalence = #equivalent

/* GENDER */
* group[0].element[2].code = #ClinicalDocument_recordTarget_patientRole_patient_administrativeGenderCode
* group[0].element[2].target[0].code = #Patient_gender
* group[0].element[2].target[0].equivalence = #equivalent

/* BIRTHDATE */
* group[0].element[3].code = #ClinicalDocument_recordTarget_patientRole_patient_birthTime
* group[0].element[3].target[0].code = #Patient_birthDate
* group[0].element[3].target[0].equivalence = #equivalent

/* DECEASED IND */
* group[0].element[4].code = #ClinicalDocument_recordTarget_patientRole_patient_deceasedInd
* group[0].element[4].target[0].code = #Patient_deceasedBoolean
* group[0].element[4].target[0].equivalence = #equivalent

/* DECEASED TIME */
* group[0].element[5].code = #ClinicalDocument_recordTarget_patientRole_patient_deceasedTime
* group[0].element[5].target[0].code = #Patient_deceasedDateTime
* group[0].element[5].target[0].equivalence = #equivalent

/* MARITAL STATUS */
* group[0].element[6].code = #ClinicalDocument_recordTarget_patientRole_patient_maritalStatusCode
* group[0].element[6].target[0].code = #Patient_maritalStatus
* group[0].element[6].target[0].equivalence = #equivalent

/* LANGUAGE */
* group[0].element[7].code = #ClinicalDocument_recordTarget_patientRole_patient_languageCommunication_languageCode
* group[0].element[7].target[0].code = #Patient_communication_language
* group[0].element[7].target[0].equivalence = #equivalent

/* ADDRESS */
* group[0].element[8].code = #ClinicalDocument_recordTarget_patientRole_addr
* group[0].element[8].target[0].code = #Patient_address
* group[0].element[8].target[0].equivalence = #equivalent

/* TELECOM */
* group[0].element[9].code = #ClinicalDocument_recordTarget_patientRole_telecom
* group[0].element[9].target[0].code = #Patient_telecom
* group[0].element[9].target[0].equivalence = #equivalent

/* MANAGING ORGANIZATION */
* group[0].element[10].code = #ClinicalDocument_recordTarget_patientRole_providerOrganization
* group[0].element[10].target[0].code = #Patient_managingOrganization
* group[0].element[10].target[0].equivalence = #equivalent