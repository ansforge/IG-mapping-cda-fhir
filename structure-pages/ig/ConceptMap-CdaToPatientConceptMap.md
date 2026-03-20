# ConceptMap — CDA PatientRole → FHIR Patient - POC - Mapping CDA to FHIR v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ConceptMap — CDA PatientRole → FHIR Patient**

## ConceptMap: ConceptMap — CDA PatientRole → FHIR Patient (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/ressourcesTransverses/Patient | *Version*:0.1.0 |
| Draft as of 2026-03-20 | *Computable Name*:PatientRoleToPatient |

 
Correspondances CDA PatientRole → FHIR Patient 



## Resource Content

```json
{
  "resourceType" : "ConceptMap",
  "id" : "CdaToPatientConceptMap",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/ressourcesTransverses/Patient",
  "version" : "0.1.0",
  "name" : "PatientRoleToPatient",
  "title" : "ConceptMap — CDA PatientRole → FHIR Patient",
  "status" : "draft",
  "experimental" : true,
  "date" : "2026-03-20T13:38:30+00:00",
  "publisher" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
  "contact" : [{
    "name" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
    "telecom" : [{
      "system" : "url",
      "value" : "https://esante.gouv.fr"
    }]
  }],
  "description" : "Correspondances CDA PatientRole → FHIR Patient",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "FR",
      "display" : "FRANCE"
    }]
  }],
  "sourceUri" : "http://hl7.org/cda/stds/core/StructureDefinition/PatientRole",
  "targetUri" : "http://hl7.org/fhir/StructureDefinition/Patient",
  "group" : [{
    "source" : "http://hl7.org/cda/stds/core/StructureDefinition/PatientRole",
    "target" : "http://hl7.org/fhir/StructureDefinition/Patient",
    "element" : [{
      "code" : "ClinicalDocument_recordTarget_patientRole_id",
      "target" : [{
        "code" : "Patient_identifier",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "ClinicalDocument_recordTarget_patientRole_patient_name",
      "target" : [{
        "code" : "Patient_name",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "ClinicalDocument_recordTarget_patientRole_patient_administrativeGenderCode",
      "target" : [{
        "code" : "Patient_gender",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "ClinicalDocument_recordTarget_patientRole_patient_birthTime",
      "target" : [{
        "code" : "Patient_birthDate",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "ClinicalDocument_recordTarget_patientRole_patient_deceasedInd",
      "target" : [{
        "code" : "Patient_deceasedBoolean",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "ClinicalDocument_recordTarget_patientRole_patient_deceasedTime",
      "target" : [{
        "code" : "Patient_deceasedDateTime",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "ClinicalDocument_recordTarget_patientRole_patient_maritalStatusCode",
      "target" : [{
        "code" : "Patient_maritalStatus",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "ClinicalDocument_recordTarget_patientRole_patient_languageCommunication_languageCode",
      "target" : [{
        "code" : "Patient_communication_language",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "ClinicalDocument_recordTarget_patientRole_addr",
      "target" : [{
        "code" : "Patient_address",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "ClinicalDocument_recordTarget_patientRole_telecom",
      "target" : [{
        "code" : "Patient_telecom",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "ClinicalDocument_recordTarget_patientRole_providerOrganization",
      "target" : [{
        "code" : "Patient_managingOrganization",
        "equivalence" : "equivalent"
      }]
    }]
  }]
}

```
