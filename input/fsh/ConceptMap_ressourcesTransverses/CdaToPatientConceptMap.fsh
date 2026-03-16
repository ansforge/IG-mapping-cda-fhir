Instance: CdaToPatientConceptMap
InstanceOf: ConceptMap
Title: "ConceptMap — CDA PatientRole → FHIR Patient"
Usage: #definition

* url = "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/ressourcesTransverses/Patient"
* name = "PatientRoleToPatient"
* status = #draft
* experimental = true
* description = "Correspondances CDA PatientRole → FHIR Patient"
* source = "http://hl7.org/cda/stds/core/StructureDefinition/PatientRole"
* target = "http://hl7.org/fhir/StructureDefinition/Patient"

* group[0].source = "http://hl7.org/cda/stds/core/StructureDefinition/PatientRole"
* group[0].target = "http://hl7.org/fhir/StructureDefinition/Patient"

/* IDENTIFIER */
* group[0].element[0].code = #CDA001
* group[0].element[0].display = "ClinicalDocument.recordTarget.patientRole.id"
* group[0].element[0].target[0].code = #FHIR001
* group[0].element[0].target[0].display = "Patient.identifier"
* group[0].element[0].target[0].equivalence = #equal

/* NAME */
* group[0].element[1].code = #CDA002
* group[0].element[1].display = "ClinicalDocument.recordTarget.patientRole.patient.name"
* group[0].element[1].target[0].code = #FHIR002
* group[0].element[1].target[0].display = "Patient.name"
* group[0].element[1].target[0].equivalence = #equal

/* GENDER */
* group[0].element[2].code = #CDA003
* group[0].element[2].display = "ClinicalDocument.recordTarget.patientRole.patient.administrativeGenderCode"
* group[0].element[2].target[0].code = #FHIR003
* group[0].element[2].target[0].display = "Patient.gender"
* group[0].element[2].target[0].equivalence = #equal

/* BIRTHDATE */
* group[0].element[3].code = #CDA004
* group[0].element[3].display = "ClinicalDocument.recordTarget.patientRole.patient.birthTime"
* group[0].element[3].target[0].code = #FHIR004
* group[0].element[3].target[0].display = "Patient.birthDate"
* group[0].element[3].target[0].equivalence = #equal

/* DECEASED IND */
* group[0].element[4].code = #CDA005
* group[0].element[4].display = "ClinicalDocument.recordTarget.patientRole.patient.deceasedInd"
* group[0].element[4].target[0].code = #FHIR005
* group[0].element[4].target[0].display = "Patient.deceasedBoolean"
* group[0].element[4].target[0].equivalence = #equal

/* DECEASED TIME */
* group[0].element[5].code = #CDA006
* group[0].element[5].display = "ClinicalDocument.recordTarget.patientRole.patient.deceasedTime"
* group[0].element[5].target[0].code = #FHIR006
* group[0].element[5].target[0].display = "Patient.deceasedDateTime"
* group[0].element[5].target[0].equivalence = #equal

/* MARITAL STATUS */
* group[0].element[6].code = #CDA007
* group[0].element[6].display = "ClinicalDocument.recordTarget.patientRole.patient.maritalStatusCode"
* group[0].element[6].target[0].code = #FHIR007
* group[0].element[6].target[0].display = "Patient.maritalStatus"
* group[0].element[6].target[0].equivalence = #equal

/* LANGUAGE */
* group[0].element[7].code = #CDA008
* group[0].element[7].display = "ClinicalDocument.recordTarget.patientRole.patient.languageCommunication.languageCode"
* group[0].element[7].target[0].code = #FHIR008
* group[0].element[7].target[0].display = "Patient.communication.language"
* group[0].element[7].target[0].equivalence = #equal

/* ADDRESS */
* group[0].element[8].code = #CDA009
* group[0].element[8].display = "ClinicalDocument.recordTarget.patientRole.addr"
* group[0].element[8].target[0].code = #FHIR009
* group[0].element[8].target[0].display = "Patient.address"
* group[0].element[8].target[0].equivalence = #equal

/* TELECOM */
* group[0].element[9].code = #CDA010
* group[0].element[9].display = "ClinicalDocument.recordTarget.patientRole.telecom"
* group[0].element[9].target[0].code = #FHIR010
* group[0].element[9].target[0].display = "Patient.telecom"
* group[0].element[9].target[0].equivalence = #equal

/* MANAGING ORGANIZATION */
* group[0].element[10].code = #CDA011
* group[0].element[10].display = "ClinicalDocument.recordTarget.patientRole.providerOrganization"
* group[0].element[10].target[0].code = #FHIR011
* group[0].element[10].target[0].display = "Patient.managingOrganization"
* group[0].element[10].target[0].equivalence = #equal