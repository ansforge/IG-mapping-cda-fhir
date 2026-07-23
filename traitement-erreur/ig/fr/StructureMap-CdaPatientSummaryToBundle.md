# Mapping CDA Patient Summary vers FHIR - Étape 4 finale - Mapping CDA to FHIR (Preuve de concept) v0.1.0

## StructureMap: Mapping CDA Patient Summary vers FHIR - Étape 4 finale 

 
Mapping CDA Patient Summary vers FHIR - Étape 4 finale 



## Resource Content

```json
{
  "resourceType" : "StructureMap",
  "id" : "CdaPatientSummaryToBundle",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/StructureMap/CdaPatientSummaryToBundle",
  "version" : "0.1.0",
  "name" : "CdaPatientSummaryToBundle",
  "title" : "Mapping CDA Patient Summary vers FHIR - Étape 4 finale",
  "status" : "draft",
  "date" : "2026-07-23T09:29:57+00:00",
  "publisher" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
  "contact" : [{
    "name" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
    "telecom" : [{
      "system" : "url",
      "value" : "https://esante.gouv.fr"
    }]
  }],
  "description" : "Mapping CDA Patient Summary vers FHIR - Étape 4 finale",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "FR",
      "display" : "France (la)"
    }]
  }],
  "structure" : [{
    "url" : "http://hl7.org/cda/stds/core/StructureDefinition/ClinicalDocument|2.0.0-sd",
    "mode" : "source",
    "alias" : "ClinicalDocument"
  },
  {
    "url" : "http://hl7.org/cda/stds/core/StructureDefinition/PatientRole|2.0.0-sd",
    "mode" : "source",
    "alias" : "PatientRole"
  },
  {
    "url" : "http://hl7.org/cda/stds/core/StructureDefinition/RelatedEntity|2.0.0-sd",
    "mode" : "source",
    "alias" : "RelatedEntity"
  },
  {
    "url" : "http://hl7.org/cda/stds/core/StructureDefinition/EncompassingEncounter|2.0.0-sd",
    "mode" : "source",
    "alias" : "EncompassingEncounter"
  },
  {
    "url" : "http://hl7.org/cda/stds/core/StructureDefinition/HealthCareFacility|2.0.0-sd",
    "mode" : "source",
    "alias" : "HealthCareFacility"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/Bundle|4.0.1",
    "mode" : "target",
    "alias" : "Bundle"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/Composition|4.0.1",
    "mode" : "target",
    "alias" : "Composition"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/Patient|4.0.1",
    "mode" : "target",
    "alias" : "Patient"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/Organization|4.0.1",
    "mode" : "target",
    "alias" : "Organization"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/Practitioner|4.0.1",
    "mode" : "target",
    "alias" : "Practitioner"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/PractitionerRole|4.0.1",
    "mode" : "target",
    "alias" : "PractitionerRole"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/RelatedPerson|4.0.1",
    "mode" : "target",
    "alias" : "RelatedPerson"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/Encounter|4.0.1",
    "mode" : "target",
    "alias" : "Encounter"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/Location|4.0.1",
    "mode" : "target",
    "alias" : "Location"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/Condition|4.0.1",
    "mode" : "target",
    "alias" : "Condition"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/AllergyIntolerance|4.0.1",
    "mode" : "target",
    "alias" : "AllergyIntolerance"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/AdverseEvent|4.0.1",
    "mode" : "target",
    "alias" : "AdverseEvent"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/Medication|4.0.1",
    "mode" : "target",
    "alias" : "Medication"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/MedicationStatement|4.0.1",
    "mode" : "target",
    "alias" : "MedicationStatement"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/Procedure|4.0.1",
    "mode" : "target",
    "alias" : "Procedure"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/Immunization|4.0.1",
    "mode" : "target",
    "alias" : "Immunization"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/Observation|4.0.1",
    "mode" : "target",
    "alias" : "Observation"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/CarePlan|4.0.1",
    "mode" : "target",
    "alias" : "CarePlan"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/DocumentReference|4.0.1",
    "mode" : "target",
    "alias" : "DocumentReference"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/DiagnosticReport|4.0.1",
    "mode" : "target",
    "alias" : "DiagnosticReport"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/MedicationRequest|4.0.1",
    "mode" : "target",
    "alias" : "MedicationRequest"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/ServiceRequest|4.0.1",
    "mode" : "target",
    "alias" : "ServiceRequest"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/ImmunizationRecommendation|4.0.1",
    "mode" : "target",
    "alias" : "ImmunizationRecommendation"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/FamilyMemberHistory|4.0.1",
    "mode" : "target",
    "alias" : "FamilyMemberHistory"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/Identifier|4.0.1",
    "mode" : "target",
    "alias" : "Identifier"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/CodeableConcept|4.0.1",
    "mode" : "target",
    "alias" : "CodeableConcept"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/Coding|4.0.1",
    "mode" : "target",
    "alias" : "Coding"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/Reference|4.0.1",
    "mode" : "target",
    "alias" : "Reference"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/Period|4.0.1",
    "mode" : "target",
    "alias" : "Period"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/Attachment|4.0.1",
    "mode" : "target",
    "alias" : "Attachment"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/Narrative|4.0.1",
    "mode" : "target",
    "alias" : "Narrative"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/Timing|4.0.1",
    "mode" : "target",
    "alias" : "Timing"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/Range|4.0.1",
    "mode" : "target",
    "alias" : "Range"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/Quantity|4.0.1",
    "mode" : "target",
    "alias" : "Quantity"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/Ratio|4.0.1",
    "mode" : "target",
    "alias" : "Ratio"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/Annotation|4.0.1",
    "mode" : "target",
    "alias" : "Annotation"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/code|4.0.1",
    "mode" : "target",
    "alias" : "code"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/date|4.0.1",
    "mode" : "target",
    "alias" : "date"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/dateTime|4.0.1",
    "mode" : "target",
    "alias" : "dateTime"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/boolean|4.0.1",
    "mode" : "target",
    "alias" : "boolean"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/Device|4.0.1",
    "mode" : "target",
    "alias" : "Device"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/DeviceUseStatement|4.0.1",
    "mode" : "target",
    "alias" : "DeviceUseStatement"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/Consent|4.0.1",
    "mode" : "target",
    "alias" : "Consent"
  }],
  "import" : ["https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/StructureMap/CdaToFHIRTypes|0.1.0",
  "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/StructureMap/CdaToBundle",
  "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/StructureMap/CdaFrToBundle|0.1.0"],
  "group" : [{
    "name" : "TransformPatientSummaryClinicalDocumentToFHIRDocument",
    "typeMode" : "none",
    "documentation" : "GROUPE D’ENTRÉE — CRÉATION DU BUNDLE FINAL PATIENT SUMMARY\n\n   Ce groupe crée le Bundle final avec Composition et Patient. Ces ressources\n   sont toujours nécessaires dans un document FHIR de type document.\n\n   Les autres ressources administratives sont créées plus loin, uniquement si le\n   bloc CDA correspondant existe",
    "input" : [{
      "name" : "cda",
      "type" : "ClinicalDocument",
      "mode" : "source"
    },
    {
      "name" : "bundle",
      "type" : "Bundle",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "main",
      "source" : [{
        "context" : "cda"
      }],
      "target" : [{
        "context" : "bundle",
        "contextType" : "variable",
        "element" : "entry",
        "variable" : "compositionEntry"
      },
      {
        "context" : "compositionEntry",
        "contextType" : "variable",
        "element" : "resource",
        "variable" : "composition",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Composition"
        }]
      },
      {
        "context" : "composition",
        "contextType" : "variable",
        "element" : "id",
        "transform" : "uuid"
      },
      {
        "context" : "compositionEntry",
        "contextType" : "variable",
        "element" : "fullUrl",
        "transform" : "evaluate",
        "parameter" : [{
          "valueString" : "'urn:uuid:' + %composition.id"
        }]
      },
      {
        "context" : "bundle",
        "contextType" : "variable",
        "element" : "entry",
        "variable" : "patientEntry"
      },
      {
        "context" : "patientEntry",
        "contextType" : "variable",
        "element" : "resource",
        "variable" : "patient",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Patient"
        }]
      },
      {
        "context" : "patient",
        "contextType" : "variable",
        "element" : "id",
        "transform" : "uuid"
      },
      {
        "context" : "patientEntry",
        "contextType" : "variable",
        "element" : "fullUrl",
        "transform" : "evaluate",
        "parameter" : [{
          "valueString" : "'urn:uuid:' + %patient.id"
        }]
      }],
      "dependent" : [{
        "name" : "OrchestrateClinicalDocumentFinalTransformation",
        "variable" : ["cda", "patient", "composition", "bundle"]
      }]
    }]
  },
  {
    "name" : "OrchestrateClinicalDocumentFinalTransformation",
    "typeMode" : "none",
    "documentation" : "GROUPE D’ORCHESTRATION FINALE — SOCLE FRANÇAIS + MÉTIER PATIENT SUMMARY\n   Ce groupe applique deux traitements successifs :\n   - MapClinicalDocumentHeaderWithFrenchRules, importé depuis l’étape 3, traite\n     l’en-tête CDA, crée les ressources administratives nécessaires, applique le\n     socle générique de l’étape 2 et l’enrichissement français ;\n   - MapPatientSummaryBody traite ensuite les sections Patient Summary et crée\n     les ressources métier à partir des entries CDA.\n\n   Les ressources optionnelles ne sont donc pas créées au début : elles sont\n   créées uniquement dans les groupes associés aux blocs CDA présents",
    "input" : [{
      "name" : "cda",
      "type" : "ClinicalDocument",
      "mode" : "source"
    },
    {
      "name" : "patient",
      "type" : "Patient",
      "mode" : "target"
    },
    {
      "name" : "composition",
      "type" : "Composition",
      "mode" : "target"
    },
    {
      "name" : "bundle",
      "type" : "Bundle",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "headerFrenchBase",
      "source" : [{
        "context" : "cda"
      }],
      "dependent" : [{
        "name" : "MapClinicalDocumentHeaderWithFrenchRules",
        "variable" : ["cda", "bundle", "composition", "patient"]
      }]
    },
    {
      "name" : "patientSummaryBody",
      "source" : [{
        "context" : "cda"
      }],
      "dependent" : [{
        "name" : "MapPatientSummaryBody",
        "variable" : ["cda", "composition", "bundle", "patient"]
      }]
    }]
  },
  {
    "name" : "MapPatientSummaryBody",
    "typeMode" : "none",
    "documentation" : "CORPS PATIENT SUMMARY — SECTIONS + ENTRIES MÉTIER\n   Pour chaque section CDA :\n   - MapCDASectionToCompositionSection, importé depuis l’étape 2, crée le\n     squelette commun de la Composition.section avec title, code et text ;\n   - MapPatientSummarySectionEntries crée ensuite les ressources métier selon\n     le code LOINC de la section",
    "input" : [{
      "name" : "src",
      "type" : "ClinicalDocument",
      "mode" : "source"
    },
    {
      "name" : "composition",
      "type" : "Composition",
      "mode" : "target"
    },
    {
      "name" : "bundle",
      "type" : "Bundle",
      "mode" : "target"
    },
    {
      "name" : "patient",
      "type" : "Patient",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "component",
      "source" : [{
        "context" : "src",
        "element" : "component",
        "variable" : "cdaComponent"
      }],
      "rule" : [{
        "name" : "structuredBody",
        "source" : [{
          "context" : "cdaComponent",
          "element" : "structuredBody",
          "variable" : "structuredBody"
        }],
        "rule" : [{
          "name" : "bodyComponent",
          "source" : [{
            "context" : "structuredBody",
            "element" : "component",
            "variable" : "bodyComponent"
          }],
          "rule" : [{
            "name" : "section",
            "source" : [{
              "context" : "bodyComponent",
              "element" : "section",
              "variable" : "section"
            }],
            "target" : [{
              "context" : "composition",
              "contextType" : "variable",
              "element" : "section",
              "variable" : "compSection"
            }],
            "rule" : [{
              "name" : "sectionBase",
              "source" : [{
                "context" : "section"
              }],
              "dependent" : [{
                "name" : "MapCDASectionToCompositionSection",
                "variable" : ["section", "compSection"]
              }]
            },
            {
              "name" : "patientSummaryEntries",
              "source" : [{
                "context" : "section"
              }],
              "dependent" : [{
                "name" : "MapPatientSummarySectionEntries",
                "variable" : ["section", "compSection", "bundle", "patient"]
              }]
            }]
          }]
        }]
      }]
    }]
  },
  {
    "name" : "MapPatientSummarySectionEntries",
    "typeMode" : "none",
    "documentation" : "DISPATCH DES ENTRIES MÉTIER PATIENT SUMMARY\n   CDA section.code LOINC -> groupe métier FHIR correspondant",
    "input" : [{
      "name" : "section",
      "mode" : "source"
    },
    {
      "name" : "compSection",
      "mode" : "target"
    },
    {
      "name" : "bundle",
      "type" : "Bundle",
      "mode" : "target"
    },
    {
      "name" : "patient",
      "type" : "Patient",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "activeProblems",
      "source" : [{
        "context" : "section",
        "element" : "code",
        "variable" : "secCode",
        "condition" : "secCode.code = '11450-4'"
      }],
      "dependent" : [{
        "name" : "PatientSummaryConditionSection",
        "variable" : ["section", "compSection", "bundle", "patient"]
      }]
    },
    {
      "name" : "medicalHistory",
      "source" : [{
        "context" : "section",
        "element" : "code",
        "variable" : "secCode",
        "condition" : "secCode.code = '11348-0'"
      }],
      "dependent" : [{
        "name" : "PatientSummaryConditionSection",
        "variable" : ["section", "compSection", "bundle", "patient"]
      }]
    },
    {
      "name" : "allergies",
      "source" : [{
        "context" : "section",
        "element" : "code",
        "variable" : "secCode",
        "condition" : "secCode.code = '48765-2'"
      }],
      "dependent" : [{
        "name" : "PatientSummaryAllergySection",
        "variable" : ["section", "compSection", "bundle", "patient"]
      }]
    },
    {
      "name" : "medications",
      "source" : [{
        "context" : "section",
        "element" : "code",
        "variable" : "secCode",
        "condition" : "secCode.code = '10160-0'"
      }],
      "dependent" : [{
        "name" : "PatientSummaryMedicationSection",
        "variable" : ["section", "compSection", "bundle", "patient"]
      }]
    },
    {
      "name" : "procedureHistory",
      "source" : [{
        "context" : "section",
        "element" : "code",
        "variable" : "secCode",
        "condition" : "secCode.code = '47519-4'"
      }],
      "dependent" : [{
        "name" : "PatientSummaryProcedureSection",
        "variable" : ["section", "compSection", "bundle", "patient"]
      }]
    },
    {
      "name" : "adverseDrugReactions",
      "source" : [{
        "context" : "section",
        "element" : "code",
        "variable" : "secCode",
        "condition" : "secCode.code = '44939-7'"
      }],
      "dependent" : [{
        "name" : "PatientSummaryAdverseDrugReactionSection",
        "variable" : ["section", "compSection", "bundle", "patient"]
      }]
    },
    {
      "name" : "immunizations",
      "source" : [{
        "context" : "section",
        "element" : "code",
        "variable" : "secCode",
        "condition" : "secCode.code = '11369-6'"
      }],
      "dependent" : [{
        "name" : "PatientSummaryImmunizationSection",
        "variable" : ["section", "compSection", "bundle", "patient"]
      }]
    },
    {
      "name" : "functionalStatus",
      "source" : [{
        "context" : "section",
        "element" : "code",
        "variable" : "secCode",
        "condition" : "secCode.code = '47420-5'"
      }],
      "dependent" : [{
        "name" : "PatientSummaryFunctionalStatusSection",
        "variable" : ["section", "compSection", "bundle", "patient"]
      }]
    },
    {
      "name" : "vitalSigns",
      "source" : [{
        "context" : "section",
        "element" : "code",
        "variable" : "secCode",
        "condition" : "secCode.code = '8716-3'"
      }],
      "dependent" : [{
        "name" : "PatientSummaryVitalSignsSection",
        "variable" : ["section", "compSection", "bundle", "patient"]
      }]
    },
    {
      "name" : "lifestyle",
      "source" : [{
        "context" : "section",
        "element" : "code",
        "variable" : "secCode",
        "condition" : "secCode.code = '29762-2'"
      }],
      "dependent" : [{
        "name" : "PatientSummaryLifestyleSection",
        "variable" : ["section", "compSection", "bundle", "patient"]
      }]
    },
    {
      "name" : "professionalRisks",
      "source" : [{
        "context" : "section",
        "element" : "code",
        "variable" : "secCode",
        "condition" : "secCode.code = '10161-8'"
      }],
      "dependent" : [{
        "name" : "PatientSummaryProfessionalRisksSection",
        "variable" : ["section", "compSection", "bundle", "patient"]
      }]
    },
    {
      "name" : "results",
      "source" : [{
        "context" : "section",
        "element" : "code",
        "variable" : "secCode",
        "condition" : "secCode.code = '30954-2'"
      }],
      "dependent" : [{
        "name" : "PatientSummaryResultsSection",
        "variable" : ["section", "compSection", "bundle", "patient"]
      }]
    },
    {
      "name" : "carePlan",
      "source" : [{
        "context" : "section",
        "element" : "code",
        "variable" : "secCode",
        "condition" : "secCode.code = '18776-5'"
      }],
      "dependent" : [{
        "name" : "PatientSummaryCarePlanSection",
        "variable" : ["section", "compSection", "bundle", "patient"]
      }]
    },
    {
      "name" : "familyHistory",
      "source" : [{
        "context" : "section",
        "element" : "code",
        "variable" : "secCode",
        "condition" : "secCode.code = '10157-6'"
      }],
      "dependent" : [{
        "name" : "PatientSummaryFamilyHistorySection",
        "variable" : ["section", "compSection", "bundle", "patient"]
      }]
    },
    {
      "name" : "medicalDevices",
      "source" : [{
        "context" : "section",
        "element" : "code",
        "variable" : "secCode",
        "condition" : "secCode.code = '46264-8'"
      }],
      "dependent" : [{
        "name" : "PatientSummaryMedicalDeviceSection",
        "variable" : ["section", "compSection", "bundle", "patient"]
      }]
    },
    {
      "name" : "addedDocuments",
      "source" : [{
        "context" : "section",
        "element" : "code",
        "variable" : "secCode",
        "condition" : "secCode.code = '55107-7'"
      }],
      "dependent" : [{
        "name" : "PatientSummaryAddedDocumentsSection",
        "variable" : ["section", "compSection", "bundle", "patient"]
      }]
    },
    {
      "name" : "advanceDirective",
      "source" : [{
        "context" : "section",
        "element" : "code",
        "variable" : "secCode",
        "condition" : "secCode.code = '42348-3'"
      }],
      "dependent" : [{
        "name" : "PatientSummaryAdvanceDirectiveSection",
        "variable" : ["section", "compSection", "bundle", "patient"]
      }]
    }]
  },
  {
    "name" : "PatientSummaryConditionSection",
    "typeMode" : "none",
    "documentation" : "1. PROBLÈMES ACTIFS ET ANTÉCÉDENTS MÉDICAUX\r\nSection CDA problèmes / antécédents -> Conditions FHIR",
    "input" : [{
      "name" : "section",
      "mode" : "source"
    },
    {
      "name" : "compSection",
      "mode" : "target"
    },
    {
      "name" : "bundle",
      "type" : "Bundle",
      "mode" : "target"
    },
    {
      "name" : "patient",
      "type" : "Patient",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "sectionEntry",
      "source" : [{
        "context" : "section",
        "element" : "entry",
        "variable" : "entry"
      }],
      "rule" : [{
        "name" : "problemConcernAct",
        "source" : [{
          "context" : "entry",
          "element" : "act",
          "variable" : "problemConcernAct"
        }],
        "rule" : [{
          "name" : "problemEntryRelationship",
          "source" : [{
            "context" : "problemConcernAct",
            "element" : "entryRelationship",
            "variable" : "er"
          }],
          "rule" : [{
            "name" : "conditionFromProblemObservation",
            "source" : [{
              "context" : "er",
              "element" : "observation",
              "variable" : "problemObservation"
            }],
            "target" : [{
              "context" : "bundle",
              "contextType" : "variable",
              "element" : "entry",
              "variable" : "conditionEntry"
            },
            {
              "context" : "conditionEntry",
              "contextType" : "variable",
              "element" : "resource",
              "variable" : "condition",
              "transform" : "create",
              "parameter" : [{
                "valueString" : "Condition"
              }]
            },
            {
              "context" : "condition",
              "contextType" : "variable",
              "element" : "id",
              "transform" : "uuid"
            },
            {
              "context" : "conditionEntry",
              "contextType" : "variable",
              "element" : "fullUrl",
              "transform" : "evaluate",
              "parameter" : [{
                "valueString" : "'urn:uuid:' + %condition.id"
              }]
            }],
            "dependent" : [{
              "name" : "PatientSummaryConditionFromProblemObservation",
              "variable" : ["problemObservation",
              "condition",
              "compSection",
              "patient",
              "bundle"]
            }]
          }]
        }]
      }]
    }]
  },
  {
    "name" : "PatientSummaryConditionFromProblemObservation",
    "typeMode" : "none",
    "documentation" : "Observation CDA de problème -> Condition FHIR",
    "input" : [{
      "name" : "observation",
      "mode" : "source"
    },
    {
      "name" : "condition",
      "type" : "Condition",
      "mode" : "target"
    },
    {
      "name" : "compSection",
      "mode" : "target"
    },
    {
      "name" : "patient",
      "type" : "Patient",
      "mode" : "target"
    },
    {
      "name" : "bundle",
      "type" : "Bundle",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "subject",
      "source" : [{
        "context" : "observation"
      }],
      "target" : [{
        "context" : "condition",
        "contextType" : "variable",
        "element" : "subject",
        "variable" : "subjectRef",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Reference"
        }]
      },
      {
        "context" : "subjectRef",
        "contextType" : "variable",
        "element" : "reference",
        "transform" : "evaluate",
        "parameter" : [{
          "valueString" : "'urn:uuid:' + %patient.id"
        }]
      }]
    },
    {
      "name" : "identifier",
      "source" : [{
        "context" : "observation",
        "element" : "id",
        "variable" : "problemId"
      }],
      "target" : [{
        "context" : "condition",
        "contextType" : "variable",
        "element" : "identifier",
        "variable" : "identifier",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Identifier"
        }]
      }],
      "dependent" : [{
        "name" : "II",
        "variable" : ["problemId", "identifier"]
      }]
    },
    {
      "name" : "category",
      "source" : [{
        "context" : "observation",
        "element" : "code",
        "variable" : "problemType"
      }],
      "target" : [{
        "context" : "condition",
        "contextType" : "variable",
        "element" : "category",
        "variable" : "category",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "rule" : [{
        "name" : "categoryCoding",
        "source" : [{
          "context" : "problemType"
        }],
        "dependent" : [{
          "name" : "CDCodeableConcept",
          "variable" : ["problemType", "category"]
        }]
      },
      {
        "name" : "text",
        "source" : [{
          "context" : "observation",
          "element" : "text",
          "variable" : "txt"
        }],
        "rule" : [{
          "name" : "reference",
          "source" : [{
            "context" : "txt",
            "element" : "reference",
            "variable" : "ref"
          }],
          "rule" : [{
            "name" : "categoryText",
            "source" : [{
              "context" : "ref",
              "element" : "value",
              "variable" : "value"
            }],
            "target" : [{
              "context" : "category",
              "contextType" : "variable",
              "element" : "text",
              "transform" : "cast",
              "parameter" : [{
                "valueId" : "value"
              },
              {
                "valueString" : "string"
              }]
            }]
          }]
        }]
      }]
    },
    {
      "name" : "code",
      "source" : [{
        "context" : "observation",
        "element" : "value",
        "variable" : "problemValue"
      }],
      "target" : [{
        "context" : "condition",
        "contextType" : "variable",
        "element" : "code",
        "variable" : "code",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "dependent" : [{
        "name" : "CDCodeableConcept",
        "variable" : ["problemValue", "code"]
      }]
    },
    {
      "name" : "effectiveTime",
      "source" : [{
        "context" : "observation",
        "element" : "effectiveTime",
        "variable" : "effectiveTime"
      }],
      "rule" : [{
        "name" : "onsetDateTime",
        "source" : [{
          "context" : "effectiveTime",
          "element" : "low",
          "variable" : "low"
        }],
        "target" : [{
          "context" : "condition",
          "contextType" : "variable",
          "element" : "onset",
          "variable" : "onsetDateTime",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "dateTime"
          }]
        }],
        "dependent" : [{
          "name" : "TSDateTime",
          "variable" : ["low", "onsetDateTime"]
        }]
      },
      {
        "name" : "abatementDateTime",
        "source" : [{
          "context" : "effectiveTime",
          "element" : "high",
          "variable" : "high"
        }],
        "target" : [{
          "context" : "condition",
          "contextType" : "variable",
          "element" : "abatement",
          "variable" : "abatementDateTime",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "dateTime"
          }]
        }],
        "dependent" : [{
          "name" : "TSDateTime",
          "variable" : ["high", "abatementDateTime"]
        }]
      }]
    },
    {
      "name" : "entryRelationships",
      "source" : [{
        "context" : "observation",
        "element" : "entryRelationship",
        "variable" : "er"
      }],
      "rule" : [{
        "name" : "severityBlock",
        "source" : [{
          "context" : "er",
          "element" : "observation",
          "variable" : "severityObs"
        }],
        "rule" : [{
          "name" : "severityTemplate",
          "source" : [{
            "context" : "severityObs",
            "element" : "templateId",
            "variable" : "tid"
          }],
          "rule" : [{
            "name" : "severity",
            "source" : [{
              "context" : "tid",
              "element" : "root",
              "variable" : "root",
              "condition" : "root = '1.2.250.1.213.1.1.3.29'"
            }],
            "rule" : [{
              "name" : "severity",
              "source" : [{
                "context" : "severityObs",
                "element" : "value",
                "variable" : "severityValue"
              }],
              "target" : [{
                "context" : "condition",
                "contextType" : "variable",
                "element" : "severity",
                "variable" : "severity",
                "transform" : "create",
                "parameter" : [{
                  "valueString" : "CodeableConcept"
                }]
              }],
              "dependent" : [{
                "name" : "CDCodeableConcept",
                "variable" : ["severityValue", "severity"]
              }]
            }]
          }]
        }]
      },
      {
        "name" : "clinicalStatusBlock",
        "source" : [{
          "context" : "er",
          "element" : "observation",
          "variable" : "problemStatusObs"
        }],
        "rule" : [{
          "name" : "clinicalStatusTemplate",
          "source" : [{
            "context" : "problemStatusObs",
            "element" : "templateId",
            "variable" : "tid"
          }],
          "rule" : [{
            "name" : "clinicalStatus",
            "source" : [{
              "context" : "tid",
              "element" : "root",
              "variable" : "root",
              "condition" : "root = '1.2.250.1.213.1.1.3.30'"
            }],
            "rule" : [{
              "name" : "clinicalStatus",
              "source" : [{
                "context" : "problemStatusObs",
                "element" : "value",
                "variable" : "statusValue"
              }],
              "target" : [{
                "context" : "condition",
                "contextType" : "variable",
                "element" : "clinicalStatus",
                "variable" : "clinicalStatus",
                "transform" : "create",
                "parameter" : [{
                  "valueString" : "CodeableConcept"
                }]
              }],
              "rule" : [{
                "name" : "clinicalStatusText",
                "source" : [{
                  "context" : "statusValue",
                  "element" : "displayName",
                  "variable" : "display"
                }],
                "target" : [{
                  "context" : "clinicalStatus",
                  "contextType" : "variable",
                  "element" : "text",
                  "transform" : "cast",
                  "parameter" : [{
                    "valueId" : "display"
                  },
                  {
                    "valueString" : "string"
                  }]
                }]
              },
              {
                "name" : "clinicalStatusCoding",
                "source" : [{
                  "context" : "statusValue",
                  "element" : "code",
                  "variable" : "code"
                }],
                "target" : [{
                  "context" : "clinicalStatus",
                  "contextType" : "variable",
                  "element" : "coding",
                  "variable" : "coding",
                  "transform" : "create",
                  "parameter" : [{
                    "valueString" : "Coding"
                  }]
                }],
                "rule" : [{
                  "name" : "clinicalStatusSystem",
                  "source" : [{
                    "context" : "statusValue"
                  }],
                  "target" : [{
                    "context" : "coding",
                    "contextType" : "variable",
                    "element" : "system",
                    "transform" : "copy",
                    "parameter" : [{
                      "valueString" : "http://terminology.hl7.org/CodeSystem/condition-clinical"
                    }]
                  }]
                },
                {
                  "name" : "clinicalStatusCode",
                  "source" : [{
                    "context" : "code"
                  }],
                  "target" : [{
                    "context" : "coding",
                    "contextType" : "variable",
                    "element" : "code",
                    "transform" : "cast",
                    "parameter" : [{
                      "valueId" : "code"
                    },
                    {
                      "valueString" : "code"
                    }]
                  }]
                },
                {
                  "name" : "clinicalStatusDisplayActive",
                  "source" : [{
                    "context" : "code",
                    "condition" : "code = 'active'"
                  }],
                  "target" : [{
                    "context" : "coding",
                    "contextType" : "variable",
                    "element" : "display",
                    "transform" : "copy",
                    "parameter" : [{
                      "valueString" : "Active"
                    }]
                  }]
                },
                {
                  "name" : "clinicalStatusDisplayRecurrence",
                  "source" : [{
                    "context" : "code",
                    "condition" : "code = 'recurrence'"
                  }],
                  "target" : [{
                    "context" : "coding",
                    "contextType" : "variable",
                    "element" : "display",
                    "transform" : "copy",
                    "parameter" : [{
                      "valueString" : "Recurrence"
                    }]
                  }]
                },
                {
                  "name" : "clinicalStatusDisplayRelapse",
                  "source" : [{
                    "context" : "code",
                    "condition" : "code = 'relapse'"
                  }],
                  "target" : [{
                    "context" : "coding",
                    "contextType" : "variable",
                    "element" : "display",
                    "transform" : "copy",
                    "parameter" : [{
                      "valueString" : "Relapse"
                    }]
                  }]
                },
                {
                  "name" : "clinicalStatusDisplayInactive",
                  "source" : [{
                    "context" : "code",
                    "condition" : "code = 'inactive'"
                  }],
                  "target" : [{
                    "context" : "coding",
                    "contextType" : "variable",
                    "element" : "display",
                    "transform" : "copy",
                    "parameter" : [{
                      "valueString" : "Inactive"
                    }]
                  }]
                },
                {
                  "name" : "clinicalStatusDisplayRemission",
                  "source" : [{
                    "context" : "code",
                    "condition" : "code = 'remission'"
                  }],
                  "target" : [{
                    "context" : "coding",
                    "contextType" : "variable",
                    "element" : "display",
                    "transform" : "copy",
                    "parameter" : [{
                      "valueString" : "Remission"
                    }]
                  }]
                },
                {
                  "name" : "clinicalStatusDisplayResolved",
                  "source" : [{
                    "context" : "code",
                    "condition" : "code = 'resolved'"
                  }],
                  "target" : [{
                    "context" : "coding",
                    "contextType" : "variable",
                    "element" : "display",
                    "transform" : "copy",
                    "parameter" : [{
                      "valueString" : "Resolved"
                    }]
                  }]
                }]
              }]
            }]
          }]
        }]
      },
      {
        "name" : "stageSummaryBlock",
        "source" : [{
          "context" : "er",
          "element" : "observation",
          "variable" : "healthStatusObs"
        }],
        "rule" : [{
          "name" : "stageSummaryTemplate",
          "source" : [{
            "context" : "healthStatusObs",
            "element" : "templateId",
            "variable" : "tid"
          }],
          "rule" : [{
            "name" : "stageSummary",
            "source" : [{
              "context" : "tid",
              "element" : "root",
              "variable" : "root",
              "condition" : "root = '1.2.250.1.213.1.1.3.31'"
            }],
            "rule" : [{
              "name" : "stage",
              "source" : [{
                "context" : "healthStatusObs",
                "element" : "value",
                "variable" : "healthStatusValue"
              }],
              "target" : [{
                "context" : "condition",
                "contextType" : "variable",
                "element" : "stage",
                "variable" : "stage"
              }],
              "rule" : [{
                "name" : "stageSummary",
                "source" : [{
                  "context" : "healthStatusValue"
                }],
                "target" : [{
                  "context" : "stage",
                  "contextType" : "variable",
                  "element" : "summary",
                  "variable" : "summary",
                  "transform" : "create",
                  "parameter" : [{
                    "valueString" : "CodeableConcept"
                  }]
                }],
                "dependent" : [{
                  "name" : "CDCodeableConcept",
                  "variable" : ["healthStatusValue", "summary"]
                }]
              }]
            }]
          }]
        }]
      },
      {
        "name" : "verificationStatusBlock",
        "source" : [{
          "context" : "er",
          "element" : "observation",
          "variable" : "certaintyObs"
        }],
        "rule" : [{
          "name" : "verificationStatusTemplate",
          "source" : [{
            "context" : "certaintyObs",
            "element" : "templateId",
            "variable" : "tid"
          }],
          "rule" : [{
            "name" : "verificationStatus",
            "source" : [{
              "context" : "tid",
              "element" : "root",
              "variable" : "root",
              "condition" : "root = '1.2.250.1.213.1.1.3.171'"
            }],
            "rule" : [{
              "name" : "verificationStatus",
              "source" : [{
                "context" : "certaintyObs",
                "element" : "value",
                "variable" : "certaintyValue"
              }],
              "target" : [{
                "context" : "condition",
                "contextType" : "variable",
                "element" : "verificationStatus",
                "variable" : "verificationStatus",
                "transform" : "create",
                "parameter" : [{
                  "valueString" : "CodeableConcept"
                }]
              }],
              "rule" : [{
                "name" : "verificationStatusText",
                "source" : [{
                  "context" : "certaintyValue",
                  "element" : "displayName",
                  "variable" : "display"
                }],
                "target" : [{
                  "context" : "verificationStatus",
                  "contextType" : "variable",
                  "element" : "text",
                  "transform" : "cast",
                  "parameter" : [{
                    "valueId" : "display"
                  },
                  {
                    "valueString" : "string"
                  }]
                }]
              },
              {
                "name" : "verificationStatusCoding",
                "source" : [{
                  "context" : "certaintyValue",
                  "element" : "code",
                  "variable" : "code"
                }],
                "target" : [{
                  "context" : "verificationStatus",
                  "contextType" : "variable",
                  "element" : "coding",
                  "variable" : "coding",
                  "transform" : "create",
                  "parameter" : [{
                    "valueString" : "Coding"
                  }]
                }],
                "rule" : [{
                  "name" : "verificationStatusSystem",
                  "source" : [{
                    "context" : "certaintyValue"
                  }],
                  "target" : [{
                    "context" : "coding",
                    "contextType" : "variable",
                    "element" : "system",
                    "transform" : "copy",
                    "parameter" : [{
                      "valueString" : "http://terminology.hl7.org/CodeSystem/condition-ver-status"
                    }]
                  }]
                },
                {
                  "name" : "verificationStatusCode",
                  "source" : [{
                    "context" : "code"
                  }],
                  "target" : [{
                    "context" : "coding",
                    "contextType" : "variable",
                    "element" : "code",
                    "transform" : "cast",
                    "parameter" : [{
                      "valueId" : "code"
                    },
                    {
                      "valueString" : "code"
                    }]
                  }]
                },
                {
                  "name" : "verificationStatusDisplayUnconfirmed",
                  "source" : [{
                    "context" : "code",
                    "condition" : "code = 'unconfirmed'"
                  }],
                  "target" : [{
                    "context" : "coding",
                    "contextType" : "variable",
                    "element" : "display",
                    "transform" : "copy",
                    "parameter" : [{
                      "valueString" : "Unconfirmed"
                    }]
                  }]
                },
                {
                  "name" : "verificationStatusDisplayProvisional",
                  "source" : [{
                    "context" : "code",
                    "condition" : "code = 'provisional'"
                  }],
                  "target" : [{
                    "context" : "coding",
                    "contextType" : "variable",
                    "element" : "display",
                    "transform" : "copy",
                    "parameter" : [{
                      "valueString" : "Provisional"
                    }]
                  }]
                },
                {
                  "name" : "verificationStatusDisplayDifferential",
                  "source" : [{
                    "context" : "code",
                    "condition" : "code = 'differential'"
                  }],
                  "target" : [{
                    "context" : "coding",
                    "contextType" : "variable",
                    "element" : "display",
                    "transform" : "copy",
                    "parameter" : [{
                      "valueString" : "Differential"
                    }]
                  }]
                },
                {
                  "name" : "verificationStatusDisplayConfirmed",
                  "source" : [{
                    "context" : "code",
                    "condition" : "code = 'confirmed'"
                  }],
                  "target" : [{
                    "context" : "coding",
                    "contextType" : "variable",
                    "element" : "display",
                    "transform" : "copy",
                    "parameter" : [{
                      "valueString" : "Confirmed"
                    }]
                  }]
                },
                {
                  "name" : "verificationStatusDisplayRefuted",
                  "source" : [{
                    "context" : "code",
                    "condition" : "code = 'refuted'"
                  }],
                  "target" : [{
                    "context" : "coding",
                    "contextType" : "variable",
                    "element" : "display",
                    "transform" : "copy",
                    "parameter" : [{
                      "valueString" : "Refuted"
                    }]
                  }]
                },
                {
                  "name" : "verificationStatusDisplayEnteredInError",
                  "source" : [{
                    "context" : "code",
                    "condition" : "code = 'entered-in-error'"
                  }],
                  "target" : [{
                    "context" : "coding",
                    "contextType" : "variable",
                    "element" : "display",
                    "transform" : "copy",
                    "parameter" : [{
                      "valueString" : "Entered in Error"
                    }]
                  }]
                }]
              }]
            }]
          }]
        }]
      }]
    },
    {
      "name" : "externalReference",
      "source" : [{
        "context" : "observation",
        "element" : "reference",
        "variable" : "cdaReference"
      }],
      "rule" : [{
        "name" : "externalDocumentReference",
        "source" : [{
          "context" : "cdaReference",
          "element" : "externalDocument",
          "variable" : "externalDocument"
        }],
        "target" : [{
          "context" : "bundle",
          "contextType" : "variable",
          "element" : "entry",
          "variable" : "documentReferenceEntry"
        },
        {
          "context" : "documentReferenceEntry",
          "contextType" : "variable",
          "element" : "resource",
          "variable" : "documentReference",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "DocumentReference"
          }]
        },
        {
          "context" : "documentReference",
          "contextType" : "variable",
          "element" : "id",
          "transform" : "uuid"
        },
        {
          "context" : "documentReferenceEntry",
          "contextType" : "variable",
          "element" : "fullUrl",
          "transform" : "evaluate",
          "parameter" : [{
            "valueString" : "'urn:uuid:' + %documentReference.id"
          }]
        }],
        "rule" : [{
          "name" : "documentReferenceStatus",
          "source" : [{
            "context" : "externalDocument"
          }],
          "target" : [{
            "context" : "documentReference",
            "contextType" : "variable",
            "element" : "status",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "current"
            }]
          }]
        },
        {
          "name" : "documentReferenceSubject",
          "source" : [{
            "context" : "externalDocument"
          }],
          "target" : [{
            "context" : "documentReference",
            "contextType" : "variable",
            "element" : "subject",
            "variable" : "subjectRef",
            "transform" : "create",
            "parameter" : [{
              "valueString" : "Reference"
            }]
          },
          {
            "context" : "subjectRef",
            "contextType" : "variable",
            "element" : "reference",
            "transform" : "evaluate",
            "parameter" : [{
              "valueString" : "'urn:uuid:' + %patient.id"
            }]
          }]
        },
        {
          "name" : "documentReferenceIdentifier",
          "source" : [{
            "context" : "externalDocument",
            "element" : "id",
            "variable" : "externalId"
          }],
          "target" : [{
            "context" : "documentReference",
            "contextType" : "variable",
            "element" : "identifier",
            "variable" : "identifier",
            "transform" : "create",
            "parameter" : [{
              "valueString" : "Identifier"
            }]
          }],
          "dependent" : [{
            "name" : "II",
            "variable" : ["externalId", "identifier"]
          }]
        },
        {
          "name" : "externalText",
          "source" : [{
            "context" : "externalDocument",
            "element" : "text",
            "variable" : "externalText"
          }],
          "rule" : [{
            "name" : "externalTextReference",
            "source" : [{
              "context" : "externalText",
              "element" : "reference",
              "variable" : "externalRef"
            }],
            "rule" : [{
              "name" : "content",
              "source" : [{
                "context" : "externalRef",
                "element" : "value",
                "variable" : "url"
              }],
              "target" : [{
                "context" : "documentReference",
                "contextType" : "variable",
                "element" : "content",
                "variable" : "content"
              }],
              "rule" : [{
                "name" : "attachment",
                "source" : [{
                  "context" : "url"
                }],
                "target" : [{
                  "context" : "content",
                  "contextType" : "variable",
                  "element" : "attachment",
                  "variable" : "attachment",
                  "transform" : "create",
                  "parameter" : [{
                    "valueString" : "Attachment"
                  }]
                }],
                "rule" : [{
                  "name" : "attachmentUrl",
                  "source" : [{
                    "context" : "url"
                  }],
                  "target" : [{
                    "context" : "attachment",
                    "contextType" : "variable",
                    "element" : "url",
                    "transform" : "cast",
                    "parameter" : [{
                      "valueId" : "url"
                    },
                    {
                      "valueString" : "string"
                    }]
                  }]
                }]
              }]
            }]
          }]
        },
        {
          "name" : "evidence",
          "source" : [{
            "context" : "externalDocument"
          }],
          "target" : [{
            "context" : "condition",
            "contextType" : "variable",
            "element" : "evidence",
            "variable" : "evidence"
          }],
          "rule" : [{
            "name" : "evidenceDetail",
            "source" : [{
              "context" : "externalDocument"
            }],
            "target" : [{
              "context" : "evidence",
              "contextType" : "variable",
              "element" : "detail",
              "variable" : "detailRef",
              "transform" : "create",
              "parameter" : [{
                "valueString" : "Reference"
              }]
            },
            {
              "context" : "detailRef",
              "contextType" : "variable",
              "element" : "reference",
              "transform" : "evaluate",
              "parameter" : [{
                "valueString" : "'urn:uuid:' + %documentReference.id"
              }]
            }]
          }]
        }]
      }]
    },
    {
      "name" : "sectionEntry",
      "source" : [{
        "context" : "observation"
      }],
      "target" : [{
        "context" : "compSection",
        "contextType" : "variable",
        "element" : "entry",
        "variable" : "sectionRef",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Reference"
        }]
      },
      {
        "context" : "sectionRef",
        "contextType" : "variable",
        "element" : "reference",
        "transform" : "evaluate",
        "parameter" : [{
          "valueString" : "'urn:uuid:' + %condition.id"
        }]
      }]
    }]
  },
  {
    "name" : "PatientSummaryAllergySection",
    "typeMode" : "none",
    "documentation" : "2. ALLERGIES / HYPERSENSIBILITÉS\r\nSection CDA allergies / hypersensibilités -> AllergyIntolerance",
    "input" : [{
      "name" : "section",
      "mode" : "source"
    },
    {
      "name" : "compSection",
      "mode" : "target"
    },
    {
      "name" : "bundle",
      "type" : "Bundle",
      "mode" : "target"
    },
    {
      "name" : "patient",
      "type" : "Patient",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "sectionTemplate",
      "source" : [{
        "context" : "section",
        "element" : "templateId",
        "variable" : "sectionTid"
      }],
      "rule" : [{
        "name" : "frAllergySection",
        "source" : [{
          "context" : "sectionTid",
          "element" : "root",
          "variable" : "sectionRoot",
          "condition" : "sectionRoot = '1.2.250.1.213.1.1.2.137'"
        }],
        "rule" : [{
          "name" : "sectionEntry",
          "source" : [{
            "context" : "section",
            "element" : "entry",
            "variable" : "entry"
          }],
          "rule" : [{
            "name" : "allergyConcernAct",
            "source" : [{
              "context" : "entry",
              "element" : "act",
              "variable" : "allergyConcernAct"
            }],
            "rule" : [{
              "name" : "allergyConcernActTemplate",
              "source" : [{
                "context" : "allergyConcernAct",
                "element" : "templateId",
                "variable" : "actTid"
              }],
              "rule" : [{
                "name" : "frAllergyConcernAct",
                "source" : [{
                  "context" : "actTid",
                  "element" : "root",
                  "variable" : "actRoot",
                  "condition" : "actRoot = '1.2.250.1.213.1.1.3.40'"
                }],
                "rule" : [{
                  "name" : "allergyEntryRelationship",
                  "source" : [{
                    "context" : "allergyConcernAct",
                    "element" : "entryRelationship",
                    "variable" : "er"
                  }],
                  "rule" : [{
                    "name" : "allergyObservation",
                    "source" : [{
                      "context" : "er",
                      "element" : "observation",
                      "variable" : "allergyObservation"
                    }],
                    "rule" : [{
                      "name" : "allergyObservationTemplate",
                      "source" : [{
                        "context" : "allergyObservation",
                        "element" : "templateId",
                        "variable" : "obsTid"
                      }],
                      "rule" : [{
                        "name" : "allergyFromCdaObservation",
                        "source" : [{
                          "context" : "obsTid",
                          "element" : "root",
                          "variable" : "obsRoot",
                          "condition" : "obsRoot = '1.2.250.1.213.1.1.3.41'"
                        }],
                        "target" : [{
                          "context" : "bundle",
                          "contextType" : "variable",
                          "element" : "entry",
                          "variable" : "allergyEntry"
                        },
                        {
                          "context" : "allergyEntry",
                          "contextType" : "variable",
                          "element" : "resource",
                          "variable" : "allergy",
                          "transform" : "create",
                          "parameter" : [{
                            "valueString" : "AllergyIntolerance"
                          }]
                        },
                        {
                          "context" : "allergy",
                          "contextType" : "variable",
                          "element" : "id",
                          "transform" : "uuid"
                        },
                        {
                          "context" : "allergyEntry",
                          "contextType" : "variable",
                          "element" : "fullUrl",
                          "transform" : "evaluate",
                          "parameter" : [{
                            "valueString" : "'urn:uuid:' + %allergy.id"
                          }]
                        }],
                        "dependent" : [{
                          "name" : "AllergyFromCdaObservation",
                          "variable" : ["allergyObservation", "allergy", "compSection", "patient"]
                        }]
                      }]
                    }]
                  }]
                }]
              }]
            }]
          }]
        }]
      }]
    }]
  },
  {
    "name" : "AllergyFromCdaObservation",
    "typeMode" : "none",
    "documentation" : "Observation CDA d’allergie -> AllergyIntolerance",
    "input" : [{
      "name" : "observation",
      "mode" : "source"
    },
    {
      "name" : "allergy",
      "type" : "AllergyIntolerance",
      "mode" : "target"
    },
    {
      "name" : "compSection",
      "mode" : "target"
    },
    {
      "name" : "patient",
      "type" : "Patient",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "identifier",
      "source" : [{
        "context" : "observation",
        "element" : "id",
        "variable" : "allergyId"
      }],
      "target" : [{
        "context" : "allergy",
        "contextType" : "variable",
        "element" : "identifier",
        "variable" : "identifier",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Identifier"
        }]
      }],
      "dependent" : [{
        "name" : "II",
        "variable" : ["allergyId", "identifier"]
      }]
    },
    {
      "name" : "patient",
      "source" : [{
        "context" : "observation"
      }],
      "target" : [{
        "context" : "allergy",
        "contextType" : "variable",
        "element" : "patient",
        "variable" : "patientRef",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Reference"
        }]
      },
      {
        "context" : "patientRef",
        "contextType" : "variable",
        "element" : "reference",
        "transform" : "evaluate",
        "parameter" : [{
          "valueString" : "'urn:uuid:' + %patient.id"
        }]
      }]
    },
    {
      "name" : "participant",
      "source" : [{
        "context" : "observation",
        "element" : "participant",
        "variable" : "participant"
      }],
      "rule" : [{
        "name" : "participantRole",
        "source" : [{
          "context" : "participant",
          "element" : "participantRole",
          "variable" : "participantRole"
        }],
        "rule" : [{
          "name" : "playingEntity",
          "source" : [{
            "context" : "participantRole",
            "element" : "playingEntity",
            "variable" : "playingEntity"
          }],
          "rule" : [{
            "name" : "allergenCode",
            "source" : [{
              "context" : "playingEntity",
              "element" : "code",
              "variable" : "allergenCode"
            }],
            "target" : [{
              "context" : "allergy",
              "contextType" : "variable",
              "element" : "code",
              "variable" : "code",
              "transform" : "create",
              "parameter" : [{
                "valueString" : "CodeableConcept"
              }]
            }],
            "dependent" : [{
              "name" : "CDCodeableConcept",
              "variable" : ["allergenCode", "code"]
            }]
          }]
        }]
      }]
    },
    {
      "name" : "typeAndCategory",
      "source" : [{
        "context" : "observation",
        "element" : "code",
        "variable" : "allergyTypeCode"
      }],
      "rule" : [{
        "name" : "medicationAllergyByCode",
        "source" : [{
          "context" : "allergyTypeCode",
          "element" : "code",
          "variable" : "code",
          "condition" : "code = '416098002'"
        }],
        "target" : [{
          "context" : "allergy",
          "contextType" : "variable",
          "element" : "type",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "allergy"
          }]
        },
        {
          "context" : "allergy",
          "contextType" : "variable",
          "element" : "category",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "medication"
          }]
        }]
      },
      {
        "name" : "typeIntolerance",
        "source" : [{
          "context" : "allergyTypeCode",
          "element" : "displayName",
          "variable" : "display",
          "condition" : "display.lower().contains('intolérance') or display.lower().contains('intolerance')"
        }],
        "target" : [{
          "context" : "allergy",
          "contextType" : "variable",
          "element" : "type",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "intolerance"
          }]
        }]
      },
      {
        "name" : "typeAllergy",
        "source" : [{
          "context" : "allergyTypeCode",
          "element" : "displayName",
          "variable" : "display",
          "condition" : "(allergyTypeCode.code != '416098002') and (display.lower().contains('allergie') or display.lower().contains('hypersensibilité') or display.lower().contains('hypersensibilite')) and display.lower().contains('intolérance').not() and display.lower().contains('intolerance').not()"
        }],
        "target" : [{
          "context" : "allergy",
          "contextType" : "variable",
          "element" : "type",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "allergy"
          }]
        }]
      },
      {
        "name" : "categoryMedicationByDisplay",
        "source" : [{
          "context" : "allergyTypeCode",
          "element" : "displayName",
          "variable" : "display",
          "condition" : "(allergyTypeCode.code != '416098002') and (display.lower().contains('médicament') or display.lower().contains('medicament') or display.lower().contains('médicamenteuse') or display.lower().contains('medicamenteuse'))"
        }],
        "target" : [{
          "context" : "allergy",
          "contextType" : "variable",
          "element" : "category",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "medication"
          }]
        }]
      },
      {
        "name" : "categoryFood",
        "source" : [{
          "context" : "allergyTypeCode",
          "element" : "displayName",
          "variable" : "display",
          "condition" : "display.lower().contains('alimentaire') or display.lower().contains('aliment') or display.lower().contains('nourriture')"
        }],
        "target" : [{
          "context" : "allergy",
          "contextType" : "variable",
          "element" : "category",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "food"
          }]
        }]
      },
      {
        "name" : "categoryEnvironment",
        "source" : [{
          "context" : "allergyTypeCode",
          "element" : "displayName",
          "variable" : "display",
          "condition" : "display.lower().contains('environnement') or display.lower().contains('pollen') or display.lower().contains('poussière') or display.lower().contains('poussiere') or display.lower().contains('latex')"
        }],
        "target" : [{
          "context" : "allergy",
          "contextType" : "variable",
          "element" : "category",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "environment"
          }]
        }]
      },
      {
        "name" : "categoryBiologic",
        "source" : [{
          "context" : "allergyTypeCode",
          "element" : "displayName",
          "variable" : "display",
          "condition" : "display.lower().contains('biologique') or display.lower().contains('vaccin') or display.lower().contains('sérum') or display.lower().contains('serum')"
        }],
        "target" : [{
          "context" : "allergy",
          "contextType" : "variable",
          "element" : "category",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "biologic"
          }]
        }]
      }]
    },
    {
      "name" : "effectiveTime",
      "source" : [{
        "context" : "observation",
        "element" : "effectiveTime",
        "variable" : "effectiveTime"
      }],
      "rule" : [{
        "name" : "onsetDateTime",
        "source" : [{
          "context" : "effectiveTime",
          "element" : "low",
          "variable" : "low"
        }],
        "target" : [{
          "context" : "allergy",
          "contextType" : "variable",
          "element" : "onset",
          "variable" : "onsetDateTime",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "dateTime"
          }]
        }],
        "dependent" : [{
          "name" : "TSDateTime",
          "variable" : ["low", "onsetDateTime"]
        }]
      }]
    },
    {
      "name" : "entryRelationships",
      "source" : [{
        "context" : "observation",
        "element" : "entryRelationship",
        "variable" : "er"
      }],
      "rule" : [{
        "name" : "statusBlock",
        "source" : [{
          "context" : "er",
          "element" : "observation",
          "variable" : "statusObs"
        }],
        "rule" : [{
          "name" : "statusTemplate",
          "source" : [{
            "context" : "statusObs",
            "element" : "templateId",
            "variable" : "tid"
          }],
          "rule" : [{
            "name" : "clinicalStatusBlock",
            "source" : [{
              "context" : "tid",
              "element" : "root",
              "variable" : "root",
              "condition" : "root = '1.2.250.1.213.1.1.3.30'"
            }],
            "rule" : [{
              "name" : "clinicalStatus",
              "source" : [{
                "context" : "statusObs",
                "element" : "value",
                "variable" : "statusValue"
              }],
              "target" : [{
                "context" : "allergy",
                "contextType" : "variable",
                "element" : "clinicalStatus",
                "variable" : "clinicalStatus",
                "transform" : "create",
                "parameter" : [{
                  "valueString" : "CodeableConcept"
                }]
              }],
              "rule" : [{
                "name" : "originalText",
                "source" : [{
                  "context" : "statusValue",
                  "element" : "originalText",
                  "variable" : "originalText"
                }],
                "rule" : [{
                  "name" : "reference",
                  "source" : [{
                    "context" : "originalText",
                    "element" : "reference",
                    "variable" : "ref"
                  }],
                  "rule" : [{
                    "name" : "textFromOriginalTextReference",
                    "source" : [{
                      "context" : "ref",
                      "element" : "value",
                      "variable" : "value"
                    }],
                    "target" : [{
                      "context" : "clinicalStatus",
                      "contextType" : "variable",
                      "element" : "text",
                      "transform" : "cast",
                      "parameter" : [{
                        "valueId" : "value"
                      },
                      {
                        "valueString" : "string"
                      }]
                    }]
                  }]
                },
                {
                  "name" : "textFromOriginalText",
                  "source" : [{
                    "context" : "originalText",
                    "element" : "xmlText",
                    "variable" : "txt",
                    "condition" : "originalText.reference.empty()"
                  }],
                  "target" : [{
                    "context" : "clinicalStatus",
                    "contextType" : "variable",
                    "element" : "text",
                    "transform" : "cast",
                    "parameter" : [{
                      "valueId" : "txt"
                    },
                    {
                      "valueString" : "string"
                    }]
                  }]
                }]
              },
              {
                "name" : "textFromDisplayName",
                "source" : [{
                  "context" : "statusValue",
                  "element" : "displayName",
                  "variable" : "display",
                  "condition" : "statusValue.originalText.empty()"
                }],
                "target" : [{
                  "context" : "clinicalStatus",
                  "contextType" : "variable",
                  "element" : "text",
                  "transform" : "cast",
                  "parameter" : [{
                    "valueId" : "display"
                  },
                  {
                    "valueString" : "string"
                  }]
                }]
              },
              {
                "name" : "activeFromCode",
                "source" : [{
                  "context" : "statusValue",
                  "element" : "code",
                  "variable" : "code",
                  "condition" : "(code = 'active') or (code = 'actif')"
                }],
                "target" : [{
                  "context" : "clinicalStatus",
                  "contextType" : "variable",
                  "element" : "coding",
                  "variable" : "coding",
                  "transform" : "create",
                  "parameter" : [{
                    "valueString" : "Coding"
                  }]
                }],
                "rule" : [{
                  "name" : "system",
                  "source" : [{
                    "context" : "statusValue"
                  }],
                  "target" : [{
                    "context" : "coding",
                    "contextType" : "variable",
                    "element" : "system",
                    "transform" : "copy",
                    "parameter" : [{
                      "valueString" : "http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical"
                    }]
                  }]
                },
                {
                  "name" : "code",
                  "source" : [{
                    "context" : "statusValue"
                  }],
                  "target" : [{
                    "context" : "coding",
                    "contextType" : "variable",
                    "element" : "code",
                    "transform" : "copy",
                    "parameter" : [{
                      "valueString" : "active"
                    }]
                  }]
                },
                {
                  "name" : "display",
                  "source" : [{
                    "context" : "statusValue"
                  }],
                  "target" : [{
                    "context" : "coding",
                    "contextType" : "variable",
                    "element" : "display",
                    "transform" : "copy",
                    "parameter" : [{
                      "valueString" : "Active"
                    }]
                  }]
                }]
              },
              {
                "name" : "inactiveFromCode",
                "source" : [{
                  "context" : "statusValue",
                  "element" : "code",
                  "variable" : "code",
                  "condition" : "(code = 'inactive') or (code = 'inactif')"
                }],
                "target" : [{
                  "context" : "clinicalStatus",
                  "contextType" : "variable",
                  "element" : "coding",
                  "variable" : "coding",
                  "transform" : "create",
                  "parameter" : [{
                    "valueString" : "Coding"
                  }]
                }],
                "rule" : [{
                  "name" : "system",
                  "source" : [{
                    "context" : "statusValue"
                  }],
                  "target" : [{
                    "context" : "coding",
                    "contextType" : "variable",
                    "element" : "system",
                    "transform" : "copy",
                    "parameter" : [{
                      "valueString" : "http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical"
                    }]
                  }]
                },
                {
                  "name" : "code",
                  "source" : [{
                    "context" : "statusValue"
                  }],
                  "target" : [{
                    "context" : "coding",
                    "contextType" : "variable",
                    "element" : "code",
                    "transform" : "copy",
                    "parameter" : [{
                      "valueString" : "inactive"
                    }]
                  }]
                },
                {
                  "name" : "display",
                  "source" : [{
                    "context" : "statusValue"
                  }],
                  "target" : [{
                    "context" : "coding",
                    "contextType" : "variable",
                    "element" : "display",
                    "transform" : "copy",
                    "parameter" : [{
                      "valueString" : "Inactive"
                    }]
                  }]
                }]
              },
              {
                "name" : "resolvedFromCode",
                "source" : [{
                  "context" : "statusValue",
                  "element" : "code",
                  "variable" : "code",
                  "condition" : "(code = 'resolved') or (code = 'resolu') or (code = 'résolu')"
                }],
                "target" : [{
                  "context" : "clinicalStatus",
                  "contextType" : "variable",
                  "element" : "coding",
                  "variable" : "coding",
                  "transform" : "create",
                  "parameter" : [{
                    "valueString" : "Coding"
                  }]
                }],
                "rule" : [{
                  "name" : "system",
                  "source" : [{
                    "context" : "statusValue"
                  }],
                  "target" : [{
                    "context" : "coding",
                    "contextType" : "variable",
                    "element" : "system",
                    "transform" : "copy",
                    "parameter" : [{
                      "valueString" : "http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical"
                    }]
                  }]
                },
                {
                  "name" : "code",
                  "source" : [{
                    "context" : "statusValue"
                  }],
                  "target" : [{
                    "context" : "coding",
                    "contextType" : "variable",
                    "element" : "code",
                    "transform" : "copy",
                    "parameter" : [{
                      "valueString" : "resolved"
                    }]
                  }]
                },
                {
                  "name" : "display",
                  "source" : [{
                    "context" : "statusValue"
                  }],
                  "target" : [{
                    "context" : "coding",
                    "contextType" : "variable",
                    "element" : "display",
                    "transform" : "copy",
                    "parameter" : [{
                      "valueString" : "Resolved"
                    }]
                  }]
                }]
              },
              {
                "name" : "activeFromText",
                "source" : [{
                  "context" : "statusValue",
                  "element" : "displayName",
                  "variable" : "display",
                  "condition" : "statusValue.code.empty() and display.lower().contains('actif') and display.lower().contains('inactif').not()"
                }],
                "target" : [{
                  "context" : "clinicalStatus",
                  "contextType" : "variable",
                  "element" : "coding",
                  "variable" : "coding",
                  "transform" : "create",
                  "parameter" : [{
                    "valueString" : "Coding"
                  }]
                }],
                "rule" : [{
                  "name" : "system",
                  "source" : [{
                    "context" : "statusValue"
                  }],
                  "target" : [{
                    "context" : "coding",
                    "contextType" : "variable",
                    "element" : "system",
                    "transform" : "copy",
                    "parameter" : [{
                      "valueString" : "http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical"
                    }]
                  }]
                },
                {
                  "name" : "code",
                  "source" : [{
                    "context" : "statusValue"
                  }],
                  "target" : [{
                    "context" : "coding",
                    "contextType" : "variable",
                    "element" : "code",
                    "transform" : "copy",
                    "parameter" : [{
                      "valueString" : "active"
                    }]
                  }]
                },
                {
                  "name" : "display",
                  "source" : [{
                    "context" : "statusValue"
                  }],
                  "target" : [{
                    "context" : "coding",
                    "contextType" : "variable",
                    "element" : "display",
                    "transform" : "copy",
                    "parameter" : [{
                      "valueString" : "Active"
                    }]
                  }]
                }]
              },
              {
                "name" : "inactiveFromText",
                "source" : [{
                  "context" : "statusValue",
                  "element" : "displayName",
                  "variable" : "display",
                  "condition" : "statusValue.code.empty() and display.lower().contains('inactif')"
                }],
                "target" : [{
                  "context" : "clinicalStatus",
                  "contextType" : "variable",
                  "element" : "coding",
                  "variable" : "coding",
                  "transform" : "create",
                  "parameter" : [{
                    "valueString" : "Coding"
                  }]
                }],
                "rule" : [{
                  "name" : "system",
                  "source" : [{
                    "context" : "statusValue"
                  }],
                  "target" : [{
                    "context" : "coding",
                    "contextType" : "variable",
                    "element" : "system",
                    "transform" : "copy",
                    "parameter" : [{
                      "valueString" : "http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical"
                    }]
                  }]
                },
                {
                  "name" : "code",
                  "source" : [{
                    "context" : "statusValue"
                  }],
                  "target" : [{
                    "context" : "coding",
                    "contextType" : "variable",
                    "element" : "code",
                    "transform" : "copy",
                    "parameter" : [{
                      "valueString" : "inactive"
                    }]
                  }]
                },
                {
                  "name" : "display",
                  "source" : [{
                    "context" : "statusValue"
                  }],
                  "target" : [{
                    "context" : "coding",
                    "contextType" : "variable",
                    "element" : "display",
                    "transform" : "copy",
                    "parameter" : [{
                      "valueString" : "Inactive"
                    }]
                  }]
                }]
              },
              {
                "name" : "resolvedFromText",
                "source" : [{
                  "context" : "statusValue",
                  "element" : "displayName",
                  "variable" : "display",
                  "condition" : "statusValue.code.empty() and (display.lower().contains('résolu') or display.lower().contains('resolu'))"
                }],
                "target" : [{
                  "context" : "clinicalStatus",
                  "contextType" : "variable",
                  "element" : "coding",
                  "variable" : "coding",
                  "transform" : "create",
                  "parameter" : [{
                    "valueString" : "Coding"
                  }]
                }],
                "rule" : [{
                  "name" : "system",
                  "source" : [{
                    "context" : "statusValue"
                  }],
                  "target" : [{
                    "context" : "coding",
                    "contextType" : "variable",
                    "element" : "system",
                    "transform" : "copy",
                    "parameter" : [{
                      "valueString" : "http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical"
                    }]
                  }]
                },
                {
                  "name" : "code",
                  "source" : [{
                    "context" : "statusValue"
                  }],
                  "target" : [{
                    "context" : "coding",
                    "contextType" : "variable",
                    "element" : "code",
                    "transform" : "copy",
                    "parameter" : [{
                      "valueString" : "resolved"
                    }]
                  }]
                },
                {
                  "name" : "display",
                  "source" : [{
                    "context" : "statusValue"
                  }],
                  "target" : [{
                    "context" : "coding",
                    "contextType" : "variable",
                    "element" : "display",
                    "transform" : "copy",
                    "parameter" : [{
                      "valueString" : "Resolved"
                    }]
                  }]
                }]
              },
              {
                "name" : "clinicalStatusAbsentReason",
                "source" : [{
                  "context" : "statusValue",
                  "condition" : "statusValue.code.empty() and statusValue.displayName.empty() and statusValue.originalText.empty()"
                }],
                "target" : [{
                  "context" : "clinicalStatus",
                  "contextType" : "variable",
                  "element" : "extension",
                  "variable" : "absentReason",
                  "transform" : "create",
                  "parameter" : [{
                    "valueString" : "Extension"
                  }]
                }],
                "rule" : [{
                  "name" : "url",
                  "source" : [{
                    "context" : "statusValue"
                  }],
                  "target" : [{
                    "context" : "absentReason",
                    "contextType" : "variable",
                    "element" : "url",
                    "transform" : "copy",
                    "parameter" : [{
                      "valueString" : "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
                    }]
                  }]
                },
                {
                  "name" : "valueCode",
                  "source" : [{
                    "context" : "statusValue"
                  }],
                  "target" : [{
                    "context" : "absentReason",
                    "contextType" : "variable",
                    "element" : "value",
                    "transform" : "cast",
                    "parameter" : [{
                      "valueString" : "unknown"
                    },
                    {
                      "valueString" : "code"
                    }]
                  }]
                }]
              }]
            }]
          }]
        }]
      },
      {
        "name" : "statusNoValueBlock",
        "source" : [{
          "context" : "er",
          "element" : "observation",
          "variable" : "statusObs"
        }],
        "rule" : [{
          "name" : "statusNoValueTemplate",
          "source" : [{
            "context" : "statusObs",
            "element" : "templateId",
            "variable" : "tid"
          }],
          "rule" : [{
            "name" : "clinicalStatusNoValueBlock",
            "source" : [{
              "context" : "tid",
              "element" : "root",
              "variable" : "root",
              "condition" : "root = '1.2.250.1.213.1.1.3.30'"
            }],
            "rule" : [{
              "name" : "clinicalStatusNoValue",
              "source" : [{
                "context" : "statusObs",
                "condition" : "statusObs.value.empty()"
              }],
              "target" : [{
                "context" : "allergy",
                "contextType" : "variable",
                "element" : "clinicalStatus",
                "variable" : "clinicalStatus",
                "transform" : "create",
                "parameter" : [{
                  "valueString" : "CodeableConcept"
                }]
              }],
              "rule" : [{
                "name" : "dataAbsentReason",
                "source" : [{
                  "context" : "statusObs"
                }],
                "target" : [{
                  "context" : "clinicalStatus",
                  "contextType" : "variable",
                  "element" : "extension",
                  "variable" : "absentReason",
                  "transform" : "create",
                  "parameter" : [{
                    "valueString" : "Extension"
                  }]
                }],
                "rule" : [{
                  "name" : "url",
                  "source" : [{
                    "context" : "statusObs"
                  }],
                  "target" : [{
                    "context" : "absentReason",
                    "contextType" : "variable",
                    "element" : "url",
                    "transform" : "copy",
                    "parameter" : [{
                      "valueString" : "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
                    }]
                  }]
                },
                {
                  "name" : "valueCode",
                  "source" : [{
                    "context" : "statusObs"
                  }],
                  "target" : [{
                    "context" : "absentReason",
                    "contextType" : "variable",
                    "element" : "value",
                    "transform" : "cast",
                    "parameter" : [{
                      "valueString" : "unknown"
                    },
                    {
                      "valueString" : "code"
                    }]
                  }]
                }]
              }]
            }]
          }]
        }]
      },
      {
        "name" : "criticalityBlock",
        "source" : [{
          "context" : "er",
          "element" : "observation",
          "variable" : "criticalityObs"
        }],
        "rule" : [{
          "name" : "criticalityTemplate",
          "source" : [{
            "context" : "criticalityObs",
            "element" : "templateId",
            "variable" : "tid"
          }],
          "rule" : [{
            "name" : "criticality",
            "source" : [{
              "context" : "tid",
              "element" : "root",
              "variable" : "root",
              "condition" : "root = '1.2.250.1.213.1.1.3.172'"
            }],
            "rule" : [{
              "name" : "criticalityValue",
              "source" : [{
                "context" : "criticalityObs",
                "element" : "value",
                "variable" : "criticalityValue"
              }],
              "rule" : [{
                "name" : "criticality",
                "source" : [{
                  "context" : "criticalityValue",
                  "element" : "code",
                  "variable" : "code"
                }],
                "target" : [{
                  "context" : "allergy",
                  "contextType" : "variable",
                  "element" : "criticality",
                  "transform" : "cast",
                  "parameter" : [{
                    "valueId" : "code"
                  },
                  {
                    "valueString" : "code"
                  }]
                }]
              }]
            }]
          }]
        }]
      },
      {
        "name" : "certaintyBlock",
        "source" : [{
          "context" : "er",
          "element" : "observation",
          "variable" : "certaintyObs"
        }],
        "rule" : [{
          "name" : "certaintyTemplate",
          "source" : [{
            "context" : "certaintyObs",
            "element" : "templateId",
            "variable" : "tid"
          }],
          "rule" : [{
            "name" : "verificationStatusBlock",
            "source" : [{
              "context" : "tid",
              "element" : "root",
              "variable" : "root",
              "condition" : "root = '1.2.250.1.213.1.1.3.171'"
            }],
            "rule" : [{
              "name" : "verificationStatus",
              "source" : [{
                "context" : "certaintyObs",
                "element" : "value",
                "variable" : "certaintyValue"
              }],
              "target" : [{
                "context" : "allergy",
                "contextType" : "variable",
                "element" : "verificationStatus",
                "variable" : "verificationStatus",
                "transform" : "create",
                "parameter" : [{
                  "valueString" : "CodeableConcept"
                }]
              }],
              "rule" : [{
                "name" : "originalText",
                "source" : [{
                  "context" : "certaintyValue",
                  "element" : "originalText",
                  "variable" : "originalText"
                }],
                "rule" : [{
                  "name" : "reference",
                  "source" : [{
                    "context" : "originalText",
                    "element" : "reference",
                    "variable" : "ref"
                  }],
                  "rule" : [{
                    "name" : "textFromOriginalTextReference",
                    "source" : [{
                      "context" : "ref",
                      "element" : "value",
                      "variable" : "value"
                    }],
                    "target" : [{
                      "context" : "verificationStatus",
                      "contextType" : "variable",
                      "element" : "text",
                      "transform" : "cast",
                      "parameter" : [{
                        "valueId" : "value"
                      },
                      {
                        "valueString" : "string"
                      }]
                    }]
                  }]
                },
                {
                  "name" : "textFromOriginalText",
                  "source" : [{
                    "context" : "originalText",
                    "element" : "xmlText",
                    "variable" : "txt",
                    "condition" : "originalText.reference.empty()"
                  }],
                  "target" : [{
                    "context" : "verificationStatus",
                    "contextType" : "variable",
                    "element" : "text",
                    "transform" : "cast",
                    "parameter" : [{
                      "valueId" : "txt"
                    },
                    {
                      "valueString" : "string"
                    }]
                  }]
                }]
              },
              {
                "name" : "textFromDisplayName",
                "source" : [{
                  "context" : "certaintyValue",
                  "element" : "displayName",
                  "variable" : "display",
                  "condition" : "certaintyValue.originalText.empty()"
                }],
                "target" : [{
                  "context" : "verificationStatus",
                  "contextType" : "variable",
                  "element" : "text",
                  "transform" : "cast",
                  "parameter" : [{
                    "valueId" : "display"
                  },
                  {
                    "valueString" : "string"
                  }]
                }]
              },
              {
                "name" : "confirmedFromCode",
                "source" : [{
                  "context" : "certaintyValue",
                  "element" : "code",
                  "variable" : "code",
                  "condition" : "(code = 'confirmed') or (code = 'confirme') or (code = 'confirmé')"
                }],
                "target" : [{
                  "context" : "verificationStatus",
                  "contextType" : "variable",
                  "element" : "coding",
                  "variable" : "coding",
                  "transform" : "create",
                  "parameter" : [{
                    "valueString" : "Coding"
                  }]
                }],
                "rule" : [{
                  "name" : "system",
                  "source" : [{
                    "context" : "certaintyValue"
                  }],
                  "target" : [{
                    "context" : "coding",
                    "contextType" : "variable",
                    "element" : "system",
                    "transform" : "copy",
                    "parameter" : [{
                      "valueString" : "http://terminology.hl7.org/CodeSystem/allergyintolerance-verification"
                    }]
                  }]
                },
                {
                  "name" : "code",
                  "source" : [{
                    "context" : "certaintyValue"
                  }],
                  "target" : [{
                    "context" : "coding",
                    "contextType" : "variable",
                    "element" : "code",
                    "transform" : "copy",
                    "parameter" : [{
                      "valueString" : "confirmed"
                    }]
                  }]
                },
                {
                  "name" : "display",
                  "source" : [{
                    "context" : "certaintyValue"
                  }],
                  "target" : [{
                    "context" : "coding",
                    "contextType" : "variable",
                    "element" : "display",
                    "transform" : "copy",
                    "parameter" : [{
                      "valueString" : "Confirmed"
                    }]
                  }]
                }]
              },
              {
                "name" : "unconfirmedFromCode",
                "source" : [{
                  "context" : "certaintyValue",
                  "element" : "code",
                  "variable" : "code",
                  "condition" : "(code = 'unconfirmed') or (code = 'non-confirme') or (code = 'non-confirmé') or (code = 'non confirme') or (code = 'non confirmé')"
                }],
                "target" : [{
                  "context" : "verificationStatus",
                  "contextType" : "variable",
                  "element" : "coding",
                  "variable" : "coding",
                  "transform" : "create",
                  "parameter" : [{
                    "valueString" : "Coding"
                  }]
                }],
                "rule" : [{
                  "name" : "system",
                  "source" : [{
                    "context" : "certaintyValue"
                  }],
                  "target" : [{
                    "context" : "coding",
                    "contextType" : "variable",
                    "element" : "system",
                    "transform" : "copy",
                    "parameter" : [{
                      "valueString" : "http://terminology.hl7.org/CodeSystem/allergyintolerance-verification"
                    }]
                  }]
                },
                {
                  "name" : "code",
                  "source" : [{
                    "context" : "certaintyValue"
                  }],
                  "target" : [{
                    "context" : "coding",
                    "contextType" : "variable",
                    "element" : "code",
                    "transform" : "copy",
                    "parameter" : [{
                      "valueString" : "unconfirmed"
                    }]
                  }]
                },
                {
                  "name" : "display",
                  "source" : [{
                    "context" : "certaintyValue"
                  }],
                  "target" : [{
                    "context" : "coding",
                    "contextType" : "variable",
                    "element" : "display",
                    "transform" : "copy",
                    "parameter" : [{
                      "valueString" : "Unconfirmed"
                    }]
                  }]
                }]
              },
              {
                "name" : "refutedFromCode",
                "source" : [{
                  "context" : "certaintyValue",
                  "element" : "code",
                  "variable" : "code",
                  "condition" : "(code = 'refuted') or (code = 'refute') or (code = 'réfuté')"
                }],
                "target" : [{
                  "context" : "verificationStatus",
                  "contextType" : "variable",
                  "element" : "coding",
                  "variable" : "coding",
                  "transform" : "create",
                  "parameter" : [{
                    "valueString" : "Coding"
                  }]
                }],
                "rule" : [{
                  "name" : "system",
                  "source" : [{
                    "context" : "certaintyValue"
                  }],
                  "target" : [{
                    "context" : "coding",
                    "contextType" : "variable",
                    "element" : "system",
                    "transform" : "copy",
                    "parameter" : [{
                      "valueString" : "http://terminology.hl7.org/CodeSystem/allergyintolerance-verification"
                    }]
                  }]
                },
                {
                  "name" : "code",
                  "source" : [{
                    "context" : "certaintyValue"
                  }],
                  "target" : [{
                    "context" : "coding",
                    "contextType" : "variable",
                    "element" : "code",
                    "transform" : "copy",
                    "parameter" : [{
                      "valueString" : "refuted"
                    }]
                  }]
                },
                {
                  "name" : "display",
                  "source" : [{
                    "context" : "certaintyValue"
                  }],
                  "target" : [{
                    "context" : "coding",
                    "contextType" : "variable",
                    "element" : "display",
                    "transform" : "copy",
                    "parameter" : [{
                      "valueString" : "Refuted"
                    }]
                  }]
                }]
              },
              {
                "name" : "enteredInErrorFromCode",
                "source" : [{
                  "context" : "certaintyValue",
                  "element" : "code",
                  "variable" : "code",
                  "condition" : "(code = 'entered-in-error') or (code = 'erreur')"
                }],
                "target" : [{
                  "context" : "verificationStatus",
                  "contextType" : "variable",
                  "element" : "coding",
                  "variable" : "coding",
                  "transform" : "create",
                  "parameter" : [{
                    "valueString" : "Coding"
                  }]
                }],
                "rule" : [{
                  "name" : "system",
                  "source" : [{
                    "context" : "certaintyValue"
                  }],
                  "target" : [{
                    "context" : "coding",
                    "contextType" : "variable",
                    "element" : "system",
                    "transform" : "copy",
                    "parameter" : [{
                      "valueString" : "http://terminology.hl7.org/CodeSystem/allergyintolerance-verification"
                    }]
                  }]
                },
                {
                  "name" : "code",
                  "source" : [{
                    "context" : "certaintyValue"
                  }],
                  "target" : [{
                    "context" : "coding",
                    "contextType" : "variable",
                    "element" : "code",
                    "transform" : "copy",
                    "parameter" : [{
                      "valueString" : "entered-in-error"
                    }]
                  }]
                },
                {
                  "name" : "display",
                  "source" : [{
                    "context" : "certaintyValue"
                  }],
                  "target" : [{
                    "context" : "coding",
                    "contextType" : "variable",
                    "element" : "display",
                    "transform" : "copy",
                    "parameter" : [{
                      "valueString" : "Entered in Error"
                    }]
                  }]
                }]
              },
              {
                "name" : "unconfirmedFromText",
                "source" : [{
                  "context" : "certaintyValue",
                  "element" : "displayName",
                  "variable" : "display",
                  "condition" : "certaintyValue.code.empty() and (display.lower().contains('non confirmé') or display.lower().contains('non confirme'))"
                }],
                "target" : [{
                  "context" : "verificationStatus",
                  "contextType" : "variable",
                  "element" : "coding",
                  "variable" : "coding",
                  "transform" : "create",
                  "parameter" : [{
                    "valueString" : "Coding"
                  }]
                }],
                "rule" : [{
                  "name" : "system",
                  "source" : [{
                    "context" : "certaintyValue"
                  }],
                  "target" : [{
                    "context" : "coding",
                    "contextType" : "variable",
                    "element" : "system",
                    "transform" : "copy",
                    "parameter" : [{
                      "valueString" : "http://terminology.hl7.org/CodeSystem/allergyintolerance-verification"
                    }]
                  }]
                },
                {
                  "name" : "code",
                  "source" : [{
                    "context" : "certaintyValue"
                  }],
                  "target" : [{
                    "context" : "coding",
                    "contextType" : "variable",
                    "element" : "code",
                    "transform" : "copy",
                    "parameter" : [{
                      "valueString" : "unconfirmed"
                    }]
                  }]
                },
                {
                  "name" : "display",
                  "source" : [{
                    "context" : "certaintyValue"
                  }],
                  "target" : [{
                    "context" : "coding",
                    "contextType" : "variable",
                    "element" : "display",
                    "transform" : "copy",
                    "parameter" : [{
                      "valueString" : "Unconfirmed"
                    }]
                  }]
                }]
              },
              {
                "name" : "confirmedFromText",
                "source" : [{
                  "context" : "certaintyValue",
                  "element" : "displayName",
                  "variable" : "display",
                  "condition" : "certaintyValue.code.empty() and (display.lower().contains('confirmé') or display.lower().contains('confirme')) and display.lower().contains('non confirmé').not() and display.lower().contains('non confirme').not()"
                }],
                "target" : [{
                  "context" : "verificationStatus",
                  "contextType" : "variable",
                  "element" : "coding",
                  "variable" : "coding",
                  "transform" : "create",
                  "parameter" : [{
                    "valueString" : "Coding"
                  }]
                }],
                "rule" : [{
                  "name" : "system",
                  "source" : [{
                    "context" : "certaintyValue"
                  }],
                  "target" : [{
                    "context" : "coding",
                    "contextType" : "variable",
                    "element" : "system",
                    "transform" : "copy",
                    "parameter" : [{
                      "valueString" : "http://terminology.hl7.org/CodeSystem/allergyintolerance-verification"
                    }]
                  }]
                },
                {
                  "name" : "code",
                  "source" : [{
                    "context" : "certaintyValue"
                  }],
                  "target" : [{
                    "context" : "coding",
                    "contextType" : "variable",
                    "element" : "code",
                    "transform" : "copy",
                    "parameter" : [{
                      "valueString" : "confirmed"
                    }]
                  }]
                },
                {
                  "name" : "display",
                  "source" : [{
                    "context" : "certaintyValue"
                  }],
                  "target" : [{
                    "context" : "coding",
                    "contextType" : "variable",
                    "element" : "display",
                    "transform" : "copy",
                    "parameter" : [{
                      "valueString" : "Confirmed"
                    }]
                  }]
                }]
              },
              {
                "name" : "refutedFromText",
                "source" : [{
                  "context" : "certaintyValue",
                  "element" : "displayName",
                  "variable" : "display",
                  "condition" : "certaintyValue.code.empty() and (display.lower().contains('réfuté') or display.lower().contains('refute'))"
                }],
                "target" : [{
                  "context" : "verificationStatus",
                  "contextType" : "variable",
                  "element" : "coding",
                  "variable" : "coding",
                  "transform" : "create",
                  "parameter" : [{
                    "valueString" : "Coding"
                  }]
                }],
                "rule" : [{
                  "name" : "system",
                  "source" : [{
                    "context" : "certaintyValue"
                  }],
                  "target" : [{
                    "context" : "coding",
                    "contextType" : "variable",
                    "element" : "system",
                    "transform" : "copy",
                    "parameter" : [{
                      "valueString" : "http://terminology.hl7.org/CodeSystem/allergyintolerance-verification"
                    }]
                  }]
                },
                {
                  "name" : "code",
                  "source" : [{
                    "context" : "certaintyValue"
                  }],
                  "target" : [{
                    "context" : "coding",
                    "contextType" : "variable",
                    "element" : "code",
                    "transform" : "copy",
                    "parameter" : [{
                      "valueString" : "refuted"
                    }]
                  }]
                },
                {
                  "name" : "display",
                  "source" : [{
                    "context" : "certaintyValue"
                  }],
                  "target" : [{
                    "context" : "coding",
                    "contextType" : "variable",
                    "element" : "display",
                    "transform" : "copy",
                    "parameter" : [{
                      "valueString" : "Refuted"
                    }]
                  }]
                }]
              },
              {
                "name" : "enteredInErrorFromText",
                "source" : [{
                  "context" : "certaintyValue",
                  "element" : "displayName",
                  "variable" : "display",
                  "condition" : "certaintyValue.code.empty() and (display.lower().contains('erreur') or display.lower().contains('saisi par erreur'))"
                }],
                "target" : [{
                  "context" : "verificationStatus",
                  "contextType" : "variable",
                  "element" : "coding",
                  "variable" : "coding",
                  "transform" : "create",
                  "parameter" : [{
                    "valueString" : "Coding"
                  }]
                }],
                "rule" : [{
                  "name" : "system",
                  "source" : [{
                    "context" : "certaintyValue"
                  }],
                  "target" : [{
                    "context" : "coding",
                    "contextType" : "variable",
                    "element" : "system",
                    "transform" : "copy",
                    "parameter" : [{
                      "valueString" : "http://terminology.hl7.org/CodeSystem/allergyintolerance-verification"
                    }]
                  }]
                },
                {
                  "name" : "code",
                  "source" : [{
                    "context" : "certaintyValue"
                  }],
                  "target" : [{
                    "context" : "coding",
                    "contextType" : "variable",
                    "element" : "code",
                    "transform" : "copy",
                    "parameter" : [{
                      "valueString" : "entered-in-error"
                    }]
                  }]
                },
                {
                  "name" : "display",
                  "source" : [{
                    "context" : "certaintyValue"
                  }],
                  "target" : [{
                    "context" : "coding",
                    "contextType" : "variable",
                    "element" : "display",
                    "transform" : "copy",
                    "parameter" : [{
                      "valueString" : "Entered in Error"
                    }]
                  }]
                }]
              },
              {
                "name" : "verificationStatusAbsentReason",
                "source" : [{
                  "context" : "certaintyValue",
                  "condition" : "certaintyValue.code.empty() and certaintyValue.displayName.empty() and certaintyValue.originalText.empty()"
                }],
                "target" : [{
                  "context" : "verificationStatus",
                  "contextType" : "variable",
                  "element" : "extension",
                  "variable" : "absentReason",
                  "transform" : "create",
                  "parameter" : [{
                    "valueString" : "Extension"
                  }]
                }],
                "rule" : [{
                  "name" : "url",
                  "source" : [{
                    "context" : "certaintyValue"
                  }],
                  "target" : [{
                    "context" : "absentReason",
                    "contextType" : "variable",
                    "element" : "url",
                    "transform" : "copy",
                    "parameter" : [{
                      "valueString" : "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
                    }]
                  }]
                },
                {
                  "name" : "valueCode",
                  "source" : [{
                    "context" : "certaintyValue"
                  }],
                  "target" : [{
                    "context" : "absentReason",
                    "contextType" : "variable",
                    "element" : "value",
                    "transform" : "cast",
                    "parameter" : [{
                      "valueString" : "unknown"
                    },
                    {
                      "valueString" : "code"
                    }]
                  }]
                }]
              }]
            }]
          }]
        }]
      },
      {
        "name" : "certaintyNoValueBlock",
        "source" : [{
          "context" : "er",
          "element" : "observation",
          "variable" : "certaintyObs"
        }],
        "rule" : [{
          "name" : "certaintyNoValueTemplate",
          "source" : [{
            "context" : "certaintyObs",
            "element" : "templateId",
            "variable" : "tid"
          }],
          "rule" : [{
            "name" : "verificationStatusNoValueBlock",
            "source" : [{
              "context" : "tid",
              "element" : "root",
              "variable" : "root",
              "condition" : "root = '1.2.250.1.213.1.1.3.171'"
            }],
            "rule" : [{
              "name" : "verificationStatusNoValue",
              "source" : [{
                "context" : "certaintyObs",
                "condition" : "certaintyObs.value.empty()"
              }],
              "target" : [{
                "context" : "allergy",
                "contextType" : "variable",
                "element" : "verificationStatus",
                "variable" : "verificationStatus",
                "transform" : "create",
                "parameter" : [{
                  "valueString" : "CodeableConcept"
                }]
              }],
              "rule" : [{
                "name" : "dataAbsentReason",
                "source" : [{
                  "context" : "certaintyObs"
                }],
                "target" : [{
                  "context" : "verificationStatus",
                  "contextType" : "variable",
                  "element" : "extension",
                  "variable" : "absentReason",
                  "transform" : "create",
                  "parameter" : [{
                    "valueString" : "Extension"
                  }]
                }],
                "rule" : [{
                  "name" : "url",
                  "source" : [{
                    "context" : "certaintyObs"
                  }],
                  "target" : [{
                    "context" : "absentReason",
                    "contextType" : "variable",
                    "element" : "url",
                    "transform" : "copy",
                    "parameter" : [{
                      "valueString" : "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
                    }]
                  }]
                },
                {
                  "name" : "valueCode",
                  "source" : [{
                    "context" : "certaintyObs"
                  }],
                  "target" : [{
                    "context" : "absentReason",
                    "contextType" : "variable",
                    "element" : "value",
                    "transform" : "cast",
                    "parameter" : [{
                      "valueString" : "unknown"
                    },
                    {
                      "valueString" : "code"
                    }]
                  }]
                }]
              }]
            }]
          }]
        }]
      },
      {
        "name" : "reactionBlock",
        "source" : [{
          "context" : "er",
          "element" : "observation",
          "variable" : "reactionObs"
        }],
        "rule" : [{
          "name" : "reactionTemplate",
          "source" : [{
            "context" : "reactionObs",
            "element" : "templateId",
            "variable" : "tid"
          }],
          "rule" : [{
            "name" : "reaction",
            "source" : [{
              "context" : "tid",
              "element" : "root",
              "variable" : "root",
              "condition" : "root = '1.2.250.1.213.1.1.3.37'"
            }],
            "target" : [{
              "context" : "allergy",
              "contextType" : "variable",
              "element" : "reaction",
              "variable" : "reaction"
            }],
            "rule" : [{
              "name" : "reactionSubstance",
              "source" : [{
                "context" : "observation",
                "element" : "participant",
                "variable" : "participant"
              }],
              "rule" : [{
                "name" : "participantRole",
                "source" : [{
                  "context" : "participant",
                  "element" : "participantRole",
                  "variable" : "participantRole"
                }],
                "rule" : [{
                  "name" : "playingEntity",
                  "source" : [{
                    "context" : "participantRole",
                    "element" : "playingEntity",
                    "variable" : "playingEntity"
                  }],
                  "rule" : [{
                    "name" : "substance",
                    "source" : [{
                      "context" : "playingEntity",
                      "element" : "code",
                      "variable" : "substanceCode"
                    }],
                    "target" : [{
                      "context" : "reaction",
                      "contextType" : "variable",
                      "element" : "substance",
                      "variable" : "substance",
                      "transform" : "create",
                      "parameter" : [{
                        "valueString" : "CodeableConcept"
                      }]
                    }],
                    "dependent" : [{
                      "name" : "CDCodeableConcept",
                      "variable" : ["substanceCode", "substance"]
                    }]
                  }]
                }]
              }]
            },
            {
              "name" : "manifestation",
              "source" : [{
                "context" : "reactionObs",
                "element" : "value",
                "variable" : "manifestationValue"
              }],
              "target" : [{
                "context" : "reaction",
                "contextType" : "variable",
                "element" : "manifestation",
                "variable" : "manifestation",
                "transform" : "create",
                "parameter" : [{
                  "valueString" : "CodeableConcept"
                }]
              }],
              "dependent" : [{
                "name" : "CDCodeableConcept",
                "variable" : ["manifestationValue", "manifestation"]
              }]
            },
            {
              "name" : "reactionEffectiveTime",
              "source" : [{
                "context" : "reactionObs",
                "element" : "effectiveTime",
                "variable" : "effectiveTime"
              }],
              "rule" : [{
                "name" : "reactionOnset",
                "source" : [{
                  "context" : "effectiveTime",
                  "element" : "low",
                  "variable" : "low"
                }],
                "target" : [{
                  "context" : "reaction",
                  "contextType" : "variable",
                  "element" : "onset",
                  "variable" : "onsetDateTime",
                  "transform" : "create",
                  "parameter" : [{
                    "valueString" : "dateTime"
                  }]
                }],
                "dependent" : [{
                  "name" : "TSDateTime",
                  "variable" : ["low", "onsetDateTime"]
                }]
              }]
            },
            {
              "name" : "reactionEntryRelationships",
              "source" : [{
                "context" : "reactionObs",
                "element" : "entryRelationship",
                "variable" : "reactionEr"
              }],
              "rule" : [{
                "name" : "severityObservation",
                "source" : [{
                  "context" : "reactionEr",
                  "element" : "observation",
                  "variable" : "severityObs"
                }],
                "rule" : [{
                  "name" : "severityTemplate",
                  "source" : [{
                    "context" : "severityObs",
                    "element" : "templateId",
                    "variable" : "severityTid"
                  }],
                  "rule" : [{
                    "name" : "reactionSeverity",
                    "source" : [{
                      "context" : "severityTid",
                      "element" : "root",
                      "variable" : "severityRoot",
                      "condition" : "severityRoot = '1.2.250.1.213.1.1.3.29'"
                    }],
                    "rule" : [{
                      "name" : "severityMild",
                      "source" : [{
                        "context" : "severityObs",
                        "element" : "value",
                        "variable" : "severityValue",
                        "condition" : "severityValue.code = '255604002'"
                      }],
                      "target" : [{
                        "context" : "reaction",
                        "contextType" : "variable",
                        "element" : "severity",
                        "transform" : "copy",
                        "parameter" : [{
                          "valueString" : "mild"
                        }]
                      }]
                    },
                    {
                      "name" : "severityModerate",
                      "source" : [{
                        "context" : "severityObs",
                        "element" : "value",
                        "variable" : "severityValue",
                        "condition" : "severityValue.code = '6736007'"
                      }],
                      "target" : [{
                        "context" : "reaction",
                        "contextType" : "variable",
                        "element" : "severity",
                        "transform" : "copy",
                        "parameter" : [{
                          "valueString" : "moderate"
                        }]
                      }]
                    },
                    {
                      "name" : "severitySevere",
                      "source" : [{
                        "context" : "severityObs",
                        "element" : "value",
                        "variable" : "severityValue",
                        "condition" : "severityValue.code = '24484000'"
                      }],
                      "target" : [{
                        "context" : "reaction",
                        "contextType" : "variable",
                        "element" : "severity",
                        "transform" : "copy",
                        "parameter" : [{
                          "valueString" : "severe"
                        }]
                      }]
                    }]
                  }]
                }]
              }]
            }]
          }]
        }]
      }]
    },
    {
      "name" : "sectionEntry",
      "source" : [{
        "context" : "observation"
      }],
      "target" : [{
        "context" : "compSection",
        "contextType" : "variable",
        "element" : "entry",
        "variable" : "sectionRef",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Reference"
        }]
      },
      {
        "context" : "sectionRef",
        "contextType" : "variable",
        "element" : "reference",
        "transform" : "evaluate",
        "parameter" : [{
          "valueString" : "'urn:uuid:' + %allergy.id"
        }]
      }]
    }]
  },
  {
    "name" : "PatientSummaryProcedureSection",
    "typeMode" : "none",
    "documentation" : "3. PROCÉDURES / ACTES",
    "input" : [{
      "name" : "section",
      "mode" : "source"
    },
    {
      "name" : "compSection",
      "mode" : "target"
    },
    {
      "name" : "bundle",
      "type" : "Bundle",
      "mode" : "target"
    },
    {
      "name" : "patient",
      "type" : "Patient",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "sectionTemplate",
      "source" : [{
        "context" : "section",
        "element" : "templateId",
        "variable" : "sectionTid"
      }],
      "rule" : [{
        "name" : "historyActsSection",
        "source" : [{
          "context" : "sectionTid",
          "element" : "root",
          "variable" : "sectionRoot",
          "condition" : "sectionRoot = '1.2.250.1.213.1.1.2.136'"
        }],
        "rule" : [{
          "name" : "sectionEntry",
          "source" : [{
            "context" : "section",
            "element" : "entry",
            "variable" : "entry"
          }],
          "rule" : [{
            "name" : "cdaProcedure",
            "source" : [{
              "context" : "entry",
              "element" : "procedure",
              "variable" : "cdaProcedure"
            }],
            "rule" : [{
              "name" : "procedureTemplate",
              "source" : [{
                "context" : "cdaProcedure",
                "element" : "templateId",
                "variable" : "procTid"
              }],
              "rule" : [{
                "name" : "procedure",
                "source" : [{
                  "context" : "procTid",
                  "element" : "root",
                  "variable" : "procRoot",
                  "condition" : "procRoot = '1.2.250.1.213.1.1.3.62'"
                }],
                "target" : [{
                  "context" : "bundle",
                  "contextType" : "variable",
                  "element" : "entry",
                  "variable" : "procedureEntry"
                },
                {
                  "context" : "procedureEntry",
                  "contextType" : "variable",
                  "element" : "resource",
                  "variable" : "fhirProcedure",
                  "transform" : "create",
                  "parameter" : [{
                    "valueString" : "Procedure"
                  }]
                },
                {
                  "context" : "fhirProcedure",
                  "contextType" : "variable",
                  "element" : "id",
                  "transform" : "uuid"
                },
                {
                  "context" : "procedureEntry",
                  "contextType" : "variable",
                  "element" : "fullUrl",
                  "transform" : "evaluate",
                  "parameter" : [{
                    "valueString" : "'urn:uuid:' + %fhirProcedure.id"
                  }]
                }],
                "dependent" : [{
                  "name" : "PatientSummaryProcedureFromProcedure",
                  "variable" : ["cdaProcedure", "fhirProcedure", "compSection", "patient", "bundle"]
                }]
              }]
            }]
          }]
        }]
      }]
    }]
  },
  {
    "name" : "PatientSummaryProcedureFromProcedure",
    "typeMode" : "none",
    "documentation" : "Acte CDA -> Procedure FHIR",
    "input" : [{
      "name" : "procedure",
      "mode" : "source"
    },
    {
      "name" : "fhirProcedure",
      "type" : "Procedure",
      "mode" : "target"
    },
    {
      "name" : "compSection",
      "mode" : "target"
    },
    {
      "name" : "patient",
      "type" : "Patient",
      "mode" : "target"
    },
    {
      "name" : "bundle",
      "type" : "Bundle",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "statusDefault",
      "source" : [{
        "context" : "procedure"
      }],
      "target" : [{
        "context" : "fhirProcedure",
        "contextType" : "variable",
        "element" : "status",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "unknown"
        }]
      }]
    },
    {
      "name" : "status",
      "source" : [{
        "context" : "procedure",
        "element" : "statusCode",
        "variable" : "statusCode"
      }],
      "rule" : [{
        "name" : "completed",
        "source" : [{
          "context" : "statusCode",
          "element" : "code",
          "variable" : "code",
          "condition" : "code = 'completed'"
        }],
        "target" : [{
          "context" : "fhirProcedure",
          "contextType" : "variable",
          "element" : "status",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "completed"
          }]
        }]
      },
      {
        "name" : "active",
        "source" : [{
          "context" : "statusCode",
          "element" : "code",
          "variable" : "code",
          "condition" : "code = 'active'"
        }],
        "target" : [{
          "context" : "fhirProcedure",
          "contextType" : "variable",
          "element" : "status",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "in-progress"
          }]
        }]
      },
      {
        "name" : "aborted",
        "source" : [{
          "context" : "statusCode",
          "element" : "code",
          "variable" : "code",
          "condition" : "code = 'aborted'"
        }],
        "target" : [{
          "context" : "fhirProcedure",
          "contextType" : "variable",
          "element" : "status",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "stopped"
          }]
        }]
      },
      {
        "name" : "cancelled",
        "source" : [{
          "context" : "statusCode",
          "element" : "code",
          "variable" : "code",
          "condition" : "code = 'cancelled'"
        }],
        "target" : [{
          "context" : "fhirProcedure",
          "contextType" : "variable",
          "element" : "status",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "not-done"
          }]
        }]
      },
      {
        "name" : "suspended",
        "source" : [{
          "context" : "statusCode",
          "element" : "code",
          "variable" : "code",
          "condition" : "code = 'suspended'"
        }],
        "target" : [{
          "context" : "fhirProcedure",
          "contextType" : "variable",
          "element" : "status",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "on-hold"
          }]
        }]
      }]
    },
    {
      "name" : "statusIntent",
      "source" : [{
        "context" : "procedure",
        "element" : "moodCode",
        "variable" : "mood",
        "condition" : "mood = 'INT'"
      }],
      "target" : [{
        "context" : "fhirProcedure",
        "contextType" : "variable",
        "element" : "status",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "preparation"
        }]
      }]
    },
    {
      "name" : "identifier",
      "source" : [{
        "context" : "procedure",
        "element" : "id",
        "variable" : "procedureId"
      }],
      "target" : [{
        "context" : "fhirProcedure",
        "contextType" : "variable",
        "element" : "identifier",
        "variable" : "identifier",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Identifier"
        }]
      }],
      "dependent" : [{
        "name" : "II",
        "variable" : ["procedureId", "identifier"]
      }]
    },
    {
      "name" : "subject",
      "source" : [{
        "context" : "procedure"
      }],
      "target" : [{
        "context" : "fhirProcedure",
        "contextType" : "variable",
        "element" : "subject",
        "variable" : "subjectRef",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Reference"
        }]
      },
      {
        "context" : "subjectRef",
        "contextType" : "variable",
        "element" : "reference",
        "transform" : "evaluate",
        "parameter" : [{
          "valueString" : "'urn:uuid:' + %patient.id"
        }]
      }]
    },
    {
      "name" : "code",
      "source" : [{
        "context" : "procedure",
        "element" : "code",
        "variable" : "procedureCode"
      }],
      "target" : [{
        "context" : "fhirProcedure",
        "contextType" : "variable",
        "element" : "code",
        "variable" : "code",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "dependent" : [{
        "name" : "CDCodeableConcept",
        "variable" : ["procedureCode", "code"]
      }]
    },
    {
      "name" : "performed",
      "source" : [{
        "context" : "procedure",
        "element" : "effectiveTime",
        "variable" : "effectiveTime"
      }],
      "rule" : [{
        "name" : "performedDateTime",
        "source" : [{
          "context" : "effectiveTime",
          "element" : "value",
          "variable" : "value"
        }],
        "target" : [{
          "context" : "fhirProcedure",
          "contextType" : "variable",
          "element" : "performed",
          "variable" : "performedDateTime",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "dateTime"
          }]
        }],
        "dependent" : [{
          "name" : "TSDateTime",
          "variable" : ["effectiveTime", "performedDateTime"]
        }]
      },
      {
        "name" : "performedPeriod",
        "source" : [{
          "context" : "effectiveTime",
          "element" : "low",
          "variable" : "low"
        }],
        "target" : [{
          "context" : "fhirProcedure",
          "contextType" : "variable",
          "element" : "performed",
          "variable" : "performedPeriod",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Period"
          }]
        }],
        "rule" : [{
          "name" : "start",
          "source" : [{
            "context" : "low"
          }],
          "target" : [{
            "context" : "performedPeriod",
            "contextType" : "variable",
            "element" : "start",
            "variable" : "start",
            "transform" : "create",
            "parameter" : [{
              "valueString" : "dateTime"
            }]
          }],
          "dependent" : [{
            "name" : "TSDateTime",
            "variable" : ["low", "start"]
          }]
        },
        {
          "name" : "end",
          "source" : [{
            "context" : "effectiveTime",
            "element" : "high",
            "variable" : "high"
          }],
          "target" : [{
            "context" : "performedPeriod",
            "contextType" : "variable",
            "element" : "end",
            "variable" : "end",
            "transform" : "create",
            "parameter" : [{
              "valueString" : "dateTime"
            }]
          }],
          "dependent" : [{
            "name" : "TSDateTime",
            "variable" : ["high", "end"]
          }]
        }]
      }]
    },
    {
      "name" : "targetSite",
      "source" : [{
        "context" : "procedure",
        "element" : "targetSiteCode",
        "variable" : "targetSiteCode"
      }],
      "target" : [{
        "context" : "fhirProcedure",
        "contextType" : "variable",
        "element" : "bodySite",
        "variable" : "bodySite",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "dependent" : [{
        "name" : "CDCodeableConcept",
        "variable" : ["targetSiteCode", "bodySite"]
      }]
    },
    {
      "name" : "approachSite",
      "source" : [{
        "context" : "procedure",
        "element" : "approachSiteCode",
        "variable" : "approachSiteCode"
      }],
      "target" : [{
        "context" : "fhirProcedure",
        "contextType" : "variable",
        "element" : "bodySite",
        "variable" : "approachSite",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "dependent" : [{
        "name" : "CDCodeableConcept",
        "variable" : ["approachSiteCode", "approachSite"]
      }]
    },
    {
      "name" : "author",
      "source" : [{
        "context" : "procedure",
        "element" : "author",
        "variable" : "author"
      }],
      "rule" : [{
        "name" : "recorder",
        "source" : [{
          "context" : "author",
          "element" : "assignedAuthor",
          "variable" : "assignedAuthor"
        }],
        "dependent" : [{
          "name" : "ProcedureRecorderFromAssignedAuthor",
          "variable" : ["assignedAuthor", "fhirProcedure", "bundle"]
        }]
      }]
    },
    {
      "name" : "performer",
      "source" : [{
        "context" : "procedure",
        "element" : "performer",
        "variable" : "performer"
      }],
      "rule" : [{
        "name" : "performer",
        "source" : [{
          "context" : "performer",
          "element" : "assignedEntity",
          "variable" : "assignedEntity"
        }],
        "dependent" : [{
          "name" : "ProcedurePerformerFromAssignedEntity",
          "variable" : ["assignedEntity", "fhirProcedure", "bundle"]
        }]
      }]
    },
    {
      "name" : "entryRelationship",
      "source" : [{
        "context" : "procedure",
        "element" : "entryRelationship",
        "variable" : "er"
      }],
      "rule" : [{
        "name" : "reasonAct",
        "source" : [{
          "context" : "er",
          "element" : "act",
          "variable" : "reasonAct",
          "condition" : "er.typeCode = 'RSON'"
        }],
        "rule" : [{
          "name" : "reasonTemplate",
          "source" : [{
            "context" : "reasonAct",
            "element" : "templateId",
            "variable" : "tid"
          }],
          "rule" : [{
            "name" : "reason",
            "source" : [{
              "context" : "tid",
              "element" : "root",
              "variable" : "root",
              "condition" : "root = '1.2.250.1.213.1.1.3.36'"
            }],
            "rule" : [{
              "name" : "reasonCode",
              "source" : [{
                "context" : "reasonAct",
                "element" : "code",
                "variable" : "reasonCode"
              }],
              "target" : [{
                "context" : "fhirProcedure",
                "contextType" : "variable",
                "element" : "reasonCode",
                "variable" : "reason",
                "transform" : "create",
                "parameter" : [{
                  "valueString" : "CodeableConcept"
                }]
              }],
              "dependent" : [{
                "name" : "CDCodeableConcept",
                "variable" : ["reasonCode", "reason"]
              }]
            }]
          }]
        }]
      },
      {
        "name" : "commentAct",
        "source" : [{
          "context" : "er",
          "element" : "act",
          "variable" : "commentAct",
          "condition" : "er.typeCode = 'SUBJ'"
        }],
        "rule" : [{
          "name" : "commentTemplate",
          "source" : [{
            "context" : "commentAct",
            "element" : "templateId",
            "variable" : "tid"
          }],
          "rule" : [{
            "name" : "commentNotMapped",
            "source" : [{
              "context" : "tid",
              "element" : "root",
              "variable" : "root",
              "condition" : "root = '1.2.250.1.213.1.1.3.32'"
            }]
          }]
        }]
      },
      {
        "name" : "deviceReferenceAct",
        "source" : [{
          "context" : "er",
          "element" : "act",
          "variable" : "deviceReferenceAct",
          "condition" : "er.typeCode = 'REFR'"
        }],
        "rule" : [{
          "name" : "deviceReferenceTemplate",
          "source" : [{
            "context" : "deviceReferenceAct",
            "element" : "templateId",
            "variable" : "tid"
          }],
          "rule" : [{
            "name" : "deviceReference",
            "source" : [{
              "context" : "tid",
              "element" : "root",
              "variable" : "root",
              "condition" : "root = '1.2.250.1.213.1.1.3.36'"
            }],
            "rule" : [{
              "name" : "usedReference",
              "source" : [{
                "context" : "deviceReferenceAct",
                "element" : "id",
                "variable" : "deviceId"
              }],
              "target" : [{
                "context" : "fhirProcedure",
                "contextType" : "variable",
                "element" : "usedReference",
                "variable" : "usedRef",
                "transform" : "create",
                "parameter" : [{
                  "valueString" : "Reference"
                }]
              },
              {
                "context" : "usedRef",
                "contextType" : "variable",
                "element" : "identifier",
                "variable" : "identifier",
                "transform" : "create",
                "parameter" : [{
                  "valueString" : "Identifier"
                }]
              }],
              "dependent" : [{
                "name" : "II",
                "variable" : ["deviceId", "identifier"]
              }]
            }]
          }]
        }]
      },
      {
        "name" : "linkedObservation",
        "source" : [{
          "context" : "er",
          "element" : "observation",
          "variable" : "linkedObservation"
        }],
        "rule" : [{
          "name" : "linkedObservationTemplate",
          "source" : [{
            "context" : "linkedObservation",
            "element" : "templateId",
            "variable" : "tid"
          }],
          "rule" : [{
            "name" : "linkedObservationResource",
            "source" : [{
              "context" : "tid",
              "element" : "root",
              "variable" : "root",
              "condition" : "root = '1.2.250.1.213.1.1.3.48'"
            }],
            "target" : [{
              "context" : "bundle",
              "contextType" : "variable",
              "element" : "entry",
              "variable" : "obsEntry"
            },
            {
              "context" : "obsEntry",
              "contextType" : "variable",
              "element" : "resource",
              "variable" : "observation",
              "transform" : "create",
              "parameter" : [{
                "valueString" : "Observation"
              }]
            },
            {
              "context" : "observation",
              "contextType" : "variable",
              "element" : "id",
              "transform" : "uuid"
            },
            {
              "context" : "obsEntry",
              "contextType" : "variable",
              "element" : "fullUrl",
              "transform" : "evaluate",
              "parameter" : [{
                "valueString" : "'urn:uuid:' + %observation.id"
              }]
            }],
            "rule" : [{
              "name" : "observationStatus",
              "source" : [{
                "context" : "linkedObservation"
              }],
              "target" : [{
                "context" : "observation",
                "contextType" : "variable",
                "element" : "status",
                "transform" : "copy",
                "parameter" : [{
                  "valueString" : "final"
                }]
              }]
            },
            {
              "name" : "observationIdentifier",
              "source" : [{
                "context" : "linkedObservation",
                "element" : "id",
                "variable" : "id"
              }],
              "target" : [{
                "context" : "observation",
                "contextType" : "variable",
                "element" : "identifier",
                "variable" : "identifier",
                "transform" : "create",
                "parameter" : [{
                  "valueString" : "Identifier"
                }]
              }],
              "dependent" : [{
                "name" : "II",
                "variable" : ["id", "identifier"]
              }]
            },
            {
              "name" : "observationSubject",
              "source" : [{
                "context" : "linkedObservation"
              }],
              "target" : [{
                "context" : "observation",
                "contextType" : "variable",
                "element" : "subject",
                "variable" : "subjectRef",
                "transform" : "create",
                "parameter" : [{
                  "valueString" : "Reference"
                }]
              },
              {
                "context" : "subjectRef",
                "contextType" : "variable",
                "element" : "reference",
                "transform" : "evaluate",
                "parameter" : [{
                  "valueString" : "'urn:uuid:' + %patient.id"
                }]
              }]
            },
            {
              "name" : "category",
              "source" : [{
                "context" : "linkedObservation"
              }],
              "target" : [{
                "context" : "observation",
                "contextType" : "variable",
                "element" : "category",
                "variable" : "category",
                "transform" : "create",
                "parameter" : [{
                  "valueString" : "CodeableConcept"
                }]
              }],
              "rule" : [{
                "name" : "categoryCoding",
                "source" : [{
                  "context" : "linkedObservation"
                }],
                "target" : [{
                  "context" : "category",
                  "contextType" : "variable",
                  "element" : "coding",
                  "variable" : "coding",
                  "transform" : "create",
                  "parameter" : [{
                    "valueString" : "Coding"
                  }]
                }],
                "rule" : [{
                  "name" : "categorySystem",
                  "source" : [{
                    "context" : "linkedObservation"
                  }],
                  "target" : [{
                    "context" : "coding",
                    "contextType" : "variable",
                    "element" : "system",
                    "transform" : "copy",
                    "parameter" : [{
                      "valueString" : "http://terminology.hl7.org/CodeSystem/observation-category"
                    }]
                  }]
                },
                {
                  "name" : "categoryCode",
                  "source" : [{
                    "context" : "linkedObservation"
                  }],
                  "target" : [{
                    "context" : "coding",
                    "contextType" : "variable",
                    "element" : "code",
                    "transform" : "copy",
                    "parameter" : [{
                      "valueString" : "procedure"
                    }]
                  }]
                },
                {
                  "name" : "categoryDisplay",
                  "source" : [{
                    "context" : "linkedObservation"
                  }],
                  "target" : [{
                    "context" : "coding",
                    "contextType" : "variable",
                    "element" : "display",
                    "transform" : "copy",
                    "parameter" : [{
                      "valueString" : "Procedure"
                    }]
                  }]
                }]
              }]
            },
            {
              "name" : "observationCode",
              "source" : [{
                "context" : "linkedObservation",
                "element" : "code",
                "variable" : "code"
              }],
              "target" : [{
                "context" : "observation",
                "contextType" : "variable",
                "element" : "code",
                "variable" : "cc",
                "transform" : "create",
                "parameter" : [{
                  "valueString" : "CodeableConcept"
                }]
              }],
              "dependent" : [{
                "name" : "CDCodeableConcept",
                "variable" : ["code", "cc"]
              }]
            },
            {
              "name" : "effectiveTime",
              "source" : [{
                "context" : "linkedObservation",
                "element" : "effectiveTime",
                "variable" : "effectiveTime"
              }],
              "dependent" : [{
                "name" : "ObservationEffectiveFromEffectiveTime",
                "variable" : ["effectiveTime", "observation"]
              }]
            },
            {
              "name" : "effectiveTimeAbsentReason",
              "source" : [{
                "context" : "linkedObservation",
                "condition" : "linkedObservation.effectiveTime.empty()"
              }],
              "target" : [{
                "context" : "observation",
                "contextType" : "variable",
                "element" : "effective",
                "variable" : "effectiveDateTime",
                "transform" : "create",
                "parameter" : [{
                  "valueString" : "dateTime"
                }]
              }],
              "rule" : [{
                "name" : "dataAbsentReason",
                "source" : [{
                  "context" : "linkedObservation"
                }],
                "target" : [{
                  "context" : "effectiveDateTime",
                  "contextType" : "variable",
                  "element" : "extension",
                  "variable" : "absentReason",
                  "transform" : "create",
                  "parameter" : [{
                    "valueString" : "Extension"
                  }]
                }],
                "rule" : [{
                  "name" : "url",
                  "source" : [{
                    "context" : "linkedObservation"
                  }],
                  "target" : [{
                    "context" : "absentReason",
                    "contextType" : "variable",
                    "element" : "url",
                    "transform" : "copy",
                    "parameter" : [{
                      "valueString" : "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
                    }]
                  }]
                },
                {
                  "name" : "valueCode",
                  "source" : [{
                    "context" : "linkedObservation"
                  }],
                  "target" : [{
                    "context" : "absentReason",
                    "contextType" : "variable",
                    "element" : "value",
                    "transform" : "cast",
                    "parameter" : [{
                      "valueString" : "unknown"
                    },
                    {
                      "valueString" : "code"
                    }]
                  }]
                }]
              }]
            },
            {
              "name" : "observationValue",
              "source" : [{
                "context" : "linkedObservation",
                "element" : "value",
                "variable" : "value"
              }],
              "target" : [{
                "context" : "observation",
                "contextType" : "variable",
                "element" : "value",
                "variable" : "cc",
                "transform" : "create",
                "parameter" : [{
                  "valueString" : "CodeableConcept"
                }]
              }],
              "dependent" : [{
                "name" : "CDCodeableConcept",
                "variable" : ["value", "cc"]
              }]
            },
            {
              "name" : "partOf",
              "source" : [{
                "context" : "linkedObservation"
              }],
              "target" : [{
                "context" : "fhirProcedure",
                "contextType" : "variable",
                "element" : "partOf",
                "variable" : "partOfRef",
                "transform" : "create",
                "parameter" : [{
                  "valueString" : "Reference"
                }]
              },
              {
                "context" : "partOfRef",
                "contextType" : "variable",
                "element" : "reference",
                "transform" : "evaluate",
                "parameter" : [{
                  "valueString" : "'urn:uuid:' + %observation.id"
                }]
              }]
            }]
          }]
        }]
      }]
    },
    {
      "name" : "sectionEntry",
      "source" : [{
        "context" : "procedure"
      }],
      "target" : [{
        "context" : "compSection",
        "contextType" : "variable",
        "element" : "entry",
        "variable" : "sectionRef",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Reference"
        }]
      },
      {
        "context" : "sectionRef",
        "contextType" : "variable",
        "element" : "reference",
        "transform" : "evaluate",
        "parameter" : [{
          "valueString" : "'urn:uuid:' + %fhirProcedure.id"
        }]
      }]
    }]
  },
  {
    "name" : "ProcedureRecorderFromAssignedAuthor",
    "typeMode" : "none",
    "documentation" : "Auteur CDA -> recorder Procedure",
    "input" : [{
      "name" : "assignedAuthor",
      "mode" : "source"
    },
    {
      "name" : "fhirProcedure",
      "type" : "Procedure",
      "mode" : "target"
    },
    {
      "name" : "bundle",
      "type" : "Bundle",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "recorder",
      "source" : [{
        "context" : "assignedAuthor"
      }],
      "target" : [{
        "context" : "bundle",
        "contextType" : "variable",
        "element" : "entry",
        "variable" : "practitionerEntry"
      },
      {
        "context" : "practitionerEntry",
        "contextType" : "variable",
        "element" : "resource",
        "variable" : "practitioner",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Practitioner"
        }]
      },
      {
        "context" : "practitioner",
        "contextType" : "variable",
        "element" : "id",
        "transform" : "uuid"
      },
      {
        "context" : "practitionerEntry",
        "contextType" : "variable",
        "element" : "fullUrl",
        "transform" : "evaluate",
        "parameter" : [{
          "valueString" : "'urn:uuid:' + %practitioner.id"
        }]
      }],
      "rule" : [{
        "name" : "practitionerBase",
        "source" : [{
          "context" : "assignedAuthor"
        }],
        "dependent" : [{
          "name" : "MapCDAAssignedEntityToPractitioner",
          "variable" : ["assignedAuthor", "practitioner"]
        }]
      },
      {
        "name" : "practitionerFR",
        "source" : [{
          "context" : "assignedAuthor"
        }],
        "dependent" : [{
          "name" : "MapCDAAssignedEntityToFrenchPractitioner",
          "variable" : ["assignedAuthor", "practitioner"]
        }]
      },
      {
        "name" : "withOrganization",
        "source" : [{
          "context" : "assignedAuthor",
          "element" : "representedOrganization",
          "variable" : "representedOrganization"
        }],
        "target" : [{
          "context" : "bundle",
          "contextType" : "variable",
          "element" : "entry",
          "variable" : "organizationEntry"
        },
        {
          "context" : "organizationEntry",
          "contextType" : "variable",
          "element" : "resource",
          "variable" : "organization",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Organization"
          }]
        },
        {
          "context" : "organization",
          "contextType" : "variable",
          "element" : "id",
          "transform" : "uuid"
        },
        {
          "context" : "organizationEntry",
          "contextType" : "variable",
          "element" : "fullUrl",
          "transform" : "evaluate",
          "parameter" : [{
            "valueString" : "'urn:uuid:' + %organization.id"
          }]
        },
        {
          "context" : "bundle",
          "contextType" : "variable",
          "element" : "entry",
          "variable" : "roleEntry"
        },
        {
          "context" : "roleEntry",
          "contextType" : "variable",
          "element" : "resource",
          "variable" : "practitionerRole",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "PractitionerRole"
          }]
        },
        {
          "context" : "practitionerRole",
          "contextType" : "variable",
          "element" : "id",
          "transform" : "uuid"
        },
        {
          "context" : "roleEntry",
          "contextType" : "variable",
          "element" : "fullUrl",
          "transform" : "evaluate",
          "parameter" : [{
            "valueString" : "'urn:uuid:' + %practitionerRole.id"
          }]
        }],
        "rule" : [{
          "name" : "organizationBase",
          "source" : [{
            "context" : "representedOrganization"
          }],
          "dependent" : [{
            "name" : "MapCDAOrganizationToOrganization",
            "variable" : ["representedOrganization", "organization"]
          }]
        },
        {
          "name" : "organizationFR",
          "source" : [{
            "context" : "representedOrganization"
          }],
          "dependent" : [{
            "name" : "MapCDAOrganizationToFrenchOrganization",
            "variable" : ["representedOrganization", "organization"]
          }]
        },
        {
          "name" : "roleBase",
          "source" : [{
            "context" : "assignedAuthor"
          }],
          "dependent" : [{
            "name" : "MapCDAAssignedEntityToPractitionerRole",
            "variable" : ["assignedAuthor",
            "practitionerRole",
            "practitioner",
            "organization"]
          }]
        },
        {
          "name" : "roleFR",
          "source" : [{
            "context" : "assignedAuthor"
          }],
          "dependent" : [{
            "name" : "MapCDAAssignedEntityToFrenchPractitionerRole",
            "variable" : ["assignedAuthor",
            "practitionerRole",
            "practitioner",
            "organization"]
          }]
        },
        {
          "name" : "recorderRole",
          "source" : [{
            "context" : "assignedAuthor"
          }],
          "target" : [{
            "context" : "fhirProcedure",
            "contextType" : "variable",
            "element" : "recorder",
            "variable" : "recorderRef",
            "transform" : "create",
            "parameter" : [{
              "valueString" : "Reference"
            }]
          },
          {
            "context" : "recorderRef",
            "contextType" : "variable",
            "element" : "reference",
            "transform" : "evaluate",
            "parameter" : [{
              "valueString" : "'urn:uuid:' + %practitionerRole.id"
            }]
          }]
        }]
      },
      {
        "name" : "recorderPractitionerOnly",
        "source" : [{
          "context" : "assignedAuthor",
          "condition" : "assignedAuthor.representedOrganization.empty()"
        }],
        "target" : [{
          "context" : "fhirProcedure",
          "contextType" : "variable",
          "element" : "recorder",
          "variable" : "recorderRef",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Reference"
          }]
        },
        {
          "context" : "recorderRef",
          "contextType" : "variable",
          "element" : "reference",
          "transform" : "evaluate",
          "parameter" : [{
            "valueString" : "'urn:uuid:' + %practitioner.id"
          }]
        }]
      }]
    }]
  },
  {
    "name" : "ProcedurePerformerFromAssignedEntity",
    "typeMode" : "none",
    "documentation" : "Performer CDA -> performer Procedure",
    "input" : [{
      "name" : "assignedEntity",
      "mode" : "source"
    },
    {
      "name" : "fhirProcedure",
      "type" : "Procedure",
      "mode" : "target"
    },
    {
      "name" : "bundle",
      "type" : "Bundle",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "performer",
      "source" : [{
        "context" : "assignedEntity"
      }],
      "target" : [{
        "context" : "bundle",
        "contextType" : "variable",
        "element" : "entry",
        "variable" : "practitionerEntry"
      },
      {
        "context" : "practitionerEntry",
        "contextType" : "variable",
        "element" : "resource",
        "variable" : "practitioner",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Practitioner"
        }]
      },
      {
        "context" : "practitioner",
        "contextType" : "variable",
        "element" : "id",
        "transform" : "uuid"
      },
      {
        "context" : "practitionerEntry",
        "contextType" : "variable",
        "element" : "fullUrl",
        "transform" : "evaluate",
        "parameter" : [{
          "valueString" : "'urn:uuid:' + %practitioner.id"
        }]
      }],
      "rule" : [{
        "name" : "practitionerBase",
        "source" : [{
          "context" : "assignedEntity"
        }],
        "dependent" : [{
          "name" : "MapCDAAssignedEntityToPractitioner",
          "variable" : ["assignedEntity", "practitioner"]
        }]
      },
      {
        "name" : "practitionerFR",
        "source" : [{
          "context" : "assignedEntity"
        }],
        "dependent" : [{
          "name" : "MapCDAAssignedEntityToFrenchPractitioner",
          "variable" : ["assignedEntity", "practitioner"]
        }]
      },
      {
        "name" : "withOrganization",
        "source" : [{
          "context" : "assignedEntity",
          "element" : "representedOrganization",
          "variable" : "representedOrganization"
        }],
        "target" : [{
          "context" : "bundle",
          "contextType" : "variable",
          "element" : "entry",
          "variable" : "organizationEntry"
        },
        {
          "context" : "organizationEntry",
          "contextType" : "variable",
          "element" : "resource",
          "variable" : "organization",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Organization"
          }]
        },
        {
          "context" : "organization",
          "contextType" : "variable",
          "element" : "id",
          "transform" : "uuid"
        },
        {
          "context" : "organizationEntry",
          "contextType" : "variable",
          "element" : "fullUrl",
          "transform" : "evaluate",
          "parameter" : [{
            "valueString" : "'urn:uuid:' + %organization.id"
          }]
        },
        {
          "context" : "bundle",
          "contextType" : "variable",
          "element" : "entry",
          "variable" : "roleEntry"
        },
        {
          "context" : "roleEntry",
          "contextType" : "variable",
          "element" : "resource",
          "variable" : "practitionerRole",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "PractitionerRole"
          }]
        },
        {
          "context" : "practitionerRole",
          "contextType" : "variable",
          "element" : "id",
          "transform" : "uuid"
        },
        {
          "context" : "roleEntry",
          "contextType" : "variable",
          "element" : "fullUrl",
          "transform" : "evaluate",
          "parameter" : [{
            "valueString" : "'urn:uuid:' + %practitionerRole.id"
          }]
        }],
        "rule" : [{
          "name" : "organizationBase",
          "source" : [{
            "context" : "representedOrganization"
          }],
          "dependent" : [{
            "name" : "MapCDAOrganizationToOrganization",
            "variable" : ["representedOrganization", "organization"]
          }]
        },
        {
          "name" : "organizationFR",
          "source" : [{
            "context" : "representedOrganization"
          }],
          "dependent" : [{
            "name" : "MapCDAOrganizationToFrenchOrganization",
            "variable" : ["representedOrganization", "organization"]
          }]
        },
        {
          "name" : "roleBase",
          "source" : [{
            "context" : "assignedEntity"
          }],
          "dependent" : [{
            "name" : "MapCDAAssignedEntityToPractitionerRole",
            "variable" : ["assignedEntity",
            "practitionerRole",
            "practitioner",
            "organization"]
          }]
        },
        {
          "name" : "roleFR",
          "source" : [{
            "context" : "assignedEntity"
          }],
          "dependent" : [{
            "name" : "MapCDAAssignedEntityToFrenchPractitionerRole",
            "variable" : ["assignedEntity",
            "practitionerRole",
            "practitioner",
            "organization"]
          }]
        },
        {
          "name" : "performerRole",
          "source" : [{
            "context" : "assignedEntity"
          }],
          "target" : [{
            "context" : "fhirProcedure",
            "contextType" : "variable",
            "element" : "performer",
            "variable" : "performer"
          },
          {
            "context" : "performer",
            "contextType" : "variable",
            "element" : "actor",
            "variable" : "actorRef",
            "transform" : "create",
            "parameter" : [{
              "valueString" : "Reference"
            }]
          },
          {
            "context" : "actorRef",
            "contextType" : "variable",
            "element" : "reference",
            "transform" : "evaluate",
            "parameter" : [{
              "valueString" : "'urn:uuid:' + %practitionerRole.id"
            }]
          }]
        }]
      },
      {
        "name" : "performerPractitionerOnly",
        "source" : [{
          "context" : "assignedEntity",
          "condition" : "assignedEntity.representedOrganization.empty()"
        }],
        "target" : [{
          "context" : "fhirProcedure",
          "contextType" : "variable",
          "element" : "performer",
          "variable" : "performer"
        },
        {
          "context" : "performer",
          "contextType" : "variable",
          "element" : "actor",
          "variable" : "actorRef",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Reference"
          }]
        },
        {
          "context" : "actorRef",
          "contextType" : "variable",
          "element" : "reference",
          "transform" : "evaluate",
          "parameter" : [{
            "valueString" : "'urn:uuid:' + %practitioner.id"
          }]
        }]
      }]
    }]
  },
  {
    "name" : "PatientSummaryMedicationSection",
    "typeMode" : "none",
    "documentation" : "4. TRAITEMENTS",
    "input" : [{
      "name" : "section",
      "mode" : "source"
    },
    {
      "name" : "compSection",
      "mode" : "target"
    },
    {
      "name" : "bundle",
      "type" : "Bundle",
      "mode" : "target"
    },
    {
      "name" : "patient",
      "type" : "Patient",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "sectionTemplate",
      "source" : [{
        "context" : "section",
        "element" : "templateId",
        "variable" : "sectionTid"
      }],
      "rule" : [{
        "name" : "medicationSection",
        "source" : [{
          "context" : "sectionTid",
          "element" : "root",
          "variable" : "sectionRoot",
          "condition" : "sectionRoot = '1.2.250.1.213.1.1.2.143'"
        }],
        "rule" : [{
          "name" : "entry",
          "source" : [{
            "context" : "section",
            "element" : "entry",
            "variable" : "entry"
          }],
          "rule" : [{
            "name" : "substanceAdministration",
            "source" : [{
              "context" : "entry",
              "element" : "substanceAdministration",
              "variable" : "substanceAdministration"
            }],
            "rule" : [{
              "name" : "treatmentTemplate",
              "source" : [{
                "context" : "substanceAdministration",
                "element" : "templateId",
                "variable" : "treatmentTid"
              }],
              "rule" : [{
                "name" : "medicationStatement",
                "source" : [{
                  "context" : "treatmentTid",
                  "element" : "root",
                  "variable" : "treatmentRoot",
                  "condition" : "treatmentRoot = '1.2.250.1.213.1.1.3.42'"
                }],
                "target" : [{
                  "context" : "bundle",
                  "contextType" : "variable",
                  "element" : "entry",
                  "variable" : "medicationStatementEntry"
                },
                {
                  "context" : "medicationStatementEntry",
                  "contextType" : "variable",
                  "element" : "resource",
                  "variable" : "medicationStatement",
                  "transform" : "create",
                  "parameter" : [{
                    "valueString" : "MedicationStatement"
                  }]
                },
                {
                  "context" : "medicationStatement",
                  "contextType" : "variable",
                  "element" : "id",
                  "transform" : "uuid"
                },
                {
                  "context" : "medicationStatementEntry",
                  "contextType" : "variable",
                  "element" : "fullUrl",
                  "transform" : "evaluate",
                  "parameter" : [{
                    "valueString" : "'urn:uuid:' + %medicationStatement.id"
                  }]
                }],
                "dependent" : [{
                  "name" : "PatientSummaryMedicationStatementFromSubstanceAdministration",
                  "variable" : ["substanceAdministration",
                  "medicationStatement",
                  "compSection",
                  "bundle",
                  "patient"]
                }]
              }]
            }]
          }]
        }]
      }]
    }]
  },
  {
    "name" : "PatientSummaryMedicationStatementFromSubstanceAdministration",
    "typeMode" : "none",
    "documentation" : "Administration CDA -> MedicationStatement",
    "input" : [{
      "name" : "substanceAdministration",
      "mode" : "source"
    },
    {
      "name" : "medicationStatement",
      "type" : "MedicationStatement",
      "mode" : "target"
    },
    {
      "name" : "compSection",
      "mode" : "target"
    },
    {
      "name" : "bundle",
      "type" : "Bundle",
      "mode" : "target"
    },
    {
      "name" : "patient",
      "type" : "Patient",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "statusDefault",
      "source" : [{
        "context" : "substanceAdministration"
      }],
      "target" : [{
        "context" : "medicationStatement",
        "contextType" : "variable",
        "element" : "status",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "unknown"
        }]
      }]
    },
    {
      "name" : "status",
      "source" : [{
        "context" : "substanceAdministration",
        "element" : "statusCode",
        "variable" : "statusCode"
      }],
      "dependent" : [{
        "name" : "MedicationStatementStatusFromCdaStatus",
        "variable" : ["statusCode", "medicationStatement"]
      }]
    },
    {
      "name" : "identifier",
      "source" : [{
        "context" : "substanceAdministration",
        "element" : "id",
        "variable" : "id"
      }],
      "target" : [{
        "context" : "medicationStatement",
        "contextType" : "variable",
        "element" : "identifier",
        "variable" : "identifier",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Identifier"
        }]
      }],
      "dependent" : [{
        "name" : "II",
        "variable" : ["id", "identifier"]
      }]
    },
    {
      "name" : "subject",
      "source" : [{
        "context" : "substanceAdministration"
      }],
      "target" : [{
        "context" : "medicationStatement",
        "contextType" : "variable",
        "element" : "subject",
        "variable" : "subjectRef",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Reference"
        }]
      },
      {
        "context" : "subjectRef",
        "contextType" : "variable",
        "element" : "reference",
        "transform" : "evaluate",
        "parameter" : [{
          "valueString" : "'urn:uuid:' + %patient.id"
        }]
      }]
    },
    {
      "name" : "category",
      "source" : [{
        "context" : "substanceAdministration",
        "element" : "code",
        "variable" : "treatmentCode"
      }],
      "target" : [{
        "context" : "medicationStatement",
        "contextType" : "variable",
        "element" : "category",
        "variable" : "category",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "dependent" : [{
        "name" : "CDCodeableConcept",
        "variable" : ["treatmentCode", "category"]
      }]
    },
    {
      "name" : "medication",
      "source" : [{
        "context" : "substanceAdministration",
        "element" : "consumable",
        "variable" : "consumable"
      }],
      "dependent" : [{
        "name" : "MedicationResourceFromConsumable",
        "variable" : ["consumable", "medicationStatement", "bundle"]
      }]
    },
    {
      "name" : "effective",
      "source" : [{
        "context" : "substanceAdministration",
        "element" : "effectiveTime",
        "variable" : "effectiveTime"
      }],
      "dependent" : [{
        "name" : "MedicationStatementEffectiveFromEffectiveTime",
        "variable" : ["effectiveTime", "medicationStatement"]
      }]
    },
    {
      "name" : "mainDosage",
      "source" : [{
        "context" : "substanceAdministration"
      }],
      "dependent" : [{
        "name" : "MedicationMainDosageFromSubstanceAdministration",
        "variable" : ["substanceAdministration", "medicationStatement"]
      }]
    },
    {
      "name" : "entryRelationship",
      "source" : [{
        "context" : "substanceAdministration",
        "element" : "entryRelationship",
        "variable" : "er"
      }],
      "dependent" : [{
        "name" : "MedicationEntryRelationship",
        "variable" : ["er", "medicationStatement"]
      }]
    },
    {
      "name" : "childTreatment",
      "source" : [{
        "context" : "substanceAdministration",
        "element" : "entryRelationship",
        "variable" : "er",
        "condition" : "er.typeCode = 'COMP'"
      }],
      "rule" : [{
        "name" : "childDosage",
        "source" : [{
          "context" : "er",
          "element" : "substanceAdministration",
          "variable" : "childAdministration"
        }],
        "target" : [{
          "context" : "medicationStatement",
          "contextType" : "variable",
          "element" : "dosage",
          "variable" : "childDosage"
        }],
        "dependent" : [{
          "name" : "MedicationChildDosageFromSubstanceAdministration",
          "variable" : ["childAdministration", "substanceAdministration", "childDosage"]
        }]
      }]
    },
    {
      "name" : "sectionEntry",
      "source" : [{
        "context" : "substanceAdministration"
      }],
      "target" : [{
        "context" : "compSection",
        "contextType" : "variable",
        "element" : "entry",
        "variable" : "sectionRef",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Reference"
        }]
      },
      {
        "context" : "sectionRef",
        "contextType" : "variable",
        "element" : "reference",
        "transform" : "evaluate",
        "parameter" : [{
          "valueString" : "'urn:uuid:' + %medicationStatement.id"
        }]
      }]
    }]
  },
  {
    "name" : "MedicationStatementStatusFromCdaStatus",
    "typeMode" : "none",
    "documentation" : "Statut CDA -> MedicationStatement.status",
    "input" : [{
      "name" : "statusCode",
      "mode" : "source"
    },
    {
      "name" : "medicationStatement",
      "type" : "MedicationStatement",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "completed",
      "source" : [{
        "context" : "statusCode",
        "element" : "code",
        "variable" : "code",
        "condition" : "code = 'completed'"
      }],
      "target" : [{
        "context" : "medicationStatement",
        "contextType" : "variable",
        "element" : "status",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "completed"
        }]
      }]
    },
    {
      "name" : "active",
      "source" : [{
        "context" : "statusCode",
        "element" : "code",
        "variable" : "code",
        "condition" : "code = 'active'"
      }],
      "target" : [{
        "context" : "medicationStatement",
        "contextType" : "variable",
        "element" : "status",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "active"
        }]
      }]
    },
    {
      "name" : "aborted",
      "source" : [{
        "context" : "statusCode",
        "element" : "code",
        "variable" : "code",
        "condition" : "code = 'aborted'"
      }],
      "target" : [{
        "context" : "medicationStatement",
        "contextType" : "variable",
        "element" : "status",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "stopped"
        }]
      }]
    },
    {
      "name" : "cancelled",
      "source" : [{
        "context" : "statusCode",
        "element" : "code",
        "variable" : "code",
        "condition" : "code = 'cancelled'"
      }],
      "target" : [{
        "context" : "medicationStatement",
        "contextType" : "variable",
        "element" : "status",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "stopped"
        }]
      }]
    },
    {
      "name" : "suspended",
      "source" : [{
        "context" : "statusCode",
        "element" : "code",
        "variable" : "code",
        "condition" : "code = 'suspended'"
      }],
      "target" : [{
        "context" : "medicationStatement",
        "contextType" : "variable",
        "element" : "status",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "on-hold"
        }]
      }]
    }]
  },
  {
    "name" : "MedicationResourceFromConsumable",
    "typeMode" : "none",
    "documentation" : "Produit de santé CDA -> Medication + référence depuis MedicationStatement",
    "input" : [{
      "name" : "consumable",
      "mode" : "source"
    },
    {
      "name" : "medicationStatement",
      "type" : "MedicationStatement",
      "mode" : "target"
    },
    {
      "name" : "bundle",
      "type" : "Bundle",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "manufacturedProduct",
      "source" : [{
        "context" : "consumable",
        "element" : "manufacturedProduct",
        "variable" : "manufacturedProduct"
      }],
      "rule" : [{
        "name" : "medication",
        "source" : [{
          "context" : "manufacturedProduct",
          "element" : "manufacturedMaterial",
          "variable" : "manufacturedMaterial"
        }],
        "target" : [{
          "context" : "bundle",
          "contextType" : "variable",
          "element" : "entry",
          "variable" : "medicationEntry"
        },
        {
          "context" : "medicationEntry",
          "contextType" : "variable",
          "element" : "resource",
          "variable" : "medication",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Medication"
          }]
        },
        {
          "context" : "medication",
          "contextType" : "variable",
          "element" : "id",
          "transform" : "uuid"
        },
        {
          "context" : "medicationEntry",
          "contextType" : "variable",
          "element" : "fullUrl",
          "transform" : "evaluate",
          "parameter" : [{
            "valueString" : "'urn:uuid:' + %medication.id"
          }]
        }],
        "rule" : [{
          "name" : "medicationContent",
          "source" : [{
            "context" : "manufacturedMaterial"
          }],
          "dependent" : [{
            "name" : "MedicationFromManufacturedMaterial",
            "variable" : ["manufacturedMaterial", "medication"]
          }]
        },
        {
          "name" : "medicationReference",
          "source" : [{
            "context" : "manufacturedMaterial"
          }],
          "target" : [{
            "context" : "medicationStatement",
            "contextType" : "variable",
            "element" : "medication",
            "variable" : "medicationRef",
            "transform" : "create",
            "parameter" : [{
              "valueString" : "Reference"
            }]
          },
          {
            "context" : "medicationRef",
            "contextType" : "variable",
            "element" : "reference",
            "transform" : "evaluate",
            "parameter" : [{
              "valueString" : "'urn:uuid:' + %medication.id"
            }]
          }]
        }]
      }]
    }]
  },
  {
    "name" : "MedicationFromManufacturedMaterial",
    "typeMode" : "none",
    "documentation" : "Contenu du médicament",
    "input" : [{
      "name" : "manufacturedMaterial",
      "mode" : "source"
    },
    {
      "name" : "medication",
      "type" : "Medication",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "code",
      "source" : [{
        "context" : "manufacturedMaterial",
        "element" : "code",
        "variable" : "medicationCode"
      }],
      "target" : [{
        "context" : "medication",
        "contextType" : "variable",
        "element" : "code",
        "variable" : "code",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "dependent" : [{
        "name" : "CDCodeableConcept",
        "variable" : ["medicationCode", "code"]
      }]
    },
    {
      "name" : "nameOnly",
      "source" : [{
        "context" : "manufacturedMaterial",
        "element" : "name",
        "variable" : "medicationName",
        "condition" : "manufacturedMaterial.code.empty()"
      }],
      "target" : [{
        "context" : "medication",
        "contextType" : "variable",
        "element" : "code",
        "variable" : "code",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "rule" : [{
        "name" : "codeText",
        "source" : [{
          "context" : "medicationName",
          "element" : "xmlText",
          "variable" : "nameText"
        }],
        "target" : [{
          "context" : "code",
          "contextType" : "variable",
          "element" : "text",
          "transform" : "cast",
          "parameter" : [{
            "valueId" : "nameText"
          },
          {
            "valueString" : "string"
          }]
        }]
      }]
    },
    {
      "name" : "form",
      "source" : [{
        "context" : "manufacturedMaterial",
        "element" : "pharm:formCode",
        "variable" : "formCode"
      }],
      "target" : [{
        "context" : "medication",
        "contextType" : "variable",
        "element" : "form",
        "variable" : "form",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "dependent" : [{
        "name" : "CDCodeableConcept",
        "variable" : ["formCode", "form"]
      }]
    },
    {
      "name" : "ingredient",
      "source" : [{
        "context" : "manufacturedMaterial",
        "element" : "pharm:ingredient",
        "variable" : "ingredient"
      }],
      "dependent" : [{
        "name" : "MedicationIngredientFromPharmIngredient",
        "variable" : ["ingredient", "medication"]
      }]
    }]
  },
  {
    "name" : "MedicationIngredientFromPharmIngredient",
    "typeMode" : "none",
    "documentation" : "Ingrédient pharmaceutique",
    "input" : [{
      "name" : "ingredient",
      "mode" : "source"
    },
    {
      "name" : "medication",
      "type" : "Medication",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "innerIngredient",
      "source" : [{
        "context" : "ingredient",
        "element" : "pharm:ingredient",
        "variable" : "innerIngredient"
      }],
      "rule" : [{
        "name" : "ingredient",
        "source" : [{
          "context" : "innerIngredient",
          "element" : "pharm:code",
          "variable" : "ingredientCode"
        }],
        "target" : [{
          "context" : "medication",
          "contextType" : "variable",
          "element" : "ingredient",
          "variable" : "fhirIngredient"
        },
        {
          "context" : "fhirIngredient",
          "contextType" : "variable",
          "element" : "item",
          "variable" : "item",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "CodeableConcept"
          }]
        }],
        "rule" : [{
          "name" : "ingredientCode",
          "source" : [{
            "context" : "ingredientCode"
          }],
          "dependent" : [{
            "name" : "CDCodeableConcept",
            "variable" : ["ingredientCode", "item"]
          }]
        },
        {
          "name" : "strength",
          "source" : [{
            "context" : "ingredient",
            "element" : "pharm:quantity",
            "variable" : "quantity"
          }],
          "dependent" : [{
            "name" : "MedicationIngredientStrengthFromPharmQuantity",
            "variable" : ["quantity", "fhirIngredient"]
          }]
        }]
      }]
    }]
  },
  {
    "name" : "MedicationIngredientStrengthFromPharmQuantity",
    "typeMode" : "none",
    "documentation" : "Dosage de l’ingrédient",
    "input" : [{
      "name" : "quantity",
      "mode" : "source"
    },
    {
      "name" : "fhirIngredient",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "strength",
      "source" : [{
        "context" : "quantity",
        "element" : "numerator",
        "variable" : "numerator"
      }],
      "target" : [{
        "context" : "fhirIngredient",
        "contextType" : "variable",
        "element" : "strength",
        "variable" : "strength",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Ratio"
        }]
      }],
      "rule" : [{
        "name" : "numerator",
        "source" : [{
          "context" : "numerator"
        }],
        "target" : [{
          "context" : "strength",
          "contextType" : "variable",
          "element" : "numerator",
          "variable" : "numeratorQuantity",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Quantity"
          }]
        }],
        "rule" : [{
          "name" : "numeratorValue",
          "source" : [{
            "context" : "numerator",
            "element" : "value",
            "variable" : "value"
          }],
          "target" : [{
            "context" : "numeratorQuantity",
            "contextType" : "variable",
            "element" : "value",
            "transform" : "cast",
            "parameter" : [{
              "valueId" : "value"
            },
            {
              "valueString" : "decimal"
            }]
          }]
        },
        {
          "name" : "numeratorUnit",
          "source" : [{
            "context" : "numerator",
            "element" : "unit",
            "variable" : "unit"
          }],
          "target" : [{
            "context" : "numeratorQuantity",
            "contextType" : "variable",
            "element" : "unit",
            "transform" : "cast",
            "parameter" : [{
              "valueId" : "unit"
            },
            {
              "valueString" : "string"
            }]
          }]
        }]
      },
      {
        "name" : "denominator",
        "source" : [{
          "context" : "quantity",
          "element" : "denominator",
          "variable" : "denominator"
        }],
        "target" : [{
          "context" : "strength",
          "contextType" : "variable",
          "element" : "denominator",
          "variable" : "denominatorQuantity",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Quantity"
          }]
        }],
        "rule" : [{
          "name" : "denominatorValue",
          "source" : [{
            "context" : "denominator",
            "element" : "value",
            "variable" : "value"
          }],
          "target" : [{
            "context" : "denominatorQuantity",
            "contextType" : "variable",
            "element" : "value",
            "transform" : "cast",
            "parameter" : [{
              "valueId" : "value"
            },
            {
              "valueString" : "decimal"
            }]
          }]
        },
        {
          "name" : "denominatorUnit",
          "source" : [{
            "context" : "denominator",
            "element" : "unit",
            "variable" : "unit"
          }],
          "target" : [{
            "context" : "denominatorQuantity",
            "contextType" : "variable",
            "element" : "unit",
            "transform" : "cast",
            "parameter" : [{
              "valueId" : "unit"
            },
            {
              "valueString" : "string"
            }]
          }]
        }]
      }]
    }]
  },
  {
    "name" : "MedicationStatementEffectiveFromEffectiveTime",
    "typeMode" : "none",
    "documentation" : "Période du traitement",
    "input" : [{
      "name" : "effectiveTime",
      "mode" : "source"
    },
    {
      "name" : "medicationStatement",
      "type" : "MedicationStatement",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "periodByLow",
      "source" : [{
        "context" : "effectiveTime",
        "element" : "low",
        "variable" : "low"
      }],
      "target" : [{
        "context" : "medicationStatement",
        "contextType" : "variable",
        "element" : "effective",
        "variable" : "period",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Period"
        }]
      }],
      "rule" : [{
        "name" : "start",
        "source" : [{
          "context" : "low"
        }],
        "target" : [{
          "context" : "period",
          "contextType" : "variable",
          "element" : "start",
          "variable" : "start",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "dateTime"
          }]
        }],
        "dependent" : [{
          "name" : "TSDateTime",
          "variable" : ["low", "start"]
        }]
      },
      {
        "name" : "high",
        "source" : [{
          "context" : "effectiveTime",
          "element" : "high",
          "variable" : "high"
        }],
        "rule" : [{
          "name" : "end",
          "source" : [{
            "context" : "high",
            "element" : "value",
            "variable" : "value"
          }],
          "target" : [{
            "context" : "period",
            "contextType" : "variable",
            "element" : "end",
            "variable" : "end",
            "transform" : "create",
            "parameter" : [{
              "valueString" : "dateTime"
            }]
          }],
          "dependent" : [{
            "name" : "TSDateTime",
            "variable" : ["high", "end"]
          }]
        }]
      }]
    },
    {
      "name" : "periodByHigh",
      "source" : [{
        "context" : "effectiveTime",
        "element" : "high",
        "variable" : "high",
        "condition" : "effectiveTime.low.empty()"
      }],
      "rule" : [{
        "name" : "period",
        "source" : [{
          "context" : "high",
          "element" : "value",
          "variable" : "value"
        }],
        "target" : [{
          "context" : "medicationStatement",
          "contextType" : "variable",
          "element" : "effective",
          "variable" : "period",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Period"
          }]
        }],
        "rule" : [{
          "name" : "endOnly",
          "source" : [{
            "context" : "high"
          }],
          "target" : [{
            "context" : "period",
            "contextType" : "variable",
            "element" : "end",
            "variable" : "end",
            "transform" : "create",
            "parameter" : [{
              "valueString" : "dateTime"
            }]
          }],
          "dependent" : [{
            "name" : "TSDateTime",
            "variable" : ["high", "end"]
          }]
        }]
      }]
    }]
  },
  {
    "name" : "MedicationMainDosageFromSubstanceAdministration",
    "typeMode" : "none",
    "documentation" : "Création conditionnelle du dosage principal",
    "input" : [{
      "name" : "substanceAdministration",
      "mode" : "source"
    },
    {
      "name" : "medicationStatement",
      "type" : "MedicationStatement",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "dosageByRoute",
      "source" : [{
        "context" : "substanceAdministration",
        "element" : "routeCode",
        "variable" : "routeCode"
      }],
      "target" : [{
        "context" : "medicationStatement",
        "contextType" : "variable",
        "element" : "dosage",
        "variable" : "dosage"
      }],
      "dependent" : [{
        "name" : "MedicationMainDosageContent",
        "variable" : ["substanceAdministration", "dosage"]
      }]
    },
    {
      "name" : "dosageByDose",
      "source" : [{
        "context" : "substanceAdministration",
        "element" : "doseQuantity",
        "variable" : "doseQuantity",
        "condition" : "substanceAdministration.routeCode.empty()"
      }],
      "rule" : [{
        "name" : "dosageByDoseLow",
        "source" : [{
          "context" : "doseQuantity",
          "element" : "low",
          "variable" : "low"
        }],
        "target" : [{
          "context" : "medicationStatement",
          "contextType" : "variable",
          "element" : "dosage",
          "variable" : "dosage"
        }],
        "dependent" : [{
          "name" : "MedicationMainDosageContent",
          "variable" : ["substanceAdministration", "dosage"]
        }]
      },
      {
        "name" : "dosageByDoseHigh",
        "source" : [{
          "context" : "doseQuantity",
          "element" : "high",
          "variable" : "high",
          "condition" : "doseQuantity.low.empty()"
        }],
        "target" : [{
          "context" : "medicationStatement",
          "contextType" : "variable",
          "element" : "dosage",
          "variable" : "dosage"
        }],
        "dependent" : [{
          "name" : "MedicationMainDosageContent",
          "variable" : ["substanceAdministration", "dosage"]
        }]
      }]
    },
    {
      "name" : "dosageByRate",
      "source" : [{
        "context" : "substanceAdministration",
        "element" : "rateQuantity",
        "variable" : "rateQuantity",
        "condition" : "substanceAdministration.routeCode.empty() and substanceAdministration.doseQuantity.empty()"
      }],
      "rule" : [{
        "name" : "dosageByRateLow",
        "source" : [{
          "context" : "rateQuantity",
          "element" : "low",
          "variable" : "low"
        }],
        "target" : [{
          "context" : "medicationStatement",
          "contextType" : "variable",
          "element" : "dosage",
          "variable" : "dosage"
        }],
        "dependent" : [{
          "name" : "MedicationMainDosageContent",
          "variable" : ["substanceAdministration", "dosage"]
        }]
      },
      {
        "name" : "dosageByRateHigh",
        "source" : [{
          "context" : "rateQuantity",
          "element" : "high",
          "variable" : "high",
          "condition" : "rateQuantity.low.empty()"
        }],
        "target" : [{
          "context" : "medicationStatement",
          "contextType" : "variable",
          "element" : "dosage",
          "variable" : "dosage"
        }],
        "dependent" : [{
          "name" : "MedicationMainDosageContent",
          "variable" : ["substanceAdministration", "dosage"]
        }]
      }]
    },
    {
      "name" : "dosageByTiming",
      "source" : [{
        "context" : "substanceAdministration",
        "element" : "effectiveTime",
        "variable" : "effectiveTime",
        "condition" : "substanceAdministration.routeCode.empty() and substanceAdministration.doseQuantity.empty() and substanceAdministration.rateQuantity.empty()"
      }],
      "rule" : [{
        "name" : "dosageByTiming",
        "source" : [{
          "context" : "effectiveTime",
          "element" : "period",
          "variable" : "period"
        }],
        "target" : [{
          "context" : "medicationStatement",
          "contextType" : "variable",
          "element" : "dosage",
          "variable" : "dosage"
        }],
        "dependent" : [{
          "name" : "MedicationMainDosageContent",
          "variable" : ["substanceAdministration", "dosage"]
        }]
      }]
    },
    {
      "name" : "dosageByMaxDose",
      "source" : [{
        "context" : "substanceAdministration",
        "element" : "maxDoseQuantity",
        "variable" : "maxDoseQuantity",
        "condition" : "substanceAdministration.routeCode.empty() and substanceAdministration.doseQuantity.empty() and substanceAdministration.rateQuantity.empty()"
      }],
      "rule" : [{
        "name" : "numerator",
        "source" : [{
          "context" : "maxDoseQuantity",
          "element" : "numerator",
          "variable" : "numerator"
        }],
        "rule" : [{
          "name" : "dosageByMaxDose",
          "source" : [{
            "context" : "numerator",
            "element" : "value",
            "variable" : "value"
          }],
          "target" : [{
            "context" : "medicationStatement",
            "contextType" : "variable",
            "element" : "dosage",
            "variable" : "dosage"
          }],
          "dependent" : [{
            "name" : "MedicationMainDosageContent",
            "variable" : ["substanceAdministration", "dosage"]
          }]
        }]
      }]
    }]
  },
  {
    "name" : "MedicationMainDosageContent",
    "typeMode" : "none",
    "documentation" : "Contenu du dosage",
    "input" : [{
      "name" : "substanceAdministration",
      "mode" : "source"
    },
    {
      "name" : "dosage",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "timing",
      "source" : [{
        "context" : "substanceAdministration",
        "element" : "effectiveTime",
        "variable" : "effectiveTime"
      }],
      "dependent" : [{
        "name" : "MedicationDosageTimingFromEffectiveTime",
        "variable" : ["effectiveTime", "dosage"]
      }]
    },
    {
      "name" : "route",
      "source" : [{
        "context" : "substanceAdministration",
        "element" : "routeCode",
        "variable" : "routeCode"
      }],
      "target" : [{
        "context" : "dosage",
        "contextType" : "variable",
        "element" : "route",
        "variable" : "route",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "dependent" : [{
        "name" : "CDCodeableConcept",
        "variable" : ["routeCode", "route"]
      }]
    },
    {
      "name" : "dose",
      "source" : [{
        "context" : "substanceAdministration",
        "element" : "doseQuantity",
        "variable" : "doseQuantity"
      }],
      "dependent" : [{
        "name" : "MedicationDosageDoseFromDoseQuantity",
        "variable" : ["doseQuantity", "dosage"]
      }]
    },
    {
      "name" : "rate",
      "source" : [{
        "context" : "substanceAdministration",
        "element" : "rateQuantity",
        "variable" : "rateQuantity"
      }],
      "dependent" : [{
        "name" : "MedicationDosageRateFromRateQuantity",
        "variable" : ["rateQuantity", "dosage"]
      }]
    },
    {
      "name" : "maxDose",
      "source" : [{
        "context" : "substanceAdministration",
        "element" : "maxDoseQuantity",
        "variable" : "maxDoseQuantity"
      }],
      "dependent" : [{
        "name" : "MedicationDosageMaxDoseFromMaxDoseQuantity",
        "variable" : ["maxDoseQuantity", "dosage"]
      }]
    }]
  },
  {
    "name" : "MedicationDosageTimingFromEffectiveTime",
    "typeMode" : "none",
    "documentation" : "Fréquence / rythme",
    "input" : [{
      "name" : "effectiveTime",
      "mode" : "source"
    },
    {
      "name" : "dosage",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "timing",
      "source" : [{
        "context" : "effectiveTime",
        "element" : "period",
        "variable" : "period"
      }],
      "target" : [{
        "context" : "dosage",
        "contextType" : "variable",
        "element" : "timing",
        "variable" : "timing",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Timing"
        }]
      }],
      "rule" : [{
        "name" : "repeat",
        "source" : [{
          "context" : "period"
        }],
        "target" : [{
          "context" : "timing",
          "contextType" : "variable",
          "element" : "repeat",
          "variable" : "repeat"
        }],
        "rule" : [{
          "name" : "periodValue",
          "source" : [{
            "context" : "period",
            "element" : "value",
            "variable" : "value"
          }],
          "target" : [{
            "context" : "repeat",
            "contextType" : "variable",
            "element" : "period",
            "transform" : "cast",
            "parameter" : [{
              "valueId" : "value"
            },
            {
              "valueString" : "decimal"
            }]
          }]
        },
        {
          "name" : "periodUnit",
          "source" : [{
            "context" : "period",
            "element" : "unit",
            "variable" : "unit"
          }],
          "target" : [{
            "context" : "repeat",
            "contextType" : "variable",
            "element" : "periodUnit",
            "transform" : "cast",
            "parameter" : [{
              "valueId" : "unit"
            },
            {
              "valueString" : "code"
            }]
          }]
        }]
      },
      {
        "name" : "translation",
        "source" : [{
          "context" : "period",
          "element" : "translation",
          "variable" : "translation"
        }],
        "rule" : [{
          "name" : "originalText",
          "source" : [{
            "context" : "translation",
            "element" : "originalText",
            "variable" : "originalText"
          }],
          "rule" : [{
            "name" : "reference",
            "source" : [{
              "context" : "originalText",
              "element" : "reference",
              "variable" : "ref"
            }],
            "rule" : [{
              "name" : "dosageText",
              "source" : [{
                "context" : "ref",
                "element" : "value",
                "variable" : "value"
              }],
              "target" : [{
                "context" : "dosage",
                "contextType" : "variable",
                "element" : "text",
                "transform" : "cast",
                "parameter" : [{
                  "valueId" : "value"
                },
                {
                  "valueString" : "string"
                }]
              }]
            }]
          }]
        }]
      }]
    }]
  },
  {
    "name" : "MedicationDosageDoseFromDoseQuantity",
    "typeMode" : "none",
    "documentation" : "Dose",
    "input" : [{
      "name" : "doseQuantity",
      "mode" : "source"
    },
    {
      "name" : "dosage",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "doseRangeByLow",
      "source" : [{
        "context" : "doseQuantity",
        "element" : "low",
        "variable" : "low"
      }],
      "target" : [{
        "context" : "dosage",
        "contextType" : "variable",
        "element" : "doseAndRate",
        "variable" : "doseAndRate"
      },
      {
        "context" : "doseAndRate",
        "contextType" : "variable",
        "element" : "dose",
        "variable" : "doseRange",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Range"
        }]
      }],
      "dependent" : [{
        "name" : "MedicationRangeFromLowHigh",
        "variable" : ["doseQuantity", "doseRange"]
      }]
    },
    {
      "name" : "doseRangeByHigh",
      "source" : [{
        "context" : "doseQuantity",
        "element" : "high",
        "variable" : "high",
        "condition" : "doseQuantity.low.empty()"
      }],
      "target" : [{
        "context" : "dosage",
        "contextType" : "variable",
        "element" : "doseAndRate",
        "variable" : "doseAndRate"
      },
      {
        "context" : "doseAndRate",
        "contextType" : "variable",
        "element" : "dose",
        "variable" : "doseRange",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Range"
        }]
      }],
      "dependent" : [{
        "name" : "MedicationRangeFromLowHigh",
        "variable" : ["doseQuantity", "doseRange"]
      }]
    }]
  },
  {
    "name" : "MedicationDosageRateFromRateQuantity",
    "typeMode" : "none",
    "documentation" : "Rythme / débit",
    "input" : [{
      "name" : "rateQuantity",
      "mode" : "source"
    },
    {
      "name" : "dosage",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "rateRangeByLow",
      "source" : [{
        "context" : "rateQuantity",
        "element" : "low",
        "variable" : "low"
      }],
      "target" : [{
        "context" : "dosage",
        "contextType" : "variable",
        "element" : "doseAndRate",
        "variable" : "doseAndRate"
      },
      {
        "context" : "doseAndRate",
        "contextType" : "variable",
        "element" : "rate",
        "variable" : "rateRange",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Range"
        }]
      }],
      "dependent" : [{
        "name" : "MedicationRangeFromLowHigh",
        "variable" : ["rateQuantity", "rateRange"]
      }]
    },
    {
      "name" : "rateRangeByHigh",
      "source" : [{
        "context" : "rateQuantity",
        "element" : "high",
        "variable" : "high",
        "condition" : "rateQuantity.low.empty()"
      }],
      "target" : [{
        "context" : "dosage",
        "contextType" : "variable",
        "element" : "doseAndRate",
        "variable" : "doseAndRate"
      },
      {
        "context" : "doseAndRate",
        "contextType" : "variable",
        "element" : "rate",
        "variable" : "rateRange",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Range"
        }]
      }],
      "dependent" : [{
        "name" : "MedicationRangeFromLowHigh",
        "variable" : ["rateQuantity", "rateRange"]
      }]
    }]
  },
  {
    "name" : "MedicationDosageMaxDoseFromMaxDoseQuantity",
    "typeMode" : "none",
    "documentation" : "Dose maximale",
    "input" : [{
      "name" : "maxDoseQuantity",
      "mode" : "source"
    },
    {
      "name" : "dosage",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "numerator",
      "source" : [{
        "context" : "maxDoseQuantity",
        "element" : "numerator",
        "variable" : "numerator"
      }],
      "rule" : [{
        "name" : "maxDose",
        "source" : [{
          "context" : "numerator",
          "element" : "value",
          "variable" : "value"
        }],
        "target" : [{
          "context" : "dosage",
          "contextType" : "variable",
          "element" : "maxDosePerPeriod",
          "variable" : "ratio",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Ratio"
          }]
        }],
        "dependent" : [{
          "name" : "MedicationRatioFromNumeratorDenominator",
          "variable" : ["maxDoseQuantity", "ratio"]
        }]
      }]
    }]
  },
  {
    "name" : "MedicationRangeFromLowHigh",
    "typeMode" : "none",
    "documentation" : "Range low/high",
    "input" : [{
      "name" : "srcQuantity",
      "mode" : "source"
    },
    {
      "name" : "range",
      "type" : "Range",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "low",
      "source" : [{
        "context" : "srcQuantity",
        "element" : "low",
        "variable" : "low"
      }],
      "rule" : [{
        "name" : "lowQuantity",
        "source" : [{
          "context" : "low",
          "element" : "value",
          "variable" : "value"
        }],
        "target" : [{
          "context" : "range",
          "contextType" : "variable",
          "element" : "low",
          "variable" : "lowQuantity",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Quantity"
          }]
        }],
        "rule" : [{
          "name" : "lowValue",
          "source" : [{
            "context" : "value"
          }],
          "target" : [{
            "context" : "lowQuantity",
            "contextType" : "variable",
            "element" : "value",
            "transform" : "cast",
            "parameter" : [{
              "valueId" : "value"
            },
            {
              "valueString" : "decimal"
            }]
          }]
        },
        {
          "name" : "lowUnit",
          "source" : [{
            "context" : "low",
            "element" : "unit",
            "variable" : "unit"
          }],
          "target" : [{
            "context" : "lowQuantity",
            "contextType" : "variable",
            "element" : "unit",
            "transform" : "cast",
            "parameter" : [{
              "valueId" : "unit"
            },
            {
              "valueString" : "string"
            }]
          }]
        }]
      }]
    },
    {
      "name" : "high",
      "source" : [{
        "context" : "srcQuantity",
        "element" : "high",
        "variable" : "high"
      }],
      "rule" : [{
        "name" : "highQuantity",
        "source" : [{
          "context" : "high",
          "element" : "value",
          "variable" : "value"
        }],
        "target" : [{
          "context" : "range",
          "contextType" : "variable",
          "element" : "high",
          "variable" : "highQuantity",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Quantity"
          }]
        }],
        "rule" : [{
          "name" : "highValue",
          "source" : [{
            "context" : "value"
          }],
          "target" : [{
            "context" : "highQuantity",
            "contextType" : "variable",
            "element" : "value",
            "transform" : "cast",
            "parameter" : [{
              "valueId" : "value"
            },
            {
              "valueString" : "decimal"
            }]
          }]
        },
        {
          "name" : "highUnit",
          "source" : [{
            "context" : "high",
            "element" : "unit",
            "variable" : "unit"
          }],
          "target" : [{
            "context" : "highQuantity",
            "contextType" : "variable",
            "element" : "unit",
            "transform" : "cast",
            "parameter" : [{
              "valueId" : "unit"
            },
            {
              "valueString" : "string"
            }]
          }]
        }]
      }]
    }]
  },
  {
    "name" : "MedicationRatioFromNumeratorDenominator",
    "typeMode" : "none",
    "documentation" : "Ratio numerator/denominator",
    "input" : [{
      "name" : "srcRatio",
      "mode" : "source"
    },
    {
      "name" : "ratio",
      "type" : "Ratio",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "numerator",
      "source" : [{
        "context" : "srcRatio",
        "element" : "numerator",
        "variable" : "numerator"
      }],
      "rule" : [{
        "name" : "numeratorQuantity",
        "source" : [{
          "context" : "numerator",
          "element" : "value",
          "variable" : "value"
        }],
        "target" : [{
          "context" : "ratio",
          "contextType" : "variable",
          "element" : "numerator",
          "variable" : "numeratorQuantity",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Quantity"
          }]
        }],
        "rule" : [{
          "name" : "numeratorValue",
          "source" : [{
            "context" : "value"
          }],
          "target" : [{
            "context" : "numeratorQuantity",
            "contextType" : "variable",
            "element" : "value",
            "transform" : "cast",
            "parameter" : [{
              "valueId" : "value"
            },
            {
              "valueString" : "decimal"
            }]
          }]
        },
        {
          "name" : "numeratorUnit",
          "source" : [{
            "context" : "numerator",
            "element" : "unit",
            "variable" : "unit"
          }],
          "target" : [{
            "context" : "numeratorQuantity",
            "contextType" : "variable",
            "element" : "unit",
            "transform" : "cast",
            "parameter" : [{
              "valueId" : "unit"
            },
            {
              "valueString" : "string"
            }]
          }]
        }]
      }]
    },
    {
      "name" : "denominator",
      "source" : [{
        "context" : "srcRatio",
        "element" : "denominator",
        "variable" : "denominator"
      }],
      "rule" : [{
        "name" : "denominatorQuantity",
        "source" : [{
          "context" : "denominator",
          "element" : "value",
          "variable" : "value"
        }],
        "target" : [{
          "context" : "ratio",
          "contextType" : "variable",
          "element" : "denominator",
          "variable" : "denominatorQuantity",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Quantity"
          }]
        }],
        "rule" : [{
          "name" : "denominatorValue",
          "source" : [{
            "context" : "value"
          }],
          "target" : [{
            "context" : "denominatorQuantity",
            "contextType" : "variable",
            "element" : "value",
            "transform" : "cast",
            "parameter" : [{
              "valueId" : "value"
            },
            {
              "valueString" : "decimal"
            }]
          }]
        },
        {
          "name" : "denominatorUnit",
          "source" : [{
            "context" : "denominator",
            "element" : "unit",
            "variable" : "unit"
          }],
          "target" : [{
            "context" : "denominatorQuantity",
            "contextType" : "variable",
            "element" : "unit",
            "transform" : "cast",
            "parameter" : [{
              "valueId" : "unit"
            },
            {
              "valueString" : "string"
            }]
          }]
        }]
      }]
    }]
  },
  {
    "name" : "MedicationEntryRelationship",
    "typeMode" : "none",
    "documentation" : "Motif et commentaire",
    "input" : [{
      "name" : "er",
      "mode" : "source"
    },
    {
      "name" : "medicationStatement",
      "type" : "MedicationStatement",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "reasonAct",
      "source" : [{
        "context" : "er",
        "element" : "act",
        "variable" : "reasonAct",
        "condition" : "er.typeCode = 'RSON'"
      }],
      "rule" : [{
        "name" : "reasonTemplate",
        "source" : [{
          "context" : "reasonAct",
          "element" : "templateId",
          "variable" : "tid"
        }],
        "rule" : [{
          "name" : "reason",
          "source" : [{
            "context" : "tid",
            "element" : "root",
            "variable" : "root",
            "condition" : "root = '1.2.250.1.213.1.1.3.36'"
          }],
          "dependent" : [{
            "name" : "MedicationReasonFromAct",
            "variable" : ["reasonAct", "medicationStatement"]
          }]
        }]
      }]
    },
    {
      "name" : "commentAct",
      "source" : [{
        "context" : "er",
        "element" : "act",
        "variable" : "commentAct",
        "condition" : "er.typeCode = 'SUBJ'"
      }],
      "rule" : [{
        "name" : "commentTemplate",
        "source" : [{
          "context" : "commentAct",
          "element" : "templateId",
          "variable" : "tid"
        }],
        "rule" : [{
          "name" : "commentNotMapped",
          "source" : [{
            "context" : "tid",
            "element" : "root",
            "variable" : "root",
            "condition" : "root = '1.2.250.1.213.1.1.3.32'"
          }]
        }]
      }]
    }]
  },
  {
    "name" : "MedicationReasonFromAct",
    "typeMode" : "none",
    "documentation" : "Motif du traitement",
    "input" : [{
      "name" : "reasonAct",
      "mode" : "source"
    },
    {
      "name" : "medicationStatement",
      "type" : "MedicationStatement",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "reasonCode",
      "source" : [{
        "context" : "reasonAct",
        "element" : "code",
        "variable" : "reasonCode"
      }],
      "target" : [{
        "context" : "medicationStatement",
        "contextType" : "variable",
        "element" : "reasonCode",
        "variable" : "reason",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "dependent" : [{
        "name" : "CDCodeableConcept",
        "variable" : ["reasonCode", "reason"]
      }]
    }]
  },
  {
    "name" : "MedicationChildDosageFromSubstanceAdministration",
    "typeMode" : "none",
    "documentation" : "Posologie subordonnée",
    "input" : [{
      "name" : "childAdministration",
      "mode" : "source"
    },
    {
      "name" : "parentAdministration",
      "mode" : "source"
    },
    {
      "name" : "childDosage",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "childTiming",
      "source" : [{
        "context" : "childAdministration",
        "element" : "effectiveTime",
        "variable" : "childEffectiveTime"
      }],
      "dependent" : [{
        "name" : "MedicationChildTimingFromEffectiveTime",
        "variable" : ["childEffectiveTime", "childDosage"]
      }]
    },
    {
      "name" : "childRoute",
      "source" : [{
        "context" : "parentAdministration",
        "element" : "routeCode",
        "variable" : "routeCode"
      }],
      "target" : [{
        "context" : "childDosage",
        "contextType" : "variable",
        "element" : "route",
        "variable" : "route",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "dependent" : [{
        "name" : "CDCodeableConcept",
        "variable" : ["routeCode", "route"]
      }]
    },
    {
      "name" : "childDose",
      "source" : [{
        "context" : "childAdministration",
        "element" : "doseQuantity",
        "variable" : "doseQuantity"
      }],
      "dependent" : [{
        "name" : "MedicationDosageDoseFromDoseQuantity",
        "variable" : ["doseQuantity", "childDosage"]
      }]
    },
    {
      "name" : "childRate",
      "source" : [{
        "context" : "childAdministration",
        "element" : "rateQuantity",
        "variable" : "rateQuantity"
      }],
      "dependent" : [{
        "name" : "MedicationDosageRateFromRateQuantity",
        "variable" : ["rateQuantity", "childDosage"]
      }]
    }]
  },
  {
    "name" : "MedicationChildTimingFromEffectiveTime",
    "typeMode" : "none",
    "documentation" : "Rythme de la posologie subordonnée",
    "input" : [{
      "name" : "childEffectiveTime",
      "mode" : "source"
    },
    {
      "name" : "childDosage",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "timing",
      "source" : [{
        "context" : "childEffectiveTime"
      }],
      "target" : [{
        "context" : "childDosage",
        "contextType" : "variable",
        "element" : "timing",
        "variable" : "timing",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Timing"
        }]
      }],
      "rule" : [{
        "name" : "repeat",
        "source" : [{
          "context" : "childEffectiveTime"
        }],
        "target" : [{
          "context" : "timing",
          "contextType" : "variable",
          "element" : "repeat",
          "variable" : "repeat"
        }],
        "rule" : [{
          "name" : "comp",
          "source" : [{
            "context" : "childEffectiveTime",
            "element" : "comp",
            "variable" : "comp"
          }],
          "rule" : [{
            "name" : "bounds",
            "source" : [{
              "context" : "comp",
              "element" : "low",
              "variable" : "low"
            }],
            "target" : [{
              "context" : "repeat",
              "contextType" : "variable",
              "element" : "bounds",
              "variable" : "boundsPeriod",
              "transform" : "create",
              "parameter" : [{
                "valueString" : "Period"
              }]
            }],
            "rule" : [{
              "name" : "boundsStart",
              "source" : [{
                "context" : "low"
              }],
              "target" : [{
                "context" : "boundsPeriod",
                "contextType" : "variable",
                "element" : "start",
                "variable" : "start",
                "transform" : "create",
                "parameter" : [{
                  "valueString" : "dateTime"
                }]
              }],
              "dependent" : [{
                "name" : "TSDateTime",
                "variable" : ["low", "start"]
              }]
            }]
          },
          {
            "name" : "period",
            "source" : [{
              "context" : "comp",
              "element" : "period",
              "variable" : "period"
            }],
            "rule" : [{
              "name" : "periodValue",
              "source" : [{
                "context" : "period",
                "element" : "value",
                "variable" : "value"
              }],
              "target" : [{
                "context" : "repeat",
                "contextType" : "variable",
                "element" : "period",
                "transform" : "cast",
                "parameter" : [{
                  "valueId" : "value"
                },
                {
                  "valueString" : "decimal"
                }]
              }]
            },
            {
              "name" : "periodUnit",
              "source" : [{
                "context" : "period",
                "element" : "unit",
                "variable" : "unit"
              }],
              "target" : [{
                "context" : "repeat",
                "contextType" : "variable",
                "element" : "periodUnit",
                "transform" : "cast",
                "parameter" : [{
                  "valueId" : "unit"
                },
                {
                  "valueString" : "code"
                }]
              }]
            },
            {
              "name" : "translation",
              "source" : [{
                "context" : "period",
                "element" : "translation",
                "variable" : "translation"
              }],
              "rule" : [{
                "name" : "originalText",
                "source" : [{
                  "context" : "translation",
                  "element" : "originalText",
                  "variable" : "originalText"
                }],
                "rule" : [{
                  "name" : "reference",
                  "source" : [{
                    "context" : "originalText",
                    "element" : "reference",
                    "variable" : "ref"
                  }],
                  "rule" : [{
                    "name" : "childDosageText",
                    "source" : [{
                      "context" : "ref",
                      "element" : "value",
                      "variable" : "value"
                    }],
                    "target" : [{
                      "context" : "childDosage",
                      "contextType" : "variable",
                      "element" : "text",
                      "transform" : "cast",
                      "parameter" : [{
                        "valueId" : "value"
                      },
                      {
                        "valueString" : "string"
                      }]
                    }]
                  }]
                }]
              }]
            }]
          }]
        }]
      }]
    }]
  },
  {
    "name" : "PatientSummaryAdverseDrugReactionSection",
    "typeMode" : "none",
    "documentation" : "5. EFFETS INDÉSIRABLES MÉDICAMENTEUX",
    "input" : [{
      "name" : "section",
      "mode" : "source"
    },
    {
      "name" : "compSection",
      "mode" : "target"
    },
    {
      "name" : "bundle",
      "type" : "Bundle",
      "mode" : "target"
    },
    {
      "name" : "patient",
      "type" : "Patient",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "sectionTemplate",
      "source" : [{
        "context" : "section",
        "element" : "templateId",
        "variable" : "sectionTid"
      }],
      "rule" : [{
        "name" : "adverseSection",
        "source" : [{
          "context" : "sectionTid",
          "element" : "root",
          "variable" : "sectionRoot",
          "condition" : "sectionRoot = '1.2.250.1.213.1.1.2.247'"
        }],
        "rule" : [{
          "name" : "entry",
          "source" : [{
            "context" : "section",
            "element" : "entry",
            "variable" : "entry"
          }],
          "rule" : [{
            "name" : "adverseObservation",
            "source" : [{
              "context" : "entry",
              "element" : "observation",
              "variable" : "adverseObservation"
            }],
            "rule" : [{
              "name" : "adverseTemplate",
              "source" : [{
                "context" : "adverseObservation",
                "element" : "templateId",
                "variable" : "tid"
              }],
              "rule" : [{
                "name" : "adverseEvent",
                "source" : [{
                  "context" : "tid",
                  "element" : "root",
                  "variable" : "root",
                  "condition" : "root = '1.2.250.1.213.1.1.3.210'"
                }],
                "target" : [{
                  "context" : "bundle",
                  "contextType" : "variable",
                  "element" : "entry",
                  "variable" : "adverseEntry"
                },
                {
                  "context" : "adverseEntry",
                  "contextType" : "variable",
                  "element" : "resource",
                  "variable" : "adverseEvent",
                  "transform" : "create",
                  "parameter" : [{
                    "valueString" : "AdverseEvent"
                  }]
                },
                {
                  "context" : "adverseEvent",
                  "contextType" : "variable",
                  "element" : "id",
                  "transform" : "uuid"
                },
                {
                  "context" : "adverseEntry",
                  "contextType" : "variable",
                  "element" : "fullUrl",
                  "transform" : "evaluate",
                  "parameter" : [{
                    "valueString" : "'urn:uuid:' + %adverseEvent.id"
                  }]
                }],
                "dependent" : [{
                  "name" : "PatientSummaryAdverseEventFromObservation",
                  "variable" : ["adverseObservation",
                  "adverseEvent",
                  "compSection",
                  "bundle",
                  "patient"]
                }]
              }]
            }]
          }]
        }]
      }]
    }]
  },
  {
    "name" : "PatientSummaryAdverseEventFromObservation",
    "typeMode" : "none",
    "documentation" : "Observation CDA -> AdverseEvent",
    "input" : [{
      "name" : "adverseObservation",
      "mode" : "source"
    },
    {
      "name" : "adverseEvent",
      "type" : "AdverseEvent",
      "mode" : "target"
    },
    {
      "name" : "compSection",
      "mode" : "target"
    },
    {
      "name" : "bundle",
      "type" : "Bundle",
      "mode" : "target"
    },
    {
      "name" : "patient",
      "type" : "Patient",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "actualityDefault",
      "source" : [{
        "context" : "adverseObservation"
      }],
      "target" : [{
        "context" : "adverseEvent",
        "contextType" : "variable",
        "element" : "actuality",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "actual"
        }]
      }]
    },
    {
      "name" : "actualityPotential",
      "source" : [{
        "context" : "adverseObservation",
        "element" : "moodCode",
        "variable" : "mood",
        "condition" : "mood = 'INT'"
      }],
      "target" : [{
        "context" : "adverseEvent",
        "contextType" : "variable",
        "element" : "actuality",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "potential"
        }]
      }]
    },
    {
      "name" : "identifier",
      "source" : [{
        "context" : "adverseObservation",
        "element" : "id",
        "variable" : "id"
      }],
      "target" : [{
        "context" : "adverseEvent",
        "contextType" : "variable",
        "element" : "identifier",
        "variable" : "identifier",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Identifier"
        }]
      }],
      "dependent" : [{
        "name" : "II",
        "variable" : ["id", "identifier"]
      }]
    },
    {
      "name" : "subject",
      "source" : [{
        "context" : "adverseObservation"
      }],
      "target" : [{
        "context" : "adverseEvent",
        "contextType" : "variable",
        "element" : "subject",
        "variable" : "subjectRef",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Reference"
        }]
      },
      {
        "context" : "subjectRef",
        "contextType" : "variable",
        "element" : "reference",
        "transform" : "evaluate",
        "parameter" : [{
          "valueString" : "'urn:uuid:' + %patient.id"
        }]
      }]
    },
    {
      "name" : "category",
      "source" : [{
        "context" : "adverseObservation",
        "element" : "code",
        "variable" : "code"
      }],
      "target" : [{
        "context" : "adverseEvent",
        "contextType" : "variable",
        "element" : "category",
        "variable" : "category",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "rule" : [{
        "name" : "categoryCoding",
        "source" : [{
          "context" : "code"
        }],
        "dependent" : [{
          "name" : "CDCodeableConcept",
          "variable" : ["code", "category"]
        }]
      },
      {
        "name" : "text",
        "source" : [{
          "context" : "adverseObservation",
          "element" : "text",
          "variable" : "text"
        }],
        "rule" : [{
          "name" : "reference",
          "source" : [{
            "context" : "text",
            "element" : "reference",
            "variable" : "reference"
          }],
          "rule" : [{
            "name" : "categoryText",
            "source" : [{
              "context" : "reference",
              "element" : "value",
              "variable" : "value"
            }],
            "target" : [{
              "context" : "category",
              "contextType" : "variable",
              "element" : "text",
              "transform" : "cast",
              "parameter" : [{
                "valueId" : "value"
              },
              {
                "valueString" : "string"
              }]
            }]
          }]
        }]
      }]
    },
    {
      "name" : "dates",
      "source" : [{
        "context" : "adverseObservation",
        "element" : "effectiveTime",
        "variable" : "effectiveTime"
      }],
      "rule" : [{
        "name" : "date",
        "source" : [{
          "context" : "effectiveTime",
          "element" : "low",
          "variable" : "low"
        }],
        "target" : [{
          "context" : "adverseEvent",
          "contextType" : "variable",
          "element" : "date",
          "variable" : "date",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "dateTime"
          }]
        }],
        "dependent" : [{
          "name" : "TSDateTime",
          "variable" : ["low", "date"]
        }]
      },
      {
        "name" : "detected",
        "source" : [{
          "context" : "effectiveTime",
          "element" : "high",
          "variable" : "high"
        }],
        "rule" : [{
          "name" : "detected",
          "source" : [{
            "context" : "high",
            "element" : "value",
            "variable" : "value"
          }],
          "target" : [{
            "context" : "adverseEvent",
            "contextType" : "variable",
            "element" : "detected",
            "variable" : "detected",
            "transform" : "create",
            "parameter" : [{
              "valueString" : "dateTime"
            }]
          }],
          "dependent" : [{
            "name" : "TSDateTime",
            "variable" : ["high", "detected"]
          }]
        }]
      }]
    },
    {
      "name" : "entryRelationship",
      "source" : [{
        "context" : "adverseObservation",
        "element" : "entryRelationship",
        "variable" : "er"
      }],
      "rule" : [{
        "name" : "treatment",
        "source" : [{
          "context" : "er",
          "element" : "substanceAdministration",
          "variable" : "treatment",
          "condition" : "er.typeCode = 'COMP'"
        }],
        "rule" : [{
          "name" : "treatmentTemplate",
          "source" : [{
            "context" : "treatment",
            "element" : "templateId",
            "variable" : "tid"
          }],
          "rule" : [{
            "name" : "suspectMedication",
            "source" : [{
              "context" : "tid",
              "element" : "root",
              "variable" : "root",
              "condition" : "root = '1.2.250.1.213.1.1.3.42'"
            }],
            "dependent" : [{
              "name" : "AdverseEventSuspectMedicationFromTreatment",
              "variable" : ["treatment",
              "adverseObservation",
              "adverseEvent",
              "bundle",
              "patient"]
            }]
          }]
        }]
      },
      {
        "name" : "reaction",
        "source" : [{
          "context" : "er",
          "element" : "observation",
          "variable" : "reactionObservation",
          "condition" : "er.typeCode = 'MFST'"
        }],
        "rule" : [{
          "name" : "reactionTemplate",
          "source" : [{
            "context" : "reactionObservation",
            "element" : "templateId",
            "variable" : "tid"
          }],
          "rule" : [{
            "name" : "reaction",
            "source" : [{
              "context" : "tid",
              "element" : "root",
              "variable" : "root",
              "condition" : "root = '1.2.250.1.213.1.1.3.37'"
            }],
            "dependent" : [{
              "name" : "AdverseEventResultingConditionFromReaction",
              "variable" : ["reactionObservation", "adverseEvent", "bundle", "patient"]
            }]
          }]
        }]
      },
      {
        "name" : "seriousness",
        "source" : [{
          "context" : "er",
          "element" : "observation",
          "variable" : "seriousnessObservation",
          "condition" : "er.typeCode = 'SUBJ'"
        }],
        "rule" : [{
          "name" : "seriousnessTemplate",
          "source" : [{
            "context" : "seriousnessObservation",
            "element" : "templateId",
            "variable" : "tid"
          }],
          "rule" : [{
            "name" : "seriousness",
            "source" : [{
              "context" : "tid",
              "element" : "root",
              "variable" : "root",
              "condition" : "root = '1.2.250.1.213.1.1.3.212'"
            }],
            "rule" : [{
              "name" : "seriousness",
              "source" : [{
                "context" : "seriousnessObservation",
                "element" : "value",
                "variable" : "value"
              }],
              "target" : [{
                "context" : "adverseEvent",
                "contextType" : "variable",
                "element" : "seriousness",
                "variable" : "seriousness",
                "transform" : "create",
                "parameter" : [{
                  "valueString" : "CodeableConcept"
                }]
              }],
              "dependent" : [{
                "name" : "CDCodeableConcept",
                "variable" : ["value", "seriousness"]
              }]
            }]
          }]
        }]
      },
      {
        "name" : "outcome",
        "source" : [{
          "context" : "er",
          "element" : "observation",
          "variable" : "outcomeObservation",
          "condition" : "er.typeCode = 'SUBJ'"
        }],
        "rule" : [{
          "name" : "outcomeTemplate",
          "source" : [{
            "context" : "outcomeObservation",
            "element" : "templateId",
            "variable" : "tid"
          }],
          "rule" : [{
            "name" : "outcome",
            "source" : [{
              "context" : "tid",
              "element" : "root",
              "variable" : "root",
              "condition" : "root = '1.2.250.1.213.1.1.3.213'"
            }],
            "rule" : [{
              "name" : "outcome",
              "source" : [{
                "context" : "outcomeObservation",
                "element" : "value",
                "variable" : "value"
              }],
              "target" : [{
                "context" : "adverseEvent",
                "contextType" : "variable",
                "element" : "outcome",
                "variable" : "outcome",
                "transform" : "create",
                "parameter" : [{
                  "valueString" : "CodeableConcept"
                }]
              }],
              "dependent" : [{
                "name" : "CDCodeableConcept",
                "variable" : ["value", "outcome"]
              }]
            }]
          }]
        }]
      },
      {
        "name" : "comment",
        "source" : [{
          "context" : "er",
          "element" : "act",
          "variable" : "commentAct",
          "condition" : "er.typeCode = 'SUBJ'"
        }],
        "rule" : [{
          "name" : "commentTemplate",
          "source" : [{
            "context" : "commentAct",
            "element" : "templateId",
            "variable" : "tid"
          }],
          "rule" : [{
            "name" : "commentNotMapped",
            "source" : [{
              "context" : "tid",
              "element" : "root",
              "variable" : "root",
              "condition" : "root = '1.2.250.1.213.1.1.3.32'"
            }]
          }]
        }]
      }]
    },
    {
      "name" : "sectionEntry",
      "source" : [{
        "context" : "adverseObservation"
      }],
      "target" : [{
        "context" : "compSection",
        "contextType" : "variable",
        "element" : "entry",
        "variable" : "sectionRef",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Reference"
        }]
      },
      {
        "context" : "sectionRef",
        "contextType" : "variable",
        "element" : "reference",
        "transform" : "evaluate",
        "parameter" : [{
          "valueString" : "'urn:uuid:' + %adverseEvent.id"
        }]
      }]
    }]
  },
  {
    "name" : "AdverseEventSuspectMedicationFromTreatment",
    "typeMode" : "none",
    "documentation" : "Traitement suspect -> MedicationStatement + suspectEntity",
    "input" : [{
      "name" : "treatment",
      "mode" : "source"
    },
    {
      "name" : "adverseObservation",
      "mode" : "source"
    },
    {
      "name" : "adverseEvent",
      "type" : "AdverseEvent",
      "mode" : "target"
    },
    {
      "name" : "bundle",
      "type" : "Bundle",
      "mode" : "target"
    },
    {
      "name" : "patient",
      "type" : "Patient",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "suspectMedication",
      "source" : [{
        "context" : "treatment"
      }],
      "target" : [{
        "context" : "bundle",
        "contextType" : "variable",
        "element" : "entry",
        "variable" : "medicationStatementEntry"
      },
      {
        "context" : "medicationStatementEntry",
        "contextType" : "variable",
        "element" : "resource",
        "variable" : "medicationStatement",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "MedicationStatement"
        }]
      },
      {
        "context" : "medicationStatement",
        "contextType" : "variable",
        "element" : "id",
        "transform" : "uuid"
      },
      {
        "context" : "medicationStatementEntry",
        "contextType" : "variable",
        "element" : "fullUrl",
        "transform" : "evaluate",
        "parameter" : [{
          "valueString" : "'urn:uuid:' + %medicationStatement.id"
        }]
      }],
      "rule" : [{
        "name" : "statusDefault",
        "source" : [{
          "context" : "treatment"
        }],
        "target" : [{
          "context" : "medicationStatement",
          "contextType" : "variable",
          "element" : "status",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "unknown"
          }]
        }]
      },
      {
        "name" : "status",
        "source" : [{
          "context" : "treatment",
          "element" : "statusCode",
          "variable" : "statusCode"
        }],
        "dependent" : [{
          "name" : "MedicationStatementStatusFromCdaStatus",
          "variable" : ["statusCode", "medicationStatement"]
        }]
      },
      {
        "name" : "identifier",
        "source" : [{
          "context" : "treatment",
          "element" : "id",
          "variable" : "id"
        }],
        "target" : [{
          "context" : "medicationStatement",
          "contextType" : "variable",
          "element" : "identifier",
          "variable" : "identifier",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Identifier"
          }]
        }],
        "dependent" : [{
          "name" : "II",
          "variable" : ["id", "identifier"]
        }]
      },
      {
        "name" : "subject",
        "source" : [{
          "context" : "treatment"
        }],
        "target" : [{
          "context" : "medicationStatement",
          "contextType" : "variable",
          "element" : "subject",
          "variable" : "subjectRef",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Reference"
          }]
        },
        {
          "context" : "subjectRef",
          "contextType" : "variable",
          "element" : "reference",
          "transform" : "evaluate",
          "parameter" : [{
            "valueString" : "'urn:uuid:' + %patient.id"
          }]
        }]
      },
      {
        "name" : "category",
        "source" : [{
          "context" : "treatment",
          "element" : "code",
          "variable" : "treatmentCode"
        }],
        "target" : [{
          "context" : "medicationStatement",
          "contextType" : "variable",
          "element" : "category",
          "variable" : "category",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "CodeableConcept"
          }]
        }],
        "dependent" : [{
          "name" : "CDCodeableConcept",
          "variable" : ["treatmentCode", "category"]
        }]
      },
      {
        "name" : "medication",
        "source" : [{
          "context" : "treatment",
          "element" : "consumable",
          "variable" : "consumable"
        }],
        "dependent" : [{
          "name" : "MedicationResourceFromConsumable",
          "variable" : ["consumable", "medicationStatement", "bundle"]
        }]
      },
      {
        "name" : "effective",
        "source" : [{
          "context" : "treatment",
          "element" : "effectiveTime",
          "variable" : "effectiveTime"
        }],
        "dependent" : [{
          "name" : "MedicationStatementEffectiveFromEffectiveTime",
          "variable" : ["effectiveTime", "medicationStatement"]
        }]
      },
      {
        "name" : "dosage",
        "source" : [{
          "context" : "treatment"
        }],
        "dependent" : [{
          "name" : "MedicationMainDosageFromSubstanceAdministration",
          "variable" : ["treatment", "medicationStatement"]
        }]
      },
      {
        "name" : "suspectEntity",
        "source" : [{
          "context" : "treatment"
        }],
        "target" : [{
          "context" : "adverseEvent",
          "contextType" : "variable",
          "element" : "suspectEntity",
          "variable" : "suspectEntity"
        },
        {
          "context" : "suspectEntity",
          "contextType" : "variable",
          "element" : "instance",
          "variable" : "instanceRef",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Reference"
          }]
        },
        {
          "context" : "instanceRef",
          "contextType" : "variable",
          "element" : "reference",
          "transform" : "evaluate",
          "parameter" : [{
            "valueString" : "'urn:uuid:' + %medicationStatement.id"
          }]
        }],
        "rule" : [{
          "name" : "causality",
          "source" : [{
            "context" : "adverseObservation",
            "element" : "entryRelationship",
            "variable" : "causalityEr"
          }],
          "rule" : [{
            "name" : "causalityObservation",
            "source" : [{
              "context" : "causalityEr",
              "element" : "observation",
              "variable" : "causalityObservation",
              "condition" : "causalityEr.typeCode = 'SUBJ'"
            }],
            "rule" : [{
              "name" : "causalityTemplate",
              "source" : [{
                "context" : "causalityObservation",
                "element" : "templateId",
                "variable" : "tid"
              }],
              "rule" : [{
                "name" : "causality",
                "source" : [{
                  "context" : "tid",
                  "element" : "root",
                  "variable" : "root",
                  "condition" : "root = '1.2.250.1.213.1.1.3.211'"
                }],
                "rule" : [{
                  "name" : "causalityAssessment",
                  "source" : [{
                    "context" : "causalityObservation",
                    "element" : "value",
                    "variable" : "value"
                  }],
                  "target" : [{
                    "context" : "suspectEntity",
                    "contextType" : "variable",
                    "element" : "causality",
                    "variable" : "causality"
                  },
                  {
                    "context" : "causality",
                    "contextType" : "variable",
                    "element" : "assessment",
                    "variable" : "assessment",
                    "transform" : "create",
                    "parameter" : [{
                      "valueString" : "CodeableConcept"
                    }]
                  }],
                  "dependent" : [{
                    "name" : "CDCodeableConcept",
                    "variable" : ["value", "assessment"]
                  }]
                }]
              }]
            }]
          }]
        }]
      }]
    }]
  },
  {
    "name" : "AdverseEventResultingConditionFromReaction",
    "typeMode" : "none",
    "documentation" : "Réaction observée -> Condition + resultingCondition",
    "input" : [{
      "name" : "reactionObservation",
      "mode" : "source"
    },
    {
      "name" : "adverseEvent",
      "type" : "AdverseEvent",
      "mode" : "target"
    },
    {
      "name" : "bundle",
      "type" : "Bundle",
      "mode" : "target"
    },
    {
      "name" : "patient",
      "type" : "Patient",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "reactionCondition",
      "source" : [{
        "context" : "reactionObservation"
      }],
      "target" : [{
        "context" : "bundle",
        "contextType" : "variable",
        "element" : "entry",
        "variable" : "conditionEntry"
      },
      {
        "context" : "conditionEntry",
        "contextType" : "variable",
        "element" : "resource",
        "variable" : "condition",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Condition"
        }]
      },
      {
        "context" : "condition",
        "contextType" : "variable",
        "element" : "id",
        "transform" : "uuid"
      },
      {
        "context" : "conditionEntry",
        "contextType" : "variable",
        "element" : "fullUrl",
        "transform" : "evaluate",
        "parameter" : [{
          "valueString" : "'urn:uuid:' + %condition.id"
        }]
      }],
      "rule" : [{
        "name" : "identifier",
        "source" : [{
          "context" : "reactionObservation",
          "element" : "id",
          "variable" : "id"
        }],
        "target" : [{
          "context" : "condition",
          "contextType" : "variable",
          "element" : "identifier",
          "variable" : "identifier",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Identifier"
          }]
        }],
        "dependent" : [{
          "name" : "II",
          "variable" : ["id", "identifier"]
        }]
      },
      {
        "name" : "subject",
        "source" : [{
          "context" : "reactionObservation"
        }],
        "target" : [{
          "context" : "condition",
          "contextType" : "variable",
          "element" : "subject",
          "variable" : "subjectRef",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Reference"
          }]
        },
        {
          "context" : "subjectRef",
          "contextType" : "variable",
          "element" : "reference",
          "transform" : "evaluate",
          "parameter" : [{
            "valueString" : "'urn:uuid:' + %patient.id"
          }]
        }]
      },
      {
        "name" : "category",
        "source" : [{
          "context" : "reactionObservation",
          "element" : "code",
          "variable" : "code"
        }],
        "target" : [{
          "context" : "condition",
          "contextType" : "variable",
          "element" : "category",
          "variable" : "category",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "CodeableConcept"
          }]
        }],
        "dependent" : [{
          "name" : "CDCodeableConcept",
          "variable" : ["code", "category"]
        }]
      },
      {
        "name" : "code",
        "source" : [{
          "context" : "reactionObservation",
          "element" : "value",
          "variable" : "value"
        }],
        "target" : [{
          "context" : "condition",
          "contextType" : "variable",
          "element" : "code",
          "variable" : "conditionCode",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "CodeableConcept"
          }]
        }],
        "dependent" : [{
          "name" : "CDCodeableConcept",
          "variable" : ["value", "conditionCode"]
        }]
      },
      {
        "name" : "effectiveTime",
        "source" : [{
          "context" : "reactionObservation",
          "element" : "effectiveTime",
          "variable" : "effectiveTime"
        }],
        "rule" : [{
          "name" : "onset",
          "source" : [{
            "context" : "effectiveTime",
            "element" : "low",
            "variable" : "low"
          }],
          "target" : [{
            "context" : "condition",
            "contextType" : "variable",
            "element" : "onset",
            "variable" : "onset",
            "transform" : "create",
            "parameter" : [{
              "valueString" : "dateTime"
            }]
          }],
          "dependent" : [{
            "name" : "TSDateTime",
            "variable" : ["low", "onset"]
          }]
        },
        {
          "name" : "abatement",
          "source" : [{
            "context" : "effectiveTime",
            "element" : "high",
            "variable" : "high"
          }],
          "rule" : [{
            "name" : "abatement",
            "source" : [{
              "context" : "high",
              "element" : "value",
              "variable" : "value"
            }],
            "target" : [{
              "context" : "condition",
              "contextType" : "variable",
              "element" : "abatement",
              "variable" : "abatement",
              "transform" : "create",
              "parameter" : [{
                "valueString" : "dateTime"
              }]
            }],
            "dependent" : [{
              "name" : "TSDateTime",
              "variable" : ["high", "abatement"]
            }]
          }]
        }]
      },
      {
        "name" : "resultingCondition",
        "source" : [{
          "context" : "reactionObservation"
        }],
        "target" : [{
          "context" : "adverseEvent",
          "contextType" : "variable",
          "element" : "resultingCondition",
          "variable" : "conditionRef",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Reference"
          }]
        },
        {
          "context" : "conditionRef",
          "contextType" : "variable",
          "element" : "reference",
          "transform" : "evaluate",
          "parameter" : [{
            "valueString" : "'urn:uuid:' + %condition.id"
          }]
        }]
      }]
    }]
  },
  {
    "name" : "PatientSummaryImmunizationSection",
    "typeMode" : "none",
    "documentation" : "6. VACCINATIONS",
    "input" : [{
      "name" : "section",
      "mode" : "source"
    },
    {
      "name" : "compSection",
      "mode" : "target"
    },
    {
      "name" : "bundle",
      "type" : "Bundle",
      "mode" : "target"
    },
    {
      "name" : "patient",
      "type" : "Patient",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "sectionTemplate",
      "source" : [{
        "context" : "section",
        "element" : "templateId",
        "variable" : "sectionTid"
      }],
      "rule" : [{
        "name" : "vaccinationSection",
        "source" : [{
          "context" : "sectionTid",
          "element" : "root",
          "variable" : "sectionRoot",
          "condition" : "sectionRoot = '1.2.250.1.213.1.1.2.147'"
        }],
        "rule" : [{
          "name" : "entry",
          "source" : [{
            "context" : "section",
            "element" : "entry",
            "variable" : "entry"
          }],
          "rule" : [{
            "name" : "substanceAdministration",
            "source" : [{
              "context" : "entry",
              "element" : "substanceAdministration",
              "variable" : "substanceAdministration"
            }],
            "rule" : [{
              "name" : "immunizationTemplate",
              "source" : [{
                "context" : "substanceAdministration",
                "element" : "templateId",
                "variable" : "immunizationTid"
              }],
              "rule" : [{
                "name" : "immunization",
                "source" : [{
                  "context" : "immunizationTid",
                  "element" : "root",
                  "variable" : "immunizationRoot",
                  "condition" : "immunizationRoot = '1.2.250.1.213.1.1.3.45'"
                }],
                "target" : [{
                  "context" : "bundle",
                  "contextType" : "variable",
                  "element" : "entry",
                  "variable" : "immunizationEntry"
                },
                {
                  "context" : "immunizationEntry",
                  "contextType" : "variable",
                  "element" : "resource",
                  "variable" : "immunization",
                  "transform" : "create",
                  "parameter" : [{
                    "valueString" : "Immunization"
                  }]
                },
                {
                  "context" : "immunization",
                  "contextType" : "variable",
                  "element" : "id",
                  "transform" : "uuid"
                },
                {
                  "context" : "immunizationEntry",
                  "contextType" : "variable",
                  "element" : "fullUrl",
                  "transform" : "evaluate",
                  "parameter" : [{
                    "valueString" : "'urn:uuid:' + %immunization.id"
                  }]
                }],
                "dependent" : [{
                  "name" : "PatientSummaryImmunizationFromSubstanceAdministration",
                  "variable" : ["substanceAdministration",
                  "immunization",
                  "compSection",
                  "bundle",
                  "patient"]
                }]
              }]
            }]
          }]
        }]
      }]
    }]
  },
  {
    "name" : "PatientSummaryImmunizationFromSubstanceAdministration",
    "typeMode" : "none",
    "documentation" : "substanceAdministration CDA -> Immunization",
    "input" : [{
      "name" : "substanceAdministration",
      "mode" : "source"
    },
    {
      "name" : "immunization",
      "type" : "Immunization",
      "mode" : "target"
    },
    {
      "name" : "compSection",
      "mode" : "target"
    },
    {
      "name" : "bundle",
      "type" : "Bundle",
      "mode" : "target"
    },
    {
      "name" : "patient",
      "type" : "Patient",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "statusDefault",
      "source" : [{
        "context" : "substanceAdministration"
      }],
      "target" : [{
        "context" : "immunization",
        "contextType" : "variable",
        "element" : "status",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "completed"
        }]
      }]
    },
    {
      "name" : "statusNotDoneByNegation",
      "source" : [{
        "context" : "substanceAdministration",
        "element" : "negationInd",
        "variable" : "negation",
        "condition" : "negation = 'true'"
      }],
      "target" : [{
        "context" : "immunization",
        "contextType" : "variable",
        "element" : "status",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "not-done"
        }]
      }]
    },
    {
      "name" : "status",
      "source" : [{
        "context" : "substanceAdministration",
        "element" : "statusCode",
        "variable" : "statusCode"
      }],
      "rule" : [{
        "name" : "completed",
        "source" : [{
          "context" : "statusCode",
          "element" : "code",
          "variable" : "code",
          "condition" : "code = 'completed'"
        }],
        "target" : [{
          "context" : "immunization",
          "contextType" : "variable",
          "element" : "status",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "completed"
          }]
        }]
      },
      {
        "name" : "aborted",
        "source" : [{
          "context" : "statusCode",
          "element" : "code",
          "variable" : "code",
          "condition" : "code = 'aborted'"
        }],
        "target" : [{
          "context" : "immunization",
          "contextType" : "variable",
          "element" : "status",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "not-done"
          }]
        }]
      },
      {
        "name" : "cancelled",
        "source" : [{
          "context" : "statusCode",
          "element" : "code",
          "variable" : "code",
          "condition" : "code = 'cancelled'"
        }],
        "target" : [{
          "context" : "immunization",
          "contextType" : "variable",
          "element" : "status",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "not-done"
          }]
        }]
      }]
    },
    {
      "name" : "identifier",
      "source" : [{
        "context" : "substanceAdministration",
        "element" : "id",
        "variable" : "id"
      }],
      "target" : [{
        "context" : "immunization",
        "contextType" : "variable",
        "element" : "identifier",
        "variable" : "identifier",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Identifier"
        }]
      }],
      "dependent" : [{
        "name" : "II",
        "variable" : ["id", "identifier"]
      }]
    },
    {
      "name" : "patient",
      "source" : [{
        "context" : "substanceAdministration"
      }],
      "target" : [{
        "context" : "immunization",
        "contextType" : "variable",
        "element" : "patient",
        "variable" : "patientRef",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Reference"
        }]
      },
      {
        "context" : "patientRef",
        "contextType" : "variable",
        "element" : "reference",
        "transform" : "evaluate",
        "parameter" : [{
          "valueString" : "'urn:uuid:' + %patient.id"
        }]
      }]
    },
    {
      "name" : "occurrenceDateTime",
      "source" : [{
        "context" : "substanceAdministration",
        "element" : "effectiveTime",
        "variable" : "effectiveTime"
      }],
      "target" : [{
        "context" : "immunization",
        "contextType" : "variable",
        "element" : "occurrence",
        "variable" : "occurrenceDateTime",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "dateTime"
        }]
      }],
      "dependent" : [{
        "name" : "TSDateTime",
        "variable" : ["effectiveTime", "occurrenceDateTime"]
      }]
    },
    {
      "name" : "vaccine",
      "source" : [{
        "context" : "substanceAdministration",
        "element" : "consumable",
        "variable" : "consumable"
      }],
      "rule" : [{
        "name" : "manufacturedProduct",
        "source" : [{
          "context" : "consumable",
          "element" : "manufacturedProduct",
          "variable" : "manufacturedProduct"
        }],
        "rule" : [{
          "name" : "manufacturedMaterial",
          "source" : [{
            "context" : "manufacturedProduct",
            "element" : "manufacturedMaterial",
            "variable" : "manufacturedMaterial"
          }],
          "rule" : [{
            "name" : "vaccineCode",
            "source" : [{
              "context" : "manufacturedMaterial",
              "element" : "code",
              "variable" : "vaccineCode"
            }],
            "target" : [{
              "context" : "immunization",
              "contextType" : "variable",
              "element" : "vaccineCode",
              "variable" : "code",
              "transform" : "create",
              "parameter" : [{
                "valueString" : "CodeableConcept"
              }]
            }],
            "rule" : [{
              "name" : "vaccineCoding",
              "source" : [{
                "context" : "vaccineCode"
              }],
              "dependent" : [{
                "name" : "CDCodeableConcept",
                "variable" : ["vaccineCode", "code"]
              }]
            },
            {
              "name" : "text",
              "source" : [{
                "context" : "substanceAdministration",
                "element" : "text",
                "variable" : "text"
              }],
              "rule" : [{
                "name" : "reference",
                "source" : [{
                  "context" : "text",
                  "element" : "reference",
                  "variable" : "reference"
                }],
                "rule" : [{
                  "name" : "vaccineText",
                  "source" : [{
                    "context" : "reference",
                    "element" : "value",
                    "variable" : "value"
                  }],
                  "target" : [{
                    "context" : "code",
                    "contextType" : "variable",
                    "element" : "text",
                    "transform" : "cast",
                    "parameter" : [{
                      "valueId" : "value"
                    },
                    {
                      "valueString" : "string"
                    }]
                  }]
                }]
              }]
            }]
          },
          {
            "name" : "lotNumberText",
            "source" : [{
              "context" : "manufacturedMaterial",
              "element" : "lotNumberText",
              "variable" : "lotNumberText"
            }],
            "rule" : [{
              "name" : "lotNumber",
              "source" : [{
                "context" : "lotNumberText",
                "element" : "xmlText",
                "variable" : "lot"
              }],
              "target" : [{
                "context" : "immunization",
                "contextType" : "variable",
                "element" : "lotNumber",
                "transform" : "cast",
                "parameter" : [{
                  "valueId" : "lot"
                },
                {
                  "valueString" : "string"
                }]
              }]
            }]
          }]
        }]
      }]
    },
    {
      "name" : "route",
      "source" : [{
        "context" : "substanceAdministration",
        "element" : "routeCode",
        "variable" : "routeCode"
      }],
      "target" : [{
        "context" : "immunization",
        "contextType" : "variable",
        "element" : "route",
        "variable" : "route",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "rule" : [{
        "name" : "routeCode",
        "source" : [{
          "context" : "routeCode"
        }],
        "dependent" : [{
          "name" : "CDCodeableConcept",
          "variable" : ["routeCode", "route"]
        }]
      },
      {
        "name" : "originalText",
        "source" : [{
          "context" : "routeCode",
          "element" : "originalText",
          "variable" : "originalText"
        }],
        "rule" : [{
          "name" : "reference",
          "source" : [{
            "context" : "originalText",
            "element" : "reference",
            "variable" : "reference"
          }],
          "rule" : [{
            "name" : "routeText",
            "source" : [{
              "context" : "reference",
              "element" : "value",
              "variable" : "value"
            }],
            "target" : [{
              "context" : "route",
              "contextType" : "variable",
              "element" : "text",
              "transform" : "cast",
              "parameter" : [{
                "valueId" : "value"
              },
              {
                "valueString" : "string"
              }]
            }]
          }]
        }]
      }]
    },
    {
      "name" : "site",
      "source" : [{
        "context" : "substanceAdministration",
        "element" : "approachSiteCode",
        "variable" : "siteCode"
      }],
      "target" : [{
        "context" : "immunization",
        "contextType" : "variable",
        "element" : "site",
        "variable" : "site",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "rule" : [{
        "name" : "siteCode",
        "source" : [{
          "context" : "siteCode"
        }],
        "dependent" : [{
          "name" : "CDCodeableConcept",
          "variable" : ["siteCode", "site"]
        }]
      },
      {
        "name" : "originalText",
        "source" : [{
          "context" : "siteCode",
          "element" : "originalText",
          "variable" : "originalText"
        }],
        "rule" : [{
          "name" : "reference",
          "source" : [{
            "context" : "originalText",
            "element" : "reference",
            "variable" : "reference"
          }],
          "rule" : [{
            "name" : "siteText",
            "source" : [{
              "context" : "reference",
              "element" : "value",
              "variable" : "value"
            }],
            "target" : [{
              "context" : "site",
              "contextType" : "variable",
              "element" : "text",
              "transform" : "cast",
              "parameter" : [{
                "valueId" : "value"
              },
              {
                "valueString" : "string"
              }]
            }]
          }]
        }]
      }]
    },
    {
      "name" : "protocolApplied",
      "source" : [{
        "context" : "substanceAdministration",
        "element" : "code",
        "variable" : "seriesCode"
      }],
      "target" : [{
        "context" : "immunization",
        "contextType" : "variable",
        "element" : "protocolApplied",
        "variable" : "protocol"
      }],
      "rule" : [{
        "name" : "series",
        "source" : [{
          "context" : "seriesCode",
          "element" : "displayName",
          "variable" : "display"
        }],
        "target" : [{
          "context" : "protocol",
          "contextType" : "variable",
          "element" : "series",
          "transform" : "cast",
          "parameter" : [{
            "valueId" : "display"
          },
          {
            "valueString" : "string"
          }]
        }]
      },
      {
        "name" : "doseNumber",
        "source" : [{
          "context" : "substanceAdministration",
          "element" : "entryRelationship",
          "variable" : "er"
        }],
        "rule" : [{
          "name" : "rankObservation",
          "source" : [{
            "context" : "er",
            "element" : "observation",
            "variable" : "rankObservation",
            "condition" : "er.typeCode = 'SUBJ'"
          }],
          "rule" : [{
            "name" : "rankTemplate",
            "source" : [{
              "context" : "rankObservation",
              "element" : "templateId",
              "variable" : "tid"
            }],
            "rule" : [{
              "name" : "rank",
              "source" : [{
                "context" : "tid",
                "element" : "root",
                "variable" : "root",
                "condition" : "root = '1.2.250.1.213.1.1.3.82'"
              }],
              "rule" : [{
                "name" : "value",
                "source" : [{
                  "context" : "rankObservation",
                  "element" : "value",
                  "variable" : "value"
                }],
                "rule" : [{
                  "name" : "doseNumber",
                  "source" : [{
                    "context" : "value",
                    "element" : "value",
                    "variable" : "doseValue"
                  }],
                  "target" : [{
                    "context" : "protocol",
                    "contextType" : "variable",
                    "element" : "doseNumber",
                    "transform" : "cast",
                    "parameter" : [{
                      "valueId" : "doseValue"
                    },
                    {
                      "valueString" : "positiveInt"
                    }]
                  }]
                }]
              }]
            }]
          }]
        }]
      },
      {
        "name" : "targetDisease",
        "source" : [{
          "context" : "substanceAdministration",
          "element" : "consumable",
          "variable" : "consumable"
        }],
        "rule" : [{
          "name" : "manufacturedProduct",
          "source" : [{
            "context" : "consumable",
            "element" : "manufacturedProduct",
            "variable" : "manufacturedProduct"
          }],
          "rule" : [{
            "name" : "manufacturedMaterial",
            "source" : [{
              "context" : "manufacturedProduct",
              "element" : "manufacturedMaterial",
              "variable" : "manufacturedMaterial"
            }],
            "rule" : [{
              "name" : "vaccineCode",
              "source" : [{
                "context" : "manufacturedMaterial",
                "element" : "code",
                "variable" : "vaccineCode"
              }],
              "rule" : [{
                "name" : "targetDisease",
                "source" : [{
                  "context" : "vaccineCode",
                  "element" : "translation",
                  "variable" : "translation"
                }],
                "target" : [{
                  "context" : "protocol",
                  "contextType" : "variable",
                  "element" : "targetDisease",
                  "variable" : "targetDisease",
                  "transform" : "create",
                  "parameter" : [{
                    "valueString" : "CodeableConcept"
                  }]
                }],
                "dependent" : [{
                  "name" : "CDCodeableConcept",
                  "variable" : ["translation", "targetDisease"]
                }]
              }]
            }]
          }]
        }]
      }]
    },
    {
      "name" : "performer",
      "source" : [{
        "context" : "substanceAdministration",
        "element" : "performer",
        "variable" : "performer"
      }],
      "rule" : [{
        "name" : "performer",
        "source" : [{
          "context" : "performer",
          "element" : "assignedEntity",
          "variable" : "assignedEntity"
        }],
        "dependent" : [{
          "name" : "ImmunizationPerformerFromAssignedEntity",
          "variable" : ["assignedEntity", "immunization", "bundle"]
        }]
      }]
    },
    {
      "name" : "entryRelationship",
      "source" : [{
        "context" : "substanceAdministration",
        "element" : "entryRelationship",
        "variable" : "er"
      }],
      "rule" : [{
        "name" : "reactionObservation",
        "source" : [{
          "context" : "er",
          "element" : "observation",
          "variable" : "reactionObservation",
          "condition" : "er.typeCode = 'CAUS'"
        }],
        "rule" : [{
          "name" : "reactionTemplate",
          "source" : [{
            "context" : "reactionObservation",
            "element" : "templateId",
            "variable" : "tid"
          }],
          "rule" : [{
            "name" : "reaction",
            "source" : [{
              "context" : "tid",
              "element" : "root",
              "variable" : "root",
              "condition" : "root = '1.2.250.1.213.1.1.3.37'"
            }],
            "dependent" : [{
              "name" : "ImmunizationReactionFromObservation",
              "variable" : ["reactionObservation", "immunization", "bundle", "patient"]
            }]
          }]
        }]
      },
      {
        "name" : "commentAct",
        "source" : [{
          "context" : "er",
          "element" : "act",
          "variable" : "commentAct",
          "condition" : "er.typeCode = 'SUBJ'"
        }],
        "rule" : [{
          "name" : "commentTemplate",
          "source" : [{
            "context" : "commentAct",
            "element" : "templateId",
            "variable" : "tid"
          }],
          "rule" : [{
            "name" : "comment",
            "source" : [{
              "context" : "tid",
              "element" : "root",
              "variable" : "root",
              "condition" : "root = '1.2.250.1.213.1.1.3.32'"
            }],
            "rule" : [{
              "name" : "text",
              "source" : [{
                "context" : "commentAct",
                "element" : "text",
                "variable" : "text"
              }],
              "rule" : [{
                "name" : "reference",
                "source" : [{
                  "context" : "text",
                  "element" : "reference",
                  "variable" : "reference"
                }],
                "rule" : [{
                  "name" : "note",
                  "source" : [{
                    "context" : "reference",
                    "element" : "value",
                    "variable" : "value"
                  }],
                  "target" : [{
                    "context" : "immunization",
                    "contextType" : "variable",
                    "element" : "note",
                    "variable" : "note",
                    "transform" : "create",
                    "parameter" : [{
                      "valueString" : "Annotation"
                    }]
                  },
                  {
                    "context" : "note",
                    "contextType" : "variable",
                    "element" : "text",
                    "transform" : "cast",
                    "parameter" : [{
                      "valueId" : "value"
                    },
                    {
                      "valueString" : "string"
                    }]
                  }]
                }]
              }]
            }]
          }]
        }]
      }]
    },
    {
      "name" : "sectionEntry",
      "source" : [{
        "context" : "substanceAdministration"
      }],
      "target" : [{
        "context" : "compSection",
        "contextType" : "variable",
        "element" : "entry",
        "variable" : "sectionRef",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Reference"
        }]
      },
      {
        "context" : "sectionRef",
        "contextType" : "variable",
        "element" : "reference",
        "transform" : "evaluate",
        "parameter" : [{
          "valueString" : "'urn:uuid:' + %immunization.id"
        }]
      }]
    }]
  },
  {
    "name" : "ImmunizationPerformerFromAssignedEntity",
    "typeMode" : "none",
    "documentation" : "Vaccinateur CDA -> Practitioner / Organization / PractitionerRole",
    "input" : [{
      "name" : "assignedEntity",
      "mode" : "source"
    },
    {
      "name" : "immunization",
      "type" : "Immunization",
      "mode" : "target"
    },
    {
      "name" : "bundle",
      "type" : "Bundle",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "performer",
      "source" : [{
        "context" : "assignedEntity"
      }],
      "target" : [{
        "context" : "bundle",
        "contextType" : "variable",
        "element" : "entry",
        "variable" : "practitionerEntry"
      },
      {
        "context" : "practitionerEntry",
        "contextType" : "variable",
        "element" : "resource",
        "variable" : "practitioner",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Practitioner"
        }]
      },
      {
        "context" : "practitioner",
        "contextType" : "variable",
        "element" : "id",
        "transform" : "uuid"
      },
      {
        "context" : "practitionerEntry",
        "contextType" : "variable",
        "element" : "fullUrl",
        "transform" : "evaluate",
        "parameter" : [{
          "valueString" : "'urn:uuid:' + %practitioner.id"
        }]
      }],
      "rule" : [{
        "name" : "practitionerBase",
        "source" : [{
          "context" : "assignedEntity"
        }],
        "dependent" : [{
          "name" : "MapCDAAssignedEntityToPractitioner",
          "variable" : ["assignedEntity", "practitioner"]
        }]
      },
      {
        "name" : "practitionerFR",
        "source" : [{
          "context" : "assignedEntity"
        }],
        "dependent" : [{
          "name" : "MapCDAAssignedEntityToFrenchPractitioner",
          "variable" : ["assignedEntity", "practitioner"]
        }]
      },
      {
        "name" : "withOrganization",
        "source" : [{
          "context" : "assignedEntity",
          "element" : "representedOrganization",
          "variable" : "representedOrganization"
        }],
        "target" : [{
          "context" : "bundle",
          "contextType" : "variable",
          "element" : "entry",
          "variable" : "organizationEntry"
        },
        {
          "context" : "organizationEntry",
          "contextType" : "variable",
          "element" : "resource",
          "variable" : "organization",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Organization"
          }]
        },
        {
          "context" : "organization",
          "contextType" : "variable",
          "element" : "id",
          "transform" : "uuid"
        },
        {
          "context" : "organizationEntry",
          "contextType" : "variable",
          "element" : "fullUrl",
          "transform" : "evaluate",
          "parameter" : [{
            "valueString" : "'urn:uuid:' + %organization.id"
          }]
        },
        {
          "context" : "bundle",
          "contextType" : "variable",
          "element" : "entry",
          "variable" : "roleEntry"
        },
        {
          "context" : "roleEntry",
          "contextType" : "variable",
          "element" : "resource",
          "variable" : "practitionerRole",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "PractitionerRole"
          }]
        },
        {
          "context" : "practitionerRole",
          "contextType" : "variable",
          "element" : "id",
          "transform" : "uuid"
        },
        {
          "context" : "roleEntry",
          "contextType" : "variable",
          "element" : "fullUrl",
          "transform" : "evaluate",
          "parameter" : [{
            "valueString" : "'urn:uuid:' + %practitionerRole.id"
          }]
        }],
        "rule" : [{
          "name" : "organizationBase",
          "source" : [{
            "context" : "representedOrganization"
          }],
          "dependent" : [{
            "name" : "MapCDAOrganizationToOrganization",
            "variable" : ["representedOrganization", "organization"]
          }]
        },
        {
          "name" : "organizationFR",
          "source" : [{
            "context" : "representedOrganization"
          }],
          "dependent" : [{
            "name" : "MapCDAOrganizationToFrenchOrganization",
            "variable" : ["representedOrganization", "organization"]
          }]
        },
        {
          "name" : "roleBase",
          "source" : [{
            "context" : "assignedEntity"
          }],
          "dependent" : [{
            "name" : "MapCDAAssignedEntityToPractitionerRole",
            "variable" : ["assignedEntity",
            "practitionerRole",
            "practitioner",
            "organization"]
          }]
        },
        {
          "name" : "roleFR",
          "source" : [{
            "context" : "assignedEntity"
          }],
          "dependent" : [{
            "name" : "MapCDAAssignedEntityToFrenchPractitionerRole",
            "variable" : ["assignedEntity",
            "practitionerRole",
            "practitioner",
            "organization"]
          }]
        },
        {
          "name" : "performerRole",
          "source" : [{
            "context" : "assignedEntity"
          }],
          "target" : [{
            "context" : "immunization",
            "contextType" : "variable",
            "element" : "performer",
            "variable" : "performer"
          },
          {
            "context" : "performer",
            "contextType" : "variable",
            "element" : "actor",
            "variable" : "actorRef",
            "transform" : "create",
            "parameter" : [{
              "valueString" : "Reference"
            }]
          },
          {
            "context" : "actorRef",
            "contextType" : "variable",
            "element" : "reference",
            "transform" : "evaluate",
            "parameter" : [{
              "valueString" : "'urn:uuid:' + %practitionerRole.id"
            }]
          }]
        }]
      },
      {
        "name" : "performerPractitionerOnly",
        "source" : [{
          "context" : "assignedEntity",
          "condition" : "assignedEntity.representedOrganization.empty()"
        }],
        "target" : [{
          "context" : "immunization",
          "contextType" : "variable",
          "element" : "performer",
          "variable" : "performer"
        },
        {
          "context" : "performer",
          "contextType" : "variable",
          "element" : "actor",
          "variable" : "actorRef",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Reference"
          }]
        },
        {
          "context" : "actorRef",
          "contextType" : "variable",
          "element" : "reference",
          "transform" : "evaluate",
          "parameter" : [{
            "valueString" : "'urn:uuid:' + %practitioner.id"
          }]
        }]
      }]
    }]
  },
  {
    "name" : "ImmunizationReactionFromObservation",
    "typeMode" : "none",
    "documentation" : "Réaction observée -> Observation + Immunization.reaction.detail",
    "input" : [{
      "name" : "reactionObservation",
      "mode" : "source"
    },
    {
      "name" : "immunization",
      "type" : "Immunization",
      "mode" : "target"
    },
    {
      "name" : "bundle",
      "type" : "Bundle",
      "mode" : "target"
    },
    {
      "name" : "patient",
      "type" : "Patient",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "reaction",
      "source" : [{
        "context" : "reactionObservation"
      }],
      "target" : [{
        "context" : "bundle",
        "contextType" : "variable",
        "element" : "entry",
        "variable" : "observationEntry"
      },
      {
        "context" : "observationEntry",
        "contextType" : "variable",
        "element" : "resource",
        "variable" : "reaction",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Observation"
        }]
      },
      {
        "context" : "reaction",
        "contextType" : "variable",
        "element" : "id",
        "transform" : "uuid"
      },
      {
        "context" : "observationEntry",
        "contextType" : "variable",
        "element" : "fullUrl",
        "transform" : "evaluate",
        "parameter" : [{
          "valueString" : "'urn:uuid:' + %reaction.id"
        }]
      }],
      "rule" : [{
        "name" : "status",
        "source" : [{
          "context" : "reactionObservation"
        }],
        "target" : [{
          "context" : "reaction",
          "contextType" : "variable",
          "element" : "status",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "final"
          }]
        }]
      },
      {
        "name" : "identifier",
        "source" : [{
          "context" : "reactionObservation",
          "element" : "id",
          "variable" : "id"
        }],
        "target" : [{
          "context" : "reaction",
          "contextType" : "variable",
          "element" : "identifier",
          "variable" : "identifier",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Identifier"
          }]
        }],
        "dependent" : [{
          "name" : "II",
          "variable" : ["id", "identifier"]
        }]
      },
      {
        "name" : "subject",
        "source" : [{
          "context" : "reactionObservation"
        }],
        "target" : [{
          "context" : "reaction",
          "contextType" : "variable",
          "element" : "subject",
          "variable" : "subjectRef",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Reference"
          }]
        },
        {
          "context" : "subjectRef",
          "contextType" : "variable",
          "element" : "reference",
          "transform" : "evaluate",
          "parameter" : [{
            "valueString" : "'urn:uuid:' + %patient.id"
          }]
        }]
      },
      {
        "name" : "category",
        "source" : [{
          "context" : "reactionObservation"
        }],
        "target" : [{
          "context" : "reaction",
          "contextType" : "variable",
          "element" : "category",
          "variable" : "category",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "CodeableConcept"
          }]
        }],
        "rule" : [{
          "name" : "categoryCoding",
          "source" : [{
            "context" : "reactionObservation"
          }],
          "target" : [{
            "context" : "category",
            "contextType" : "variable",
            "element" : "coding",
            "variable" : "coding",
            "transform" : "create",
            "parameter" : [{
              "valueString" : "Coding"
            }]
          }],
          "rule" : [{
            "name" : "categorySystem",
            "source" : [{
              "context" : "reactionObservation"
            }],
            "target" : [{
              "context" : "coding",
              "contextType" : "variable",
              "element" : "system",
              "transform" : "copy",
              "parameter" : [{
                "valueString" : "http://terminology.hl7.org/CodeSystem/observation-category"
              }]
            }]
          },
          {
            "name" : "categoryCode",
            "source" : [{
              "context" : "reactionObservation"
            }],
            "target" : [{
              "context" : "coding",
              "contextType" : "variable",
              "element" : "code",
              "transform" : "copy",
              "parameter" : [{
                "valueString" : "exam"
              }]
            }]
          },
          {
            "name" : "categoryDisplay",
            "source" : [{
              "context" : "reactionObservation"
            }],
            "target" : [{
              "context" : "coding",
              "contextType" : "variable",
              "element" : "display",
              "transform" : "copy",
              "parameter" : [{
                "valueString" : "Exam"
              }]
            }]
          }]
        }]
      },
      {
        "name" : "reactionCode",
        "source" : [{
          "context" : "reactionObservation",
          "element" : "code",
          "variable" : "code"
        }],
        "target" : [{
          "context" : "reaction",
          "contextType" : "variable",
          "element" : "code",
          "variable" : "cc",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "CodeableConcept"
          }]
        }],
        "rule" : [{
          "name" : "code",
          "source" : [{
            "context" : "code"
          }],
          "dependent" : [{
            "name" : "CDCodeableConcept",
            "variable" : ["code", "cc"]
          }]
        },
        {
          "name" : "textBlock",
          "source" : [{
            "context" : "reactionObservation",
            "element" : "text",
            "variable" : "text"
          }],
          "rule" : [{
            "name" : "reference",
            "source" : [{
              "context" : "text",
              "element" : "reference",
              "variable" : "reference"
            }],
            "rule" : [{
              "name" : "text",
              "source" : [{
                "context" : "reference",
                "element" : "value",
                "variable" : "value"
              }],
              "target" : [{
                "context" : "cc",
                "contextType" : "variable",
                "element" : "text",
                "transform" : "cast",
                "parameter" : [{
                  "valueId" : "value"
                },
                {
                  "valueString" : "string"
                }]
              }]
            }]
          }]
        }]
      },
      {
        "name" : "value",
        "source" : [{
          "context" : "reactionObservation",
          "element" : "value",
          "variable" : "value"
        }],
        "target" : [{
          "context" : "reaction",
          "contextType" : "variable",
          "element" : "value",
          "variable" : "valueCodeableConcept",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "CodeableConcept"
          }]
        }],
        "dependent" : [{
          "name" : "CDCodeableConcept",
          "variable" : ["value", "valueCodeableConcept"]
        }]
      },
      {
        "name" : "effectiveTime",
        "source" : [{
          "context" : "reactionObservation",
          "element" : "effectiveTime",
          "variable" : "effectiveTime"
        }],
        "rule" : [{
          "name" : "effectiveDateTimeValue",
          "source" : [{
            "context" : "effectiveTime",
            "element" : "value",
            "variable" : "value"
          }],
          "target" : [{
            "context" : "reaction",
            "contextType" : "variable",
            "element" : "effective",
            "variable" : "effectiveDateTime",
            "transform" : "create",
            "parameter" : [{
              "valueString" : "dateTime"
            }]
          }],
          "dependent" : [{
            "name" : "TSDateTime",
            "variable" : ["effectiveTime", "effectiveDateTime"]
          }]
        },
        {
          "name" : "effectiveDateTimeLow",
          "source" : [{
            "context" : "effectiveTime",
            "element" : "low",
            "variable" : "low",
            "condition" : "effectiveTime.value.empty()"
          }],
          "target" : [{
            "context" : "reaction",
            "contextType" : "variable",
            "element" : "effective",
            "variable" : "effectiveDateTime",
            "transform" : "create",
            "parameter" : [{
              "valueString" : "dateTime"
            }]
          }],
          "dependent" : [{
            "name" : "TSDateTime",
            "variable" : ["low", "effectiveDateTime"]
          }]
        },
        {
          "name" : "effectiveDateTimeHigh",
          "source" : [{
            "context" : "effectiveTime",
            "element" : "high",
            "variable" : "high",
            "condition" : "effectiveTime.value.empty() and effectiveTime.low.empty()"
          }],
          "target" : [{
            "context" : "reaction",
            "contextType" : "variable",
            "element" : "effective",
            "variable" : "effectiveDateTime",
            "transform" : "create",
            "parameter" : [{
              "valueString" : "dateTime"
            }]
          }],
          "dependent" : [{
            "name" : "TSDateTime",
            "variable" : ["high", "effectiveDateTime"]
          }]
        },
        {
          "name" : "effectiveTimePresentWithoutValue",
          "source" : [{
            "context" : "effectiveTime",
            "condition" : "effectiveTime.value.empty() and effectiveTime.low.empty() and effectiveTime.high.empty()"
          }],
          "target" : [{
            "context" : "reaction",
            "contextType" : "variable",
            "element" : "effective",
            "variable" : "effectiveDateTime",
            "transform" : "create",
            "parameter" : [{
              "valueString" : "dateTime"
            }]
          }],
          "rule" : [{
            "name" : "dataAbsentReason",
            "source" : [{
              "context" : "effectiveTime"
            }],
            "target" : [{
              "context" : "effectiveDateTime",
              "contextType" : "variable",
              "element" : "extension",
              "variable" : "absentReason",
              "transform" : "create",
              "parameter" : [{
                "valueString" : "Extension"
              }]
            }],
            "rule" : [{
              "name" : "url",
              "source" : [{
                "context" : "effectiveTime"
              }],
              "target" : [{
                "context" : "absentReason",
                "contextType" : "variable",
                "element" : "url",
                "transform" : "copy",
                "parameter" : [{
                  "valueString" : "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
                }]
              }]
            },
            {
              "name" : "valueCode",
              "source" : [{
                "context" : "effectiveTime"
              }],
              "target" : [{
                "context" : "absentReason",
                "contextType" : "variable",
                "element" : "value",
                "transform" : "cast",
                "parameter" : [{
                  "valueString" : "unknown"
                },
                {
                  "valueString" : "code"
                }]
              }]
            }]
          }]
        }]
      },
      {
        "name" : "effectiveTimeAbsentReason",
        "source" : [{
          "context" : "reactionObservation",
          "condition" : "reactionObservation.effectiveTime.empty()"
        }],
        "target" : [{
          "context" : "reaction",
          "contextType" : "variable",
          "element" : "effective",
          "variable" : "effectiveDateTime",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "dateTime"
          }]
        }],
        "rule" : [{
          "name" : "dataAbsentReason",
          "source" : [{
            "context" : "reactionObservation"
          }],
          "target" : [{
            "context" : "effectiveDateTime",
            "contextType" : "variable",
            "element" : "extension",
            "variable" : "absentReason",
            "transform" : "create",
            "parameter" : [{
              "valueString" : "Extension"
            }]
          }],
          "rule" : [{
            "name" : "url",
            "source" : [{
              "context" : "reactionObservation"
            }],
            "target" : [{
              "context" : "absentReason",
              "contextType" : "variable",
              "element" : "url",
              "transform" : "copy",
              "parameter" : [{
                "valueString" : "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
              }]
            }]
          },
          {
            "name" : "valueCode",
            "source" : [{
              "context" : "reactionObservation"
            }],
            "target" : [{
              "context" : "absentReason",
              "contextType" : "variable",
              "element" : "value",
              "transform" : "cast",
              "parameter" : [{
                "valueString" : "unknown"
              },
              {
                "valueString" : "code"
              }]
            }]
          }]
        }]
      },
      {
        "name" : "immunizationReaction",
        "source" : [{
          "context" : "reactionObservation"
        }],
        "target" : [{
          "context" : "immunization",
          "contextType" : "variable",
          "element" : "reaction",
          "variable" : "immunizationReaction"
        }],
        "rule" : [{
          "name" : "reactionDateBlock",
          "source" : [{
            "context" : "reactionObservation",
            "element" : "effectiveTime",
            "variable" : "effectiveTime"
          }],
          "rule" : [{
            "name" : "reactionDate",
            "source" : [{
              "context" : "effectiveTime",
              "element" : "low",
              "variable" : "low"
            }],
            "target" : [{
              "context" : "immunizationReaction",
              "contextType" : "variable",
              "element" : "date",
              "variable" : "reactionDate",
              "transform" : "create",
              "parameter" : [{
                "valueString" : "dateTime"
              }]
            }],
            "dependent" : [{
              "name" : "TSDateTime",
              "variable" : ["low", "reactionDate"]
            }]
          }]
        },
        {
          "name" : "reactionDetail",
          "source" : [{
            "context" : "reactionObservation"
          }],
          "target" : [{
            "context" : "immunizationReaction",
            "contextType" : "variable",
            "element" : "detail",
            "variable" : "detailRef",
            "transform" : "create",
            "parameter" : [{
              "valueString" : "Reference"
            }]
          },
          {
            "context" : "detailRef",
            "contextType" : "variable",
            "element" : "reference",
            "transform" : "evaluate",
            "parameter" : [{
              "valueString" : "'urn:uuid:' + %reaction.id"
            }]
          }]
        }]
      }]
    }]
  },
  {
    "name" : "PatientSummaryObservationBase",
    "typeMode" : "none",
    "documentation" : "7. OBSERVATIONS\n   Sections concernées :\n   - Constantes / signes vitaux\n   - Mode de vie / habitus\n   - Statut fonctionnel\n   - Résultats\n   - Facteurs de risques professionnels\r\nBASE COMMUNE DES OBSERVATIONS",
    "input" : [{
      "name" : "observation",
      "mode" : "source"
    },
    {
      "name" : "fhirObservation",
      "type" : "Observation",
      "mode" : "target"
    },
    {
      "name" : "patient",
      "type" : "Patient",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "statusDefault",
      "source" : [{
        "context" : "observation"
      }],
      "target" : [{
        "context" : "fhirObservation",
        "contextType" : "variable",
        "element" : "status",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "final"
        }]
      }]
    },
    {
      "name" : "status",
      "source" : [{
        "context" : "observation",
        "element" : "statusCode",
        "variable" : "statusCode"
      }],
      "dependent" : [{
        "name" : "ObservationStatusFromCdaStatus",
        "variable" : ["statusCode", "fhirObservation"]
      }]
    },
    {
      "name" : "identifier",
      "source" : [{
        "context" : "observation",
        "element" : "id",
        "variable" : "id"
      }],
      "target" : [{
        "context" : "fhirObservation",
        "contextType" : "variable",
        "element" : "identifier",
        "variable" : "identifier",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Identifier"
        }]
      }],
      "dependent" : [{
        "name" : "II",
        "variable" : ["id", "identifier"]
      }]
    },
    {
      "name" : "subject",
      "source" : [{
        "context" : "observation"
      }],
      "target" : [{
        "context" : "fhirObservation",
        "contextType" : "variable",
        "element" : "subject",
        "variable" : "subjectRef",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Reference"
        }]
      },
      {
        "context" : "subjectRef",
        "contextType" : "variable",
        "element" : "reference",
        "transform" : "evaluate",
        "parameter" : [{
          "valueString" : "'urn:uuid:' + %patient.id"
        }]
      }]
    },
    {
      "name" : "categoryAbsentReason",
      "source" : [{
        "context" : "observation"
      }],
      "target" : [{
        "context" : "fhirObservation",
        "contextType" : "variable",
        "element" : "category",
        "variable" : "category",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "rule" : [{
        "name" : "dataAbsentReason",
        "source" : [{
          "context" : "observation"
        }],
        "target" : [{
          "context" : "category",
          "contextType" : "variable",
          "element" : "extension",
          "variable" : "absentReason",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Extension"
          }]
        }],
        "rule" : [{
          "name" : "url",
          "source" : [{
            "context" : "observation"
          }],
          "target" : [{
            "context" : "absentReason",
            "contextType" : "variable",
            "element" : "url",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
            }]
          }]
        },
        {
          "name" : "valueCode",
          "source" : [{
            "context" : "observation"
          }],
          "target" : [{
            "context" : "absentReason",
            "contextType" : "variable",
            "element" : "value",
            "transform" : "cast",
            "parameter" : [{
              "valueString" : "unknown"
            },
            {
              "valueString" : "code"
            }]
          }]
        }]
      }]
    },
    {
      "name" : "observationCode",
      "source" : [{
        "context" : "observation",
        "element" : "code",
        "variable" : "code"
      }],
      "target" : [{
        "context" : "fhirObservation",
        "contextType" : "variable",
        "element" : "code",
        "variable" : "obsCode",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "rule" : [{
        "name" : "code",
        "source" : [{
          "context" : "code"
        }],
        "dependent" : [{
          "name" : "CDCodeableConcept",
          "variable" : ["code", "obsCode"]
        }]
      },
      {
        "name" : "text",
        "source" : [{
          "context" : "observation",
          "element" : "text",
          "variable" : "text"
        }],
        "rule" : [{
          "name" : "reference",
          "source" : [{
            "context" : "text",
            "element" : "reference",
            "variable" : "reference"
          }],
          "rule" : [{
            "name" : "codeText",
            "source" : [{
              "context" : "reference",
              "element" : "value",
              "variable" : "value"
            }],
            "target" : [{
              "context" : "obsCode",
              "contextType" : "variable",
              "element" : "text",
              "transform" : "cast",
              "parameter" : [{
                "valueId" : "value"
              },
              {
                "valueString" : "string"
              }]
            }]
          }]
        }]
      }]
    },
    {
      "name" : "effectiveTime",
      "source" : [{
        "context" : "observation",
        "element" : "effectiveTime",
        "variable" : "effectiveTime"
      }],
      "dependent" : [{
        "name" : "ObservationEffectiveFromEffectiveTime",
        "variable" : ["effectiveTime", "fhirObservation"]
      }]
    },
    {
      "name" : "effectiveTimeAbsentReason",
      "source" : [{
        "context" : "observation",
        "condition" : "observation.effectiveTime.empty()"
      }],
      "target" : [{
        "context" : "fhirObservation",
        "contextType" : "variable",
        "element" : "effective",
        "variable" : "effectiveDateTime",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "dateTime"
        }]
      }],
      "rule" : [{
        "name" : "dataAbsentReason",
        "source" : [{
          "context" : "observation"
        }],
        "target" : [{
          "context" : "effectiveDateTime",
          "contextType" : "variable",
          "element" : "extension",
          "variable" : "absentReason",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Extension"
          }]
        }],
        "rule" : [{
          "name" : "url",
          "source" : [{
            "context" : "observation"
          }],
          "target" : [{
            "context" : "absentReason",
            "contextType" : "variable",
            "element" : "url",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
            }]
          }]
        },
        {
          "name" : "valueCode",
          "source" : [{
            "context" : "observation"
          }],
          "target" : [{
            "context" : "absentReason",
            "contextType" : "variable",
            "element" : "value",
            "transform" : "cast",
            "parameter" : [{
              "valueString" : "unknown"
            },
            {
              "valueString" : "code"
            }]
          }]
        }]
      }]
    },
    {
      "name" : "value",
      "source" : [{
        "context" : "observation",
        "element" : "value",
        "variable" : "value"
      }],
      "dependent" : [{
        "name" : "ObservationValueFromCdaValue",
        "variable" : ["value", "fhirObservation"]
      }]
    },
    {
      "name" : "interpretation",
      "source" : [{
        "context" : "observation",
        "element" : "interpretationCode",
        "variable" : "interpretationCode"
      }],
      "target" : [{
        "context" : "fhirObservation",
        "contextType" : "variable",
        "element" : "interpretation",
        "variable" : "interpretation",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "dependent" : [{
        "name" : "CDCodeableConcept",
        "variable" : ["interpretationCode", "interpretation"]
      }]
    },
    {
      "name" : "method",
      "source" : [{
        "context" : "observation",
        "element" : "methodCode",
        "variable" : "methodCode"
      }],
      "target" : [{
        "context" : "fhirObservation",
        "contextType" : "variable",
        "element" : "method",
        "variable" : "method",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "dependent" : [{
        "name" : "CDCodeableConcept",
        "variable" : ["methodCode", "method"]
      }]
    },
    {
      "name" : "bodySite",
      "source" : [{
        "context" : "observation",
        "element" : "targetSiteCode",
        "variable" : "targetSiteCode"
      }],
      "target" : [{
        "context" : "fhirObservation",
        "contextType" : "variable",
        "element" : "bodySite",
        "variable" : "bodySite",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "dependent" : [{
        "name" : "CDCodeableConcept",
        "variable" : ["targetSiteCode", "bodySite"]
      }]
    },
    {
      "name" : "qualifiers",
      "source" : [{
        "context" : "observation",
        "element" : "code",
        "variable" : "code"
      }],
      "rule" : [{
        "name" : "qualifierComponent",
        "source" : [{
          "context" : "code",
          "element" : "qualifier",
          "variable" : "qualifier"
        }],
        "target" : [{
          "context" : "fhirObservation",
          "contextType" : "variable",
          "element" : "component",
          "variable" : "component"
        }],
        "dependent" : [{
          "name" : "ObservationComponentFromQualifier",
          "variable" : ["qualifier", "component"]
        }]
      }]
    },
    {
      "name" : "comments",
      "source" : [{
        "context" : "observation",
        "element" : "entryRelationship",
        "variable" : "er"
      }],
      "dependent" : [{
        "name" : "ObservationCommentFromEntryRelationship",
        "variable" : ["er", "fhirObservation"]
      }]
    }]
  },
  {
    "name" : "ObservationStatusFromCdaStatus",
    "typeMode" : "none",
    "documentation" : "Statut CDA -> Observation.status",
    "input" : [{
      "name" : "statusCode",
      "mode" : "source"
    },
    {
      "name" : "fhirObservation",
      "type" : "Observation",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "completed",
      "source" : [{
        "context" : "statusCode",
        "element" : "code",
        "variable" : "code",
        "condition" : "code = 'completed'"
      }],
      "target" : [{
        "context" : "fhirObservation",
        "contextType" : "variable",
        "element" : "status",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "final"
        }]
      }]
    },
    {
      "name" : "active",
      "source" : [{
        "context" : "statusCode",
        "element" : "code",
        "variable" : "code",
        "condition" : "code = 'active'"
      }],
      "target" : [{
        "context" : "fhirObservation",
        "contextType" : "variable",
        "element" : "status",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "registered"
        }]
      }]
    },
    {
      "name" : "aborted",
      "source" : [{
        "context" : "statusCode",
        "element" : "code",
        "variable" : "code",
        "condition" : "code = 'aborted'"
      }],
      "target" : [{
        "context" : "fhirObservation",
        "contextType" : "variable",
        "element" : "status",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "cancelled"
        }]
      }]
    },
    {
      "name" : "cancelled",
      "source" : [{
        "context" : "statusCode",
        "element" : "code",
        "variable" : "code",
        "condition" : "code = 'cancelled'"
      }],
      "target" : [{
        "context" : "fhirObservation",
        "contextType" : "variable",
        "element" : "status",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "cancelled"
        }]
      }]
    }]
  },
  {
    "name" : "ObservationEffectiveFromEffectiveTime",
    "typeMode" : "none",
    "documentation" : "effectiveTime CDA -> Observation.effective[x]",
    "input" : [{
      "name" : "effectiveTime",
      "mode" : "source"
    },
    {
      "name" : "fhirObservation",
      "type" : "Observation",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "effectiveDateTime",
      "source" : [{
        "context" : "effectiveTime",
        "element" : "value",
        "variable" : "value"
      }],
      "target" : [{
        "context" : "fhirObservation",
        "contextType" : "variable",
        "element" : "effective",
        "variable" : "effectiveDateTime",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "dateTime"
        }]
      }],
      "dependent" : [{
        "name" : "TSDateTime",
        "variable" : ["effectiveTime", "effectiveDateTime"]
      }]
    },
    {
      "name" : "effectiveLowAsDateTime",
      "source" : [{
        "context" : "effectiveTime",
        "element" : "low",
        "variable" : "low",
        "condition" : "effectiveTime.high.empty()"
      }],
      "target" : [{
        "context" : "fhirObservation",
        "contextType" : "variable",
        "element" : "effective",
        "variable" : "effectiveDateTime",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "dateTime"
        }]
      }],
      "dependent" : [{
        "name" : "TSDateTime",
        "variable" : ["low", "effectiveDateTime"]
      }]
    },
    {
      "name" : "effectivePeriod",
      "source" : [{
        "context" : "effectiveTime",
        "element" : "low",
        "variable" : "low",
        "condition" : "effectiveTime.high.exists()"
      }],
      "target" : [{
        "context" : "fhirObservation",
        "contextType" : "variable",
        "element" : "effective",
        "variable" : "effectivePeriod",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Period"
        }]
      }],
      "rule" : [{
        "name" : "start",
        "source" : [{
          "context" : "low"
        }],
        "target" : [{
          "context" : "effectivePeriod",
          "contextType" : "variable",
          "element" : "start",
          "variable" : "start",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "dateTime"
          }]
        }],
        "dependent" : [{
          "name" : "TSDateTime",
          "variable" : ["low", "start"]
        }]
      },
      {
        "name" : "end",
        "source" : [{
          "context" : "effectiveTime",
          "element" : "high",
          "variable" : "high"
        }],
        "target" : [{
          "context" : "effectivePeriod",
          "contextType" : "variable",
          "element" : "end",
          "variable" : "end",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "dateTime"
          }]
        }],
        "dependent" : [{
          "name" : "TSDateTime",
          "variable" : ["high", "end"]
        }]
      }]
    },
    {
      "name" : "effectiveTimePresentWithoutValue",
      "source" : [{
        "context" : "effectiveTime",
        "condition" : "effectiveTime.value.empty() and effectiveTime.low.empty() and effectiveTime.high.empty()"
      }],
      "target" : [{
        "context" : "fhirObservation",
        "contextType" : "variable",
        "element" : "effective",
        "variable" : "effectiveDateTime",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "dateTime"
        }]
      }],
      "rule" : [{
        "name" : "dataAbsentReason",
        "source" : [{
          "context" : "effectiveTime"
        }],
        "target" : [{
          "context" : "effectiveDateTime",
          "contextType" : "variable",
          "element" : "extension",
          "variable" : "absentReason",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Extension"
          }]
        }],
        "rule" : [{
          "name" : "url",
          "source" : [{
            "context" : "effectiveTime"
          }],
          "target" : [{
            "context" : "absentReason",
            "contextType" : "variable",
            "element" : "url",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
            }]
          }]
        },
        {
          "name" : "valueCode",
          "source" : [{
            "context" : "effectiveTime"
          }],
          "target" : [{
            "context" : "absentReason",
            "contextType" : "variable",
            "element" : "value",
            "transform" : "cast",
            "parameter" : [{
              "valueString" : "unknown"
            },
            {
              "valueString" : "code"
            }]
          }]
        }]
      }]
    }]
  },
  {
    "name" : "ObservationValueFromCdaValue",
    "typeMode" : "none",
    "documentation" : "Valeur CDA -> Observation.value[x]",
    "input" : [{
      "name" : "value",
      "mode" : "source"
    },
    {
      "name" : "fhirObservation",
      "type" : "Observation",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "valueQuantity",
      "source" : [{
        "context" : "value",
        "element" : "unit",
        "variable" : "unit"
      }],
      "target" : [{
        "context" : "fhirObservation",
        "contextType" : "variable",
        "element" : "value",
        "variable" : "quantity",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Quantity"
        }]
      }],
      "rule" : [{
        "name" : "quantityValue",
        "source" : [{
          "context" : "value",
          "element" : "value",
          "variable" : "v"
        }],
        "target" : [{
          "context" : "quantity",
          "contextType" : "variable",
          "element" : "value",
          "transform" : "cast",
          "parameter" : [{
            "valueId" : "v"
          },
          {
            "valueString" : "decimal"
          }]
        }]
      },
      {
        "name" : "quantityUnit",
        "source" : [{
          "context" : "unit"
        }],
        "target" : [{
          "context" : "quantity",
          "contextType" : "variable",
          "element" : "unit",
          "transform" : "cast",
          "parameter" : [{
            "valueId" : "unit"
          },
          {
            "valueString" : "string"
          }]
        }]
      }]
    },
    {
      "name" : "valueCodeableConcept",
      "source" : [{
        "context" : "value",
        "element" : "code",
        "variable" : "code"
      }],
      "target" : [{
        "context" : "fhirObservation",
        "contextType" : "variable",
        "element" : "value",
        "variable" : "valueCodeableConcept",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "dependent" : [{
        "name" : "CDCodeableConcept",
        "variable" : ["value", "valueCodeableConcept"]
      }]
    },
    {
      "name" : "originalTextOnly",
      "source" : [{
        "context" : "value",
        "element" : "originalText",
        "variable" : "originalText",
        "condition" : "value.code.empty() and value.unit.empty()"
      }],
      "rule" : [{
        "name" : "reference",
        "source" : [{
          "context" : "originalText",
          "element" : "reference",
          "variable" : "reference"
        }],
        "rule" : [{
          "name" : "valueCodeableConceptText",
          "source" : [{
            "context" : "reference",
            "element" : "value",
            "variable" : "text"
          }],
          "target" : [{
            "context" : "fhirObservation",
            "contextType" : "variable",
            "element" : "value",
            "variable" : "valueCodeableConcept",
            "transform" : "create",
            "parameter" : [{
              "valueString" : "CodeableConcept"
            }]
          },
          {
            "context" : "valueCodeableConcept",
            "contextType" : "variable",
            "element" : "text",
            "transform" : "cast",
            "parameter" : [{
              "valueId" : "text"
            },
            {
              "valueString" : "string"
            }]
          }]
        }]
      }]
    },
    {
      "name" : "valueBooleanTrue",
      "source" : [{
        "context" : "value",
        "element" : "value",
        "variable" : "v",
        "condition" : "value.unit.empty() and value.code.empty() and (v = 'true')"
      }],
      "target" : [{
        "context" : "fhirObservation",
        "contextType" : "variable",
        "element" : "value",
        "transform" : "cast",
        "parameter" : [{
          "valueId" : "v"
        },
        {
          "valueString" : "boolean"
        }]
      }]
    },
    {
      "name" : "valueBooleanFalse",
      "source" : [{
        "context" : "value",
        "element" : "value",
        "variable" : "v",
        "condition" : "value.unit.empty() and value.code.empty() and (v = 'false')"
      }],
      "target" : [{
        "context" : "fhirObservation",
        "contextType" : "variable",
        "element" : "value",
        "transform" : "cast",
        "parameter" : [{
          "valueId" : "v"
        },
        {
          "valueString" : "boolean"
        }]
      }]
    },
    {
      "name" : "valueString",
      "source" : [{
        "context" : "value",
        "element" : "value",
        "variable" : "v",
        "condition" : "value.unit.empty() and value.code.empty() and (v != 'true') and (v != 'false')"
      }],
      "target" : [{
        "context" : "fhirObservation",
        "contextType" : "variable",
        "element" : "value",
        "transform" : "cast",
        "parameter" : [{
          "valueId" : "v"
        },
        {
          "valueString" : "string"
        }]
      }]
    }]
  },
  {
    "name" : "ObservationComponentFromQualifier",
    "typeMode" : "none",
    "documentation" : "Qualifier CDA -> Observation.component",
    "input" : [{
      "name" : "qualifier",
      "mode" : "source"
    },
    {
      "name" : "component",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "componentCode",
      "source" : [{
        "context" : "qualifier",
        "element" : "name",
        "variable" : "name"
      }],
      "target" : [{
        "context" : "component",
        "contextType" : "variable",
        "element" : "code",
        "variable" : "componentCode",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "dependent" : [{
        "name" : "CDCodeableConcept",
        "variable" : ["name", "componentCode"]
      }]
    },
    {
      "name" : "componentValue",
      "source" : [{
        "context" : "qualifier",
        "element" : "value",
        "variable" : "value"
      }],
      "dependent" : [{
        "name" : "ObservationComponentValueFromCdaValue",
        "variable" : ["value", "component"]
      }]
    }]
  },
  {
    "name" : "ObservationComponentValueFromCdaValue",
    "typeMode" : "none",
    "documentation" : "Valeur CDA -> Observation.component.value[x]",
    "input" : [{
      "name" : "value",
      "mode" : "source"
    },
    {
      "name" : "component",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "componentValueQuantity",
      "source" : [{
        "context" : "value",
        "element" : "unit",
        "variable" : "unit"
      }],
      "target" : [{
        "context" : "component",
        "contextType" : "variable",
        "element" : "value",
        "variable" : "quantity",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Quantity"
        }]
      }],
      "rule" : [{
        "name" : "quantityValue",
        "source" : [{
          "context" : "value",
          "element" : "value",
          "variable" : "v"
        }],
        "target" : [{
          "context" : "quantity",
          "contextType" : "variable",
          "element" : "value",
          "transform" : "cast",
          "parameter" : [{
            "valueId" : "v"
          },
          {
            "valueString" : "decimal"
          }]
        }]
      },
      {
        "name" : "quantityUnit",
        "source" : [{
          "context" : "unit"
        }],
        "target" : [{
          "context" : "quantity",
          "contextType" : "variable",
          "element" : "unit",
          "transform" : "cast",
          "parameter" : [{
            "valueId" : "unit"
          },
          {
            "valueString" : "string"
          }]
        }]
      }]
    },
    {
      "name" : "componentValueCodeableConcept",
      "source" : [{
        "context" : "value",
        "element" : "code",
        "variable" : "code"
      }],
      "target" : [{
        "context" : "component",
        "contextType" : "variable",
        "element" : "value",
        "variable" : "valueCodeableConcept",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "dependent" : [{
        "name" : "CDCodeableConcept",
        "variable" : ["value", "valueCodeableConcept"]
      }]
    },
    {
      "name" : "componentValueBooleanTrue",
      "source" : [{
        "context" : "value",
        "element" : "value",
        "variable" : "v",
        "condition" : "value.unit.empty() and value.code.empty() and (v = 'true')"
      }],
      "target" : [{
        "context" : "component",
        "contextType" : "variable",
        "element" : "value",
        "transform" : "cast",
        "parameter" : [{
          "valueId" : "v"
        },
        {
          "valueString" : "boolean"
        }]
      }]
    },
    {
      "name" : "componentValueBooleanFalse",
      "source" : [{
        "context" : "value",
        "element" : "value",
        "variable" : "v",
        "condition" : "value.unit.empty() and value.code.empty() and (v = 'false')"
      }],
      "target" : [{
        "context" : "component",
        "contextType" : "variable",
        "element" : "value",
        "transform" : "cast",
        "parameter" : [{
          "valueId" : "v"
        },
        {
          "valueString" : "boolean"
        }]
      }]
    },
    {
      "name" : "componentValueString",
      "source" : [{
        "context" : "value",
        "element" : "value",
        "variable" : "v",
        "condition" : "value.unit.empty() and value.code.empty() and (v != 'true') and (v != 'false')"
      }],
      "target" : [{
        "context" : "component",
        "contextType" : "variable",
        "element" : "value",
        "transform" : "cast",
        "parameter" : [{
          "valueId" : "v"
        },
        {
          "valueString" : "string"
        }]
      }]
    }]
  },
  {
    "name" : "ObservationCommentFromEntryRelationship",
    "typeMode" : "none",
    "documentation" : "Commentaire CDA -> Observation.note",
    "input" : [{
      "name" : "er",
      "mode" : "source"
    },
    {
      "name" : "fhirObservation",
      "type" : "Observation",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "commentAct",
      "source" : [{
        "context" : "er",
        "element" : "act",
        "variable" : "commentAct"
      }],
      "rule" : [{
        "name" : "templateId",
        "source" : [{
          "context" : "commentAct",
          "element" : "templateId",
          "variable" : "tid"
        }],
        "rule" : [{
          "name" : "commentTemplate",
          "source" : [{
            "context" : "tid",
            "element" : "root",
            "variable" : "root",
            "condition" : "root = '1.2.250.1.213.1.1.3.32'"
          }],
          "rule" : [{
            "name" : "text",
            "source" : [{
              "context" : "commentAct",
              "element" : "text",
              "variable" : "text"
            }],
            "rule" : [{
              "name" : "reference",
              "source" : [{
                "context" : "text",
                "element" : "reference",
                "variable" : "reference"
              }],
              "rule" : [{
                "name" : "note",
                "source" : [{
                  "context" : "reference",
                  "element" : "value",
                  "variable" : "value"
                }],
                "target" : [{
                  "context" : "fhirObservation",
                  "contextType" : "variable",
                  "element" : "note",
                  "variable" : "note",
                  "transform" : "create",
                  "parameter" : [{
                    "valueString" : "Annotation"
                  }]
                },
                {
                  "context" : "note",
                  "contextType" : "variable",
                  "element" : "text",
                  "transform" : "cast",
                  "parameter" : [{
                    "valueId" : "value"
                  },
                  {
                    "valueString" : "string"
                  }]
                }]
              }]
            }]
          }]
        }]
      }]
    }]
  },
  {
    "name" : "PatientSummaryObservationPanelBase",
    "typeMode" : "none",
    "documentation" : "Panel Observation",
    "input" : [{
      "name" : "organizer",
      "mode" : "source"
    },
    {
      "name" : "panel",
      "type" : "Observation",
      "mode" : "target"
    },
    {
      "name" : "patient",
      "type" : "Patient",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "statusDefault",
      "source" : [{
        "context" : "organizer"
      }],
      "target" : [{
        "context" : "panel",
        "contextType" : "variable",
        "element" : "status",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "final"
        }]
      }]
    },
    {
      "name" : "status",
      "source" : [{
        "context" : "organizer",
        "element" : "statusCode",
        "variable" : "statusCode"
      }],
      "dependent" : [{
        "name" : "ObservationStatusFromCdaStatus",
        "variable" : ["statusCode", "panel"]
      }]
    },
    {
      "name" : "identifier",
      "source" : [{
        "context" : "organizer",
        "element" : "id",
        "variable" : "id"
      }],
      "target" : [{
        "context" : "panel",
        "contextType" : "variable",
        "element" : "identifier",
        "variable" : "identifier",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Identifier"
        }]
      }],
      "dependent" : [{
        "name" : "II",
        "variable" : ["id", "identifier"]
      }]
    },
    {
      "name" : "subject",
      "source" : [{
        "context" : "organizer"
      }],
      "target" : [{
        "context" : "panel",
        "contextType" : "variable",
        "element" : "subject",
        "variable" : "subjectRef",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Reference"
        }]
      },
      {
        "context" : "subjectRef",
        "contextType" : "variable",
        "element" : "reference",
        "transform" : "evaluate",
        "parameter" : [{
          "valueString" : "'urn:uuid:' + %patient.id"
        }]
      }]
    },
    {
      "name" : "category",
      "source" : [{
        "context" : "organizer"
      }],
      "target" : [{
        "context" : "panel",
        "contextType" : "variable",
        "element" : "category",
        "variable" : "category",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "rule" : [{
        "name" : "categoryCoding",
        "source" : [{
          "context" : "organizer"
        }],
        "target" : [{
          "context" : "category",
          "contextType" : "variable",
          "element" : "coding",
          "variable" : "coding",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Coding"
          }]
        }],
        "rule" : [{
          "name" : "categorySystem",
          "source" : [{
            "context" : "organizer"
          }],
          "target" : [{
            "context" : "coding",
            "contextType" : "variable",
            "element" : "system",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "http://terminology.hl7.org/CodeSystem/observation-category"
            }]
          }]
        },
        {
          "name" : "categoryCode",
          "source" : [{
            "context" : "organizer"
          }],
          "target" : [{
            "context" : "coding",
            "contextType" : "variable",
            "element" : "code",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "vital-signs"
            }]
          }]
        },
        {
          "name" : "categoryDisplay",
          "source" : [{
            "context" : "organizer"
          }],
          "target" : [{
            "context" : "coding",
            "contextType" : "variable",
            "element" : "display",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "Vital Signs"
            }]
          }]
        }]
      }]
    },
    {
      "name" : "code",
      "source" : [{
        "context" : "organizer",
        "element" : "code",
        "variable" : "code"
      }],
      "target" : [{
        "context" : "panel",
        "contextType" : "variable",
        "element" : "code",
        "variable" : "panelCode",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "dependent" : [{
        "name" : "CDCodeableConcept",
        "variable" : ["code", "panelCode"]
      }]
    },
    {
      "name" : "effectiveTime",
      "source" : [{
        "context" : "organizer",
        "element" : "effectiveTime",
        "variable" : "effectiveTime"
      }],
      "dependent" : [{
        "name" : "ObservationEffectiveFromEffectiveTime",
        "variable" : ["effectiveTime", "panel"]
      }]
    },
    {
      "name" : "effectiveTimeAbsentReason",
      "source" : [{
        "context" : "organizer",
        "condition" : "organizer.effectiveTime.empty()"
      }],
      "target" : [{
        "context" : "panel",
        "contextType" : "variable",
        "element" : "effective",
        "variable" : "effectiveDateTime",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "dateTime"
        }]
      }],
      "rule" : [{
        "name" : "dataAbsentReason",
        "source" : [{
          "context" : "organizer"
        }],
        "target" : [{
          "context" : "effectiveDateTime",
          "contextType" : "variable",
          "element" : "extension",
          "variable" : "absentReason",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Extension"
          }]
        }],
        "rule" : [{
          "name" : "url",
          "source" : [{
            "context" : "organizer"
          }],
          "target" : [{
            "context" : "absentReason",
            "contextType" : "variable",
            "element" : "url",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
            }]
          }]
        },
        {
          "name" : "valueCode",
          "source" : [{
            "context" : "organizer"
          }],
          "target" : [{
            "context" : "absentReason",
            "contextType" : "variable",
            "element" : "value",
            "transform" : "cast",
            "parameter" : [{
              "valueString" : "unknown"
            },
            {
              "valueString" : "code"
            }]
          }]
        }]
      }]
    }]
  },
  {
    "name" : "ObservationPanelHasMember",
    "typeMode" : "none",
    "input" : [{
      "name" : "src",
      "mode" : "source"
    },
    {
      "name" : "panel",
      "type" : "Observation",
      "mode" : "target"
    },
    {
      "name" : "member",
      "type" : "Observation",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "hasMember",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "panel",
        "contextType" : "variable",
        "element" : "hasMember",
        "variable" : "memberRef",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Reference"
        }]
      },
      {
        "context" : "memberRef",
        "contextType" : "variable",
        "element" : "reference",
        "transform" : "evaluate",
        "parameter" : [{
          "valueString" : "'urn:uuid:' + %member.id"
        }]
      }]
    }]
  },
  {
    "name" : "ObservationAddToSection",
    "typeMode" : "none",
    "input" : [{
      "name" : "src",
      "mode" : "source"
    },
    {
      "name" : "fhirObservation",
      "type" : "Observation",
      "mode" : "target"
    },
    {
      "name" : "compSection",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "sectionEntry",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "compSection",
        "contextType" : "variable",
        "element" : "entry",
        "variable" : "sectionRef",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Reference"
        }]
      },
      {
        "context" : "sectionRef",
        "contextType" : "variable",
        "element" : "reference",
        "transform" : "evaluate",
        "parameter" : [{
          "valueString" : "'urn:uuid:' + %fhirObservation.id"
        }]
      }]
    }]
  },
  {
    "name" : "PatientSummaryVitalSignsSection",
    "typeMode" : "none",
    "documentation" : "7.1 CONSTANCES / SIGNES VITAUX",
    "input" : [{
      "name" : "section",
      "mode" : "source"
    },
    {
      "name" : "compSection",
      "mode" : "target"
    },
    {
      "name" : "bundle",
      "type" : "Bundle",
      "mode" : "target"
    },
    {
      "name" : "patient",
      "type" : "Patient",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "sectionTemplate",
      "source" : [{
        "context" : "section",
        "element" : "templateId",
        "variable" : "sectionTid"
      }],
      "rule" : [{
        "name" : "vitalSignsSection",
        "source" : [{
          "context" : "sectionTid",
          "element" : "root",
          "variable" : "sectionRoot",
          "condition" : "sectionRoot = '1.2.250.1.213.1.1.2.75'"
        }],
        "rule" : [{
          "name" : "entry",
          "source" : [{
            "context" : "section",
            "element" : "entry",
            "variable" : "entry"
          }],
          "rule" : [{
            "name" : "organizer",
            "source" : [{
              "context" : "entry",
              "element" : "organizer",
              "variable" : "organizer"
            }],
            "rule" : [{
              "name" : "organizerTemplate",
              "source" : [{
                "context" : "organizer",
                "element" : "templateId",
                "variable" : "organizerTid"
              }],
              "rule" : [{
                "name" : "vitalSignsPanel",
                "source" : [{
                  "context" : "organizerTid",
                  "element" : "root",
                  "variable" : "organizerRoot",
                  "condition" : "organizerRoot = '1.2.250.1.213.1.1.3.49'"
                }],
                "target" : [{
                  "context" : "bundle",
                  "contextType" : "variable",
                  "element" : "entry",
                  "variable" : "panelEntry"
                },
                {
                  "context" : "panelEntry",
                  "contextType" : "variable",
                  "element" : "resource",
                  "variable" : "panel",
                  "transform" : "create",
                  "parameter" : [{
                    "valueString" : "Observation"
                  }]
                },
                {
                  "context" : "panel",
                  "contextType" : "variable",
                  "element" : "id",
                  "transform" : "uuid"
                },
                {
                  "context" : "panelEntry",
                  "contextType" : "variable",
                  "element" : "fullUrl",
                  "transform" : "evaluate",
                  "parameter" : [{
                    "valueString" : "'urn:uuid:' + %panel.id"
                  }]
                }],
                "dependent" : [{
                  "name" : "PatientSummaryVitalSignsPanelFromOrganizer",
                  "variable" : ["organizer", "panel", "compSection", "bundle", "patient"]
                }]
              }]
            }]
          }]
        }]
      }]
    }]
  },
  {
    "name" : "PatientSummaryVitalSignsPanelFromOrganizer",
    "typeMode" : "none",
    "input" : [{
      "name" : "organizer",
      "mode" : "source"
    },
    {
      "name" : "panel",
      "type" : "Observation",
      "mode" : "target"
    },
    {
      "name" : "compSection",
      "mode" : "target"
    },
    {
      "name" : "bundle",
      "type" : "Bundle",
      "mode" : "target"
    },
    {
      "name" : "patient",
      "type" : "Patient",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "panelBase",
      "source" : [{
        "context" : "organizer"
      }],
      "dependent" : [{
        "name" : "PatientSummaryObservationPanelBase",
        "variable" : ["organizer", "panel", "patient"]
      }]
    },
    {
      "name" : "component",
      "source" : [{
        "context" : "organizer",
        "element" : "component",
        "variable" : "component"
      }],
      "rule" : [{
        "name" : "observation",
        "source" : [{
          "context" : "component",
          "element" : "observation",
          "variable" : "observation"
        }],
        "rule" : [{
          "name" : "observationTemplate",
          "source" : [{
            "context" : "observation",
            "element" : "templateId",
            "variable" : "obsTid"
          }],
          "rule" : [{
            "name" : "memberObservation",
            "source" : [{
              "context" : "obsTid",
              "element" : "root",
              "variable" : "obsRoot",
              "condition" : "obsRoot = '1.2.250.1.213.1.1.3.50'"
            }],
            "target" : [{
              "context" : "bundle",
              "contextType" : "variable",
              "element" : "entry",
              "variable" : "observationEntry"
            },
            {
              "context" : "observationEntry",
              "contextType" : "variable",
              "element" : "resource",
              "variable" : "fhirObservation",
              "transform" : "create",
              "parameter" : [{
                "valueString" : "Observation"
              }]
            },
            {
              "context" : "fhirObservation",
              "contextType" : "variable",
              "element" : "id",
              "transform" : "uuid"
            },
            {
              "context" : "observationEntry",
              "contextType" : "variable",
              "element" : "fullUrl",
              "transform" : "evaluate",
              "parameter" : [{
                "valueString" : "'urn:uuid:' + %fhirObservation.id"
              }]
            }],
            "rule" : [{
              "name" : "vitalSignObservation",
              "source" : [{
                "context" : "observation"
              }],
              "dependent" : [{
                "name" : "PatientSummaryVitalSignObservationFromObservation",
                "variable" : ["observation", "fhirObservation", "patient"]
              }]
            },
            {
              "name" : "hasMember",
              "source" : [{
                "context" : "observation"
              }],
              "dependent" : [{
                "name" : "ObservationPanelHasMember",
                "variable" : ["observation", "panel", "fhirObservation"]
              }]
            }]
          }]
        }]
      }]
    },
    {
      "name" : "sectionEntry",
      "source" : [{
        "context" : "organizer"
      }],
      "dependent" : [{
        "name" : "ObservationAddToSection",
        "variable" : ["organizer", "panel", "compSection"]
      }]
    }]
  },
  {
    "name" : "PatientSummaryVitalSignObservationFromObservation",
    "typeMode" : "none",
    "input" : [{
      "name" : "observation",
      "mode" : "source"
    },
    {
      "name" : "fhirObservation",
      "type" : "Observation",
      "mode" : "target"
    },
    {
      "name" : "patient",
      "type" : "Patient",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "statusDefault",
      "source" : [{
        "context" : "observation"
      }],
      "target" : [{
        "context" : "fhirObservation",
        "contextType" : "variable",
        "element" : "status",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "final"
        }]
      }]
    },
    {
      "name" : "status",
      "source" : [{
        "context" : "observation",
        "element" : "statusCode",
        "variable" : "statusCode"
      }],
      "dependent" : [{
        "name" : "ObservationStatusFromCdaStatus",
        "variable" : ["statusCode", "fhirObservation"]
      }]
    },
    {
      "name" : "identifier",
      "source" : [{
        "context" : "observation",
        "element" : "id",
        "variable" : "id"
      }],
      "target" : [{
        "context" : "fhirObservation",
        "contextType" : "variable",
        "element" : "identifier",
        "variable" : "identifier",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Identifier"
        }]
      }],
      "dependent" : [{
        "name" : "II",
        "variable" : ["id", "identifier"]
      }]
    },
    {
      "name" : "subject",
      "source" : [{
        "context" : "observation"
      }],
      "target" : [{
        "context" : "fhirObservation",
        "contextType" : "variable",
        "element" : "subject",
        "variable" : "subjectRef",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Reference"
        }]
      },
      {
        "context" : "subjectRef",
        "contextType" : "variable",
        "element" : "reference",
        "transform" : "evaluate",
        "parameter" : [{
          "valueString" : "'urn:uuid:' + %patient.id"
        }]
      }]
    },
    {
      "name" : "category",
      "source" : [{
        "context" : "observation"
      }],
      "target" : [{
        "context" : "fhirObservation",
        "contextType" : "variable",
        "element" : "category",
        "variable" : "category",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "rule" : [{
        "name" : "categoryCoding",
        "source" : [{
          "context" : "observation"
        }],
        "target" : [{
          "context" : "category",
          "contextType" : "variable",
          "element" : "coding",
          "variable" : "coding",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Coding"
          }]
        }],
        "rule" : [{
          "name" : "categorySystem",
          "source" : [{
            "context" : "observation"
          }],
          "target" : [{
            "context" : "coding",
            "contextType" : "variable",
            "element" : "system",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "http://terminology.hl7.org/CodeSystem/observation-category"
            }]
          }]
        },
        {
          "name" : "categoryCode",
          "source" : [{
            "context" : "observation"
          }],
          "target" : [{
            "context" : "coding",
            "contextType" : "variable",
            "element" : "code",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "vital-signs"
            }]
          }]
        },
        {
          "name" : "categoryDisplay",
          "source" : [{
            "context" : "observation"
          }],
          "target" : [{
            "context" : "coding",
            "contextType" : "variable",
            "element" : "display",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "Vital Signs"
            }]
          }]
        }]
      }]
    },
    {
      "name" : "observationCode",
      "source" : [{
        "context" : "observation",
        "element" : "code",
        "variable" : "code"
      }],
      "target" : [{
        "context" : "fhirObservation",
        "contextType" : "variable",
        "element" : "code",
        "variable" : "obsCode",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "rule" : [{
        "name" : "code",
        "source" : [{
          "context" : "code"
        }],
        "dependent" : [{
          "name" : "CDCodeableConcept",
          "variable" : ["code", "obsCode"]
        }]
      },
      {
        "name" : "text",
        "source" : [{
          "context" : "observation",
          "element" : "text",
          "variable" : "text"
        }],
        "rule" : [{
          "name" : "reference",
          "source" : [{
            "context" : "text",
            "element" : "reference",
            "variable" : "reference"
          }],
          "rule" : [{
            "name" : "codeText",
            "source" : [{
              "context" : "reference",
              "element" : "value",
              "variable" : "value"
            }],
            "target" : [{
              "context" : "obsCode",
              "contextType" : "variable",
              "element" : "text",
              "transform" : "cast",
              "parameter" : [{
                "valueId" : "value"
              },
              {
                "valueString" : "string"
              }]
            }]
          }]
        }]
      }]
    },
    {
      "name" : "effectiveTime",
      "source" : [{
        "context" : "observation",
        "element" : "effectiveTime",
        "variable" : "effectiveTime"
      }],
      "dependent" : [{
        "name" : "ObservationEffectiveFromEffectiveTime",
        "variable" : ["effectiveTime", "fhirObservation"]
      }]
    },
    {
      "name" : "effectiveTimeAbsentReason",
      "source" : [{
        "context" : "observation",
        "condition" : "observation.effectiveTime.empty()"
      }],
      "target" : [{
        "context" : "fhirObservation",
        "contextType" : "variable",
        "element" : "effective",
        "variable" : "effectiveDateTime",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "dateTime"
        }]
      }],
      "rule" : [{
        "name" : "dataAbsentReason",
        "source" : [{
          "context" : "observation"
        }],
        "target" : [{
          "context" : "effectiveDateTime",
          "contextType" : "variable",
          "element" : "extension",
          "variable" : "absentReason",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Extension"
          }]
        }],
        "rule" : [{
          "name" : "url",
          "source" : [{
            "context" : "observation"
          }],
          "target" : [{
            "context" : "absentReason",
            "contextType" : "variable",
            "element" : "url",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
            }]
          }]
        },
        {
          "name" : "valueCode",
          "source" : [{
            "context" : "observation"
          }],
          "target" : [{
            "context" : "absentReason",
            "contextType" : "variable",
            "element" : "value",
            "transform" : "cast",
            "parameter" : [{
              "valueString" : "unknown"
            },
            {
              "valueString" : "code"
            }]
          }]
        }]
      }]
    },
    {
      "name" : "value",
      "source" : [{
        "context" : "observation",
        "element" : "value",
        "variable" : "value"
      }],
      "dependent" : [{
        "name" : "VitalSignObservationValueFromCdaValue",
        "variable" : ["value", "fhirObservation", "observation"]
      }]
    },
    {
      "name" : "interpretation",
      "source" : [{
        "context" : "observation",
        "element" : "interpretationCode",
        "variable" : "interpretationCode"
      }],
      "target" : [{
        "context" : "fhirObservation",
        "contextType" : "variable",
        "element" : "interpretation",
        "variable" : "interpretation",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "dependent" : [{
        "name" : "CDCodeableConcept",
        "variable" : ["interpretationCode", "interpretation"]
      }]
    },
    {
      "name" : "method",
      "source" : [{
        "context" : "observation",
        "element" : "methodCode",
        "variable" : "methodCode"
      }],
      "target" : [{
        "context" : "fhirObservation",
        "contextType" : "variable",
        "element" : "method",
        "variable" : "method",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "dependent" : [{
        "name" : "CDCodeableConcept",
        "variable" : ["methodCode", "method"]
      }]
    },
    {
      "name" : "bodySite",
      "source" : [{
        "context" : "observation",
        "element" : "targetSiteCode",
        "variable" : "targetSiteCode"
      }],
      "target" : [{
        "context" : "fhirObservation",
        "contextType" : "variable",
        "element" : "bodySite",
        "variable" : "bodySite",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "dependent" : [{
        "name" : "CDCodeableConcept",
        "variable" : ["targetSiteCode", "bodySite"]
      }]
    },
    {
      "name" : "comments",
      "source" : [{
        "context" : "observation",
        "element" : "entryRelationship",
        "variable" : "er"
      }],
      "dependent" : [{
        "name" : "ObservationCommentFromEntryRelationship",
        "variable" : ["er", "fhirObservation"]
      }]
    }]
  },
  {
    "name" : "VitalSignObservationValueFromCdaValue",
    "typeMode" : "none",
    "documentation" : "Valeur spécifique des signes vitaux",
    "input" : [{
      "name" : "value",
      "mode" : "source"
    },
    {
      "name" : "fhirObservation",
      "type" : "Observation",
      "mode" : "target"
    },
    {
      "name" : "observation",
      "mode" : "source"
    }],
    "rule" : [{
      "name" : "heightValueQuantityCm",
      "source" : [{
        "context" : "value",
        "element" : "unit",
        "variable" : "unit",
        "condition" : "(unit = 'm') and (observation.code.code = '8302-2')"
      }],
      "target" : [{
        "context" : "fhirObservation",
        "contextType" : "variable",
        "element" : "value",
        "variable" : "quantity",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Quantity"
        }]
      }],
      "rule" : [{
        "name" : "heightValueCm",
        "source" : [{
          "context" : "value",
          "element" : "value",
          "variable" : "v"
        }],
        "target" : [{
          "context" : "quantity",
          "contextType" : "variable",
          "element" : "value",
          "transform" : "evaluate",
          "parameter" : [{
            "valueString" : "v * 100"
          }]
        }]
      },
      {
        "name" : "heightUnitCm",
        "source" : [{
          "context" : "unit"
        }],
        "target" : [{
          "context" : "quantity",
          "contextType" : "variable",
          "element" : "unit",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "cm"
          }]
        }]
      },
      {
        "name" : "heightSystemUCUM",
        "source" : [{
          "context" : "value"
        }],
        "target" : [{
          "context" : "quantity",
          "contextType" : "variable",
          "element" : "system",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "http://unitsofmeasure.org"
          }]
        }]
      },
      {
        "name" : "heightCodeCm",
        "source" : [{
          "context" : "unit"
        }],
        "target" : [{
          "context" : "quantity",
          "contextType" : "variable",
          "element" : "code",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "cm"
          }]
        }]
      }]
    },
    {
      "name" : "valueQuantity",
      "source" : [{
        "context" : "value",
        "element" : "unit",
        "variable" : "unit",
        "condition" : "(observation.code.code != '8302-2') or (unit != 'm')"
      }],
      "target" : [{
        "context" : "fhirObservation",
        "contextType" : "variable",
        "element" : "value",
        "variable" : "quantity",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Quantity"
        }]
      }],
      "rule" : [{
        "name" : "quantityValue",
        "source" : [{
          "context" : "value",
          "element" : "value",
          "variable" : "v"
        }],
        "target" : [{
          "context" : "quantity",
          "contextType" : "variable",
          "element" : "value",
          "transform" : "cast",
          "parameter" : [{
            "valueId" : "v"
          },
          {
            "valueString" : "decimal"
          }]
        }]
      },
      {
        "name" : "quantityUnit",
        "source" : [{
          "context" : "unit"
        }],
        "target" : [{
          "context" : "quantity",
          "contextType" : "variable",
          "element" : "unit",
          "transform" : "cast",
          "parameter" : [{
            "valueId" : "unit"
          },
          {
            "valueString" : "string"
          }]
        }]
      },
      {
        "name" : "quantitySystem",
        "source" : [{
          "context" : "value"
        }],
        "target" : [{
          "context" : "quantity",
          "contextType" : "variable",
          "element" : "system",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "http://unitsofmeasure.org"
          }]
        }]
      },
      {
        "name" : "quantityCode",
        "source" : [{
          "context" : "unit"
        }],
        "target" : [{
          "context" : "quantity",
          "contextType" : "variable",
          "element" : "code",
          "transform" : "cast",
          "parameter" : [{
            "valueId" : "unit"
          },
          {
            "valueString" : "code"
          }]
        }]
      }]
    },
    {
      "name" : "valueCodeableConcept",
      "source" : [{
        "context" : "value",
        "element" : "code",
        "variable" : "code",
        "condition" : "value.unit.empty()"
      }],
      "target" : [{
        "context" : "fhirObservation",
        "contextType" : "variable",
        "element" : "value",
        "variable" : "valueCodeableConcept",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "dependent" : [{
        "name" : "CDCodeableConcept",
        "variable" : ["value", "valueCodeableConcept"]
      }]
    },
    {
      "name" : "valueBooleanTrue",
      "source" : [{
        "context" : "value",
        "element" : "value",
        "variable" : "v",
        "condition" : "value.unit.empty() and value.code.empty() and (v = 'true')"
      }],
      "target" : [{
        "context" : "fhirObservation",
        "contextType" : "variable",
        "element" : "value",
        "transform" : "cast",
        "parameter" : [{
          "valueId" : "v"
        },
        {
          "valueString" : "boolean"
        }]
      }]
    },
    {
      "name" : "valueBooleanFalse",
      "source" : [{
        "context" : "value",
        "element" : "value",
        "variable" : "v",
        "condition" : "value.unit.empty() and value.code.empty() and (v = 'false')"
      }],
      "target" : [{
        "context" : "fhirObservation",
        "contextType" : "variable",
        "element" : "value",
        "transform" : "cast",
        "parameter" : [{
          "valueId" : "v"
        },
        {
          "valueString" : "boolean"
        }]
      }]
    }]
  },
  {
    "name" : "PatientSummaryLifestyleSection",
    "typeMode" : "none",
    "documentation" : "7.2 MODE DE VIE / HABITUS",
    "input" : [{
      "name" : "section",
      "mode" : "source"
    },
    {
      "name" : "compSection",
      "mode" : "target"
    },
    {
      "name" : "bundle",
      "type" : "Bundle",
      "mode" : "target"
    },
    {
      "name" : "patient",
      "type" : "Patient",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "entry",
      "source" : [{
        "context" : "section",
        "element" : "entry",
        "variable" : "entry"
      }],
      "rule" : [{
        "name" : "lifestyleEntry",
        "source" : [{
          "context" : "entry",
          "element" : "observation",
          "variable" : "observation"
        }],
        "target" : [{
          "context" : "bundle",
          "contextType" : "variable",
          "element" : "entry",
          "variable" : "observationEntry"
        },
        {
          "context" : "observationEntry",
          "contextType" : "variable",
          "element" : "resource",
          "variable" : "fhirObservation",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Observation"
          }]
        },
        {
          "context" : "fhirObservation",
          "contextType" : "variable",
          "element" : "id",
          "transform" : "uuid"
        },
        {
          "context" : "observationEntry",
          "contextType" : "variable",
          "element" : "fullUrl",
          "transform" : "evaluate",
          "parameter" : [{
            "valueString" : "'urn:uuid:' + %fhirObservation.id"
          }]
        }],
        "rule" : [{
          "name" : "lifestyleObservation",
          "source" : [{
            "context" : "observation"
          }],
          "dependent" : [{
            "name" : "PatientSummaryLifestyleObservationFromObservation",
            "variable" : ["observation", "fhirObservation", "patient"]
          }]
        },
        {
          "name" : "sectionEntry",
          "source" : [{
            "context" : "observation"
          }],
          "dependent" : [{
            "name" : "ObservationAddToSection",
            "variable" : ["observation", "fhirObservation", "compSection"]
          }]
        }]
      }]
    }]
  },
  {
    "name" : "PatientSummaryLifestyleObservationFromObservation",
    "typeMode" : "none",
    "input" : [{
      "name" : "observation",
      "mode" : "source"
    },
    {
      "name" : "fhirObservation",
      "type" : "Observation",
      "mode" : "target"
    },
    {
      "name" : "patient",
      "type" : "Patient",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "statusDefault",
      "source" : [{
        "context" : "observation"
      }],
      "target" : [{
        "context" : "fhirObservation",
        "contextType" : "variable",
        "element" : "status",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "final"
        }]
      }]
    },
    {
      "name" : "status",
      "source" : [{
        "context" : "observation",
        "element" : "statusCode",
        "variable" : "statusCode"
      }],
      "dependent" : [{
        "name" : "ObservationStatusFromCdaStatus",
        "variable" : ["statusCode", "fhirObservation"]
      }]
    },
    {
      "name" : "identifier",
      "source" : [{
        "context" : "observation",
        "element" : "id",
        "variable" : "id"
      }],
      "target" : [{
        "context" : "fhirObservation",
        "contextType" : "variable",
        "element" : "identifier",
        "variable" : "identifier",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Identifier"
        }]
      }],
      "dependent" : [{
        "name" : "II",
        "variable" : ["id", "identifier"]
      }]
    },
    {
      "name" : "subject",
      "source" : [{
        "context" : "observation"
      }],
      "target" : [{
        "context" : "fhirObservation",
        "contextType" : "variable",
        "element" : "subject",
        "variable" : "subjectRef",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Reference"
        }]
      },
      {
        "context" : "subjectRef",
        "contextType" : "variable",
        "element" : "reference",
        "transform" : "evaluate",
        "parameter" : [{
          "valueString" : "'urn:uuid:' + %patient.id"
        }]
      }]
    },
    {
      "name" : "category",
      "source" : [{
        "context" : "observation"
      }],
      "target" : [{
        "context" : "fhirObservation",
        "contextType" : "variable",
        "element" : "category",
        "variable" : "category",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "rule" : [{
        "name" : "categoryCoding",
        "source" : [{
          "context" : "observation"
        }],
        "target" : [{
          "context" : "category",
          "contextType" : "variable",
          "element" : "coding",
          "variable" : "coding",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Coding"
          }]
        }],
        "rule" : [{
          "name" : "categorySystem",
          "source" : [{
            "context" : "observation"
          }],
          "target" : [{
            "context" : "coding",
            "contextType" : "variable",
            "element" : "system",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "http://terminology.hl7.org/CodeSystem/observation-category"
            }]
          }]
        },
        {
          "name" : "categoryCode",
          "source" : [{
            "context" : "observation"
          }],
          "target" : [{
            "context" : "coding",
            "contextType" : "variable",
            "element" : "code",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "social-history"
            }]
          }]
        },
        {
          "name" : "categoryDisplay",
          "source" : [{
            "context" : "observation"
          }],
          "target" : [{
            "context" : "coding",
            "contextType" : "variable",
            "element" : "display",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "Social History"
            }]
          }]
        }]
      }]
    },
    {
      "name" : "code",
      "source" : [{
        "context" : "observation",
        "element" : "code",
        "variable" : "code"
      }],
      "target" : [{
        "context" : "fhirObservation",
        "contextType" : "variable",
        "element" : "code",
        "variable" : "obsCode",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "dependent" : [{
        "name" : "CDCodeableConcept",
        "variable" : ["code", "obsCode"]
      }]
    },
    {
      "name" : "qualifiers",
      "source" : [{
        "context" : "observation",
        "element" : "code",
        "variable" : "code"
      }],
      "rule" : [{
        "name" : "qualifierComponent",
        "source" : [{
          "context" : "code",
          "element" : "qualifier",
          "variable" : "qualifier"
        }],
        "target" : [{
          "context" : "fhirObservation",
          "contextType" : "variable",
          "element" : "component",
          "variable" : "component"
        }],
        "dependent" : [{
          "name" : "LifestyleObservationComponentFromQualifier",
          "variable" : ["qualifier", "component"]
        }]
      }]
    },
    {
      "name" : "textNote",
      "source" : [{
        "context" : "observation",
        "element" : "text",
        "variable" : "text"
      }],
      "dependent" : [{
        "name" : "LifestyleObservationNoteFromText",
        "variable" : ["text", "fhirObservation"]
      }]
    },
    {
      "name" : "effectiveTime",
      "source" : [{
        "context" : "observation",
        "element" : "effectiveTime",
        "variable" : "effectiveTime"
      }],
      "dependent" : [{
        "name" : "ObservationEffectiveFromEffectiveTime",
        "variable" : ["effectiveTime", "fhirObservation"]
      }]
    },
    {
      "name" : "effectiveTimeAbsentReason",
      "source" : [{
        "context" : "observation",
        "condition" : "observation.effectiveTime.empty()"
      }],
      "target" : [{
        "context" : "fhirObservation",
        "contextType" : "variable",
        "element" : "effective",
        "variable" : "effectiveDateTime",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "dateTime"
        }]
      }],
      "rule" : [{
        "name" : "dataAbsentReason",
        "source" : [{
          "context" : "observation"
        }],
        "target" : [{
          "context" : "effectiveDateTime",
          "contextType" : "variable",
          "element" : "extension",
          "variable" : "absentReason",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Extension"
          }]
        }],
        "rule" : [{
          "name" : "url",
          "source" : [{
            "context" : "observation"
          }],
          "target" : [{
            "context" : "absentReason",
            "contextType" : "variable",
            "element" : "url",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
            }]
          }]
        },
        {
          "name" : "valueCode",
          "source" : [{
            "context" : "observation"
          }],
          "target" : [{
            "context" : "absentReason",
            "contextType" : "variable",
            "element" : "value",
            "transform" : "cast",
            "parameter" : [{
              "valueString" : "unknown"
            },
            {
              "valueString" : "code"
            }]
          }]
        }]
      }]
    },
    {
      "name" : "value",
      "source" : [{
        "context" : "observation",
        "element" : "value",
        "variable" : "value"
      }],
      "dependent" : [{
        "name" : "LifestyleObservationValueFromCdaValue",
        "variable" : ["value", "fhirObservation"]
      }]
    },
    {
      "name" : "comments",
      "source" : [{
        "context" : "observation",
        "element" : "entryRelationship",
        "variable" : "er"
      }],
      "dependent" : [{
        "name" : "ObservationCommentFromEntryRelationship",
        "variable" : ["er", "fhirObservation"]
      }]
    }]
  },
  {
    "name" : "LifestyleObservationValueFromCdaValue",
    "typeMode" : "none",
    "input" : [{
      "name" : "value",
      "mode" : "source"
    },
    {
      "name" : "fhirObservation",
      "type" : "Observation",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "valueQuantity",
      "source" : [{
        "context" : "value",
        "element" : "unit",
        "variable" : "unit"
      }],
      "target" : [{
        "context" : "fhirObservation",
        "contextType" : "variable",
        "element" : "value",
        "variable" : "quantity",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Quantity"
        }]
      }],
      "rule" : [{
        "name" : "quantityValue",
        "source" : [{
          "context" : "value",
          "element" : "value",
          "variable" : "v"
        }],
        "target" : [{
          "context" : "quantity",
          "contextType" : "variable",
          "element" : "value",
          "transform" : "cast",
          "parameter" : [{
            "valueId" : "v"
          },
          {
            "valueString" : "decimal"
          }]
        }]
      },
      {
        "name" : "quantityUnit",
        "source" : [{
          "context" : "unit"
        }],
        "target" : [{
          "context" : "quantity",
          "contextType" : "variable",
          "element" : "unit",
          "transform" : "cast",
          "parameter" : [{
            "valueId" : "unit"
          },
          {
            "valueString" : "string"
          }]
        }]
      }]
    },
    {
      "name" : "valueCodeableConcept",
      "source" : [{
        "context" : "value",
        "element" : "code",
        "variable" : "code",
        "condition" : "value.unit.empty()"
      }],
      "target" : [{
        "context" : "fhirObservation",
        "contextType" : "variable",
        "element" : "value",
        "variable" : "valueCodeableConcept",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "dependent" : [{
        "name" : "CDCodeableConcept",
        "variable" : ["value", "valueCodeableConcept"]
      }]
    },
    {
      "name" : "valueBooleanTrue",
      "source" : [{
        "context" : "value",
        "element" : "value",
        "variable" : "v",
        "condition" : "value.unit.empty() and value.code.empty() and (v = 'true')"
      }],
      "target" : [{
        "context" : "fhirObservation",
        "contextType" : "variable",
        "element" : "value",
        "transform" : "cast",
        "parameter" : [{
          "valueId" : "v"
        },
        {
          "valueString" : "boolean"
        }]
      }]
    },
    {
      "name" : "valueBooleanFalse",
      "source" : [{
        "context" : "value",
        "element" : "value",
        "variable" : "v",
        "condition" : "value.unit.empty() and value.code.empty() and (v = 'false')"
      }],
      "target" : [{
        "context" : "fhirObservation",
        "contextType" : "variable",
        "element" : "value",
        "transform" : "cast",
        "parameter" : [{
          "valueId" : "v"
        },
        {
          "valueString" : "boolean"
        }]
      }]
    }]
  },
  {
    "name" : "LifestyleObservationComponentFromQualifier",
    "typeMode" : "none",
    "input" : [{
      "name" : "qualifier",
      "mode" : "source"
    },
    {
      "name" : "component",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "componentCode",
      "source" : [{
        "context" : "qualifier",
        "element" : "name",
        "variable" : "name"
      }],
      "target" : [{
        "context" : "component",
        "contextType" : "variable",
        "element" : "code",
        "variable" : "componentCode",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "dependent" : [{
        "name" : "CDCodeableConcept",
        "variable" : ["name", "componentCode"]
      }]
    },
    {
      "name" : "componentValue",
      "source" : [{
        "context" : "qualifier",
        "element" : "value",
        "variable" : "value"
      }],
      "dependent" : [{
        "name" : "LifestyleObservationComponentValueFromCdaValue",
        "variable" : ["value", "component"]
      }]
    }]
  },
  {
    "name" : "LifestyleObservationComponentValueFromCdaValue",
    "typeMode" : "none",
    "input" : [{
      "name" : "value",
      "mode" : "source"
    },
    {
      "name" : "component",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "componentValueQuantity",
      "source" : [{
        "context" : "value",
        "element" : "unit",
        "variable" : "unit"
      }],
      "target" : [{
        "context" : "component",
        "contextType" : "variable",
        "element" : "value",
        "variable" : "quantity",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Quantity"
        }]
      }],
      "rule" : [{
        "name" : "quantityValue",
        "source" : [{
          "context" : "value",
          "element" : "value",
          "variable" : "v"
        }],
        "target" : [{
          "context" : "quantity",
          "contextType" : "variable",
          "element" : "value",
          "transform" : "cast",
          "parameter" : [{
            "valueId" : "v"
          },
          {
            "valueString" : "decimal"
          }]
        }]
      },
      {
        "name" : "quantityUnit",
        "source" : [{
          "context" : "unit"
        }],
        "target" : [{
          "context" : "quantity",
          "contextType" : "variable",
          "element" : "unit",
          "transform" : "cast",
          "parameter" : [{
            "valueId" : "unit"
          },
          {
            "valueString" : "string"
          }]
        }]
      }]
    },
    {
      "name" : "componentValueCodeableConcept",
      "source" : [{
        "context" : "value",
        "element" : "code",
        "variable" : "code",
        "condition" : "value.unit.empty()"
      }],
      "target" : [{
        "context" : "component",
        "contextType" : "variable",
        "element" : "value",
        "variable" : "valueCodeableConcept",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "dependent" : [{
        "name" : "CDCodeableConcept",
        "variable" : ["value", "valueCodeableConcept"]
      }]
    },
    {
      "name" : "componentValueBooleanTrue",
      "source" : [{
        "context" : "value",
        "element" : "value",
        "variable" : "v",
        "condition" : "value.unit.empty() and value.code.empty() and (v = 'true')"
      }],
      "target" : [{
        "context" : "component",
        "contextType" : "variable",
        "element" : "value",
        "transform" : "cast",
        "parameter" : [{
          "valueId" : "v"
        },
        {
          "valueString" : "boolean"
        }]
      }]
    },
    {
      "name" : "componentValueBooleanFalse",
      "source" : [{
        "context" : "value",
        "element" : "value",
        "variable" : "v",
        "condition" : "value.unit.empty() and value.code.empty() and (v = 'false')"
      }],
      "target" : [{
        "context" : "component",
        "contextType" : "variable",
        "element" : "value",
        "transform" : "cast",
        "parameter" : [{
          "valueId" : "v"
        },
        {
          "valueString" : "boolean"
        }]
      }]
    }]
  },
  {
    "name" : "LifestyleObservationNoteFromText",
    "typeMode" : "none",
    "input" : [{
      "name" : "text",
      "mode" : "source"
    },
    {
      "name" : "fhirObservation",
      "type" : "Observation",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "reference",
      "source" : [{
        "context" : "text",
        "element" : "reference",
        "variable" : "reference"
      }],
      "rule" : [{
        "name" : "noteReference",
        "source" : [{
          "context" : "reference",
          "element" : "value",
          "variable" : "value"
        }],
        "target" : [{
          "context" : "fhirObservation",
          "contextType" : "variable",
          "element" : "note",
          "variable" : "note",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Annotation"
          }]
        },
        {
          "context" : "note",
          "contextType" : "variable",
          "element" : "text",
          "transform" : "cast",
          "parameter" : [{
            "valueId" : "value"
          },
          {
            "valueString" : "string"
          }]
        }]
      }]
    },
    {
      "name" : "noteText",
      "source" : [{
        "context" : "text",
        "element" : "xmlText",
        "variable" : "xml",
        "condition" : "text.reference.empty()"
      }],
      "target" : [{
        "context" : "fhirObservation",
        "contextType" : "variable",
        "element" : "note",
        "variable" : "note",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Annotation"
        }]
      },
      {
        "context" : "note",
        "contextType" : "variable",
        "element" : "text",
        "transform" : "cast",
        "parameter" : [{
          "valueId" : "xml"
        },
        {
          "valueString" : "string"
        }]
      }]
    }]
  },
  {
    "name" : "PatientSummaryFunctionalStatusSection",
    "typeMode" : "none",
    "documentation" : "7.3 STATUT FONCTIONNEL",
    "input" : [{
      "name" : "section",
      "mode" : "source"
    },
    {
      "name" : "compSection",
      "mode" : "target"
    },
    {
      "name" : "bundle",
      "type" : "Bundle",
      "mode" : "target"
    },
    {
      "name" : "patient",
      "type" : "Patient",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "entry",
      "source" : [{
        "context" : "section",
        "element" : "entry",
        "variable" : "entry"
      }],
      "rule" : [{
        "name" : "panelEntry",
        "source" : [{
          "context" : "entry",
          "element" : "organizer",
          "variable" : "organizer"
        }],
        "target" : [{
          "context" : "bundle",
          "contextType" : "variable",
          "element" : "entry",
          "variable" : "panelEntry"
        },
        {
          "context" : "panelEntry",
          "contextType" : "variable",
          "element" : "resource",
          "variable" : "panel",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Observation"
          }]
        },
        {
          "context" : "panel",
          "contextType" : "variable",
          "element" : "id",
          "transform" : "uuid"
        },
        {
          "context" : "panelEntry",
          "contextType" : "variable",
          "element" : "fullUrl",
          "transform" : "evaluate",
          "parameter" : [{
            "valueString" : "'urn:uuid:' + %panel.id"
          }]
        }],
        "rule" : [{
          "name" : "functionalStatusPanel",
          "source" : [{
            "context" : "organizer"
          }],
          "dependent" : [{
            "name" : "FunctionalStatusPanelFromOrganizer",
            "variable" : ["organizer", "panel", "compSection", "bundle", "patient"]
          }]
        }]
      },
      {
        "name" : "directObservation",
        "source" : [{
          "context" : "entry",
          "element" : "observation",
          "variable" : "observation"
        }],
        "target" : [{
          "context" : "bundle",
          "contextType" : "variable",
          "element" : "entry",
          "variable" : "observationEntry"
        },
        {
          "context" : "observationEntry",
          "contextType" : "variable",
          "element" : "resource",
          "variable" : "fhirObservation",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Observation"
          }]
        },
        {
          "context" : "fhirObservation",
          "contextType" : "variable",
          "element" : "id",
          "transform" : "uuid"
        },
        {
          "context" : "observationEntry",
          "contextType" : "variable",
          "element" : "fullUrl",
          "transform" : "evaluate",
          "parameter" : [{
            "valueString" : "'urn:uuid:' + %fhirObservation.id"
          }]
        }],
        "rule" : [{
          "name" : "functionalStatusObservation",
          "source" : [{
            "context" : "observation"
          }],
          "dependent" : [{
            "name" : "FunctionalStatusEvaluationFromObservation",
            "variable" : ["observation", "fhirObservation", "patient"]
          }]
        },
        {
          "name" : "sectionEntry",
          "source" : [{
            "context" : "observation"
          }],
          "dependent" : [{
            "name" : "ObservationAddToSection",
            "variable" : ["observation", "fhirObservation", "compSection"]
          }]
        }]
      }]
    }]
  },
  {
    "name" : "FunctionalStatusPanelFromOrganizer",
    "typeMode" : "none",
    "input" : [{
      "name" : "organizer",
      "mode" : "source"
    },
    {
      "name" : "panel",
      "type" : "Observation",
      "mode" : "target"
    },
    {
      "name" : "compSection",
      "mode" : "target"
    },
    {
      "name" : "bundle",
      "type" : "Bundle",
      "mode" : "target"
    },
    {
      "name" : "patient",
      "type" : "Patient",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "panelBase",
      "source" : [{
        "context" : "organizer"
      }],
      "dependent" : [{
        "name" : "FunctionalStatusPanelBase",
        "variable" : ["organizer", "panel", "patient"]
      }]
    },
    {
      "name" : "component",
      "source" : [{
        "context" : "organizer",
        "element" : "component",
        "variable" : "component"
      }],
      "rule" : [{
        "name" : "componentObservation",
        "source" : [{
          "context" : "component",
          "element" : "observation",
          "variable" : "observation"
        }],
        "target" : [{
          "context" : "bundle",
          "contextType" : "variable",
          "element" : "entry",
          "variable" : "observationEntry"
        },
        {
          "context" : "observationEntry",
          "contextType" : "variable",
          "element" : "resource",
          "variable" : "fhirObservation",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Observation"
          }]
        },
        {
          "context" : "fhirObservation",
          "contextType" : "variable",
          "element" : "id",
          "transform" : "uuid"
        },
        {
          "context" : "observationEntry",
          "contextType" : "variable",
          "element" : "fullUrl",
          "transform" : "evaluate",
          "parameter" : [{
            "valueString" : "'urn:uuid:' + %fhirObservation.id"
          }]
        }],
        "rule" : [{
          "name" : "memberObservation",
          "source" : [{
            "context" : "observation"
          }],
          "dependent" : [{
            "name" : "FunctionalStatusEvaluationFromObservation",
            "variable" : ["observation", "fhirObservation", "patient"]
          }]
        },
        {
          "name" : "hasMember",
          "source" : [{
            "context" : "observation"
          }],
          "dependent" : [{
            "name" : "ObservationPanelHasMember",
            "variable" : ["observation", "panel", "fhirObservation"]
          }]
        }]
      }]
    },
    {
      "name" : "sectionEntry",
      "source" : [{
        "context" : "organizer"
      }],
      "dependent" : [{
        "name" : "ObservationAddToSection",
        "variable" : ["organizer", "panel", "compSection"]
      }]
    }]
  },
  {
    "name" : "FunctionalStatusPanelBase",
    "typeMode" : "none",
    "input" : [{
      "name" : "organizer",
      "mode" : "source"
    },
    {
      "name" : "panel",
      "type" : "Observation",
      "mode" : "target"
    },
    {
      "name" : "patient",
      "type" : "Patient",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "statusDefault",
      "source" : [{
        "context" : "organizer"
      }],
      "target" : [{
        "context" : "panel",
        "contextType" : "variable",
        "element" : "status",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "final"
        }]
      }]
    },
    {
      "name" : "status",
      "source" : [{
        "context" : "organizer",
        "element" : "statusCode",
        "variable" : "statusCode"
      }],
      "dependent" : [{
        "name" : "ObservationStatusFromCdaStatus",
        "variable" : ["statusCode", "panel"]
      }]
    },
    {
      "name" : "identifier",
      "source" : [{
        "context" : "organizer",
        "element" : "id",
        "variable" : "id"
      }],
      "target" : [{
        "context" : "panel",
        "contextType" : "variable",
        "element" : "identifier",
        "variable" : "identifier",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Identifier"
        }]
      }],
      "dependent" : [{
        "name" : "II",
        "variable" : ["id", "identifier"]
      }]
    },
    {
      "name" : "subject",
      "source" : [{
        "context" : "organizer"
      }],
      "target" : [{
        "context" : "panel",
        "contextType" : "variable",
        "element" : "subject",
        "variable" : "subjectRef",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Reference"
        }]
      },
      {
        "context" : "subjectRef",
        "contextType" : "variable",
        "element" : "reference",
        "transform" : "evaluate",
        "parameter" : [{
          "valueString" : "'urn:uuid:' + %patient.id"
        }]
      }]
    },
    {
      "name" : "category",
      "source" : [{
        "context" : "organizer"
      }],
      "target" : [{
        "context" : "panel",
        "contextType" : "variable",
        "element" : "category",
        "variable" : "category",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "rule" : [{
        "name" : "categoryCoding",
        "source" : [{
          "context" : "organizer"
        }],
        "target" : [{
          "context" : "category",
          "contextType" : "variable",
          "element" : "coding",
          "variable" : "coding",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Coding"
          }]
        }],
        "rule" : [{
          "name" : "categorySystem",
          "source" : [{
            "context" : "organizer"
          }],
          "target" : [{
            "context" : "coding",
            "contextType" : "variable",
            "element" : "system",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "http://terminology.hl7.org/CodeSystem/observation-category"
            }]
          }]
        },
        {
          "name" : "categoryCode",
          "source" : [{
            "context" : "organizer"
          }],
          "target" : [{
            "context" : "coding",
            "contextType" : "variable",
            "element" : "code",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "survey"
            }]
          }]
        },
        {
          "name" : "categoryDisplay",
          "source" : [{
            "context" : "organizer"
          }],
          "target" : [{
            "context" : "coding",
            "contextType" : "variable",
            "element" : "display",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "Survey"
            }]
          }]
        }]
      }]
    },
    {
      "name" : "code",
      "source" : [{
        "context" : "organizer",
        "element" : "code",
        "variable" : "code"
      }],
      "target" : [{
        "context" : "panel",
        "contextType" : "variable",
        "element" : "code",
        "variable" : "panelCode",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "dependent" : [{
        "name" : "CDCodeableConcept",
        "variable" : ["code", "panelCode"]
      }]
    },
    {
      "name" : "effectiveTime",
      "source" : [{
        "context" : "organizer",
        "element" : "effectiveTime",
        "variable" : "effectiveTime"
      }],
      "dependent" : [{
        "name" : "ObservationEffectiveFromEffectiveTime",
        "variable" : ["effectiveTime", "panel"]
      }]
    },
    {
      "name" : "effectiveTimeAbsentReason",
      "source" : [{
        "context" : "organizer",
        "condition" : "organizer.effectiveTime.empty()"
      }],
      "target" : [{
        "context" : "panel",
        "contextType" : "variable",
        "element" : "effective",
        "variable" : "effectiveDateTime",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "dateTime"
        }]
      }],
      "rule" : [{
        "name" : "dataAbsentReason",
        "source" : [{
          "context" : "organizer"
        }],
        "target" : [{
          "context" : "effectiveDateTime",
          "contextType" : "variable",
          "element" : "extension",
          "variable" : "absentReason",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Extension"
          }]
        }],
        "rule" : [{
          "name" : "url",
          "source" : [{
            "context" : "organizer"
          }],
          "target" : [{
            "context" : "absentReason",
            "contextType" : "variable",
            "element" : "url",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
            }]
          }]
        },
        {
          "name" : "valueCode",
          "source" : [{
            "context" : "organizer"
          }],
          "target" : [{
            "context" : "absentReason",
            "contextType" : "variable",
            "element" : "value",
            "transform" : "cast",
            "parameter" : [{
              "valueString" : "unknown"
            },
            {
              "valueString" : "code"
            }]
          }]
        }]
      }]
    }]
  },
  {
    "name" : "FunctionalStatusEvaluationFromObservation",
    "typeMode" : "none",
    "input" : [{
      "name" : "observation",
      "mode" : "source"
    },
    {
      "name" : "fhirObservation",
      "type" : "Observation",
      "mode" : "target"
    },
    {
      "name" : "patient",
      "type" : "Patient",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "statusDefault",
      "source" : [{
        "context" : "observation"
      }],
      "target" : [{
        "context" : "fhirObservation",
        "contextType" : "variable",
        "element" : "status",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "final"
        }]
      }]
    },
    {
      "name" : "status",
      "source" : [{
        "context" : "observation",
        "element" : "statusCode",
        "variable" : "statusCode"
      }],
      "dependent" : [{
        "name" : "ObservationStatusFromCdaStatus",
        "variable" : ["statusCode", "fhirObservation"]
      }]
    },
    {
      "name" : "identifier",
      "source" : [{
        "context" : "observation",
        "element" : "id",
        "variable" : "id"
      }],
      "target" : [{
        "context" : "fhirObservation",
        "contextType" : "variable",
        "element" : "identifier",
        "variable" : "identifier",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Identifier"
        }]
      }],
      "dependent" : [{
        "name" : "II",
        "variable" : ["id", "identifier"]
      }]
    },
    {
      "name" : "subject",
      "source" : [{
        "context" : "observation"
      }],
      "target" : [{
        "context" : "fhirObservation",
        "contextType" : "variable",
        "element" : "subject",
        "variable" : "subjectRef",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Reference"
        }]
      },
      {
        "context" : "subjectRef",
        "contextType" : "variable",
        "element" : "reference",
        "transform" : "evaluate",
        "parameter" : [{
          "valueString" : "'urn:uuid:' + %patient.id"
        }]
      }]
    },
    {
      "name" : "category",
      "source" : [{
        "context" : "observation"
      }],
      "target" : [{
        "context" : "fhirObservation",
        "contextType" : "variable",
        "element" : "category",
        "variable" : "category",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "rule" : [{
        "name" : "categoryCoding",
        "source" : [{
          "context" : "observation"
        }],
        "target" : [{
          "context" : "category",
          "contextType" : "variable",
          "element" : "coding",
          "variable" : "coding",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Coding"
          }]
        }],
        "rule" : [{
          "name" : "categorySystem",
          "source" : [{
            "context" : "observation"
          }],
          "target" : [{
            "context" : "coding",
            "contextType" : "variable",
            "element" : "system",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "http://terminology.hl7.org/CodeSystem/observation-category"
            }]
          }]
        },
        {
          "name" : "categoryCode",
          "source" : [{
            "context" : "observation"
          }],
          "target" : [{
            "context" : "coding",
            "contextType" : "variable",
            "element" : "code",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "survey"
            }]
          }]
        },
        {
          "name" : "categoryDisplay",
          "source" : [{
            "context" : "observation"
          }],
          "target" : [{
            "context" : "coding",
            "contextType" : "variable",
            "element" : "display",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "Survey"
            }]
          }]
        }]
      }]
    },
    {
      "name" : "observationCode",
      "source" : [{
        "context" : "observation",
        "element" : "code",
        "variable" : "code"
      }],
      "target" : [{
        "context" : "fhirObservation",
        "contextType" : "variable",
        "element" : "code",
        "variable" : "obsCode",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "rule" : [{
        "name" : "code",
        "source" : [{
          "context" : "code"
        }],
        "dependent" : [{
          "name" : "CDCodeableConcept",
          "variable" : ["code", "obsCode"]
        }]
      },
      {
        "name" : "text",
        "source" : [{
          "context" : "observation",
          "element" : "text",
          "variable" : "text"
        }],
        "rule" : [{
          "name" : "reference",
          "source" : [{
            "context" : "text",
            "element" : "reference",
            "variable" : "reference"
          }],
          "rule" : [{
            "name" : "codeText",
            "source" : [{
              "context" : "reference",
              "element" : "value",
              "variable" : "value"
            }],
            "target" : [{
              "context" : "obsCode",
              "contextType" : "variable",
              "element" : "text",
              "transform" : "cast",
              "parameter" : [{
                "valueId" : "value"
              },
              {
                "valueString" : "string"
              }]
            }]
          }]
        }]
      }]
    },
    {
      "name" : "effectiveTime",
      "source" : [{
        "context" : "observation",
        "element" : "effectiveTime",
        "variable" : "effectiveTime"
      }],
      "dependent" : [{
        "name" : "ObservationEffectiveFromEffectiveTime",
        "variable" : ["effectiveTime", "fhirObservation"]
      }]
    },
    {
      "name" : "effectiveTimeAbsentReason",
      "source" : [{
        "context" : "observation",
        "condition" : "observation.effectiveTime.empty()"
      }],
      "target" : [{
        "context" : "fhirObservation",
        "contextType" : "variable",
        "element" : "effective",
        "variable" : "effectiveDateTime",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "dateTime"
        }]
      }],
      "rule" : [{
        "name" : "dataAbsentReason",
        "source" : [{
          "context" : "observation"
        }],
        "target" : [{
          "context" : "effectiveDateTime",
          "contextType" : "variable",
          "element" : "extension",
          "variable" : "absentReason",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Extension"
          }]
        }],
        "rule" : [{
          "name" : "url",
          "source" : [{
            "context" : "observation"
          }],
          "target" : [{
            "context" : "absentReason",
            "contextType" : "variable",
            "element" : "url",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
            }]
          }]
        },
        {
          "name" : "valueCode",
          "source" : [{
            "context" : "observation"
          }],
          "target" : [{
            "context" : "absentReason",
            "contextType" : "variable",
            "element" : "value",
            "transform" : "cast",
            "parameter" : [{
              "valueString" : "unknown"
            },
            {
              "valueString" : "code"
            }]
          }]
        }]
      }]
    },
    {
      "name" : "value",
      "source" : [{
        "context" : "observation",
        "element" : "value",
        "variable" : "value"
      }],
      "dependent" : [{
        "name" : "FunctionalStatusValueFromCdaValue",
        "variable" : ["value", "fhirObservation"]
      }]
    },
    {
      "name" : "interpretation",
      "source" : [{
        "context" : "observation",
        "element" : "interpretationCode",
        "variable" : "interpretationCode"
      }],
      "target" : [{
        "context" : "fhirObservation",
        "contextType" : "variable",
        "element" : "interpretation",
        "variable" : "interpretation",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "dependent" : [{
        "name" : "CDCodeableConcept",
        "variable" : ["interpretationCode", "interpretation"]
      }]
    },
    {
      "name" : "entryRelationship",
      "source" : [{
        "context" : "observation",
        "element" : "entryRelationship",
        "variable" : "er"
      }],
      "dependent" : [{
        "name" : "FunctionalStatusEntryRelationship",
        "variable" : ["er", "fhirObservation"]
      }]
    }]
  },
  {
    "name" : "FunctionalStatusValueFromCdaValue",
    "typeMode" : "none",
    "input" : [{
      "name" : "value",
      "mode" : "source"
    },
    {
      "name" : "fhirObservation",
      "type" : "Observation",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "valueQuantity",
      "source" : [{
        "context" : "value",
        "element" : "unit",
        "variable" : "unit"
      }],
      "target" : [{
        "context" : "fhirObservation",
        "contextType" : "variable",
        "element" : "value",
        "variable" : "quantity",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Quantity"
        }]
      }],
      "rule" : [{
        "name" : "quantityValue",
        "source" : [{
          "context" : "value",
          "element" : "value",
          "variable" : "v"
        }],
        "target" : [{
          "context" : "quantity",
          "contextType" : "variable",
          "element" : "value",
          "transform" : "cast",
          "parameter" : [{
            "valueId" : "v"
          },
          {
            "valueString" : "decimal"
          }]
        }]
      },
      {
        "name" : "quantityUnit",
        "source" : [{
          "context" : "unit"
        }],
        "target" : [{
          "context" : "quantity",
          "contextType" : "variable",
          "element" : "unit",
          "transform" : "cast",
          "parameter" : [{
            "valueId" : "unit"
          },
          {
            "valueString" : "string"
          }]
        }]
      }]
    },
    {
      "name" : "valueCodeableConcept",
      "source" : [{
        "context" : "value",
        "element" : "code",
        "variable" : "code",
        "condition" : "value.unit.empty()"
      }],
      "target" : [{
        "context" : "fhirObservation",
        "contextType" : "variable",
        "element" : "value",
        "variable" : "valueCodeableConcept",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "dependent" : [{
        "name" : "CDCodeableConcept",
        "variable" : ["value", "valueCodeableConcept"]
      }]
    },
    {
      "name" : "valueBooleanTrue",
      "source" : [{
        "context" : "value",
        "element" : "value",
        "variable" : "v",
        "condition" : "value.unit.empty() and value.code.empty() and (v = 'true')"
      }],
      "target" : [{
        "context" : "fhirObservation",
        "contextType" : "variable",
        "element" : "value",
        "transform" : "cast",
        "parameter" : [{
          "valueId" : "v"
        },
        {
          "valueString" : "boolean"
        }]
      }]
    },
    {
      "name" : "valueBooleanFalse",
      "source" : [{
        "context" : "value",
        "element" : "value",
        "variable" : "v",
        "condition" : "value.unit.empty() and value.code.empty() and (v = 'false')"
      }],
      "target" : [{
        "context" : "fhirObservation",
        "contextType" : "variable",
        "element" : "value",
        "transform" : "cast",
        "parameter" : [{
          "valueId" : "v"
        },
        {
          "valueString" : "boolean"
        }]
      }]
    }]
  },
  {
    "name" : "FunctionalStatusEntryRelationship",
    "typeMode" : "none",
    "input" : [{
      "name" : "er",
      "mode" : "source"
    },
    {
      "name" : "fhirObservation",
      "type" : "Observation",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "componentN1",
      "source" : [{
        "context" : "er",
        "element" : "observation",
        "variable" : "componentObservation",
        "condition" : "er.typeCode = 'COMP'"
      }],
      "target" : [{
        "context" : "fhirObservation",
        "contextType" : "variable",
        "element" : "component",
        "variable" : "component"
      }],
      "dependent" : [{
        "name" : "FunctionalStatusComponentFromObservation",
        "variable" : ["componentObservation", "component"]
      }]
    },
    {
      "name" : "nestedComponents",
      "source" : [{
        "context" : "er",
        "element" : "observation",
        "variable" : "componentObservation",
        "condition" : "er.typeCode = 'COMP'"
      }],
      "rule" : [{
        "name" : "entryRelationshipN2",
        "source" : [{
          "context" : "componentObservation",
          "element" : "entryRelationship",
          "variable" : "er2"
        }],
        "rule" : [{
          "name" : "componentN2",
          "source" : [{
            "context" : "er2",
            "element" : "observation",
            "variable" : "componentObservationN2",
            "condition" : "er2.typeCode = 'COMP'"
          }],
          "target" : [{
            "context" : "fhirObservation",
            "contextType" : "variable",
            "element" : "component",
            "variable" : "componentN2"
          }],
          "dependent" : [{
            "name" : "FunctionalStatusComponentFromObservation",
            "variable" : ["componentObservationN2", "componentN2"]
          }]
        }]
      }]
    },
    {
      "name" : "comment",
      "source" : [{
        "context" : "er",
        "element" : "act",
        "variable" : "commentAct"
      }],
      "dependent" : [{
        "name" : "FunctionalStatusNoteFromCommentAct",
        "variable" : ["commentAct", "fhirObservation"]
      }]
    }]
  },
  {
    "name" : "FunctionalStatusComponentFromObservation",
    "typeMode" : "none",
    "input" : [{
      "name" : "componentObservation",
      "mode" : "source"
    },
    {
      "name" : "component",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "componentId",
      "source" : [{
        "context" : "componentObservation",
        "element" : "id",
        "variable" : "id"
      }],
      "rule" : [{
        "name" : "componentIdExtension",
        "source" : [{
          "context" : "id",
          "element" : "extension",
          "variable" : "extension"
        }],
        "target" : [{
          "context" : "component",
          "contextType" : "variable",
          "element" : "id",
          "transform" : "cast",
          "parameter" : [{
            "valueId" : "extension"
          },
          {
            "valueString" : "string"
          }]
        }]
      },
      {
        "name" : "componentIdRoot",
        "source" : [{
          "context" : "id",
          "element" : "root",
          "variable" : "root",
          "condition" : "id.extension.empty()"
        }],
        "target" : [{
          "context" : "component",
          "contextType" : "variable",
          "element" : "id",
          "transform" : "cast",
          "parameter" : [{
            "valueId" : "root"
          },
          {
            "valueString" : "string"
          }]
        }]
      }]
    },
    {
      "name" : "code",
      "source" : [{
        "context" : "componentObservation",
        "element" : "code",
        "variable" : "code"
      }],
      "target" : [{
        "context" : "component",
        "contextType" : "variable",
        "element" : "code",
        "variable" : "componentCode",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "rule" : [{
        "name" : "componentCode",
        "source" : [{
          "context" : "code"
        }],
        "dependent" : [{
          "name" : "CDCodeableConcept",
          "variable" : ["code", "componentCode"]
        }]
      },
      {
        "name" : "text",
        "source" : [{
          "context" : "componentObservation",
          "element" : "text",
          "variable" : "text"
        }],
        "rule" : [{
          "name" : "reference",
          "source" : [{
            "context" : "text",
            "element" : "reference",
            "variable" : "reference"
          }],
          "rule" : [{
            "name" : "componentCodeText",
            "source" : [{
              "context" : "reference",
              "element" : "value",
              "variable" : "value"
            }],
            "target" : [{
              "context" : "componentCode",
              "contextType" : "variable",
              "element" : "text",
              "transform" : "cast",
              "parameter" : [{
                "valueId" : "value"
              },
              {
                "valueString" : "string"
              }]
            }]
          }]
        }]
      }]
    },
    {
      "name" : "value",
      "source" : [{
        "context" : "componentObservation",
        "element" : "value",
        "variable" : "value"
      }],
      "dependent" : [{
        "name" : "FunctionalStatusComponentValueFromCdaValue",
        "variable" : ["value", "component"]
      }]
    },
    {
      "name" : "interpretation",
      "source" : [{
        "context" : "componentObservation",
        "element" : "interpretationCode",
        "variable" : "interpretationCode"
      }],
      "target" : [{
        "context" : "component",
        "contextType" : "variable",
        "element" : "interpretation",
        "variable" : "interpretation",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "dependent" : [{
        "name" : "CDCodeableConcept",
        "variable" : ["interpretationCode", "interpretation"]
      }]
    }]
  },
  {
    "name" : "FunctionalStatusComponentValueFromCdaValue",
    "typeMode" : "none",
    "input" : [{
      "name" : "value",
      "mode" : "source"
    },
    {
      "name" : "component",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "componentValueQuantity",
      "source" : [{
        "context" : "value",
        "element" : "unit",
        "variable" : "unit"
      }],
      "target" : [{
        "context" : "component",
        "contextType" : "variable",
        "element" : "value",
        "variable" : "quantity",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Quantity"
        }]
      }],
      "rule" : [{
        "name" : "quantityValue",
        "source" : [{
          "context" : "value",
          "element" : "value",
          "variable" : "v"
        }],
        "target" : [{
          "context" : "quantity",
          "contextType" : "variable",
          "element" : "value",
          "transform" : "cast",
          "parameter" : [{
            "valueId" : "v"
          },
          {
            "valueString" : "decimal"
          }]
        }]
      },
      {
        "name" : "quantityUnit",
        "source" : [{
          "context" : "unit"
        }],
        "target" : [{
          "context" : "quantity",
          "contextType" : "variable",
          "element" : "unit",
          "transform" : "cast",
          "parameter" : [{
            "valueId" : "unit"
          },
          {
            "valueString" : "string"
          }]
        }]
      }]
    },
    {
      "name" : "componentValueCodeableConcept",
      "source" : [{
        "context" : "value",
        "element" : "code",
        "variable" : "code",
        "condition" : "value.unit.empty()"
      }],
      "target" : [{
        "context" : "component",
        "contextType" : "variable",
        "element" : "value",
        "variable" : "valueCodeableConcept",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "dependent" : [{
        "name" : "CDCodeableConcept",
        "variable" : ["value", "valueCodeableConcept"]
      }]
    },
    {
      "name" : "componentValueBooleanTrue",
      "source" : [{
        "context" : "value",
        "element" : "value",
        "variable" : "v",
        "condition" : "value.unit.empty() and value.code.empty() and (v = 'true')"
      }],
      "target" : [{
        "context" : "component",
        "contextType" : "variable",
        "element" : "value",
        "transform" : "cast",
        "parameter" : [{
          "valueId" : "v"
        },
        {
          "valueString" : "boolean"
        }]
      }]
    },
    {
      "name" : "componentValueBooleanFalse",
      "source" : [{
        "context" : "value",
        "element" : "value",
        "variable" : "v",
        "condition" : "value.unit.empty() and value.code.empty() and (v = 'false')"
      }],
      "target" : [{
        "context" : "component",
        "contextType" : "variable",
        "element" : "value",
        "transform" : "cast",
        "parameter" : [{
          "valueId" : "v"
        },
        {
          "valueString" : "boolean"
        }]
      }]
    }]
  },
  {
    "name" : "FunctionalStatusNoteFromCommentAct",
    "typeMode" : "none",
    "input" : [{
      "name" : "commentAct",
      "mode" : "source"
    },
    {
      "name" : "fhirObservation",
      "type" : "Observation",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "text",
      "source" : [{
        "context" : "commentAct",
        "element" : "text",
        "variable" : "text"
      }],
      "rule" : [{
        "name" : "reference",
        "source" : [{
          "context" : "text",
          "element" : "reference",
          "variable" : "reference"
        }],
        "rule" : [{
          "name" : "noteReference",
          "source" : [{
            "context" : "reference",
            "element" : "value",
            "variable" : "value"
          }],
          "target" : [{
            "context" : "fhirObservation",
            "contextType" : "variable",
            "element" : "note",
            "variable" : "note",
            "transform" : "create",
            "parameter" : [{
              "valueString" : "Annotation"
            }]
          },
          {
            "context" : "note",
            "contextType" : "variable",
            "element" : "text",
            "transform" : "cast",
            "parameter" : [{
              "valueId" : "value"
            },
            {
              "valueString" : "string"
            }]
          }]
        }]
      }]
    }]
  },
  {
    "name" : "PatientSummaryResultsSection",
    "typeMode" : "none",
    "documentation" : "7.4 RÉSULTATS",
    "input" : [{
      "name" : "section",
      "mode" : "source"
    },
    {
      "name" : "compSection",
      "mode" : "target"
    },
    {
      "name" : "bundle",
      "type" : "Bundle",
      "mode" : "target"
    },
    {
      "name" : "patient",
      "type" : "Patient",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "entry",
      "source" : [{
        "context" : "section",
        "element" : "entry",
        "variable" : "entry"
      }],
      "rule" : [{
        "name" : "organizerEntry",
        "source" : [{
          "context" : "entry",
          "element" : "organizer",
          "variable" : "organizer"
        }],
        "target" : [{
          "context" : "bundle",
          "contextType" : "variable",
          "element" : "entry",
          "variable" : "reportEntry"
        },
        {
          "context" : "reportEntry",
          "contextType" : "variable",
          "element" : "resource",
          "variable" : "diagnosticReport",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "DiagnosticReport"
          }]
        },
        {
          "context" : "diagnosticReport",
          "contextType" : "variable",
          "element" : "id",
          "transform" : "uuid"
        },
        {
          "context" : "reportEntry",
          "contextType" : "variable",
          "element" : "fullUrl",
          "transform" : "evaluate",
          "parameter" : [{
            "valueString" : "'urn:uuid:' + %diagnosticReport.id"
          }]
        }],
        "rule" : [{
          "name" : "diagnosticReport",
          "source" : [{
            "context" : "organizer"
          }],
          "dependent" : [{
            "name" : "PatientSummaryDiagnosticReportFromOrganizer",
            "variable" : ["organizer", "diagnosticReport", "compSection", "bundle", "patient"]
          }]
        }]
      },
      {
        "name" : "directObservationEntry",
        "source" : [{
          "context" : "entry",
          "element" : "observation",
          "variable" : "observation"
        }],
        "target" : [{
          "context" : "bundle",
          "contextType" : "variable",
          "element" : "entry",
          "variable" : "reportEntry"
        },
        {
          "context" : "reportEntry",
          "contextType" : "variable",
          "element" : "resource",
          "variable" : "diagnosticReport",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "DiagnosticReport"
          }]
        },
        {
          "context" : "diagnosticReport",
          "contextType" : "variable",
          "element" : "id",
          "transform" : "uuid"
        },
        {
          "context" : "reportEntry",
          "contextType" : "variable",
          "element" : "fullUrl",
          "transform" : "evaluate",
          "parameter" : [{
            "valueString" : "'urn:uuid:' + %diagnosticReport.id"
          }]
        }],
        "rule" : [{
          "name" : "diagnosticReportFromObservation",
          "source" : [{
            "context" : "observation"
          }],
          "dependent" : [{
            "name" : "PatientSummaryDiagnosticReportFromSingleObservation",
            "variable" : ["observation",
            "diagnosticReport",
            "compSection",
            "bundle",
            "patient"]
          }]
        }]
      }]
    }]
  },
  {
    "name" : "PatientSummaryDiagnosticReportFromOrganizer",
    "typeMode" : "none",
    "input" : [{
      "name" : "organizer",
      "mode" : "source"
    },
    {
      "name" : "diagnosticReport",
      "type" : "DiagnosticReport",
      "mode" : "target"
    },
    {
      "name" : "compSection",
      "mode" : "target"
    },
    {
      "name" : "bundle",
      "type" : "Bundle",
      "mode" : "target"
    },
    {
      "name" : "patient",
      "type" : "Patient",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "statusDefault",
      "source" : [{
        "context" : "organizer"
      }],
      "target" : [{
        "context" : "diagnosticReport",
        "contextType" : "variable",
        "element" : "status",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "final"
        }]
      }]
    },
    {
      "name" : "status",
      "source" : [{
        "context" : "organizer",
        "element" : "statusCode",
        "variable" : "statusCode"
      }],
      "dependent" : [{
        "name" : "DiagnosticReportStatusFromCdaStatus",
        "variable" : ["statusCode", "diagnosticReport"]
      }]
    },
    {
      "name" : "identifier",
      "source" : [{
        "context" : "organizer",
        "element" : "id",
        "variable" : "id"
      }],
      "target" : [{
        "context" : "diagnosticReport",
        "contextType" : "variable",
        "element" : "identifier",
        "variable" : "identifier",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Identifier"
        }]
      }],
      "dependent" : [{
        "name" : "II",
        "variable" : ["id", "identifier"]
      }]
    },
    {
      "name" : "subject",
      "source" : [{
        "context" : "organizer"
      }],
      "target" : [{
        "context" : "diagnosticReport",
        "contextType" : "variable",
        "element" : "subject",
        "variable" : "subjectRef",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Reference"
        }]
      },
      {
        "context" : "subjectRef",
        "contextType" : "variable",
        "element" : "reference",
        "transform" : "evaluate",
        "parameter" : [{
          "valueString" : "'urn:uuid:' + %patient.id"
        }]
      }]
    },
    {
      "name" : "code",
      "source" : [{
        "context" : "organizer",
        "element" : "code",
        "variable" : "code"
      }],
      "target" : [{
        "context" : "diagnosticReport",
        "contextType" : "variable",
        "element" : "code",
        "variable" : "reportCode",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "dependent" : [{
        "name" : "CDCodeableConcept",
        "variable" : ["code", "reportCode"]
      }]
    },
    {
      "name" : "effectiveTime",
      "source" : [{
        "context" : "organizer",
        "element" : "effectiveTime",
        "variable" : "effectiveTime"
      }],
      "dependent" : [{
        "name" : "DiagnosticReportEffectiveFromEffectiveTime",
        "variable" : ["effectiveTime", "diagnosticReport"]
      }]
    },
    {
      "name" : "component",
      "source" : [{
        "context" : "organizer",
        "element" : "component",
        "variable" : "component"
      }],
      "rule" : [{
        "name" : "componentObservation",
        "source" : [{
          "context" : "component",
          "element" : "observation",
          "variable" : "observation"
        }],
        "target" : [{
          "context" : "bundle",
          "contextType" : "variable",
          "element" : "entry",
          "variable" : "observationEntry"
        },
        {
          "context" : "observationEntry",
          "contextType" : "variable",
          "element" : "resource",
          "variable" : "resultObservation",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Observation"
          }]
        },
        {
          "context" : "resultObservation",
          "contextType" : "variable",
          "element" : "id",
          "transform" : "uuid"
        },
        {
          "context" : "observationEntry",
          "contextType" : "variable",
          "element" : "fullUrl",
          "transform" : "evaluate",
          "parameter" : [{
            "valueString" : "'urn:uuid:' + %resultObservation.id"
          }]
        }],
        "rule" : [{
          "name" : "resultObservation",
          "source" : [{
            "context" : "observation"
          }],
          "dependent" : [{
            "name" : "PatientSummaryResultObservationFromObservation",
            "variable" : ["observation", "resultObservation", "patient"]
          }]
        },
        {
          "name" : "resultReference",
          "source" : [{
            "context" : "observation"
          }],
          "target" : [{
            "context" : "diagnosticReport",
            "contextType" : "variable",
            "element" : "result",
            "variable" : "resultRef",
            "transform" : "create",
            "parameter" : [{
              "valueString" : "Reference"
            }]
          },
          {
            "context" : "resultRef",
            "contextType" : "variable",
            "element" : "reference",
            "transform" : "evaluate",
            "parameter" : [{
              "valueString" : "'urn:uuid:' + %resultObservation.id"
            }]
          }]
        }]
      }]
    },
    {
      "name" : "sectionEntry",
      "source" : [{
        "context" : "organizer"
      }],
      "dependent" : [{
        "name" : "DiagnosticReportAddToSection",
        "variable" : ["organizer", "diagnosticReport", "compSection"]
      }]
    }]
  },
  {
    "name" : "PatientSummaryDiagnosticReportFromSingleObservation",
    "typeMode" : "none",
    "input" : [{
      "name" : "observation",
      "mode" : "source"
    },
    {
      "name" : "diagnosticReport",
      "type" : "DiagnosticReport",
      "mode" : "target"
    },
    {
      "name" : "compSection",
      "mode" : "target"
    },
    {
      "name" : "bundle",
      "type" : "Bundle",
      "mode" : "target"
    },
    {
      "name" : "patient",
      "type" : "Patient",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "statusDefault",
      "source" : [{
        "context" : "observation"
      }],
      "target" : [{
        "context" : "diagnosticReport",
        "contextType" : "variable",
        "element" : "status",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "final"
        }]
      }]
    },
    {
      "name" : "status",
      "source" : [{
        "context" : "observation",
        "element" : "statusCode",
        "variable" : "statusCode"
      }],
      "dependent" : [{
        "name" : "DiagnosticReportStatusFromCdaStatus",
        "variable" : ["statusCode", "diagnosticReport"]
      }]
    },
    {
      "name" : "identifier",
      "source" : [{
        "context" : "observation",
        "element" : "id",
        "variable" : "id"
      }],
      "target" : [{
        "context" : "diagnosticReport",
        "contextType" : "variable",
        "element" : "identifier",
        "variable" : "identifier",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Identifier"
        }]
      }],
      "dependent" : [{
        "name" : "II",
        "variable" : ["id", "identifier"]
      }]
    },
    {
      "name" : "subject",
      "source" : [{
        "context" : "observation"
      }],
      "target" : [{
        "context" : "diagnosticReport",
        "contextType" : "variable",
        "element" : "subject",
        "variable" : "subjectRef",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Reference"
        }]
      },
      {
        "context" : "subjectRef",
        "contextType" : "variable",
        "element" : "reference",
        "transform" : "evaluate",
        "parameter" : [{
          "valueString" : "'urn:uuid:' + %patient.id"
        }]
      }]
    },
    {
      "name" : "code",
      "source" : [{
        "context" : "observation",
        "element" : "code",
        "variable" : "code"
      }],
      "target" : [{
        "context" : "diagnosticReport",
        "contextType" : "variable",
        "element" : "code",
        "variable" : "reportCode",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "dependent" : [{
        "name" : "CDCodeableConcept",
        "variable" : ["code", "reportCode"]
      }]
    },
    {
      "name" : "effectiveTime",
      "source" : [{
        "context" : "observation",
        "element" : "effectiveTime",
        "variable" : "effectiveTime"
      }],
      "dependent" : [{
        "name" : "DiagnosticReportEffectiveFromEffectiveTime",
        "variable" : ["effectiveTime", "diagnosticReport"]
      }]
    },
    {
      "name" : "resultObservationEntry",
      "source" : [{
        "context" : "observation"
      }],
      "target" : [{
        "context" : "bundle",
        "contextType" : "variable",
        "element" : "entry",
        "variable" : "observationEntry"
      },
      {
        "context" : "observationEntry",
        "contextType" : "variable",
        "element" : "resource",
        "variable" : "resultObservation",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Observation"
        }]
      },
      {
        "context" : "resultObservation",
        "contextType" : "variable",
        "element" : "id",
        "transform" : "uuid"
      },
      {
        "context" : "observationEntry",
        "contextType" : "variable",
        "element" : "fullUrl",
        "transform" : "evaluate",
        "parameter" : [{
          "valueString" : "'urn:uuid:' + %resultObservation.id"
        }]
      }],
      "rule" : [{
        "name" : "resultObservation",
        "source" : [{
          "context" : "observation"
        }],
        "dependent" : [{
          "name" : "PatientSummaryResultObservationFromObservation",
          "variable" : ["observation", "resultObservation", "patient"]
        }]
      },
      {
        "name" : "resultReference",
        "source" : [{
          "context" : "observation"
        }],
        "target" : [{
          "context" : "diagnosticReport",
          "contextType" : "variable",
          "element" : "result",
          "variable" : "resultRef",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Reference"
          }]
        },
        {
          "context" : "resultRef",
          "contextType" : "variable",
          "element" : "reference",
          "transform" : "evaluate",
          "parameter" : [{
            "valueString" : "'urn:uuid:' + %resultObservation.id"
          }]
        }]
      }]
    },
    {
      "name" : "sectionEntry",
      "source" : [{
        "context" : "observation"
      }],
      "dependent" : [{
        "name" : "DiagnosticReportAddToSection",
        "variable" : ["observation", "diagnosticReport", "compSection"]
      }]
    }]
  },
  {
    "name" : "DiagnosticReportStatusFromCdaStatus",
    "typeMode" : "none",
    "input" : [{
      "name" : "statusCode",
      "mode" : "source"
    },
    {
      "name" : "diagnosticReport",
      "type" : "DiagnosticReport",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "completed",
      "source" : [{
        "context" : "statusCode",
        "element" : "code",
        "variable" : "code",
        "condition" : "code = 'completed'"
      }],
      "target" : [{
        "context" : "diagnosticReport",
        "contextType" : "variable",
        "element" : "status",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "final"
        }]
      }]
    },
    {
      "name" : "active",
      "source" : [{
        "context" : "statusCode",
        "element" : "code",
        "variable" : "code",
        "condition" : "code = 'active'"
      }],
      "target" : [{
        "context" : "diagnosticReport",
        "contextType" : "variable",
        "element" : "status",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "preliminary"
        }]
      }]
    },
    {
      "name" : "aborted",
      "source" : [{
        "context" : "statusCode",
        "element" : "code",
        "variable" : "code",
        "condition" : "code = 'aborted'"
      }],
      "target" : [{
        "context" : "diagnosticReport",
        "contextType" : "variable",
        "element" : "status",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "cancelled"
        }]
      }]
    },
    {
      "name" : "cancelled",
      "source" : [{
        "context" : "statusCode",
        "element" : "code",
        "variable" : "code",
        "condition" : "code = 'cancelled'"
      }],
      "target" : [{
        "context" : "diagnosticReport",
        "contextType" : "variable",
        "element" : "status",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "cancelled"
        }]
      }]
    }]
  },
  {
    "name" : "DiagnosticReportEffectiveFromEffectiveTime",
    "typeMode" : "none",
    "input" : [{
      "name" : "effectiveTime",
      "mode" : "source"
    },
    {
      "name" : "diagnosticReport",
      "type" : "DiagnosticReport",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "effectiveDateTime",
      "source" : [{
        "context" : "effectiveTime",
        "element" : "value",
        "variable" : "value"
      }],
      "target" : [{
        "context" : "diagnosticReport",
        "contextType" : "variable",
        "element" : "effective",
        "variable" : "effectiveDateTime",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "dateTime"
        }]
      }],
      "dependent" : [{
        "name" : "TSDateTime",
        "variable" : ["effectiveTime", "effectiveDateTime"]
      }]
    },
    {
      "name" : "effectiveLowAsDateTime",
      "source" : [{
        "context" : "effectiveTime",
        "element" : "low",
        "variable" : "low",
        "condition" : "effectiveTime.high.empty()"
      }],
      "target" : [{
        "context" : "diagnosticReport",
        "contextType" : "variable",
        "element" : "effective",
        "variable" : "effectiveDateTime",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "dateTime"
        }]
      }],
      "dependent" : [{
        "name" : "TSDateTime",
        "variable" : ["low", "effectiveDateTime"]
      }]
    },
    {
      "name" : "effectivePeriod",
      "source" : [{
        "context" : "effectiveTime",
        "element" : "low",
        "variable" : "low",
        "condition" : "effectiveTime.high.exists()"
      }],
      "target" : [{
        "context" : "diagnosticReport",
        "contextType" : "variable",
        "element" : "effective",
        "variable" : "effectivePeriod",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Period"
        }]
      }],
      "rule" : [{
        "name" : "start",
        "source" : [{
          "context" : "low"
        }],
        "target" : [{
          "context" : "effectivePeriod",
          "contextType" : "variable",
          "element" : "start",
          "variable" : "start",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "dateTime"
          }]
        }],
        "dependent" : [{
          "name" : "TSDateTime",
          "variable" : ["low", "start"]
        }]
      },
      {
        "name" : "end",
        "source" : [{
          "context" : "effectiveTime",
          "element" : "high",
          "variable" : "high"
        }],
        "target" : [{
          "context" : "effectivePeriod",
          "contextType" : "variable",
          "element" : "end",
          "variable" : "end",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "dateTime"
          }]
        }],
        "dependent" : [{
          "name" : "TSDateTime",
          "variable" : ["high", "end"]
        }]
      }]
    }]
  },
  {
    "name" : "DiagnosticReportAddToSection",
    "typeMode" : "none",
    "input" : [{
      "name" : "src",
      "mode" : "source"
    },
    {
      "name" : "diagnosticReport",
      "type" : "DiagnosticReport",
      "mode" : "target"
    },
    {
      "name" : "compSection",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "sectionEntry",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "compSection",
        "contextType" : "variable",
        "element" : "entry",
        "variable" : "sectionRef",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Reference"
        }]
      },
      {
        "context" : "sectionRef",
        "contextType" : "variable",
        "element" : "reference",
        "transform" : "evaluate",
        "parameter" : [{
          "valueString" : "'urn:uuid:' + %diagnosticReport.id"
        }]
      }]
    }]
  },
  {
    "name" : "PatientSummaryResultObservationFromObservation",
    "typeMode" : "none",
    "documentation" : "Observation de résultat",
    "input" : [{
      "name" : "observation",
      "mode" : "source"
    },
    {
      "name" : "resultObservation",
      "type" : "Observation",
      "mode" : "target"
    },
    {
      "name" : "patient",
      "type" : "Patient",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "statusDefault",
      "source" : [{
        "context" : "observation"
      }],
      "target" : [{
        "context" : "resultObservation",
        "contextType" : "variable",
        "element" : "status",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "final"
        }]
      }]
    },
    {
      "name" : "status",
      "source" : [{
        "context" : "observation",
        "element" : "statusCode",
        "variable" : "statusCode"
      }],
      "dependent" : [{
        "name" : "ObservationStatusFromCdaStatus",
        "variable" : ["statusCode", "resultObservation"]
      }]
    },
    {
      "name" : "identifier",
      "source" : [{
        "context" : "observation",
        "element" : "id",
        "variable" : "id"
      }],
      "target" : [{
        "context" : "resultObservation",
        "contextType" : "variable",
        "element" : "identifier",
        "variable" : "identifier",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Identifier"
        }]
      }],
      "dependent" : [{
        "name" : "II",
        "variable" : ["id", "identifier"]
      }]
    },
    {
      "name" : "subject",
      "source" : [{
        "context" : "observation"
      }],
      "target" : [{
        "context" : "resultObservation",
        "contextType" : "variable",
        "element" : "subject",
        "variable" : "subjectRef",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Reference"
        }]
      },
      {
        "context" : "subjectRef",
        "contextType" : "variable",
        "element" : "reference",
        "transform" : "evaluate",
        "parameter" : [{
          "valueString" : "'urn:uuid:' + %patient.id"
        }]
      }]
    },
    {
      "name" : "category",
      "source" : [{
        "context" : "observation"
      }],
      "target" : [{
        "context" : "resultObservation",
        "contextType" : "variable",
        "element" : "category",
        "variable" : "category",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "rule" : [{
        "name" : "categoryCoding",
        "source" : [{
          "context" : "observation"
        }],
        "target" : [{
          "context" : "category",
          "contextType" : "variable",
          "element" : "coding",
          "variable" : "coding",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Coding"
          }]
        }],
        "rule" : [{
          "name" : "categorySystem",
          "source" : [{
            "context" : "observation"
          }],
          "target" : [{
            "context" : "coding",
            "contextType" : "variable",
            "element" : "system",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "http://terminology.hl7.org/CodeSystem/observation-category"
            }]
          }]
        },
        {
          "name" : "categoryCode",
          "source" : [{
            "context" : "observation"
          }],
          "target" : [{
            "context" : "coding",
            "contextType" : "variable",
            "element" : "code",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "laboratory"
            }]
          }]
        },
        {
          "name" : "categoryDisplay",
          "source" : [{
            "context" : "observation"
          }],
          "target" : [{
            "context" : "coding",
            "contextType" : "variable",
            "element" : "display",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "Laboratory"
            }]
          }]
        }]
      }]
    },
    {
      "name" : "code",
      "source" : [{
        "context" : "observation",
        "element" : "code",
        "variable" : "code"
      }],
      "target" : [{
        "context" : "resultObservation",
        "contextType" : "variable",
        "element" : "code",
        "variable" : "obsCode",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "dependent" : [{
        "name" : "CDCodeableConcept",
        "variable" : ["code", "obsCode"]
      }]
    },
    {
      "name" : "textNote",
      "source" : [{
        "context" : "observation",
        "element" : "text",
        "variable" : "text"
      }],
      "dependent" : [{
        "name" : "ResultObservationNoteFromText",
        "variable" : ["text", "resultObservation"]
      }]
    },
    {
      "name" : "effectiveTime",
      "source" : [{
        "context" : "observation",
        "element" : "effectiveTime",
        "variable" : "effectiveTime"
      }],
      "dependent" : [{
        "name" : "ObservationEffectiveFromEffectiveTime",
        "variable" : ["effectiveTime", "resultObservation"]
      }]
    },
    {
      "name" : "effectiveTimeAbsentReason",
      "source" : [{
        "context" : "observation",
        "condition" : "observation.effectiveTime.empty()"
      }],
      "target" : [{
        "context" : "resultObservation",
        "contextType" : "variable",
        "element" : "effective",
        "variable" : "effectiveDateTime",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "dateTime"
        }]
      }],
      "rule" : [{
        "name" : "dataAbsentReason",
        "source" : [{
          "context" : "observation"
        }],
        "target" : [{
          "context" : "effectiveDateTime",
          "contextType" : "variable",
          "element" : "extension",
          "variable" : "absentReason",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Extension"
          }]
        }],
        "rule" : [{
          "name" : "url",
          "source" : [{
            "context" : "observation"
          }],
          "target" : [{
            "context" : "absentReason",
            "contextType" : "variable",
            "element" : "url",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
            }]
          }]
        },
        {
          "name" : "valueCode",
          "source" : [{
            "context" : "observation"
          }],
          "target" : [{
            "context" : "absentReason",
            "contextType" : "variable",
            "element" : "value",
            "transform" : "cast",
            "parameter" : [{
              "valueString" : "unknown"
            },
            {
              "valueString" : "code"
            }]
          }]
        }]
      }]
    },
    {
      "name" : "value",
      "source" : [{
        "context" : "observation",
        "element" : "value",
        "variable" : "value"
      }],
      "dependent" : [{
        "name" : "ResultObservationValueFromCdaValue",
        "variable" : ["value", "resultObservation"]
      }]
    },
    {
      "name" : "interpretation",
      "source" : [{
        "context" : "observation",
        "element" : "interpretationCode",
        "variable" : "interpretationCode"
      }],
      "target" : [{
        "context" : "resultObservation",
        "contextType" : "variable",
        "element" : "interpretation",
        "variable" : "interpretation",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "dependent" : [{
        "name" : "CDCodeableConcept",
        "variable" : ["interpretationCode", "interpretation"]
      }]
    },
    {
      "name" : "method",
      "source" : [{
        "context" : "observation",
        "element" : "methodCode",
        "variable" : "methodCode"
      }],
      "target" : [{
        "context" : "resultObservation",
        "contextType" : "variable",
        "element" : "method",
        "variable" : "method",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "dependent" : [{
        "name" : "CDCodeableConcept",
        "variable" : ["methodCode", "method"]
      }]
    },
    {
      "name" : "bodySite",
      "source" : [{
        "context" : "observation",
        "element" : "targetSiteCode",
        "variable" : "targetSiteCode"
      }],
      "target" : [{
        "context" : "resultObservation",
        "contextType" : "variable",
        "element" : "bodySite",
        "variable" : "bodySite",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "dependent" : [{
        "name" : "CDCodeableConcept",
        "variable" : ["targetSiteCode", "bodySite"]
      }]
    },
    {
      "name" : "referenceRange",
      "source" : [{
        "context" : "observation",
        "element" : "referenceRange",
        "variable" : "referenceRange"
      }],
      "dependent" : [{
        "name" : "ResultObservationReferenceRangeFromCdaReferenceRange",
        "variable" : ["referenceRange", "resultObservation"]
      }]
    },
    {
      "name" : "entryRelationship",
      "source" : [{
        "context" : "observation",
        "element" : "entryRelationship",
        "variable" : "er"
      }],
      "dependent" : [{
        "name" : "ResultObservationEntryRelationship",
        "variable" : ["er", "resultObservation"]
      }]
    }]
  },
  {
    "name" : "ResultObservationValueFromCdaValue",
    "typeMode" : "none",
    "input" : [{
      "name" : "value",
      "mode" : "source"
    },
    {
      "name" : "resultObservation",
      "type" : "Observation",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "valueQuantity",
      "source" : [{
        "context" : "value",
        "element" : "unit",
        "variable" : "unit"
      }],
      "target" : [{
        "context" : "resultObservation",
        "contextType" : "variable",
        "element" : "value",
        "variable" : "quantity",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Quantity"
        }]
      }],
      "rule" : [{
        "name" : "quantityValue",
        "source" : [{
          "context" : "value",
          "element" : "value",
          "variable" : "v"
        }],
        "target" : [{
          "context" : "quantity",
          "contextType" : "variable",
          "element" : "value",
          "transform" : "cast",
          "parameter" : [{
            "valueId" : "v"
          },
          {
            "valueString" : "decimal"
          }]
        }]
      },
      {
        "name" : "quantityUnit",
        "source" : [{
          "context" : "unit"
        }],
        "target" : [{
          "context" : "quantity",
          "contextType" : "variable",
          "element" : "unit",
          "transform" : "cast",
          "parameter" : [{
            "valueId" : "unit"
          },
          {
            "valueString" : "string"
          }]
        }]
      }]
    },
    {
      "name" : "valueCodeableConcept",
      "source" : [{
        "context" : "value",
        "element" : "code",
        "variable" : "code",
        "condition" : "value.unit.empty()"
      }],
      "target" : [{
        "context" : "resultObservation",
        "contextType" : "variable",
        "element" : "value",
        "variable" : "valueCodeableConcept",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "dependent" : [{
        "name" : "CDCodeableConcept",
        "variable" : ["value", "valueCodeableConcept"]
      }]
    },
    {
      "name" : "valueBooleanTrue",
      "source" : [{
        "context" : "value",
        "element" : "value",
        "variable" : "v",
        "condition" : "value.unit.empty() and value.code.empty() and (v = 'true')"
      }],
      "target" : [{
        "context" : "resultObservation",
        "contextType" : "variable",
        "element" : "value",
        "transform" : "cast",
        "parameter" : [{
          "valueId" : "v"
        },
        {
          "valueString" : "boolean"
        }]
      }]
    },
    {
      "name" : "valueBooleanFalse",
      "source" : [{
        "context" : "value",
        "element" : "value",
        "variable" : "v",
        "condition" : "value.unit.empty() and value.code.empty() and (v = 'false')"
      }],
      "target" : [{
        "context" : "resultObservation",
        "contextType" : "variable",
        "element" : "value",
        "transform" : "cast",
        "parameter" : [{
          "valueId" : "v"
        },
        {
          "valueString" : "boolean"
        }]
      }]
    },
    {
      "name" : "originalText",
      "source" : [{
        "context" : "value",
        "element" : "originalText",
        "variable" : "originalText",
        "condition" : "value.unit.empty() and value.code.empty()"
      }],
      "rule" : [{
        "name" : "reference",
        "source" : [{
          "context" : "originalText",
          "element" : "reference",
          "variable" : "reference"
        }],
        "rule" : [{
          "name" : "valueStringFromOriginalText",
          "source" : [{
            "context" : "reference",
            "element" : "value",
            "variable" : "text"
          }],
          "target" : [{
            "context" : "resultObservation",
            "contextType" : "variable",
            "element" : "value",
            "transform" : "cast",
            "parameter" : [{
              "valueId" : "text"
            },
            {
              "valueString" : "string"
            }]
          }]
        }]
      }]
    }]
  },
  {
    "name" : "ResultObservationNoteFromText",
    "typeMode" : "none",
    "input" : [{
      "name" : "text",
      "mode" : "source"
    },
    {
      "name" : "resultObservation",
      "type" : "Observation",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "reference",
      "source" : [{
        "context" : "text",
        "element" : "reference",
        "variable" : "reference"
      }],
      "rule" : [{
        "name" : "noteReference",
        "source" : [{
          "context" : "reference",
          "element" : "value",
          "variable" : "value"
        }],
        "target" : [{
          "context" : "resultObservation",
          "contextType" : "variable",
          "element" : "note",
          "variable" : "note",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Annotation"
          }]
        },
        {
          "context" : "note",
          "contextType" : "variable",
          "element" : "text",
          "transform" : "cast",
          "parameter" : [{
            "valueId" : "value"
          },
          {
            "valueString" : "string"
          }]
        }]
      }]
    },
    {
      "name" : "noteText",
      "source" : [{
        "context" : "text",
        "element" : "xmlText",
        "variable" : "xml",
        "condition" : "text.reference.empty()"
      }],
      "target" : [{
        "context" : "resultObservation",
        "contextType" : "variable",
        "element" : "note",
        "variable" : "note",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Annotation"
        }]
      },
      {
        "context" : "note",
        "contextType" : "variable",
        "element" : "text",
        "transform" : "cast",
        "parameter" : [{
          "valueId" : "xml"
        },
        {
          "valueString" : "string"
        }]
      }]
    }]
  },
  {
    "name" : "ResultObservationEntryRelationship",
    "typeMode" : "none",
    "input" : [{
      "name" : "er",
      "mode" : "source"
    },
    {
      "name" : "resultObservation",
      "type" : "Observation",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "comment",
      "source" : [{
        "context" : "er",
        "element" : "act",
        "variable" : "commentAct"
      }],
      "dependent" : [{
        "name" : "ResultObservationNoteFromCommentAct",
        "variable" : ["commentAct", "resultObservation"]
      }]
    },
    {
      "name" : "hasMember",
      "source" : [{
        "context" : "er",
        "element" : "observation",
        "variable" : "memberObservation",
        "condition" : "er.typeCode = 'COMP'"
      }],
      "target" : [{
        "context" : "resultObservation",
        "contextType" : "variable",
        "element" : "hasMember",
        "variable" : "memberRef",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Reference"
        }]
      }],
      "rule" : [{
        "name" : "memberId",
        "source" : [{
          "context" : "memberObservation",
          "element" : "id",
          "variable" : "id"
        }],
        "rule" : [{
          "name" : "memberReferenceExtension",
          "source" : [{
            "context" : "id",
            "element" : "extension",
            "variable" : "extension"
          }],
          "target" : [{
            "context" : "memberRef",
            "contextType" : "variable",
            "element" : "reference",
            "transform" : "evaluate",
            "parameter" : [{
              "valueString" : "'#' + extension"
            }]
          }]
        },
        {
          "name" : "memberReferenceRoot",
          "source" : [{
            "context" : "id",
            "element" : "root",
            "variable" : "root",
            "condition" : "id.extension.empty()"
          }],
          "target" : [{
            "context" : "memberRef",
            "contextType" : "variable",
            "element" : "reference",
            "transform" : "evaluate",
            "parameter" : [{
              "valueString" : "'urn:oid:' + root"
            }]
          }]
        }]
      }]
    }]
  },
  {
    "name" : "ResultObservationNoteFromCommentAct",
    "typeMode" : "none",
    "input" : [{
      "name" : "commentAct",
      "mode" : "source"
    },
    {
      "name" : "resultObservation",
      "type" : "Observation",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "templateId",
      "source" : [{
        "context" : "commentAct",
        "element" : "templateId",
        "variable" : "tid"
      }],
      "rule" : [{
        "name" : "commentTemplate",
        "source" : [{
          "context" : "tid",
          "element" : "root",
          "variable" : "root",
          "condition" : "root = '1.2.250.1.213.1.1.3.32'"
        }],
        "rule" : [{
          "name" : "text",
          "source" : [{
            "context" : "commentAct",
            "element" : "text",
            "variable" : "text"
          }],
          "rule" : [{
            "name" : "reference",
            "source" : [{
              "context" : "text",
              "element" : "reference",
              "variable" : "reference"
            }],
            "rule" : [{
              "name" : "noteReference",
              "source" : [{
                "context" : "reference",
                "element" : "value",
                "variable" : "value"
              }],
              "target" : [{
                "context" : "resultObservation",
                "contextType" : "variable",
                "element" : "note",
                "variable" : "note",
                "transform" : "create",
                "parameter" : [{
                  "valueString" : "Annotation"
                }]
              },
              {
                "context" : "note",
                "contextType" : "variable",
                "element" : "text",
                "transform" : "cast",
                "parameter" : [{
                  "valueId" : "value"
                },
                {
                  "valueString" : "string"
                }]
              }]
            }]
          }]
        }]
      }]
    }]
  },
  {
    "name" : "ResultObservationReferenceRangeFromCdaReferenceRange",
    "typeMode" : "none",
    "input" : [{
      "name" : "referenceRange",
      "mode" : "source"
    },
    {
      "name" : "resultObservation",
      "type" : "Observation",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "referenceRange",
      "source" : [{
        "context" : "referenceRange",
        "element" : "observationRange",
        "variable" : "observationRange"
      }],
      "target" : [{
        "context" : "resultObservation",
        "contextType" : "variable",
        "element" : "referenceRange",
        "variable" : "fhirReferenceRange"
      }],
      "rule" : [{
        "name" : "text",
        "source" : [{
          "context" : "observationRange",
          "element" : "text",
          "variable" : "text"
        }],
        "rule" : [{
          "name" : "referenceRangeText",
          "source" : [{
            "context" : "text",
            "element" : "xmlText",
            "variable" : "xml"
          }],
          "target" : [{
            "context" : "fhirReferenceRange",
            "contextType" : "variable",
            "element" : "text",
            "transform" : "cast",
            "parameter" : [{
              "valueId" : "xml"
            },
            {
              "valueString" : "string"
            }]
          }]
        }]
      },
      {
        "name" : "value",
        "source" : [{
          "context" : "observationRange",
          "element" : "value",
          "variable" : "value"
        }],
        "rule" : [{
          "name" : "low",
          "source" : [{
            "context" : "value",
            "element" : "low",
            "variable" : "low"
          }],
          "target" : [{
            "context" : "fhirReferenceRange",
            "contextType" : "variable",
            "element" : "low",
            "variable" : "lowQuantity",
            "transform" : "create",
            "parameter" : [{
              "valueString" : "Quantity"
            }]
          }],
          "rule" : [{
            "name" : "lowValue",
            "source" : [{
              "context" : "low",
              "element" : "value",
              "variable" : "lowValue"
            }],
            "target" : [{
              "context" : "lowQuantity",
              "contextType" : "variable",
              "element" : "value",
              "transform" : "cast",
              "parameter" : [{
                "valueId" : "lowValue"
              },
              {
                "valueString" : "decimal"
              }]
            }]
          },
          {
            "name" : "lowUnit",
            "source" : [{
              "context" : "low",
              "element" : "unit",
              "variable" : "lowUnit"
            }],
            "target" : [{
              "context" : "lowQuantity",
              "contextType" : "variable",
              "element" : "unit",
              "transform" : "cast",
              "parameter" : [{
                "valueId" : "lowUnit"
              },
              {
                "valueString" : "string"
              }]
            }]
          }]
        },
        {
          "name" : "high",
          "source" : [{
            "context" : "value",
            "element" : "high",
            "variable" : "high"
          }],
          "target" : [{
            "context" : "fhirReferenceRange",
            "contextType" : "variable",
            "element" : "high",
            "variable" : "highQuantity",
            "transform" : "create",
            "parameter" : [{
              "valueString" : "Quantity"
            }]
          }],
          "rule" : [{
            "name" : "highValue",
            "source" : [{
              "context" : "high",
              "element" : "value",
              "variable" : "highValue"
            }],
            "target" : [{
              "context" : "highQuantity",
              "contextType" : "variable",
              "element" : "value",
              "transform" : "cast",
              "parameter" : [{
                "valueId" : "highValue"
              },
              {
                "valueString" : "decimal"
              }]
            }]
          },
          {
            "name" : "highUnit",
            "source" : [{
              "context" : "high",
              "element" : "unit",
              "variable" : "highUnit"
            }],
            "target" : [{
              "context" : "highQuantity",
              "contextType" : "variable",
              "element" : "unit",
              "transform" : "cast",
              "parameter" : [{
                "valueId" : "highUnit"
              },
              {
                "valueString" : "string"
              }]
            }]
          }]
        }]
      }]
    }]
  },
  {
    "name" : "PatientSummaryProfessionalRisksSection",
    "typeMode" : "none",
    "documentation" : "7.5 FACTEURS DE RISQUES PROFESSIONNELS",
    "input" : [{
      "name" : "section",
      "mode" : "source"
    },
    {
      "name" : "compSection",
      "mode" : "target"
    },
    {
      "name" : "bundle",
      "type" : "Bundle",
      "mode" : "target"
    },
    {
      "name" : "patient",
      "type" : "Patient",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "entry",
      "source" : [{
        "context" : "section",
        "element" : "entry",
        "variable" : "entry"
      }],
      "rule" : [{
        "name" : "directObservation",
        "source" : [{
          "context" : "entry",
          "element" : "observation",
          "variable" : "observation"
        }],
        "target" : [{
          "context" : "bundle",
          "contextType" : "variable",
          "element" : "entry",
          "variable" : "observationEntry"
        },
        {
          "context" : "observationEntry",
          "contextType" : "variable",
          "element" : "resource",
          "variable" : "fhirObservation",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Observation"
          }]
        },
        {
          "context" : "fhirObservation",
          "contextType" : "variable",
          "element" : "id",
          "transform" : "uuid"
        },
        {
          "context" : "observationEntry",
          "contextType" : "variable",
          "element" : "fullUrl",
          "transform" : "evaluate",
          "parameter" : [{
            "valueString" : "'urn:uuid:' + %fhirObservation.id"
          }]
        }],
        "rule" : [{
          "name" : "professionalRiskObservation",
          "source" : [{
            "context" : "observation"
          }],
          "dependent" : [{
            "name" : "PatientSummaryProfessionalRiskObservationFromObservation",
            "variable" : ["observation", "fhirObservation", "patient"]
          }]
        },
        {
          "name" : "sectionEntry",
          "source" : [{
            "context" : "observation"
          }],
          "dependent" : [{
            "name" : "ObservationAddToSection",
            "variable" : ["observation", "fhirObservation", "compSection"]
          }]
        }]
      },
      {
        "name" : "organizer",
        "source" : [{
          "context" : "entry",
          "element" : "organizer",
          "variable" : "organizer"
        }],
        "rule" : [{
          "name" : "component",
          "source" : [{
            "context" : "organizer",
            "element" : "component",
            "variable" : "component"
          }],
          "rule" : [{
            "name" : "componentObservation",
            "source" : [{
              "context" : "component",
              "element" : "observation",
              "variable" : "observation"
            }],
            "target" : [{
              "context" : "bundle",
              "contextType" : "variable",
              "element" : "entry",
              "variable" : "observationEntry"
            },
            {
              "context" : "observationEntry",
              "contextType" : "variable",
              "element" : "resource",
              "variable" : "fhirObservation",
              "transform" : "create",
              "parameter" : [{
                "valueString" : "Observation"
              }]
            },
            {
              "context" : "fhirObservation",
              "contextType" : "variable",
              "element" : "id",
              "transform" : "uuid"
            },
            {
              "context" : "observationEntry",
              "contextType" : "variable",
              "element" : "fullUrl",
              "transform" : "evaluate",
              "parameter" : [{
                "valueString" : "'urn:uuid:' + %fhirObservation.id"
              }]
            }],
            "rule" : [{
              "name" : "professionalRiskComponentObservation",
              "source" : [{
                "context" : "observation"
              }],
              "dependent" : [{
                "name" : "PatientSummaryProfessionalRiskObservationFromObservation",
                "variable" : ["observation", "fhirObservation", "patient"]
              }]
            },
            {
              "name" : "sectionEntry",
              "source" : [{
                "context" : "observation"
              }],
              "dependent" : [{
                "name" : "ObservationAddToSection",
                "variable" : ["observation", "fhirObservation", "compSection"]
              }]
            }]
          }]
        }]
      }]
    }]
  },
  {
    "name" : "PatientSummaryProfessionalRiskObservationFromObservation",
    "typeMode" : "none",
    "input" : [{
      "name" : "observation",
      "mode" : "source"
    },
    {
      "name" : "fhirObservation",
      "type" : "Observation",
      "mode" : "target"
    },
    {
      "name" : "patient",
      "type" : "Patient",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "statusDefault",
      "source" : [{
        "context" : "observation"
      }],
      "target" : [{
        "context" : "fhirObservation",
        "contextType" : "variable",
        "element" : "status",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "final"
        }]
      }]
    },
    {
      "name" : "status",
      "source" : [{
        "context" : "observation",
        "element" : "statusCode",
        "variable" : "statusCode"
      }],
      "dependent" : [{
        "name" : "ObservationStatusFromCdaStatus",
        "variable" : ["statusCode", "fhirObservation"]
      }]
    },
    {
      "name" : "identifier",
      "source" : [{
        "context" : "observation",
        "element" : "id",
        "variable" : "id"
      }],
      "target" : [{
        "context" : "fhirObservation",
        "contextType" : "variable",
        "element" : "identifier",
        "variable" : "identifier",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Identifier"
        }]
      }],
      "dependent" : [{
        "name" : "II",
        "variable" : ["id", "identifier"]
      }]
    },
    {
      "name" : "subject",
      "source" : [{
        "context" : "observation"
      }],
      "target" : [{
        "context" : "fhirObservation",
        "contextType" : "variable",
        "element" : "subject",
        "variable" : "subjectRef",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Reference"
        }]
      },
      {
        "context" : "subjectRef",
        "contextType" : "variable",
        "element" : "reference",
        "transform" : "evaluate",
        "parameter" : [{
          "valueString" : "'urn:uuid:' + %patient.id"
        }]
      }]
    },
    {
      "name" : "category",
      "source" : [{
        "context" : "observation"
      }],
      "target" : [{
        "context" : "fhirObservation",
        "contextType" : "variable",
        "element" : "category",
        "variable" : "category",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "rule" : [{
        "name" : "categoryCoding",
        "source" : [{
          "context" : "observation"
        }],
        "target" : [{
          "context" : "category",
          "contextType" : "variable",
          "element" : "coding",
          "variable" : "coding",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Coding"
          }]
        }],
        "rule" : [{
          "name" : "categorySystem",
          "source" : [{
            "context" : "observation"
          }],
          "target" : [{
            "context" : "coding",
            "contextType" : "variable",
            "element" : "system",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "http://terminology.hl7.org/CodeSystem/observation-category"
            }]
          }]
        },
        {
          "name" : "categoryCode",
          "source" : [{
            "context" : "observation"
          }],
          "target" : [{
            "context" : "coding",
            "contextType" : "variable",
            "element" : "code",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "social-history"
            }]
          }]
        },
        {
          "name" : "categoryDisplay",
          "source" : [{
            "context" : "observation"
          }],
          "target" : [{
            "context" : "coding",
            "contextType" : "variable",
            "element" : "display",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "Social History"
            }]
          }]
        }]
      }]
    },
    {
      "name" : "code",
      "source" : [{
        "context" : "observation",
        "element" : "code",
        "variable" : "code"
      }],
      "target" : [{
        "context" : "fhirObservation",
        "contextType" : "variable",
        "element" : "code",
        "variable" : "obsCode",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "dependent" : [{
        "name" : "CDCodeableConcept",
        "variable" : ["code", "obsCode"]
      }]
    },
    {
      "name" : "qualifiers",
      "source" : [{
        "context" : "observation",
        "element" : "code",
        "variable" : "code"
      }],
      "rule" : [{
        "name" : "qualifierComponent",
        "source" : [{
          "context" : "code",
          "element" : "qualifier",
          "variable" : "qualifier"
        }],
        "target" : [{
          "context" : "fhirObservation",
          "contextType" : "variable",
          "element" : "component",
          "variable" : "component"
        }],
        "dependent" : [{
          "name" : "ProfessionalRiskObservationComponentFromQualifier",
          "variable" : ["qualifier", "component"]
        }]
      }]
    },
    {
      "name" : "textNote",
      "source" : [{
        "context" : "observation",
        "element" : "text",
        "variable" : "text"
      }],
      "dependent" : [{
        "name" : "ProfessionalRiskObservationNoteFromText",
        "variable" : ["text", "fhirObservation"]
      }]
    },
    {
      "name" : "effectiveTime",
      "source" : [{
        "context" : "observation",
        "element" : "effectiveTime",
        "variable" : "effectiveTime"
      }],
      "dependent" : [{
        "name" : "ObservationEffectiveFromEffectiveTime",
        "variable" : ["effectiveTime", "fhirObservation"]
      }]
    },
    {
      "name" : "effectiveTimeAbsentReason",
      "source" : [{
        "context" : "observation",
        "condition" : "observation.effectiveTime.empty()"
      }],
      "target" : [{
        "context" : "fhirObservation",
        "contextType" : "variable",
        "element" : "effective",
        "variable" : "effectiveDateTime",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "dateTime"
        }]
      }],
      "rule" : [{
        "name" : "dataAbsentReason",
        "source" : [{
          "context" : "observation"
        }],
        "target" : [{
          "context" : "effectiveDateTime",
          "contextType" : "variable",
          "element" : "extension",
          "variable" : "absentReason",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Extension"
          }]
        }],
        "rule" : [{
          "name" : "url",
          "source" : [{
            "context" : "observation"
          }],
          "target" : [{
            "context" : "absentReason",
            "contextType" : "variable",
            "element" : "url",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
            }]
          }]
        },
        {
          "name" : "valueCode",
          "source" : [{
            "context" : "observation"
          }],
          "target" : [{
            "context" : "absentReason",
            "contextType" : "variable",
            "element" : "value",
            "transform" : "cast",
            "parameter" : [{
              "valueString" : "unknown"
            },
            {
              "valueString" : "code"
            }]
          }]
        }]
      }]
    },
    {
      "name" : "value",
      "source" : [{
        "context" : "observation",
        "element" : "value",
        "variable" : "value"
      }],
      "dependent" : [{
        "name" : "ProfessionalRiskObservationValueFromCdaValue",
        "variable" : ["value", "fhirObservation"]
      }]
    },
    {
      "name" : "interpretation",
      "source" : [{
        "context" : "observation",
        "element" : "interpretationCode",
        "variable" : "interpretationCode"
      }],
      "target" : [{
        "context" : "fhirObservation",
        "contextType" : "variable",
        "element" : "interpretation",
        "variable" : "interpretation",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "dependent" : [{
        "name" : "CDCodeableConcept",
        "variable" : ["interpretationCode", "interpretation"]
      }]
    },
    {
      "name" : "method",
      "source" : [{
        "context" : "observation",
        "element" : "methodCode",
        "variable" : "methodCode"
      }],
      "target" : [{
        "context" : "fhirObservation",
        "contextType" : "variable",
        "element" : "method",
        "variable" : "method",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "dependent" : [{
        "name" : "CDCodeableConcept",
        "variable" : ["methodCode", "method"]
      }]
    },
    {
      "name" : "bodySite",
      "source" : [{
        "context" : "observation",
        "element" : "targetSiteCode",
        "variable" : "targetSiteCode"
      }],
      "target" : [{
        "context" : "fhirObservation",
        "contextType" : "variable",
        "element" : "bodySite",
        "variable" : "bodySite",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "dependent" : [{
        "name" : "CDCodeableConcept",
        "variable" : ["targetSiteCode", "bodySite"]
      }]
    },
    {
      "name" : "comments",
      "source" : [{
        "context" : "observation",
        "element" : "entryRelationship",
        "variable" : "er"
      }],
      "dependent" : [{
        "name" : "ObservationCommentFromEntryRelationship",
        "variable" : ["er", "fhirObservation"]
      }]
    }]
  },
  {
    "name" : "ProfessionalRiskObservationValueFromCdaValue",
    "typeMode" : "none",
    "input" : [{
      "name" : "value",
      "mode" : "source"
    },
    {
      "name" : "fhirObservation",
      "type" : "Observation",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "valueQuantity",
      "source" : [{
        "context" : "value",
        "element" : "unit",
        "variable" : "unit"
      }],
      "target" : [{
        "context" : "fhirObservation",
        "contextType" : "variable",
        "element" : "value",
        "variable" : "quantity",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Quantity"
        }]
      }],
      "rule" : [{
        "name" : "quantityValue",
        "source" : [{
          "context" : "value",
          "element" : "value",
          "variable" : "v"
        }],
        "target" : [{
          "context" : "quantity",
          "contextType" : "variable",
          "element" : "value",
          "transform" : "cast",
          "parameter" : [{
            "valueId" : "v"
          },
          {
            "valueString" : "decimal"
          }]
        }]
      },
      {
        "name" : "quantityUnit",
        "source" : [{
          "context" : "unit"
        }],
        "target" : [{
          "context" : "quantity",
          "contextType" : "variable",
          "element" : "unit",
          "transform" : "cast",
          "parameter" : [{
            "valueId" : "unit"
          },
          {
            "valueString" : "string"
          }]
        }]
      }]
    },
    {
      "name" : "valueCodeableConcept",
      "source" : [{
        "context" : "value",
        "element" : "code",
        "variable" : "code",
        "condition" : "value.unit.empty()"
      }],
      "target" : [{
        "context" : "fhirObservation",
        "contextType" : "variable",
        "element" : "value",
        "variable" : "valueCodeableConcept",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "dependent" : [{
        "name" : "CDCodeableConcept",
        "variable" : ["value", "valueCodeableConcept"]
      }]
    },
    {
      "name" : "valueBooleanTrue",
      "source" : [{
        "context" : "value",
        "element" : "value",
        "variable" : "v",
        "condition" : "value.unit.empty() and value.code.empty() and (v = 'true')"
      }],
      "target" : [{
        "context" : "fhirObservation",
        "contextType" : "variable",
        "element" : "value",
        "transform" : "cast",
        "parameter" : [{
          "valueId" : "v"
        },
        {
          "valueString" : "boolean"
        }]
      }]
    },
    {
      "name" : "valueBooleanFalse",
      "source" : [{
        "context" : "value",
        "element" : "value",
        "variable" : "v",
        "condition" : "value.unit.empty() and value.code.empty() and (v = 'false')"
      }],
      "target" : [{
        "context" : "fhirObservation",
        "contextType" : "variable",
        "element" : "value",
        "transform" : "cast",
        "parameter" : [{
          "valueId" : "v"
        },
        {
          "valueString" : "boolean"
        }]
      }]
    }]
  },
  {
    "name" : "ProfessionalRiskObservationComponentFromQualifier",
    "typeMode" : "none",
    "input" : [{
      "name" : "qualifier",
      "mode" : "source"
    },
    {
      "name" : "component",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "componentCode",
      "source" : [{
        "context" : "qualifier",
        "element" : "name",
        "variable" : "name"
      }],
      "target" : [{
        "context" : "component",
        "contextType" : "variable",
        "element" : "code",
        "variable" : "componentCode",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "dependent" : [{
        "name" : "CDCodeableConcept",
        "variable" : ["name", "componentCode"]
      }]
    },
    {
      "name" : "componentValue",
      "source" : [{
        "context" : "qualifier",
        "element" : "value",
        "variable" : "value"
      }],
      "dependent" : [{
        "name" : "ProfessionalRiskObservationComponentValueFromCdaValue",
        "variable" : ["value", "component"]
      }]
    }]
  },
  {
    "name" : "ProfessionalRiskObservationComponentValueFromCdaValue",
    "typeMode" : "none",
    "input" : [{
      "name" : "value",
      "mode" : "source"
    },
    {
      "name" : "component",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "componentValueQuantity",
      "source" : [{
        "context" : "value",
        "element" : "unit",
        "variable" : "unit"
      }],
      "target" : [{
        "context" : "component",
        "contextType" : "variable",
        "element" : "value",
        "variable" : "quantity",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Quantity"
        }]
      }],
      "rule" : [{
        "name" : "quantityValue",
        "source" : [{
          "context" : "value",
          "element" : "value",
          "variable" : "v"
        }],
        "target" : [{
          "context" : "quantity",
          "contextType" : "variable",
          "element" : "value",
          "transform" : "cast",
          "parameter" : [{
            "valueId" : "v"
          },
          {
            "valueString" : "decimal"
          }]
        }]
      },
      {
        "name" : "quantityUnit",
        "source" : [{
          "context" : "unit"
        }],
        "target" : [{
          "context" : "quantity",
          "contextType" : "variable",
          "element" : "unit",
          "transform" : "cast",
          "parameter" : [{
            "valueId" : "unit"
          },
          {
            "valueString" : "string"
          }]
        }]
      }]
    },
    {
      "name" : "componentValueCodeableConcept",
      "source" : [{
        "context" : "value",
        "element" : "code",
        "variable" : "code",
        "condition" : "value.unit.empty()"
      }],
      "target" : [{
        "context" : "component",
        "contextType" : "variable",
        "element" : "value",
        "variable" : "valueCodeableConcept",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "dependent" : [{
        "name" : "CDCodeableConcept",
        "variable" : ["value", "valueCodeableConcept"]
      }]
    },
    {
      "name" : "componentValueBooleanTrue",
      "source" : [{
        "context" : "value",
        "element" : "value",
        "variable" : "v",
        "condition" : "value.unit.empty() and value.code.empty() and (v = 'true')"
      }],
      "target" : [{
        "context" : "component",
        "contextType" : "variable",
        "element" : "value",
        "transform" : "cast",
        "parameter" : [{
          "valueId" : "v"
        },
        {
          "valueString" : "boolean"
        }]
      }]
    },
    {
      "name" : "componentValueBooleanFalse",
      "source" : [{
        "context" : "value",
        "element" : "value",
        "variable" : "v",
        "condition" : "value.unit.empty() and value.code.empty() and (v = 'false')"
      }],
      "target" : [{
        "context" : "component",
        "contextType" : "variable",
        "element" : "value",
        "transform" : "cast",
        "parameter" : [{
          "valueId" : "v"
        },
        {
          "valueString" : "boolean"
        }]
      }]
    }]
  },
  {
    "name" : "ProfessionalRiskObservationNoteFromText",
    "typeMode" : "none",
    "input" : [{
      "name" : "text",
      "mode" : "source"
    },
    {
      "name" : "fhirObservation",
      "type" : "Observation",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "reference",
      "source" : [{
        "context" : "text",
        "element" : "reference",
        "variable" : "reference"
      }],
      "rule" : [{
        "name" : "noteReference",
        "source" : [{
          "context" : "reference",
          "element" : "value",
          "variable" : "value"
        }],
        "target" : [{
          "context" : "fhirObservation",
          "contextType" : "variable",
          "element" : "note",
          "variable" : "note",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Annotation"
          }]
        },
        {
          "context" : "note",
          "contextType" : "variable",
          "element" : "text",
          "transform" : "cast",
          "parameter" : [{
            "valueId" : "value"
          },
          {
            "valueString" : "string"
          }]
        }]
      }]
    },
    {
      "name" : "noteText",
      "source" : [{
        "context" : "text",
        "element" : "xmlText",
        "variable" : "xml",
        "condition" : "text.reference.empty()"
      }],
      "target" : [{
        "context" : "fhirObservation",
        "contextType" : "variable",
        "element" : "note",
        "variable" : "note",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Annotation"
        }]
      },
      {
        "context" : "note",
        "contextType" : "variable",
        "element" : "text",
        "transform" : "cast",
        "parameter" : [{
          "valueId" : "xml"
        },
        {
          "valueString" : "string"
        }]
      }]
    }]
  },
  {
    "name" : "PatientSummaryCarePlanSection",
    "typeMode" : "none",
    "documentation" : "8. PLAN DE SOINS",
    "input" : [{
      "name" : "section",
      "mode" : "source"
    },
    {
      "name" : "compSection",
      "mode" : "target"
    },
    {
      "name" : "bundle",
      "type" : "Bundle",
      "mode" : "target"
    },
    {
      "name" : "patient",
      "type" : "Patient",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "carePlan",
      "source" : [{
        "context" : "section"
      }],
      "target" : [{
        "context" : "bundle",
        "contextType" : "variable",
        "element" : "entry",
        "variable" : "carePlanEntry"
      },
      {
        "context" : "carePlanEntry",
        "contextType" : "variable",
        "element" : "resource",
        "variable" : "carePlan",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CarePlan"
        }]
      },
      {
        "context" : "carePlan",
        "contextType" : "variable",
        "element" : "id",
        "transform" : "uuid"
      },
      {
        "context" : "carePlanEntry",
        "contextType" : "variable",
        "element" : "fullUrl",
        "transform" : "evaluate",
        "parameter" : [{
          "valueString" : "'urn:uuid:' + %carePlan.id"
        }]
      }],
      "dependent" : [{
        "name" : "PSPlanCarePlan",
        "variable" : ["section", "carePlan", "compSection", "bundle", "patient"]
      }]
    }]
  },
  {
    "name" : "PSPlanCarePlan",
    "typeMode" : "none",
    "input" : [{
      "name" : "section",
      "mode" : "source"
    },
    {
      "name" : "carePlan",
      "type" : "CarePlan",
      "mode" : "target"
    },
    {
      "name" : "compSection",
      "mode" : "target"
    },
    {
      "name" : "bundle",
      "type" : "Bundle",
      "mode" : "target"
    },
    {
      "name" : "patient",
      "type" : "Patient",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "status",
      "source" : [{
        "context" : "section"
      }],
      "target" : [{
        "context" : "carePlan",
        "contextType" : "variable",
        "element" : "status",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "active"
        }]
      }]
    },
    {
      "name" : "intent",
      "source" : [{
        "context" : "section"
      }],
      "target" : [{
        "context" : "carePlan",
        "contextType" : "variable",
        "element" : "intent",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "plan"
        }]
      }]
    },
    {
      "name" : "subject",
      "source" : [{
        "context" : "section"
      }],
      "target" : [{
        "context" : "carePlan",
        "contextType" : "variable",
        "element" : "subject",
        "variable" : "subjectRef",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Reference"
        }]
      },
      {
        "context" : "subjectRef",
        "contextType" : "variable",
        "element" : "reference",
        "transform" : "evaluate",
        "parameter" : [{
          "valueString" : "'urn:uuid:' + %patient.id"
        }]
      }]
    },
    {
      "name" : "identifier",
      "source" : [{
        "context" : "section",
        "element" : "id",
        "variable" : "id"
      }],
      "target" : [{
        "context" : "carePlan",
        "contextType" : "variable",
        "element" : "identifier",
        "variable" : "identifier",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Identifier"
        }]
      }],
      "dependent" : [{
        "name" : "II",
        "variable" : ["id", "identifier"]
      }]
    },
    {
      "name" : "category",
      "source" : [{
        "context" : "section",
        "element" : "code",
        "variable" : "code"
      }],
      "target" : [{
        "context" : "carePlan",
        "contextType" : "variable",
        "element" : "category",
        "variable" : "category",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "dependent" : [{
        "name" : "CDCodeableConcept",
        "variable" : ["code", "category"]
      }]
    },
    {
      "name" : "title",
      "source" : [{
        "context" : "section",
        "element" : "title",
        "variable" : "title"
      }],
      "target" : [{
        "context" : "carePlan",
        "contextType" : "variable",
        "element" : "title",
        "transform" : "evaluate",
        "parameter" : [{
          "valueString" : "title.xmlText"
        }]
      }]
    },
    {
      "name" : "effectiveTime",
      "source" : [{
        "context" : "section",
        "element" : "effectiveTime",
        "variable" : "effectiveTime"
      }],
      "rule" : [{
        "name" : "created",
        "source" : [{
          "context" : "effectiveTime",
          "element" : "value",
          "variable" : "value"
        }],
        "target" : [{
          "context" : "carePlan",
          "contextType" : "variable",
          "element" : "created",
          "variable" : "created",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "dateTime"
          }]
        }],
        "dependent" : [{
          "name" : "TSDateTime",
          "variable" : ["effectiveTime", "created"]
        }]
      },
      {
        "name" : "period",
        "source" : [{
          "context" : "effectiveTime",
          "element" : "low",
          "variable" : "low"
        }],
        "target" : [{
          "context" : "carePlan",
          "contextType" : "variable",
          "element" : "period",
          "variable" : "period",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Period"
          }]
        }],
        "rule" : [{
          "name" : "start",
          "source" : [{
            "context" : "low"
          }],
          "target" : [{
            "context" : "period",
            "contextType" : "variable",
            "element" : "start",
            "variable" : "start",
            "transform" : "create",
            "parameter" : [{
              "valueString" : "dateTime"
            }]
          }],
          "dependent" : [{
            "name" : "TSDateTime",
            "variable" : ["low", "start"]
          }]
        },
        {
          "name" : "end",
          "source" : [{
            "context" : "effectiveTime",
            "element" : "high",
            "variable" : "high"
          }],
          "target" : [{
            "context" : "period",
            "contextType" : "variable",
            "element" : "end",
            "variable" : "end",
            "transform" : "create",
            "parameter" : [{
              "valueString" : "dateTime"
            }]
          }],
          "dependent" : [{
            "name" : "TSDateTime",
            "variable" : ["high", "end"]
          }]
        }]
      }]
    },
    {
      "name" : "entries",
      "source" : [{
        "context" : "section",
        "element" : "entry",
        "variable" : "sectionEntry"
      }],
      "dependent" : [{
        "name" : "PSPlanEntryDispatcher",
        "variable" : ["sectionEntry", "carePlan", "compSection", "bundle", "patient"]
      }]
    },
    {
      "name" : "sectionEntryCarePlan",
      "source" : [{
        "context" : "section"
      }],
      "target" : [{
        "context" : "compSection",
        "contextType" : "variable",
        "element" : "entry",
        "variable" : "sectionRef",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Reference"
        }]
      },
      {
        "context" : "sectionRef",
        "contextType" : "variable",
        "element" : "reference",
        "transform" : "evaluate",
        "parameter" : [{
          "valueString" : "'urn:uuid:' + %carePlan.id"
        }]
      }]
    }]
  },
  {
    "name" : "PSPlanEntryDispatcher",
    "typeMode" : "none",
    "input" : [{
      "name" : "sectionEntry",
      "mode" : "source"
    },
    {
      "name" : "carePlan",
      "type" : "CarePlan",
      "mode" : "target"
    },
    {
      "name" : "compSection",
      "mode" : "target"
    },
    {
      "name" : "bundle",
      "type" : "Bundle",
      "mode" : "target"
    },
    {
      "name" : "patient",
      "type" : "Patient",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "treatment",
      "source" : [{
        "context" : "sectionEntry",
        "element" : "substanceAdministration",
        "variable" : "sa"
      }],
      "rule" : [{
        "name" : "templateTreatment",
        "source" : [{
          "context" : "sa",
          "element" : "templateId",
          "variable" : "tid"
        }],
        "rule" : [{
          "name" : "medicationRequest",
          "source" : [{
            "context" : "tid",
            "element" : "root",
            "variable" : "root",
            "condition" : "root = '1.2.250.1.213.1.1.3.42'"
          }],
          "dependent" : [{
            "name" : "PSPlanMedicationRequestEntry",
            "variable" : ["sa", "carePlan", "compSection", "bundle", "patient"]
          }]
        }]
      }]
    },
    {
      "name" : "serviceRequest",
      "source" : [{
        "context" : "sectionEntry",
        "element" : "observation",
        "variable" : "obs"
      }],
      "rule" : [{
        "name" : "templateServiceRequest",
        "source" : [{
          "context" : "obs",
          "element" : "templateId",
          "variable" : "tid"
        }],
        "rule" : [{
          "name" : "serviceRequest",
          "source" : [{
            "context" : "tid",
            "element" : "root",
            "variable" : "root",
            "condition" : "root = '1.2.250.1.213.1.1.3.27'"
          }],
          "dependent" : [{
            "name" : "PSPlanServiceRequestEntry",
            "variable" : ["obs", "carePlan", "compSection", "bundle", "patient"]
          }]
        }]
      }]
    },
    {
      "name" : "procedure",
      "source" : [{
        "context" : "sectionEntry",
        "element" : "procedure",
        "variable" : "proc"
      }],
      "rule" : [{
        "name" : "templateProcedure",
        "source" : [{
          "context" : "proc",
          "element" : "templateId",
          "variable" : "tid"
        }],
        "rule" : [{
          "name" : "procedure",
          "source" : [{
            "context" : "tid",
            "element" : "root",
            "variable" : "root",
            "condition" : "root = '1.2.250.1.213.1.1.3.62'"
          }],
          "dependent" : [{
            "name" : "PSPlanProcedureEntry",
            "variable" : ["proc", "carePlan", "compSection", "bundle", "patient"]
          }]
        }]
      }]
    },
    {
      "name" : "encounter",
      "source" : [{
        "context" : "sectionEntry",
        "element" : "encounter",
        "variable" : "enc"
      }],
      "rule" : [{
        "name" : "templateEncounter",
        "source" : [{
          "context" : "enc",
          "element" : "templateId",
          "variable" : "tid"
        }],
        "rule" : [{
          "name" : "encounter",
          "source" : [{
            "context" : "tid",
            "element" : "root",
            "variable" : "root",
            "condition" : "root = '1.2.250.1.213.1.1.3.58'"
          }],
          "dependent" : [{
            "name" : "PSPlanEncounterEntry",
            "variable" : ["enc", "carePlan", "compSection", "bundle", "patient"]
          }]
        }]
      }]
    },
    {
      "name" : "vaccineRecommendation",
      "source" : [{
        "context" : "sectionEntry",
        "element" : "substanceAdministration",
        "variable" : "sa"
      }],
      "rule" : [{
        "name" : "templateVaccineRecommendation",
        "source" : [{
          "context" : "sa",
          "element" : "templateId",
          "variable" : "tid"
        }],
        "rule" : [{
          "name" : "immunizationRecommendation",
          "source" : [{
            "context" : "tid",
            "element" : "root",
            "variable" : "root",
            "condition" : "root = '1.2.250.1.213.1.1.3.47'"
          }],
          "dependent" : [{
            "name" : "PSPlanImmunizationRecommendationEntry",
            "variable" : ["sa", "carePlan", "compSection", "bundle", "patient"]
          }]
        }]
      }]
    }]
  },
  {
    "name" : "PSPlanMedicationRequestEntry",
    "typeMode" : "none",
    "documentation" : "TRAITEMENT PRÉVU -> MedicationRequest",
    "input" : [{
      "name" : "sa",
      "mode" : "source"
    },
    {
      "name" : "carePlan",
      "type" : "CarePlan",
      "mode" : "target"
    },
    {
      "name" : "compSection",
      "mode" : "target"
    },
    {
      "name" : "bundle",
      "type" : "Bundle",
      "mode" : "target"
    },
    {
      "name" : "patient",
      "type" : "Patient",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "medicationRequest",
      "source" : [{
        "context" : "sa"
      }],
      "target" : [{
        "context" : "bundle",
        "contextType" : "variable",
        "element" : "entry",
        "variable" : "medicationRequestEntry"
      },
      {
        "context" : "medicationRequestEntry",
        "contextType" : "variable",
        "element" : "resource",
        "variable" : "medicationRequest",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "MedicationRequest"
        }]
      },
      {
        "context" : "medicationRequest",
        "contextType" : "variable",
        "element" : "id",
        "transform" : "uuid"
      },
      {
        "context" : "medicationRequestEntry",
        "contextType" : "variable",
        "element" : "fullUrl",
        "transform" : "evaluate",
        "parameter" : [{
          "valueString" : "'urn:uuid:' + %medicationRequest.id"
        }]
      }],
      "dependent" : [{
        "name" : "PSPlanMedicationRequest",
        "variable" : ["sa",
        "medicationRequest",
        "carePlan",
        "compSection",
        "bundle",
        "patient"]
      }]
    }]
  },
  {
    "name" : "PSPlanMedicationRequest",
    "typeMode" : "none",
    "input" : [{
      "name" : "sa",
      "mode" : "source"
    },
    {
      "name" : "medicationRequest",
      "type" : "MedicationRequest",
      "mode" : "target"
    },
    {
      "name" : "carePlan",
      "type" : "CarePlan",
      "mode" : "target"
    },
    {
      "name" : "compSection",
      "mode" : "target"
    },
    {
      "name" : "bundle",
      "type" : "Bundle",
      "mode" : "target"
    },
    {
      "name" : "patient",
      "type" : "Patient",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "statusDefault",
      "source" : [{
        "context" : "sa"
      }],
      "target" : [{
        "context" : "medicationRequest",
        "contextType" : "variable",
        "element" : "status",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "active"
        }]
      }]
    },
    {
      "name" : "status",
      "source" : [{
        "context" : "sa",
        "element" : "statusCode",
        "variable" : "statusCode"
      }],
      "rule" : [{
        "name" : "active",
        "source" : [{
          "context" : "statusCode",
          "element" : "code",
          "variable" : "code",
          "condition" : "code = 'active'"
        }],
        "target" : [{
          "context" : "medicationRequest",
          "contextType" : "variable",
          "element" : "status",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "active"
          }]
        }]
      },
      {
        "name" : "completed",
        "source" : [{
          "context" : "statusCode",
          "element" : "code",
          "variable" : "code",
          "condition" : "code = 'completed'"
        }],
        "target" : [{
          "context" : "medicationRequest",
          "contextType" : "variable",
          "element" : "status",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "completed"
          }]
        }]
      },
      {
        "name" : "aborted",
        "source" : [{
          "context" : "statusCode",
          "element" : "code",
          "variable" : "code",
          "condition" : "code = 'aborted'"
        }],
        "target" : [{
          "context" : "medicationRequest",
          "contextType" : "variable",
          "element" : "status",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "stopped"
          }]
        }]
      },
      {
        "name" : "cancelled",
        "source" : [{
          "context" : "statusCode",
          "element" : "code",
          "variable" : "code",
          "condition" : "code = 'cancelled'"
        }],
        "target" : [{
          "context" : "medicationRequest",
          "contextType" : "variable",
          "element" : "status",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "cancelled"
          }]
        }]
      },
      {
        "name" : "suspended",
        "source" : [{
          "context" : "statusCode",
          "element" : "code",
          "variable" : "code",
          "condition" : "code = 'suspended'"
        }],
        "target" : [{
          "context" : "medicationRequest",
          "contextType" : "variable",
          "element" : "status",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "on-hold"
          }]
        }]
      }]
    },
    {
      "name" : "intentDefault",
      "source" : [{
        "context" : "sa"
      }],
      "target" : [{
        "context" : "medicationRequest",
        "contextType" : "variable",
        "element" : "intent",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "plan"
        }]
      }]
    },
    {
      "name" : "intent",
      "source" : [{
        "context" : "sa",
        "element" : "moodCode",
        "variable" : "moodCode"
      }],
      "rule" : [{
        "name" : "intent",
        "source" : [{
          "context" : "moodCode",
          "condition" : "moodCode = 'INT'"
        }],
        "target" : [{
          "context" : "medicationRequest",
          "contextType" : "variable",
          "element" : "intent",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "plan"
          }]
        }]
      },
      {
        "name" : "goal",
        "source" : [{
          "context" : "moodCode",
          "condition" : "moodCode = 'GOL'"
        }],
        "target" : [{
          "context" : "medicationRequest",
          "contextType" : "variable",
          "element" : "intent",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "plan"
          }]
        }]
      },
      {
        "name" : "proposal",
        "source" : [{
          "context" : "moodCode",
          "condition" : "moodCode = 'PRP'"
        }],
        "target" : [{
          "context" : "medicationRequest",
          "contextType" : "variable",
          "element" : "intent",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "proposal"
          }]
        }]
      },
      {
        "name" : "order",
        "source" : [{
          "context" : "moodCode",
          "condition" : "moodCode = 'RQO'"
        }],
        "target" : [{
          "context" : "medicationRequest",
          "contextType" : "variable",
          "element" : "intent",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "order"
          }]
        }]
      },
      {
        "name" : "appointmentRequest",
        "source" : [{
          "context" : "moodCode",
          "condition" : "moodCode = 'ARQ'"
        }],
        "target" : [{
          "context" : "medicationRequest",
          "contextType" : "variable",
          "element" : "intent",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "order"
          }]
        }]
      }]
    },
    {
      "name" : "identifier",
      "source" : [{
        "context" : "sa",
        "element" : "id",
        "variable" : "id"
      }],
      "target" : [{
        "context" : "medicationRequest",
        "contextType" : "variable",
        "element" : "identifier",
        "variable" : "identifier",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Identifier"
        }]
      }],
      "dependent" : [{
        "name" : "II",
        "variable" : ["id", "identifier"]
      }]
    },
    {
      "name" : "subject",
      "source" : [{
        "context" : "sa"
      }],
      "target" : [{
        "context" : "medicationRequest",
        "contextType" : "variable",
        "element" : "subject",
        "variable" : "subjectRef",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Reference"
        }]
      },
      {
        "context" : "subjectRef",
        "contextType" : "variable",
        "element" : "reference",
        "transform" : "evaluate",
        "parameter" : [{
          "valueString" : "'urn:uuid:' + %patient.id"
        }]
      }]
    },
    {
      "name" : "medication",
      "source" : [{
        "context" : "sa",
        "element" : "consumable",
        "variable" : "consumable"
      }],
      "rule" : [{
        "name" : "manufacturedProduct",
        "source" : [{
          "context" : "consumable",
          "element" : "manufacturedProduct",
          "variable" : "manufacturedProduct"
        }],
        "rule" : [{
          "name" : "material",
          "source" : [{
            "context" : "manufacturedProduct",
            "element" : "manufacturedMaterial",
            "variable" : "material"
          }],
          "rule" : [{
            "name" : "codedMedication",
            "source" : [{
              "context" : "material",
              "element" : "code",
              "variable" : "medicationCode",
              "condition" : "medicationCode.code.empty().not()"
            }],
            "target" : [{
              "context" : "bundle",
              "contextType" : "variable",
              "element" : "entry",
              "variable" : "medicationEntry"
            },
            {
              "context" : "medicationEntry",
              "contextType" : "variable",
              "element" : "resource",
              "variable" : "medication",
              "transform" : "create",
              "parameter" : [{
                "valueString" : "Medication"
              }]
            },
            {
              "context" : "medication",
              "contextType" : "variable",
              "element" : "id",
              "transform" : "uuid"
            },
            {
              "context" : "medicationEntry",
              "contextType" : "variable",
              "element" : "fullUrl",
              "transform" : "evaluate",
              "parameter" : [{
                "valueString" : "'urn:uuid:' + %medication.id"
              }]
            }],
            "rule" : [{
              "name" : "medicationCode",
              "source" : [{
                "context" : "material",
                "element" : "code",
                "variable" : "code"
              }],
              "target" : [{
                "context" : "medication",
                "contextType" : "variable",
                "element" : "code",
                "variable" : "medicationCodeableConcept",
                "transform" : "create",
                "parameter" : [{
                  "valueString" : "CodeableConcept"
                }]
              }],
              "dependent" : [{
                "name" : "CDCodeableConcept",
                "variable" : ["code", "medicationCodeableConcept"]
              }]
            },
            {
              "name" : "nameOnly",
              "source" : [{
                "context" : "material",
                "element" : "name",
                "variable" : "name",
                "condition" : "material.code.empty()"
              }],
              "target" : [{
                "context" : "medication",
                "contextType" : "variable",
                "element" : "code",
                "variable" : "codeOnlyText",
                "transform" : "create",
                "parameter" : [{
                  "valueString" : "CodeableConcept"
                }]
              }],
              "rule" : [{
                "name" : "nameText",
                "source" : [{
                  "context" : "name",
                  "element" : "xmlText",
                  "variable" : "nameText"
                }],
                "target" : [{
                  "context" : "codeOnlyText",
                  "contextType" : "variable",
                  "element" : "text",
                  "transform" : "cast",
                  "parameter" : [{
                    "valueId" : "nameText"
                  },
                  {
                    "valueString" : "string"
                  }]
                }]
              }]
            },
            {
              "name" : "medicationReference",
              "source" : [{
                "context" : "material"
              }],
              "target" : [{
                "context" : "medicationRequest",
                "contextType" : "variable",
                "element" : "medication",
                "variable" : "medicationRef",
                "transform" : "create",
                "parameter" : [{
                  "valueString" : "Reference"
                }]
              },
              {
                "context" : "medicationRef",
                "contextType" : "variable",
                "element" : "reference",
                "transform" : "evaluate",
                "parameter" : [{
                  "valueString" : "'urn:uuid:' + %medication.id"
                }]
              }]
            }]
          },
          {
            "name" : "textOnlyMedication",
            "source" : [{
              "context" : "material",
              "element" : "code",
              "variable" : "medicationCode",
              "condition" : "medicationCode.code.empty()"
            }],
            "target" : [{
              "context" : "medicationRequest",
              "contextType" : "variable",
              "element" : "medication",
              "variable" : "medicationCodeableConcept",
              "transform" : "create",
              "parameter" : [{
                "valueString" : "CodeableConcept"
              }]
            }],
            "dependent" : [{
              "name" : "CDCodeableConcept",
              "variable" : ["medicationCode", "medicationCodeableConcept"]
            }]
          },
          {
            "name" : "medicationNameOnly",
            "source" : [{
              "context" : "material",
              "element" : "name",
              "variable" : "name",
              "condition" : "material.code.empty()"
            }],
            "target" : [{
              "context" : "medicationRequest",
              "contextType" : "variable",
              "element" : "medication",
              "variable" : "medicationCodeableConcept",
              "transform" : "create",
              "parameter" : [{
                "valueString" : "CodeableConcept"
              }]
            }],
            "rule" : [{
              "name" : "medicationNameOnly",
              "source" : [{
                "context" : "name",
                "element" : "xmlText",
                "variable" : "nameText"
              }],
              "target" : [{
                "context" : "medicationCodeableConcept",
                "contextType" : "variable",
                "element" : "text",
                "transform" : "cast",
                "parameter" : [{
                  "valueId" : "nameText"
                },
                {
                  "valueString" : "string"
                }]
              }]
            }]
          },
          {
            "name" : "translation",
            "source" : [{
              "context" : "material",
              "element" : "code",
              "variable" : "medicationCode"
            }],
            "rule" : [{
              "name" : "translationMedication",
              "source" : [{
                "context" : "medicationCode",
                "element" : "translation",
                "variable" : "translation"
              }],
              "target" : [{
                "context" : "medicationRequest",
                "contextType" : "variable",
                "element" : "medication",
                "variable" : "medicationCodeableConcept",
                "transform" : "create",
                "parameter" : [{
                  "valueString" : "CodeableConcept"
                }]
              }],
              "dependent" : [{
                "name" : "CDCodeableConcept",
                "variable" : ["translation", "medicationCodeableConcept"]
              }]
            }]
          }]
        }]
      }]
    },
    {
      "name" : "medicationAbsent",
      "source" : [{
        "context" : "sa",
        "condition" : "sa.consumable.empty()"
      }],
      "target" : [{
        "context" : "medicationRequest",
        "contextType" : "variable",
        "element" : "medication",
        "variable" : "medicationAbsent",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "dependent" : [{
        "name" : "PSPlanCodeableConceptAbsentReason",
        "variable" : ["sa", "medicationAbsent"]
      }]
    },
    {
      "name" : "text",
      "source" : [{
        "context" : "sa",
        "element" : "text",
        "variable" : "text"
      }],
      "dependent" : [{
        "name" : "PSPlanTextToNote",
        "variable" : ["text", "medicationRequest"]
      }]
    },
    {
      "name" : "comment",
      "source" : [{
        "context" : "sa",
        "element" : "entryRelationship",
        "variable" : "er"
      }],
      "dependent" : [{
        "name" : "PSPlanCommentToNote",
        "variable" : ["er", "medicationRequest"]
      }]
    },
    {
      "name" : "timing",
      "source" : [{
        "context" : "sa",
        "element" : "effectiveTime",
        "variable" : "effectiveTime"
      }],
      "rule" : [{
        "name" : "lowHigh",
        "source" : [{
          "context" : "effectiveTime",
          "element" : "low",
          "variable" : "low"
        }],
        "target" : [{
          "context" : "medicationRequest",
          "contextType" : "variable",
          "element" : "dosageInstruction",
          "variable" : "dosage"
        }],
        "rule" : [{
          "name" : "timing",
          "source" : [{
            "context" : "low"
          }],
          "target" : [{
            "context" : "dosage",
            "contextType" : "variable",
            "element" : "timing",
            "variable" : "timing"
          }],
          "rule" : [{
            "name" : "repeat",
            "source" : [{
              "context" : "low"
            }],
            "target" : [{
              "context" : "timing",
              "contextType" : "variable",
              "element" : "repeat",
              "variable" : "repeat"
            }],
            "rule" : [{
              "name" : "bounds",
              "source" : [{
                "context" : "low"
              }],
              "target" : [{
                "context" : "repeat",
                "contextType" : "variable",
                "element" : "bounds",
                "variable" : "period",
                "transform" : "create",
                "parameter" : [{
                  "valueString" : "Period"
                }]
              }],
              "rule" : [{
                "name" : "start",
                "source" : [{
                  "context" : "low"
                }],
                "target" : [{
                  "context" : "period",
                  "contextType" : "variable",
                  "element" : "start",
                  "variable" : "start",
                  "transform" : "create",
                  "parameter" : [{
                    "valueString" : "dateTime"
                  }]
                }],
                "dependent" : [{
                  "name" : "TSDateTime",
                  "variable" : ["low", "start"]
                }]
              },
              {
                "name" : "end",
                "source" : [{
                  "context" : "effectiveTime",
                  "element" : "high",
                  "variable" : "high"
                }],
                "target" : [{
                  "context" : "period",
                  "contextType" : "variable",
                  "element" : "end",
                  "variable" : "end",
                  "transform" : "create",
                  "parameter" : [{
                    "valueString" : "dateTime"
                  }]
                }],
                "dependent" : [{
                  "name" : "TSDateTime",
                  "variable" : ["high", "end"]
                }]
              }]
            }]
          }]
        }]
      },
      {
        "name" : "frequency",
        "source" : [{
          "context" : "effectiveTime",
          "element" : "period",
          "variable" : "period"
        }],
        "target" : [{
          "context" : "medicationRequest",
          "contextType" : "variable",
          "element" : "dosageInstruction",
          "variable" : "dosage"
        }],
        "rule" : [{
          "name" : "timing",
          "source" : [{
            "context" : "period"
          }],
          "target" : [{
            "context" : "dosage",
            "contextType" : "variable",
            "element" : "timing",
            "variable" : "timing"
          }],
          "rule" : [{
            "name" : "repeat",
            "source" : [{
              "context" : "period"
            }],
            "target" : [{
              "context" : "timing",
              "contextType" : "variable",
              "element" : "repeat",
              "variable" : "repeat"
            }],
            "rule" : [{
              "name" : "period",
              "source" : [{
                "context" : "period",
                "element" : "value",
                "variable" : "value"
              }],
              "target" : [{
                "context" : "repeat",
                "contextType" : "variable",
                "element" : "period",
                "transform" : "cast",
                "parameter" : [{
                  "valueId" : "value"
                },
                {
                  "valueString" : "decimal"
                }]
              }]
            },
            {
              "name" : "periodUnit",
              "source" : [{
                "context" : "period",
                "element" : "unit",
                "variable" : "unit"
              }],
              "target" : [{
                "context" : "repeat",
                "contextType" : "variable",
                "element" : "periodUnit",
                "transform" : "cast",
                "parameter" : [{
                  "valueId" : "unit"
                },
                {
                  "valueString" : "code"
                }]
              }]
            }]
          }]
        }]
      }]
    },
    {
      "name" : "repeatNumber",
      "source" : [{
        "context" : "sa",
        "element" : "repeatNumber",
        "variable" : "repeatNumber"
      }],
      "rule" : [{
        "name" : "dispenseRequest",
        "source" : [{
          "context" : "repeatNumber",
          "element" : "value",
          "variable" : "value"
        }],
        "target" : [{
          "context" : "medicationRequest",
          "contextType" : "variable",
          "element" : "dispenseRequest",
          "variable" : "dispenseRequest"
        }],
        "rule" : [{
          "name" : "numberOfRepeatsAllowed",
          "source" : [{
            "context" : "value"
          }],
          "target" : [{
            "context" : "dispenseRequest",
            "contextType" : "variable",
            "element" : "numberOfRepeatsAllowed",
            "transform" : "cast",
            "parameter" : [{
              "valueId" : "value"
            },
            {
              "valueString" : "integer"
            }]
          }]
        }]
      }]
    },
    {
      "name" : "route",
      "source" : [{
        "context" : "sa",
        "element" : "routeCode",
        "variable" : "routeCode"
      }],
      "target" : [{
        "context" : "medicationRequest",
        "contextType" : "variable",
        "element" : "dosageInstruction",
        "variable" : "dosage"
      }],
      "rule" : [{
        "name" : "route",
        "source" : [{
          "context" : "routeCode"
        }],
        "target" : [{
          "context" : "dosage",
          "contextType" : "variable",
          "element" : "route",
          "variable" : "route",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "CodeableConcept"
          }]
        }],
        "dependent" : [{
          "name" : "CDCodeableConcept",
          "variable" : ["routeCode", "route"]
        }]
      }]
    },
    {
      "name" : "site",
      "source" : [{
        "context" : "sa",
        "element" : "approachSiteCode",
        "variable" : "siteCode"
      }],
      "target" : [{
        "context" : "medicationRequest",
        "contextType" : "variable",
        "element" : "dosageInstruction",
        "variable" : "dosage"
      }],
      "rule" : [{
        "name" : "site",
        "source" : [{
          "context" : "siteCode"
        }],
        "target" : [{
          "context" : "dosage",
          "contextType" : "variable",
          "element" : "site",
          "variable" : "site",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "CodeableConcept"
          }]
        }],
        "dependent" : [{
          "name" : "CDCodeableConcept",
          "variable" : ["siteCode", "site"]
        }]
      }]
    },
    {
      "name" : "doseQuantity",
      "source" : [{
        "context" : "sa",
        "element" : "doseQuantity",
        "variable" : "doseQuantity"
      }],
      "rule" : [{
        "name" : "dose",
        "source" : [{
          "context" : "doseQuantity",
          "element" : "low",
          "variable" : "low"
        }],
        "target" : [{
          "context" : "medicationRequest",
          "contextType" : "variable",
          "element" : "dosageInstruction",
          "variable" : "dosage"
        }],
        "rule" : [{
          "name" : "doseRange",
          "source" : [{
            "context" : "doseQuantity"
          }],
          "target" : [{
            "context" : "dosage",
            "contextType" : "variable",
            "element" : "doseAndRate",
            "variable" : "doseAndRate"
          },
          {
            "context" : "doseAndRate",
            "contextType" : "variable",
            "element" : "dose",
            "variable" : "doseRange",
            "transform" : "create",
            "parameter" : [{
              "valueString" : "Range"
            }]
          }],
          "dependent" : [{
            "name" : "MedicationRangeFromLowHigh",
            "variable" : ["doseQuantity", "doseRange"]
          }]
        }]
      }]
    },
    {
      "name" : "rateQuantity",
      "source" : [{
        "context" : "sa",
        "element" : "rateQuantity",
        "variable" : "rateQuantity"
      }],
      "rule" : [{
        "name" : "rate",
        "source" : [{
          "context" : "rateQuantity",
          "element" : "low",
          "variable" : "low"
        }],
        "target" : [{
          "context" : "medicationRequest",
          "contextType" : "variable",
          "element" : "dosageInstruction",
          "variable" : "dosage"
        }],
        "rule" : [{
          "name" : "rateRange",
          "source" : [{
            "context" : "rateQuantity"
          }],
          "target" : [{
            "context" : "dosage",
            "contextType" : "variable",
            "element" : "doseAndRate",
            "variable" : "doseAndRate"
          },
          {
            "context" : "doseAndRate",
            "contextType" : "variable",
            "element" : "rate",
            "variable" : "rateRange",
            "transform" : "create",
            "parameter" : [{
              "valueString" : "Range"
            }]
          }],
          "dependent" : [{
            "name" : "MedicationRangeFromLowHigh",
            "variable" : ["rateQuantity", "rateRange"]
          }]
        }]
      }]
    },
    {
      "name" : "maxDoseQuantity",
      "source" : [{
        "context" : "sa",
        "element" : "maxDoseQuantity",
        "variable" : "maxDoseQuantity"
      }],
      "rule" : [{
        "name" : "maxDose",
        "source" : [{
          "context" : "maxDoseQuantity",
          "element" : "numerator",
          "variable" : "numerator"
        }],
        "target" : [{
          "context" : "medicationRequest",
          "contextType" : "variable",
          "element" : "dosageInstruction",
          "variable" : "dosage"
        }],
        "rule" : [{
          "name" : "maxDose",
          "source" : [{
            "context" : "maxDoseQuantity"
          }],
          "target" : [{
            "context" : "dosage",
            "contextType" : "variable",
            "element" : "maxDosePerPeriod",
            "variable" : "ratio",
            "transform" : "create",
            "parameter" : [{
              "valueString" : "Ratio"
            }]
          }],
          "dependent" : [{
            "name" : "MedicationRatioFromNumeratorDenominator",
            "variable" : ["maxDoseQuantity", "ratio"]
          }]
        }]
      }]
    },
    {
      "name" : "supportingInfo",
      "source" : [{
        "context" : "sa"
      }],
      "target" : [{
        "context" : "carePlan",
        "contextType" : "variable",
        "element" : "supportingInfo",
        "variable" : "supportRef",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Reference"
        }]
      },
      {
        "context" : "supportRef",
        "contextType" : "variable",
        "element" : "reference",
        "transform" : "evaluate",
        "parameter" : [{
          "valueString" : "'urn:uuid:' + %medicationRequest.id"
        }]
      }]
    }]
  },
  {
    "name" : "PSPlanServiceRequestEntry",
    "typeMode" : "none",
    "documentation" : "DEMANDE D’EXAMEN OU DE SUIVI -> ServiceRequest",
    "input" : [{
      "name" : "obs",
      "mode" : "source"
    },
    {
      "name" : "carePlan",
      "type" : "CarePlan",
      "mode" : "target"
    },
    {
      "name" : "compSection",
      "mode" : "target"
    },
    {
      "name" : "bundle",
      "type" : "Bundle",
      "mode" : "target"
    },
    {
      "name" : "patient",
      "type" : "Patient",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "serviceRequest",
      "source" : [{
        "context" : "obs"
      }],
      "target" : [{
        "context" : "bundle",
        "contextType" : "variable",
        "element" : "entry",
        "variable" : "serviceRequestEntry"
      },
      {
        "context" : "serviceRequestEntry",
        "contextType" : "variable",
        "element" : "resource",
        "variable" : "serviceRequest",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "ServiceRequest"
        }]
      },
      {
        "context" : "serviceRequest",
        "contextType" : "variable",
        "element" : "id",
        "transform" : "uuid"
      },
      {
        "context" : "serviceRequestEntry",
        "contextType" : "variable",
        "element" : "fullUrl",
        "transform" : "evaluate",
        "parameter" : [{
          "valueString" : "'urn:uuid:' + %serviceRequest.id"
        }]
      }],
      "dependent" : [{
        "name" : "PSPlanServiceRequest",
        "variable" : ["obs", "serviceRequest", "carePlan", "compSection", "patient"]
      }]
    }]
  },
  {
    "name" : "PSPlanServiceRequest",
    "typeMode" : "none",
    "input" : [{
      "name" : "obs",
      "mode" : "source"
    },
    {
      "name" : "serviceRequest",
      "type" : "ServiceRequest",
      "mode" : "target"
    },
    {
      "name" : "carePlan",
      "type" : "CarePlan",
      "mode" : "target"
    },
    {
      "name" : "compSection",
      "mode" : "target"
    },
    {
      "name" : "patient",
      "type" : "Patient",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "statusDefault",
      "source" : [{
        "context" : "obs"
      }],
      "target" : [{
        "context" : "serviceRequest",
        "contextType" : "variable",
        "element" : "status",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "active"
        }]
      }]
    },
    {
      "name" : "status",
      "source" : [{
        "context" : "obs",
        "element" : "statusCode",
        "variable" : "statusCode"
      }],
      "rule" : [{
        "name" : "active",
        "source" : [{
          "context" : "statusCode",
          "element" : "code",
          "variable" : "code",
          "condition" : "code = 'active'"
        }],
        "target" : [{
          "context" : "serviceRequest",
          "contextType" : "variable",
          "element" : "status",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "active"
          }]
        }]
      },
      {
        "name" : "completed",
        "source" : [{
          "context" : "statusCode",
          "element" : "code",
          "variable" : "code",
          "condition" : "code = 'completed'"
        }],
        "target" : [{
          "context" : "serviceRequest",
          "contextType" : "variable",
          "element" : "status",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "completed"
          }]
        }]
      },
      {
        "name" : "aborted",
        "source" : [{
          "context" : "statusCode",
          "element" : "code",
          "variable" : "code",
          "condition" : "code = 'aborted'"
        }],
        "target" : [{
          "context" : "serviceRequest",
          "contextType" : "variable",
          "element" : "status",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "revoked"
          }]
        }]
      },
      {
        "name" : "cancelled",
        "source" : [{
          "context" : "statusCode",
          "element" : "code",
          "variable" : "code",
          "condition" : "code = 'cancelled'"
        }],
        "target" : [{
          "context" : "serviceRequest",
          "contextType" : "variable",
          "element" : "status",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "revoked"
          }]
        }]
      },
      {
        "name" : "suspended",
        "source" : [{
          "context" : "statusCode",
          "element" : "code",
          "variable" : "code",
          "condition" : "code = 'suspended'"
        }],
        "target" : [{
          "context" : "serviceRequest",
          "contextType" : "variable",
          "element" : "status",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "on-hold"
          }]
        }]
      }]
    },
    {
      "name" : "intentDefault",
      "source" : [{
        "context" : "obs"
      }],
      "target" : [{
        "context" : "serviceRequest",
        "contextType" : "variable",
        "element" : "intent",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "plan"
        }]
      }]
    },
    {
      "name" : "intent",
      "source" : [{
        "context" : "obs",
        "element" : "moodCode",
        "variable" : "moodCode"
      }],
      "rule" : [{
        "name" : "intent",
        "source" : [{
          "context" : "moodCode",
          "condition" : "moodCode = 'INT'"
        }],
        "target" : [{
          "context" : "serviceRequest",
          "contextType" : "variable",
          "element" : "intent",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "plan"
          }]
        }]
      },
      {
        "name" : "goal",
        "source" : [{
          "context" : "moodCode",
          "condition" : "moodCode = 'GOL'"
        }],
        "target" : [{
          "context" : "serviceRequest",
          "contextType" : "variable",
          "element" : "intent",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "plan"
          }]
        }]
      },
      {
        "name" : "proposal",
        "source" : [{
          "context" : "moodCode",
          "condition" : "moodCode = 'PRP'"
        }],
        "target" : [{
          "context" : "serviceRequest",
          "contextType" : "variable",
          "element" : "intent",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "proposal"
          }]
        }]
      },
      {
        "name" : "order",
        "source" : [{
          "context" : "moodCode",
          "condition" : "moodCode = 'RQO'"
        }],
        "target" : [{
          "context" : "serviceRequest",
          "contextType" : "variable",
          "element" : "intent",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "order"
          }]
        }]
      },
      {
        "name" : "appointmentRequest",
        "source" : [{
          "context" : "moodCode",
          "condition" : "moodCode = 'ARQ'"
        }],
        "target" : [{
          "context" : "serviceRequest",
          "contextType" : "variable",
          "element" : "intent",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "order"
          }]
        }]
      }]
    },
    {
      "name" : "identifier",
      "source" : [{
        "context" : "obs",
        "element" : "id",
        "variable" : "id"
      }],
      "target" : [{
        "context" : "serviceRequest",
        "contextType" : "variable",
        "element" : "identifier",
        "variable" : "identifier",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Identifier"
        }]
      }],
      "dependent" : [{
        "name" : "II",
        "variable" : ["id", "identifier"]
      }]
    },
    {
      "name" : "subject",
      "source" : [{
        "context" : "obs"
      }],
      "target" : [{
        "context" : "serviceRequest",
        "contextType" : "variable",
        "element" : "subject",
        "variable" : "subjectRef",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Reference"
        }]
      },
      {
        "context" : "subjectRef",
        "contextType" : "variable",
        "element" : "reference",
        "transform" : "evaluate",
        "parameter" : [{
          "valueString" : "'urn:uuid:' + %patient.id"
        }]
      }]
    },
    {
      "name" : "code",
      "source" : [{
        "context" : "obs",
        "element" : "code",
        "variable" : "code"
      }],
      "target" : [{
        "context" : "serviceRequest",
        "contextType" : "variable",
        "element" : "code",
        "variable" : "codeableConcept",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "dependent" : [{
        "name" : "CDCodeableConcept",
        "variable" : ["code", "codeableConcept"]
      }]
    },
    {
      "name" : "text",
      "source" : [{
        "context" : "obs",
        "element" : "text",
        "variable" : "text"
      }],
      "dependent" : [{
        "name" : "PSPlanTextToNote",
        "variable" : ["text", "serviceRequest"]
      }]
    },
    {
      "name" : "comment",
      "source" : [{
        "context" : "obs",
        "element" : "entryRelationship",
        "variable" : "er"
      }],
      "dependent" : [{
        "name" : "PSPlanCommentToNote",
        "variable" : ["er", "serviceRequest"]
      }]
    },
    {
      "name" : "occurrence",
      "source" : [{
        "context" : "obs",
        "element" : "effectiveTime",
        "variable" : "effectiveTime"
      }],
      "rule" : [{
        "name" : "dateTime",
        "source" : [{
          "context" : "effectiveTime",
          "element" : "value",
          "variable" : "value"
        }],
        "target" : [{
          "context" : "serviceRequest",
          "contextType" : "variable",
          "element" : "occurrence",
          "variable" : "occurrenceDateTime",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "dateTime"
          }]
        }],
        "dependent" : [{
          "name" : "TSDateTime",
          "variable" : ["effectiveTime", "occurrenceDateTime"]
        }]
      },
      {
        "name" : "period",
        "source" : [{
          "context" : "effectiveTime",
          "element" : "low",
          "variable" : "low"
        }],
        "target" : [{
          "context" : "serviceRequest",
          "contextType" : "variable",
          "element" : "occurrence",
          "variable" : "period",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Period"
          }]
        }],
        "rule" : [{
          "name" : "start",
          "source" : [{
            "context" : "low"
          }],
          "target" : [{
            "context" : "period",
            "contextType" : "variable",
            "element" : "start",
            "variable" : "start",
            "transform" : "create",
            "parameter" : [{
              "valueString" : "dateTime"
            }]
          }],
          "dependent" : [{
            "name" : "TSDateTime",
            "variable" : ["low", "start"]
          }]
        },
        {
          "name" : "end",
          "source" : [{
            "context" : "effectiveTime",
            "element" : "high",
            "variable" : "high"
          }],
          "target" : [{
            "context" : "period",
            "contextType" : "variable",
            "element" : "end",
            "variable" : "end",
            "transform" : "create",
            "parameter" : [{
              "valueString" : "dateTime"
            }]
          }],
          "dependent" : [{
            "name" : "TSDateTime",
            "variable" : ["high", "end"]
          }]
        }]
      }]
    },
    {
      "name" : "orderDetail",
      "source" : [{
        "context" : "obs",
        "element" : "value",
        "variable" : "value"
      }],
      "target" : [{
        "context" : "serviceRequest",
        "contextType" : "variable",
        "element" : "orderDetail",
        "variable" : "orderDetail",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "dependent" : [{
        "name" : "CDCodeableConcept",
        "variable" : ["value", "orderDetail"]
      }]
    },
    {
      "name" : "bodySite",
      "source" : [{
        "context" : "obs",
        "element" : "targetSiteCode",
        "variable" : "targetSiteCode"
      }],
      "target" : [{
        "context" : "serviceRequest",
        "contextType" : "variable",
        "element" : "bodySite",
        "variable" : "bodySite",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "dependent" : [{
        "name" : "CDCodeableConcept",
        "variable" : ["targetSiteCode", "bodySite"]
      }]
    },
    {
      "name" : "supportingInfo",
      "source" : [{
        "context" : "obs"
      }],
      "target" : [{
        "context" : "carePlan",
        "contextType" : "variable",
        "element" : "supportingInfo",
        "variable" : "supportRef",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Reference"
        }]
      },
      {
        "context" : "supportRef",
        "contextType" : "variable",
        "element" : "reference",
        "transform" : "evaluate",
        "parameter" : [{
          "valueString" : "'urn:uuid:' + %serviceRequest.id"
        }]
      }]
    }]
  },
  {
    "name" : "PSPlanProcedureEntry",
    "typeMode" : "none",
    "documentation" : "ACTE PRÉVU -> Procedure",
    "input" : [{
      "name" : "proc",
      "mode" : "source"
    },
    {
      "name" : "carePlan",
      "type" : "CarePlan",
      "mode" : "target"
    },
    {
      "name" : "compSection",
      "mode" : "target"
    },
    {
      "name" : "bundle",
      "type" : "Bundle",
      "mode" : "target"
    },
    {
      "name" : "patient",
      "type" : "Patient",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "procedure",
      "source" : [{
        "context" : "proc"
      }],
      "target" : [{
        "context" : "bundle",
        "contextType" : "variable",
        "element" : "entry",
        "variable" : "procedureEntry"
      },
      {
        "context" : "procedureEntry",
        "contextType" : "variable",
        "element" : "resource",
        "variable" : "fhirProcedure",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Procedure"
        }]
      },
      {
        "context" : "fhirProcedure",
        "contextType" : "variable",
        "element" : "id",
        "transform" : "uuid"
      },
      {
        "context" : "procedureEntry",
        "contextType" : "variable",
        "element" : "fullUrl",
        "transform" : "evaluate",
        "parameter" : [{
          "valueString" : "'urn:uuid:' + %fhirProcedure.id"
        }]
      }],
      "dependent" : [{
        "name" : "PSPlanProcedure",
        "variable" : ["proc", "fhirProcedure", "carePlan", "compSection", "patient"]
      }]
    }]
  },
  {
    "name" : "PSPlanProcedure",
    "typeMode" : "none",
    "input" : [{
      "name" : "proc",
      "mode" : "source"
    },
    {
      "name" : "fhirProcedure",
      "type" : "Procedure",
      "mode" : "target"
    },
    {
      "name" : "carePlan",
      "type" : "CarePlan",
      "mode" : "target"
    },
    {
      "name" : "compSection",
      "mode" : "target"
    },
    {
      "name" : "patient",
      "type" : "Patient",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "statusDefault",
      "source" : [{
        "context" : "proc"
      }],
      "target" : [{
        "context" : "fhirProcedure",
        "contextType" : "variable",
        "element" : "status",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "preparation"
        }]
      }]
    },
    {
      "name" : "status",
      "source" : [{
        "context" : "proc",
        "element" : "statusCode",
        "variable" : "statusCode"
      }],
      "rule" : [{
        "name" : "active",
        "source" : [{
          "context" : "statusCode",
          "element" : "code",
          "variable" : "code",
          "condition" : "code = 'active'"
        }],
        "target" : [{
          "context" : "fhirProcedure",
          "contextType" : "variable",
          "element" : "status",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "preparation"
          }]
        }]
      },
      {
        "name" : "completed",
        "source" : [{
          "context" : "statusCode",
          "element" : "code",
          "variable" : "code",
          "condition" : "code = 'completed'"
        }],
        "target" : [{
          "context" : "fhirProcedure",
          "contextType" : "variable",
          "element" : "status",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "completed"
          }]
        }]
      },
      {
        "name" : "aborted",
        "source" : [{
          "context" : "statusCode",
          "element" : "code",
          "variable" : "code",
          "condition" : "code = 'aborted'"
        }],
        "target" : [{
          "context" : "fhirProcedure",
          "contextType" : "variable",
          "element" : "status",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "stopped"
          }]
        }]
      },
      {
        "name" : "cancelled",
        "source" : [{
          "context" : "statusCode",
          "element" : "code",
          "variable" : "code",
          "condition" : "code = 'cancelled'"
        }],
        "target" : [{
          "context" : "fhirProcedure",
          "contextType" : "variable",
          "element" : "status",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "stopped"
          }]
        }]
      },
      {
        "name" : "suspended",
        "source" : [{
          "context" : "statusCode",
          "element" : "code",
          "variable" : "code",
          "condition" : "code = 'suspended'"
        }],
        "target" : [{
          "context" : "fhirProcedure",
          "contextType" : "variable",
          "element" : "status",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "on-hold"
          }]
        }]
      }]
    },
    {
      "name" : "identifier",
      "source" : [{
        "context" : "proc",
        "element" : "id",
        "variable" : "id"
      }],
      "target" : [{
        "context" : "fhirProcedure",
        "contextType" : "variable",
        "element" : "identifier",
        "variable" : "identifier",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Identifier"
        }]
      }],
      "dependent" : [{
        "name" : "II",
        "variable" : ["id", "identifier"]
      }]
    },
    {
      "name" : "subject",
      "source" : [{
        "context" : "proc"
      }],
      "target" : [{
        "context" : "fhirProcedure",
        "contextType" : "variable",
        "element" : "subject",
        "variable" : "subjectRef",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Reference"
        }]
      },
      {
        "context" : "subjectRef",
        "contextType" : "variable",
        "element" : "reference",
        "transform" : "evaluate",
        "parameter" : [{
          "valueString" : "'urn:uuid:' + %patient.id"
        }]
      }]
    },
    {
      "name" : "code",
      "source" : [{
        "context" : "proc",
        "element" : "code",
        "variable" : "code"
      }],
      "target" : [{
        "context" : "fhirProcedure",
        "contextType" : "variable",
        "element" : "code",
        "variable" : "procedureCode",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "dependent" : [{
        "name" : "CDCodeableConcept",
        "variable" : ["code", "procedureCode"]
      }]
    },
    {
      "name" : "text",
      "source" : [{
        "context" : "proc",
        "element" : "text",
        "variable" : "text"
      }],
      "dependent" : [{
        "name" : "PSPlanTextToNote",
        "variable" : ["text", "fhirProcedure"]
      }]
    },
    {
      "name" : "comment",
      "source" : [{
        "context" : "proc",
        "element" : "entryRelationship",
        "variable" : "er"
      }],
      "dependent" : [{
        "name" : "PSPlanCommentToNote",
        "variable" : ["er", "fhirProcedure"]
      }]
    },
    {
      "name" : "performed",
      "source" : [{
        "context" : "proc",
        "element" : "effectiveTime",
        "variable" : "effectiveTime"
      }],
      "rule" : [{
        "name" : "dateTime",
        "source" : [{
          "context" : "effectiveTime",
          "element" : "value",
          "variable" : "value"
        }],
        "target" : [{
          "context" : "fhirProcedure",
          "contextType" : "variable",
          "element" : "performed",
          "variable" : "performedDateTime",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "dateTime"
          }]
        }],
        "dependent" : [{
          "name" : "TSDateTime",
          "variable" : ["effectiveTime", "performedDateTime"]
        }]
      },
      {
        "name" : "period",
        "source" : [{
          "context" : "effectiveTime",
          "element" : "low",
          "variable" : "low"
        }],
        "target" : [{
          "context" : "fhirProcedure",
          "contextType" : "variable",
          "element" : "performed",
          "variable" : "period",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Period"
          }]
        }],
        "rule" : [{
          "name" : "start",
          "source" : [{
            "context" : "low"
          }],
          "target" : [{
            "context" : "period",
            "contextType" : "variable",
            "element" : "start",
            "variable" : "start",
            "transform" : "create",
            "parameter" : [{
              "valueString" : "dateTime"
            }]
          }],
          "dependent" : [{
            "name" : "TSDateTime",
            "variable" : ["low", "start"]
          }]
        },
        {
          "name" : "end",
          "source" : [{
            "context" : "effectiveTime",
            "element" : "high",
            "variable" : "high"
          }],
          "target" : [{
            "context" : "period",
            "contextType" : "variable",
            "element" : "end",
            "variable" : "end",
            "transform" : "create",
            "parameter" : [{
              "valueString" : "dateTime"
            }]
          }],
          "dependent" : [{
            "name" : "TSDateTime",
            "variable" : ["high", "end"]
          }]
        }]
      }]
    },
    {
      "name" : "targetSite",
      "source" : [{
        "context" : "proc",
        "element" : "targetSiteCode",
        "variable" : "targetSiteCode"
      }],
      "target" : [{
        "context" : "fhirProcedure",
        "contextType" : "variable",
        "element" : "bodySite",
        "variable" : "bodySite",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "dependent" : [{
        "name" : "CDCodeableConcept",
        "variable" : ["targetSiteCode", "bodySite"]
      }]
    },
    {
      "name" : "approachSite",
      "source" : [{
        "context" : "proc",
        "element" : "approachSiteCode",
        "variable" : "approachSiteCode"
      }],
      "target" : [{
        "context" : "fhirProcedure",
        "contextType" : "variable",
        "element" : "bodySite",
        "variable" : "bodySite",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "dependent" : [{
        "name" : "CDCodeableConcept",
        "variable" : ["approachSiteCode", "bodySite"]
      }]
    },
    {
      "name" : "supportingInfo",
      "source" : [{
        "context" : "proc"
      }],
      "target" : [{
        "context" : "carePlan",
        "contextType" : "variable",
        "element" : "supportingInfo",
        "variable" : "supportRef",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Reference"
        }]
      },
      {
        "context" : "supportRef",
        "contextType" : "variable",
        "element" : "reference",
        "transform" : "evaluate",
        "parameter" : [{
          "valueString" : "'urn:uuid:' + %fhirProcedure.id"
        }]
      }]
    }]
  },
  {
    "name" : "PSPlanEncounterEntry",
    "typeMode" : "none",
    "documentation" : "RENCONTRE PRÉVUE -> Encounter",
    "input" : [{
      "name" : "enc",
      "mode" : "source"
    },
    {
      "name" : "carePlan",
      "type" : "CarePlan",
      "mode" : "target"
    },
    {
      "name" : "compSection",
      "mode" : "target"
    },
    {
      "name" : "bundle",
      "type" : "Bundle",
      "mode" : "target"
    },
    {
      "name" : "patient",
      "type" : "Patient",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "encounter",
      "source" : [{
        "context" : "enc"
      }],
      "target" : [{
        "context" : "bundle",
        "contextType" : "variable",
        "element" : "entry",
        "variable" : "encounterEntry"
      },
      {
        "context" : "encounterEntry",
        "contextType" : "variable",
        "element" : "resource",
        "variable" : "plannedEncounter",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Encounter"
        }]
      },
      {
        "context" : "plannedEncounter",
        "contextType" : "variable",
        "element" : "id",
        "transform" : "uuid"
      },
      {
        "context" : "encounterEntry",
        "contextType" : "variable",
        "element" : "fullUrl",
        "transform" : "evaluate",
        "parameter" : [{
          "valueString" : "'urn:uuid:' + %plannedEncounter.id"
        }]
      }],
      "dependent" : [{
        "name" : "PSPlanEncounter",
        "variable" : ["enc",
        "plannedEncounter",
        "carePlan",
        "compSection",
        "bundle",
        "patient"]
      }]
    }]
  },
  {
    "name" : "PSPlanEncounter",
    "typeMode" : "none",
    "input" : [{
      "name" : "enc",
      "mode" : "source"
    },
    {
      "name" : "plannedEncounter",
      "type" : "Encounter",
      "mode" : "target"
    },
    {
      "name" : "carePlan",
      "type" : "CarePlan",
      "mode" : "target"
    },
    {
      "name" : "compSection",
      "mode" : "target"
    },
    {
      "name" : "bundle",
      "type" : "Bundle",
      "mode" : "target"
    },
    {
      "name" : "patient",
      "type" : "Patient",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "statusDefault",
      "source" : [{
        "context" : "enc"
      }],
      "target" : [{
        "context" : "plannedEncounter",
        "contextType" : "variable",
        "element" : "status",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "planned"
        }]
      }]
    },
    {
      "name" : "status",
      "source" : [{
        "context" : "enc",
        "element" : "moodCode",
        "variable" : "moodCode"
      }],
      "rule" : [{
        "name" : "plannedARQ",
        "source" : [{
          "context" : "moodCode",
          "condition" : "moodCode = 'ARQ'"
        }],
        "target" : [{
          "context" : "plannedEncounter",
          "contextType" : "variable",
          "element" : "status",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "planned"
          }]
        }]
      },
      {
        "name" : "plannedINT",
        "source" : [{
          "context" : "moodCode",
          "condition" : "moodCode = 'INT'"
        }],
        "target" : [{
          "context" : "plannedEncounter",
          "contextType" : "variable",
          "element" : "status",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "planned"
          }]
        }]
      },
      {
        "name" : "finished",
        "source" : [{
          "context" : "moodCode",
          "condition" : "moodCode = 'EVN'"
        }],
        "target" : [{
          "context" : "plannedEncounter",
          "contextType" : "variable",
          "element" : "status",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "finished"
          }]
        }]
      }]
    },
    {
      "name" : "identifier",
      "source" : [{
        "context" : "enc",
        "element" : "id",
        "variable" : "id"
      }],
      "target" : [{
        "context" : "plannedEncounter",
        "contextType" : "variable",
        "element" : "identifier",
        "variable" : "identifier",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Identifier"
        }]
      }],
      "dependent" : [{
        "name" : "II",
        "variable" : ["id", "identifier"]
      }]
    },
    {
      "name" : "subject",
      "source" : [{
        "context" : "enc"
      }],
      "target" : [{
        "context" : "plannedEncounter",
        "contextType" : "variable",
        "element" : "subject",
        "variable" : "subjectRef",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Reference"
        }]
      },
      {
        "context" : "subjectRef",
        "contextType" : "variable",
        "element" : "reference",
        "transform" : "evaluate",
        "parameter" : [{
          "valueString" : "'urn:uuid:' + %patient.id"
        }]
      }]
    },
    {
      "name" : "class",
      "source" : [{
        "context" : "enc",
        "element" : "code",
        "variable" : "code"
      }],
      "target" : [{
        "context" : "plannedEncounter",
        "contextType" : "variable",
        "element" : "class",
        "variable" : "classCoding",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Coding"
        }]
      }],
      "dependent" : [{
        "name" : "CDCoding",
        "variable" : ["code", "classCoding"]
      }]
    },
    {
      "name" : "type",
      "source" : [{
        "context" : "enc",
        "element" : "code",
        "variable" : "code"
      }],
      "target" : [{
        "context" : "plannedEncounter",
        "contextType" : "variable",
        "element" : "type",
        "variable" : "encounterType",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "dependent" : [{
        "name" : "CDCodeableConcept",
        "variable" : ["code", "encounterType"]
      }]
    },
    {
      "name" : "period",
      "source" : [{
        "context" : "enc",
        "element" : "effectiveTime",
        "variable" : "effectiveTime"
      }],
      "rule" : [{
        "name" : "value",
        "source" : [{
          "context" : "effectiveTime",
          "element" : "value",
          "variable" : "value"
        }],
        "target" : [{
          "context" : "plannedEncounter",
          "contextType" : "variable",
          "element" : "period",
          "variable" : "period",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Period"
          }]
        }],
        "rule" : [{
          "name" : "start",
          "source" : [{
            "context" : "effectiveTime"
          }],
          "target" : [{
            "context" : "period",
            "contextType" : "variable",
            "element" : "start",
            "variable" : "start",
            "transform" : "create",
            "parameter" : [{
              "valueString" : "dateTime"
            }]
          }],
          "dependent" : [{
            "name" : "TSDateTime",
            "variable" : ["effectiveTime", "start"]
          }]
        }]
      },
      {
        "name" : "interval",
        "source" : [{
          "context" : "effectiveTime",
          "element" : "low",
          "variable" : "low"
        }],
        "target" : [{
          "context" : "plannedEncounter",
          "contextType" : "variable",
          "element" : "period",
          "variable" : "period",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Period"
          }]
        }],
        "rule" : [{
          "name" : "start",
          "source" : [{
            "context" : "low"
          }],
          "target" : [{
            "context" : "period",
            "contextType" : "variable",
            "element" : "start",
            "variable" : "start",
            "transform" : "create",
            "parameter" : [{
              "valueString" : "dateTime"
            }]
          }],
          "dependent" : [{
            "name" : "TSDateTime",
            "variable" : ["low", "start"]
          }]
        },
        {
          "name" : "end",
          "source" : [{
            "context" : "effectiveTime",
            "element" : "high",
            "variable" : "high"
          }],
          "target" : [{
            "context" : "period",
            "contextType" : "variable",
            "element" : "end",
            "variable" : "end",
            "transform" : "create",
            "parameter" : [{
              "valueString" : "dateTime"
            }]
          }],
          "dependent" : [{
            "name" : "TSDateTime",
            "variable" : ["high", "end"]
          }]
        }]
      }]
    },
    {
      "name" : "performer",
      "source" : [{
        "context" : "enc",
        "element" : "performer",
        "variable" : "performer"
      }],
      "dependent" : [{
        "name" : "PSPlanEncounterPerformer",
        "variable" : ["performer", "plannedEncounter", "bundle"]
      }]
    },
    {
      "name" : "location",
      "source" : [{
        "context" : "enc",
        "element" : "participant",
        "variable" : "participant"
      }],
      "dependent" : [{
        "name" : "PSPlanEncounterLocation",
        "variable" : ["participant", "plannedEncounter", "bundle"]
      }]
    },
    {
      "name" : "carePlanEncounter",
      "source" : [{
        "context" : "enc"
      }],
      "target" : [{
        "context" : "carePlan",
        "contextType" : "variable",
        "element" : "encounter",
        "variable" : "encounterRef",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Reference"
        }]
      },
      {
        "context" : "encounterRef",
        "contextType" : "variable",
        "element" : "reference",
        "transform" : "evaluate",
        "parameter" : [{
          "valueString" : "'urn:uuid:' + %plannedEncounter.id"
        }]
      }]
    }]
  },
  {
    "name" : "PSPlanEncounterPerformer",
    "typeMode" : "none",
    "input" : [{
      "name" : "performer",
      "mode" : "source"
    },
    {
      "name" : "plannedEncounter",
      "type" : "Encounter",
      "mode" : "target"
    },
    {
      "name" : "bundle",
      "type" : "Bundle",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "performer",
      "source" : [{
        "context" : "performer",
        "element" : "assignedEntity",
        "variable" : "assignedEntity"
      }],
      "target" : [{
        "context" : "bundle",
        "contextType" : "variable",
        "element" : "entry",
        "variable" : "practitionerEntry"
      },
      {
        "context" : "practitionerEntry",
        "contextType" : "variable",
        "element" : "resource",
        "variable" : "practitioner",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Practitioner"
        }]
      },
      {
        "context" : "practitioner",
        "contextType" : "variable",
        "element" : "id",
        "transform" : "uuid"
      },
      {
        "context" : "practitionerEntry",
        "contextType" : "variable",
        "element" : "fullUrl",
        "transform" : "evaluate",
        "parameter" : [{
          "valueString" : "'urn:uuid:' + %practitioner.id"
        }]
      }],
      "rule" : [{
        "name" : "practitionerBase",
        "source" : [{
          "context" : "assignedEntity"
        }],
        "dependent" : [{
          "name" : "MapCDAAssignedEntityToPractitioner",
          "variable" : ["assignedEntity", "practitioner"]
        }]
      },
      {
        "name" : "practitionerFR",
        "source" : [{
          "context" : "assignedEntity"
        }],
        "dependent" : [{
          "name" : "MapCDAAssignedEntityToFrenchPractitioner",
          "variable" : ["assignedEntity", "practitioner"]
        }]
      },
      {
        "name" : "withOrganization",
        "source" : [{
          "context" : "assignedEntity",
          "element" : "representedOrganization",
          "variable" : "representedOrganization"
        }],
        "target" : [{
          "context" : "bundle",
          "contextType" : "variable",
          "element" : "entry",
          "variable" : "organizationEntry"
        },
        {
          "context" : "organizationEntry",
          "contextType" : "variable",
          "element" : "resource",
          "variable" : "organization",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Organization"
          }]
        },
        {
          "context" : "organization",
          "contextType" : "variable",
          "element" : "id",
          "transform" : "uuid"
        },
        {
          "context" : "organizationEntry",
          "contextType" : "variable",
          "element" : "fullUrl",
          "transform" : "evaluate",
          "parameter" : [{
            "valueString" : "'urn:uuid:' + %organization.id"
          }]
        },
        {
          "context" : "bundle",
          "contextType" : "variable",
          "element" : "entry",
          "variable" : "roleEntry"
        },
        {
          "context" : "roleEntry",
          "contextType" : "variable",
          "element" : "resource",
          "variable" : "practitionerRole",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "PractitionerRole"
          }]
        },
        {
          "context" : "practitionerRole",
          "contextType" : "variable",
          "element" : "id",
          "transform" : "uuid"
        },
        {
          "context" : "roleEntry",
          "contextType" : "variable",
          "element" : "fullUrl",
          "transform" : "evaluate",
          "parameter" : [{
            "valueString" : "'urn:uuid:' + %practitionerRole.id"
          }]
        }],
        "rule" : [{
          "name" : "organizationBase",
          "source" : [{
            "context" : "representedOrganization"
          }],
          "dependent" : [{
            "name" : "MapCDAOrganizationToOrganization",
            "variable" : ["representedOrganization", "organization"]
          }]
        },
        {
          "name" : "organizationFR",
          "source" : [{
            "context" : "representedOrganization"
          }],
          "dependent" : [{
            "name" : "MapCDAOrganizationToFrenchOrganization",
            "variable" : ["representedOrganization", "organization"]
          }]
        },
        {
          "name" : "roleBase",
          "source" : [{
            "context" : "assignedEntity"
          }],
          "dependent" : [{
            "name" : "MapCDAAssignedEntityToPractitionerRole",
            "variable" : ["assignedEntity",
            "practitionerRole",
            "practitioner",
            "organization"]
          }]
        },
        {
          "name" : "roleFR",
          "source" : [{
            "context" : "assignedEntity"
          }],
          "dependent" : [{
            "name" : "MapCDAAssignedEntityToFrenchPractitionerRole",
            "variable" : ["assignedEntity",
            "practitionerRole",
            "practitioner",
            "organization"]
          }]
        },
        {
          "name" : "participantRole",
          "source" : [{
            "context" : "assignedEntity"
          }],
          "target" : [{
            "context" : "plannedEncounter",
            "contextType" : "variable",
            "element" : "participant",
            "variable" : "participant"
          }],
          "rule" : [{
            "name" : "roleRef",
            "source" : [{
              "context" : "assignedEntity"
            }],
            "target" : [{
              "context" : "participant",
              "contextType" : "variable",
              "element" : "individual",
              "variable" : "individualRef",
              "transform" : "create",
              "parameter" : [{
                "valueString" : "Reference"
              }]
            },
            {
              "context" : "individualRef",
              "contextType" : "variable",
              "element" : "reference",
              "transform" : "evaluate",
              "parameter" : [{
                "valueString" : "'urn:uuid:' + %practitionerRole.id"
              }]
            }]
          }]
        }]
      },
      {
        "name" : "participantPractitioner",
        "source" : [{
          "context" : "assignedEntity",
          "condition" : "assignedEntity.representedOrganization.empty()"
        }],
        "target" : [{
          "context" : "plannedEncounter",
          "contextType" : "variable",
          "element" : "participant",
          "variable" : "participant"
        }],
        "rule" : [{
          "name" : "practitionerRef",
          "source" : [{
            "context" : "assignedEntity"
          }],
          "target" : [{
            "context" : "participant",
            "contextType" : "variable",
            "element" : "individual",
            "variable" : "individualRef",
            "transform" : "create",
            "parameter" : [{
              "valueString" : "Reference"
            }]
          },
          {
            "context" : "individualRef",
            "contextType" : "variable",
            "element" : "reference",
            "transform" : "evaluate",
            "parameter" : [{
              "valueString" : "'urn:uuid:' + %practitioner.id"
            }]
          }]
        }]
      }]
    }]
  },
  {
    "name" : "PSPlanEncounterLocation",
    "typeMode" : "none",
    "input" : [{
      "name" : "participant",
      "mode" : "source"
    },
    {
      "name" : "plannedEncounter",
      "type" : "Encounter",
      "mode" : "target"
    },
    {
      "name" : "bundle",
      "type" : "Bundle",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "location",
      "source" : [{
        "context" : "participant",
        "element" : "participantRole",
        "variable" : "participantRole",
        "condition" : "participant.typeCode = 'LOC'"
      }],
      "target" : [{
        "context" : "bundle",
        "contextType" : "variable",
        "element" : "entry",
        "variable" : "locationEntry"
      },
      {
        "context" : "locationEntry",
        "contextType" : "variable",
        "element" : "resource",
        "variable" : "location",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Location"
        }]
      },
      {
        "context" : "location",
        "contextType" : "variable",
        "element" : "id",
        "transform" : "uuid"
      },
      {
        "context" : "locationEntry",
        "contextType" : "variable",
        "element" : "fullUrl",
        "transform" : "evaluate",
        "parameter" : [{
          "valueString" : "'urn:uuid:' + %location.id"
        }]
      }],
      "rule" : [{
        "name" : "identifier",
        "source" : [{
          "context" : "participantRole",
          "element" : "id",
          "variable" : "id"
        }],
        "target" : [{
          "context" : "location",
          "contextType" : "variable",
          "element" : "identifier",
          "variable" : "identifier",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Identifier"
          }]
        }],
        "dependent" : [{
          "name" : "II",
          "variable" : ["id", "identifier"]
        }]
      },
      {
        "name" : "type",
        "source" : [{
          "context" : "participantRole",
          "element" : "code",
          "variable" : "code"
        }],
        "target" : [{
          "context" : "location",
          "contextType" : "variable",
          "element" : "type",
          "variable" : "locationType",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "CodeableConcept"
          }]
        }],
        "dependent" : [{
          "name" : "CDCodeableConcept",
          "variable" : ["code", "locationType"]
        }]
      },
      {
        "name" : "address",
        "source" : [{
          "context" : "participantRole",
          "element" : "addr",
          "variable" : "addr"
        }],
        "target" : [{
          "context" : "location",
          "contextType" : "variable",
          "element" : "address",
          "variable" : "address",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Address"
          }]
        }],
        "dependent" : [{
          "name" : "ADAddress",
          "variable" : ["addr", "address"]
        }]
      },
      {
        "name" : "telecom",
        "source" : [{
          "context" : "participantRole",
          "element" : "telecom",
          "variable" : "telecom"
        }],
        "target" : [{
          "context" : "location",
          "contextType" : "variable",
          "element" : "telecom",
          "variable" : "contactPoint",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "ContactPoint"
          }]
        }],
        "dependent" : [{
          "name" : "TELContactPoint",
          "variable" : ["telecom", "contactPoint"]
        }]
      },
      {
        "name" : "playingEntity",
        "source" : [{
          "context" : "participantRole",
          "element" : "playingEntity",
          "variable" : "playingEntity"
        }],
        "rule" : [{
          "name" : "name",
          "source" : [{
            "context" : "playingEntity",
            "element" : "name",
            "variable" : "name"
          }],
          "target" : [{
            "context" : "location",
            "contextType" : "variable",
            "element" : "name",
            "transform" : "evaluate",
            "parameter" : [{
              "valueString" : "name.xmlText"
            }]
          }]
        }]
      },
      {
        "name" : "encounterLocation",
        "source" : [{
          "context" : "participantRole"
        }],
        "target" : [{
          "context" : "plannedEncounter",
          "contextType" : "variable",
          "element" : "location",
          "variable" : "encounterLocation"
        }],
        "rule" : [{
          "name" : "locationRef",
          "source" : [{
            "context" : "participantRole"
          }],
          "target" : [{
            "context" : "encounterLocation",
            "contextType" : "variable",
            "element" : "location",
            "variable" : "locationRef",
            "transform" : "create",
            "parameter" : [{
              "valueString" : "Reference"
            }]
          },
          {
            "context" : "locationRef",
            "contextType" : "variable",
            "element" : "reference",
            "transform" : "evaluate",
            "parameter" : [{
              "valueString" : "'urn:uuid:' + %location.id"
            }]
          }]
        }]
      }]
    }]
  },
  {
    "name" : "PSPlanImmunizationRecommendationEntry",
    "typeMode" : "none",
    "documentation" : "VACCIN RECOMMANDÉ -> ImmunizationRecommendation",
    "input" : [{
      "name" : "sa",
      "mode" : "source"
    },
    {
      "name" : "carePlan",
      "type" : "CarePlan",
      "mode" : "target"
    },
    {
      "name" : "compSection",
      "mode" : "target"
    },
    {
      "name" : "bundle",
      "type" : "Bundle",
      "mode" : "target"
    },
    {
      "name" : "patient",
      "type" : "Patient",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "recommendation",
      "source" : [{
        "context" : "sa"
      }],
      "target" : [{
        "context" : "bundle",
        "contextType" : "variable",
        "element" : "entry",
        "variable" : "recommendationEntry"
      },
      {
        "context" : "recommendationEntry",
        "contextType" : "variable",
        "element" : "resource",
        "variable" : "recommendation",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "ImmunizationRecommendation"
        }]
      },
      {
        "context" : "recommendation",
        "contextType" : "variable",
        "element" : "id",
        "transform" : "uuid"
      },
      {
        "context" : "recommendationEntry",
        "contextType" : "variable",
        "element" : "fullUrl",
        "transform" : "evaluate",
        "parameter" : [{
          "valueString" : "'urn:uuid:' + %recommendation.id"
        }]
      }],
      "dependent" : [{
        "name" : "PSPlanImmunizationRecommendation",
        "variable" : ["sa", "recommendation", "carePlan", "compSection", "patient"]
      }]
    }]
  },
  {
    "name" : "PSPlanImmunizationRecommendation",
    "typeMode" : "none",
    "input" : [{
      "name" : "sa",
      "mode" : "source"
    },
    {
      "name" : "recommendation",
      "type" : "ImmunizationRecommendation",
      "mode" : "target"
    },
    {
      "name" : "carePlan",
      "type" : "CarePlan",
      "mode" : "target"
    },
    {
      "name" : "compSection",
      "mode" : "target"
    },
    {
      "name" : "patient",
      "type" : "Patient",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "identifier",
      "source" : [{
        "context" : "sa",
        "element" : "id",
        "variable" : "id"
      }],
      "target" : [{
        "context" : "recommendation",
        "contextType" : "variable",
        "element" : "identifier",
        "variable" : "identifier",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Identifier"
        }]
      }],
      "dependent" : [{
        "name" : "II",
        "variable" : ["id", "identifier"]
      }]
    },
    {
      "name" : "patient",
      "source" : [{
        "context" : "sa"
      }],
      "target" : [{
        "context" : "recommendation",
        "contextType" : "variable",
        "element" : "patient",
        "variable" : "patientRef",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Reference"
        }]
      },
      {
        "context" : "patientRef",
        "contextType" : "variable",
        "element" : "reference",
        "transform" : "evaluate",
        "parameter" : [{
          "valueString" : "'urn:uuid:' + %patient.id"
        }]
      }]
    },
    {
      "name" : "recommendationDate",
      "source" : [{
        "context" : "sa",
        "element" : "effectiveTime",
        "variable" : "effectiveTime"
      }],
      "rule" : [{
        "name" : "dateValue",
        "source" : [{
          "context" : "effectiveTime",
          "element" : "value",
          "variable" : "value"
        }],
        "target" : [{
          "context" : "recommendation",
          "contextType" : "variable",
          "element" : "date",
          "variable" : "recommendationDate",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "dateTime"
          }]
        }],
        "dependent" : [{
          "name" : "TSDateTime",
          "variable" : ["effectiveTime", "recommendationDate"]
        }]
      },
      {
        "name" : "dateLow",
        "source" : [{
          "context" : "effectiveTime",
          "element" : "low",
          "variable" : "low",
          "condition" : "effectiveTime.value.empty()"
        }],
        "target" : [{
          "context" : "recommendation",
          "contextType" : "variable",
          "element" : "date",
          "variable" : "recommendationDate",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "dateTime"
          }]
        }],
        "dependent" : [{
          "name" : "TSDateTime",
          "variable" : ["low", "recommendationDate"]
        }]
      },
      {
        "name" : "dateHigh",
        "source" : [{
          "context" : "effectiveTime",
          "element" : "high",
          "variable" : "high",
          "condition" : "effectiveTime.value.empty() and effectiveTime.low.empty()"
        }],
        "target" : [{
          "context" : "recommendation",
          "contextType" : "variable",
          "element" : "date",
          "variable" : "recommendationDate",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "dateTime"
          }]
        }],
        "dependent" : [{
          "name" : "TSDateTime",
          "variable" : ["high", "recommendationDate"]
        }]
      },
      {
        "name" : "datePresentWithoutValue",
        "source" : [{
          "context" : "effectiveTime",
          "condition" : "effectiveTime.value.empty() and effectiveTime.low.empty() and effectiveTime.high.empty()"
        }],
        "target" : [{
          "context" : "recommendation",
          "contextType" : "variable",
          "element" : "date",
          "variable" : "recommendationDate",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "dateTime"
          }]
        }],
        "rule" : [{
          "name" : "dataAbsentReason",
          "source" : [{
            "context" : "effectiveTime"
          }],
          "target" : [{
            "context" : "recommendationDate",
            "contextType" : "variable",
            "element" : "extension",
            "variable" : "absentReason",
            "transform" : "create",
            "parameter" : [{
              "valueString" : "Extension"
            }]
          }],
          "rule" : [{
            "name" : "url",
            "source" : [{
              "context" : "effectiveTime"
            }],
            "target" : [{
              "context" : "absentReason",
              "contextType" : "variable",
              "element" : "url",
              "transform" : "copy",
              "parameter" : [{
                "valueString" : "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
              }]
            }]
          },
          {
            "name" : "valueCode",
            "source" : [{
              "context" : "effectiveTime"
            }],
            "target" : [{
              "context" : "absentReason",
              "contextType" : "variable",
              "element" : "value",
              "transform" : "cast",
              "parameter" : [{
                "valueString" : "unknown"
              },
              {
                "valueString" : "code"
              }]
            }]
          }]
        }]
      }]
    },
    {
      "name" : "recommendationDateAbsentReason",
      "source" : [{
        "context" : "sa",
        "condition" : "sa.effectiveTime.empty()"
      }],
      "target" : [{
        "context" : "recommendation",
        "contextType" : "variable",
        "element" : "date",
        "variable" : "recommendationDate",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "dateTime"
        }]
      }],
      "rule" : [{
        "name" : "dataAbsentReason",
        "source" : [{
          "context" : "sa"
        }],
        "target" : [{
          "context" : "recommendationDate",
          "contextType" : "variable",
          "element" : "extension",
          "variable" : "absentReason",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Extension"
          }]
        }],
        "rule" : [{
          "name" : "url",
          "source" : [{
            "context" : "sa"
          }],
          "target" : [{
            "context" : "absentReason",
            "contextType" : "variable",
            "element" : "url",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
            }]
          }]
        },
        {
          "name" : "valueCode",
          "source" : [{
            "context" : "sa"
          }],
          "target" : [{
            "context" : "absentReason",
            "contextType" : "variable",
            "element" : "value",
            "transform" : "cast",
            "parameter" : [{
              "valueString" : "unknown"
            },
            {
              "valueString" : "code"
            }]
          }]
        }]
      }]
    },
    {
      "name" : "recommendation",
      "source" : [{
        "context" : "sa"
      }],
      "target" : [{
        "context" : "recommendation",
        "contextType" : "variable",
        "element" : "recommendation",
        "variable" : "rec"
      }],
      "rule" : [{
        "name" : "forecastStatus",
        "source" : [{
          "context" : "sa",
          "element" : "statusCode",
          "variable" : "statusCode"
        }],
        "rule" : [{
          "name" : "active",
          "source" : [{
            "context" : "statusCode",
            "element" : "code",
            "variable" : "code",
            "condition" : "code = 'active'"
          }],
          "target" : [{
            "context" : "rec",
            "contextType" : "variable",
            "element" : "forecastStatus",
            "variable" : "forecastStatus",
            "transform" : "create",
            "parameter" : [{
              "valueString" : "CodeableConcept"
            }]
          }],
          "rule" : [{
            "name" : "coding",
            "source" : [{
              "context" : "statusCode"
            }],
            "target" : [{
              "context" : "forecastStatus",
              "contextType" : "variable",
              "element" : "coding",
              "variable" : "coding",
              "transform" : "create",
              "parameter" : [{
                "valueString" : "Coding"
              }]
            }],
            "rule" : [{
              "name" : "system",
              "source" : [{
                "context" : "statusCode"
              }],
              "target" : [{
                "context" : "coding",
                "contextType" : "variable",
                "element" : "system",
                "transform" : "copy",
                "parameter" : [{
                  "valueString" : "http://terminology.hl7.org/CodeSystem/immunization-recommendation-status"
                }]
              }]
            },
            {
              "name" : "code",
              "source" : [{
                "context" : "statusCode"
              }],
              "target" : [{
                "context" : "coding",
                "contextType" : "variable",
                "element" : "code",
                "transform" : "copy",
                "parameter" : [{
                  "valueString" : "due"
                }]
              }]
            },
            {
              "name" : "display",
              "source" : [{
                "context" : "statusCode"
              }],
              "target" : [{
                "context" : "coding",
                "contextType" : "variable",
                "element" : "display",
                "transform" : "copy",
                "parameter" : [{
                  "valueString" : "Due"
                }]
              }]
            }]
          }]
        },
        {
          "name" : "completed",
          "source" : [{
            "context" : "statusCode",
            "element" : "code",
            "variable" : "code",
            "condition" : "code = 'completed'"
          }],
          "target" : [{
            "context" : "rec",
            "contextType" : "variable",
            "element" : "forecastStatus",
            "variable" : "forecastStatus",
            "transform" : "create",
            "parameter" : [{
              "valueString" : "CodeableConcept"
            }]
          }],
          "rule" : [{
            "name" : "coding",
            "source" : [{
              "context" : "statusCode"
            }],
            "target" : [{
              "context" : "forecastStatus",
              "contextType" : "variable",
              "element" : "coding",
              "variable" : "coding",
              "transform" : "create",
              "parameter" : [{
                "valueString" : "Coding"
              }]
            }],
            "rule" : [{
              "name" : "system",
              "source" : [{
                "context" : "statusCode"
              }],
              "target" : [{
                "context" : "coding",
                "contextType" : "variable",
                "element" : "system",
                "transform" : "copy",
                "parameter" : [{
                  "valueString" : "http://terminology.hl7.org/CodeSystem/immunization-recommendation-status"
                }]
              }]
            },
            {
              "name" : "code",
              "source" : [{
                "context" : "statusCode"
              }],
              "target" : [{
                "context" : "coding",
                "contextType" : "variable",
                "element" : "code",
                "transform" : "copy",
                "parameter" : [{
                  "valueString" : "complete"
                }]
              }]
            },
            {
              "name" : "display",
              "source" : [{
                "context" : "statusCode"
              }],
              "target" : [{
                "context" : "coding",
                "contextType" : "variable",
                "element" : "display",
                "transform" : "copy",
                "parameter" : [{
                  "valueString" : "Complete"
                }]
              }]
            }]
          }]
        },
        {
          "name" : "unknown",
          "source" : [{
            "context" : "statusCode",
            "element" : "code",
            "variable" : "code",
            "condition" : "(code != 'active') and (code != 'completed')"
          }],
          "target" : [{
            "context" : "rec",
            "contextType" : "variable",
            "element" : "forecastStatus",
            "variable" : "forecastStatus",
            "transform" : "create",
            "parameter" : [{
              "valueString" : "CodeableConcept"
            }]
          }],
          "dependent" : [{
            "name" : "PSPlanCodeableConceptAbsentReason",
            "variable" : ["statusCode", "forecastStatus"]
          }]
        }]
      },
      {
        "name" : "forecastStatusAbsent",
        "source" : [{
          "context" : "sa",
          "condition" : "sa.statusCode.empty()"
        }],
        "target" : [{
          "context" : "rec",
          "contextType" : "variable",
          "element" : "forecastStatus",
          "variable" : "forecastStatus",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "CodeableConcept"
          }]
        }],
        "dependent" : [{
          "name" : "PSPlanCodeableConceptAbsentReason",
          "variable" : ["sa", "forecastStatus"]
        }]
      },
      {
        "name" : "vaccineActCode",
        "source" : [{
          "context" : "sa",
          "element" : "code",
          "variable" : "code"
        }],
        "target" : [{
          "context" : "rec",
          "contextType" : "variable",
          "element" : "vaccineCode",
          "variable" : "vaccineActCode",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "CodeableConcept"
          }]
        }],
        "dependent" : [{
          "name" : "CDCodeableConcept",
          "variable" : ["code", "vaccineActCode"]
        }]
      },
      {
        "name" : "vaccineProduct",
        "source" : [{
          "context" : "sa",
          "element" : "consumable",
          "variable" : "consumable"
        }],
        "rule" : [{
          "name" : "manufacturedProduct",
          "source" : [{
            "context" : "consumable",
            "element" : "manufacturedProduct",
            "variable" : "manufacturedProduct"
          }],
          "rule" : [{
            "name" : "material",
            "source" : [{
              "context" : "manufacturedProduct",
              "element" : "manufacturedMaterial",
              "variable" : "material"
            }],
            "rule" : [{
              "name" : "vaccineCode",
              "source" : [{
                "context" : "material",
                "element" : "code",
                "variable" : "code"
              }],
              "target" : [{
                "context" : "rec",
                "contextType" : "variable",
                "element" : "vaccineCode",
                "variable" : "vaccineCode",
                "transform" : "create",
                "parameter" : [{
                  "valueString" : "CodeableConcept"
                }]
              }],
              "dependent" : [{
                "name" : "CDCodeableConcept",
                "variable" : ["code", "vaccineCode"]
              }]
            }]
          }]
        }]
      },
      {
        "name" : "dateCriterion",
        "source" : [{
          "context" : "sa",
          "element" : "effectiveTime",
          "variable" : "effectiveTime"
        }],
        "rule" : [{
          "name" : "dateValue",
          "source" : [{
            "context" : "effectiveTime",
            "element" : "value",
            "variable" : "value"
          }],
          "target" : [{
            "context" : "rec",
            "contextType" : "variable",
            "element" : "dateCriterion",
            "variable" : "dateCriterion"
          }],
          "rule" : [{
            "name" : "code",
            "source" : [{
              "context" : "effectiveTime"
            }],
            "target" : [{
              "context" : "dateCriterion",
              "contextType" : "variable",
              "element" : "code",
              "variable" : "criterionCode",
              "transform" : "create",
              "parameter" : [{
                "valueString" : "CodeableConcept"
              }]
            }],
            "rule" : [{
              "name" : "coding",
              "source" : [{
                "context" : "effectiveTime"
              }],
              "target" : [{
                "context" : "criterionCode",
                "contextType" : "variable",
                "element" : "coding",
                "variable" : "coding",
                "transform" : "create",
                "parameter" : [{
                  "valueString" : "Coding"
                }]
              }],
              "rule" : [{
                "name" : "system",
                "source" : [{
                  "context" : "effectiveTime"
                }],
                "target" : [{
                  "context" : "coding",
                  "contextType" : "variable",
                  "element" : "system",
                  "transform" : "copy",
                  "parameter" : [{
                    "valueString" : "http://terminology.hl7.org/CodeSystem/immunization-recommendation-date-criterion"
                  }]
                }]
              },
              {
                "name" : "code",
                "source" : [{
                  "context" : "effectiveTime"
                }],
                "target" : [{
                  "context" : "coding",
                  "contextType" : "variable",
                  "element" : "code",
                  "transform" : "copy",
                  "parameter" : [{
                    "valueString" : "due"
                  }]
                }]
              },
              {
                "name" : "display",
                "source" : [{
                  "context" : "effectiveTime"
                }],
                "target" : [{
                  "context" : "coding",
                  "contextType" : "variable",
                  "element" : "display",
                  "transform" : "copy",
                  "parameter" : [{
                    "valueString" : "Due Date"
                  }]
                }]
              }]
            }]
          },
          {
            "name" : "value",
            "source" : [{
              "context" : "effectiveTime"
            }],
            "target" : [{
              "context" : "dateCriterion",
              "contextType" : "variable",
              "element" : "value",
              "variable" : "dateValue",
              "transform" : "create",
              "parameter" : [{
                "valueString" : "dateTime"
              }]
            }],
            "dependent" : [{
              "name" : "TSDateTime",
              "variable" : ["effectiveTime", "dateValue"]
            }]
          }]
        },
        {
          "name" : "dateLow",
          "source" : [{
            "context" : "effectiveTime",
            "element" : "low",
            "variable" : "low"
          }],
          "target" : [{
            "context" : "rec",
            "contextType" : "variable",
            "element" : "dateCriterion",
            "variable" : "dateCriterion"
          }],
          "rule" : [{
            "name" : "code",
            "source" : [{
              "context" : "low"
            }],
            "target" : [{
              "context" : "dateCriterion",
              "contextType" : "variable",
              "element" : "code",
              "variable" : "criterionCode",
              "transform" : "create",
              "parameter" : [{
                "valueString" : "CodeableConcept"
              }]
            }],
            "rule" : [{
              "name" : "coding",
              "source" : [{
                "context" : "low"
              }],
              "target" : [{
                "context" : "criterionCode",
                "contextType" : "variable",
                "element" : "coding",
                "variable" : "coding",
                "transform" : "create",
                "parameter" : [{
                  "valueString" : "Coding"
                }]
              }],
              "rule" : [{
                "name" : "system",
                "source" : [{
                  "context" : "low"
                }],
                "target" : [{
                  "context" : "coding",
                  "contextType" : "variable",
                  "element" : "system",
                  "transform" : "copy",
                  "parameter" : [{
                    "valueString" : "http://terminology.hl7.org/CodeSystem/immunization-recommendation-date-criterion"
                  }]
                }]
              },
              {
                "name" : "code",
                "source" : [{
                  "context" : "low"
                }],
                "target" : [{
                  "context" : "coding",
                  "contextType" : "variable",
                  "element" : "code",
                  "transform" : "copy",
                  "parameter" : [{
                    "valueString" : "earliest"
                  }]
                }]
              },
              {
                "name" : "display",
                "source" : [{
                  "context" : "low"
                }],
                "target" : [{
                  "context" : "coding",
                  "contextType" : "variable",
                  "element" : "display",
                  "transform" : "copy",
                  "parameter" : [{
                    "valueString" : "Earliest Date"
                  }]
                }]
              }]
            }]
          },
          {
            "name" : "value",
            "source" : [{
              "context" : "low"
            }],
            "target" : [{
              "context" : "dateCriterion",
              "contextType" : "variable",
              "element" : "value",
              "variable" : "dateValue",
              "transform" : "create",
              "parameter" : [{
                "valueString" : "dateTime"
              }]
            }],
            "dependent" : [{
              "name" : "TSDateTime",
              "variable" : ["low", "dateValue"]
            }]
          }]
        },
        {
          "name" : "dateHigh",
          "source" : [{
            "context" : "effectiveTime",
            "element" : "high",
            "variable" : "high"
          }],
          "target" : [{
            "context" : "rec",
            "contextType" : "variable",
            "element" : "dateCriterion",
            "variable" : "dateCriterion"
          }],
          "rule" : [{
            "name" : "code",
            "source" : [{
              "context" : "high"
            }],
            "target" : [{
              "context" : "dateCriterion",
              "contextType" : "variable",
              "element" : "code",
              "variable" : "criterionCode",
              "transform" : "create",
              "parameter" : [{
                "valueString" : "CodeableConcept"
              }]
            }],
            "rule" : [{
              "name" : "coding",
              "source" : [{
                "context" : "high"
              }],
              "target" : [{
                "context" : "criterionCode",
                "contextType" : "variable",
                "element" : "coding",
                "variable" : "coding",
                "transform" : "create",
                "parameter" : [{
                  "valueString" : "Coding"
                }]
              }],
              "rule" : [{
                "name" : "system",
                "source" : [{
                  "context" : "high"
                }],
                "target" : [{
                  "context" : "coding",
                  "contextType" : "variable",
                  "element" : "system",
                  "transform" : "copy",
                  "parameter" : [{
                    "valueString" : "http://terminology.hl7.org/CodeSystem/immunization-recommendation-date-criterion"
                  }]
                }]
              },
              {
                "name" : "code",
                "source" : [{
                  "context" : "high"
                }],
                "target" : [{
                  "context" : "coding",
                  "contextType" : "variable",
                  "element" : "code",
                  "transform" : "copy",
                  "parameter" : [{
                    "valueString" : "latest"
                  }]
                }]
              },
              {
                "name" : "display",
                "source" : [{
                  "context" : "high"
                }],
                "target" : [{
                  "context" : "coding",
                  "contextType" : "variable",
                  "element" : "display",
                  "transform" : "copy",
                  "parameter" : [{
                    "valueString" : "Latest Date"
                  }]
                }]
              }]
            }]
          },
          {
            "name" : "value",
            "source" : [{
              "context" : "high"
            }],
            "target" : [{
              "context" : "dateCriterion",
              "contextType" : "variable",
              "element" : "value",
              "variable" : "dateValue",
              "transform" : "create",
              "parameter" : [{
                "valueString" : "dateTime"
              }]
            }],
            "dependent" : [{
              "name" : "TSDateTime",
              "variable" : ["high", "dateValue"]
            }]
          }]
        }]
      },
      {
        "name" : "comment",
        "source" : [{
          "context" : "sa",
          "element" : "entryRelationship",
          "variable" : "er"
        }],
        "dependent" : [{
          "name" : "PSPlanCommentToRecommendationDescription",
          "variable" : ["er", "rec"]
        }]
      }]
    },
    {
      "name" : "supportingInfo",
      "source" : [{
        "context" : "sa"
      }],
      "target" : [{
        "context" : "carePlan",
        "contextType" : "variable",
        "element" : "supportingInfo",
        "variable" : "supportRef",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Reference"
        }]
      },
      {
        "context" : "supportRef",
        "contextType" : "variable",
        "element" : "reference",
        "transform" : "evaluate",
        "parameter" : [{
          "valueString" : "'urn:uuid:' + %recommendation.id"
        }]
      }]
    }]
  },
  {
    "name" : "PSPlanTextToNote",
    "typeMode" : "none",
    "documentation" : "TEXTES, COMMENTAIRES ET ABSENCE DE DONNÉES",
    "input" : [{
      "name" : "text",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "reference",
      "source" : [{
        "context" : "text",
        "element" : "reference",
        "variable" : "reference"
      }],
      "rule" : [{
        "name" : "reference",
        "source" : [{
          "context" : "reference",
          "element" : "value",
          "variable" : "value"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "note",
          "variable" : "note",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Annotation"
          }]
        },
        {
          "context" : "note",
          "contextType" : "variable",
          "element" : "text",
          "transform" : "cast",
          "parameter" : [{
            "valueId" : "value"
          },
          {
            "valueString" : "string"
          }]
        }]
      }]
    },
    {
      "name" : "xmlText",
      "source" : [{
        "context" : "text",
        "element" : "xmlText",
        "variable" : "xml",
        "condition" : "text.reference.empty()"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "note",
        "variable" : "note",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Annotation"
        }]
      },
      {
        "context" : "note",
        "contextType" : "variable",
        "element" : "text",
        "transform" : "cast",
        "parameter" : [{
          "valueId" : "xml"
        },
        {
          "valueString" : "string"
        }]
      }]
    }]
  },
  {
    "name" : "PSPlanCommentToNote",
    "typeMode" : "none",
    "input" : [{
      "name" : "er",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "act",
      "source" : [{
        "context" : "er",
        "element" : "act",
        "variable" : "act",
        "condition" : "er.typeCode = 'SUBJ'"
      }],
      "rule" : [{
        "name" : "template",
        "source" : [{
          "context" : "act",
          "element" : "templateId",
          "variable" : "tid"
        }],
        "rule" : [{
          "name" : "comment",
          "source" : [{
            "context" : "tid",
            "element" : "root",
            "variable" : "root",
            "condition" : "root = '1.2.250.1.213.1.1.3.32'"
          }],
          "rule" : [{
            "name" : "note",
            "source" : [{
              "context" : "act",
              "element" : "text",
              "variable" : "text"
            }],
            "dependent" : [{
              "name" : "PSPlanTextToNote",
              "variable" : ["text", "tgt"]
            }]
          }]
        }]
      }]
    }]
  },
  {
    "name" : "PSPlanTextToRecommendationDescription",
    "typeMode" : "none",
    "input" : [{
      "name" : "text",
      "mode" : "source"
    },
    {
      "name" : "rec",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "reference",
      "source" : [{
        "context" : "text",
        "element" : "reference",
        "variable" : "reference"
      }],
      "rule" : [{
        "name" : "reference",
        "source" : [{
          "context" : "reference",
          "element" : "value",
          "variable" : "value"
        }],
        "target" : [{
          "context" : "rec",
          "contextType" : "variable",
          "element" : "description",
          "transform" : "cast",
          "parameter" : [{
            "valueId" : "value"
          },
          {
            "valueString" : "string"
          }]
        }]
      }]
    },
    {
      "name" : "xmlText",
      "source" : [{
        "context" : "text",
        "element" : "xmlText",
        "variable" : "xml",
        "condition" : "text.reference.empty()"
      }],
      "target" : [{
        "context" : "rec",
        "contextType" : "variable",
        "element" : "description",
        "transform" : "cast",
        "parameter" : [{
          "valueId" : "xml"
        },
        {
          "valueString" : "string"
        }]
      }]
    }]
  },
  {
    "name" : "PSPlanCommentToRecommendationDescription",
    "typeMode" : "none",
    "input" : [{
      "name" : "er",
      "mode" : "source"
    },
    {
      "name" : "rec",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "act",
      "source" : [{
        "context" : "er",
        "element" : "act",
        "variable" : "act",
        "condition" : "er.typeCode = 'SUBJ'"
      }],
      "rule" : [{
        "name" : "template",
        "source" : [{
          "context" : "act",
          "element" : "templateId",
          "variable" : "tid"
        }],
        "rule" : [{
          "name" : "comment",
          "source" : [{
            "context" : "tid",
            "element" : "root",
            "variable" : "root",
            "condition" : "root = '1.2.250.1.213.1.1.3.32'"
          }],
          "rule" : [{
            "name" : "description",
            "source" : [{
              "context" : "act",
              "element" : "text",
              "variable" : "text"
            }],
            "dependent" : [{
              "name" : "PSPlanTextToRecommendationDescription",
              "variable" : ["text", "rec"]
            }]
          }]
        }]
      }]
    }]
  },
  {
    "name" : "PSPlanCodeableConceptAbsentReason",
    "typeMode" : "none",
    "input" : [{
      "name" : "src",
      "mode" : "source"
    },
    {
      "name" : "cc",
      "type" : "CodeableConcept",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "dataAbsentReason",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "cc",
        "contextType" : "variable",
        "element" : "extension",
        "variable" : "absentReason",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Extension"
        }]
      }],
      "rule" : [{
        "name" : "url",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "absentReason",
          "contextType" : "variable",
          "element" : "url",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
          }]
        }]
      },
      {
        "name" : "valueCode",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "absentReason",
          "contextType" : "variable",
          "element" : "value",
          "transform" : "cast",
          "parameter" : [{
            "valueString" : "unknown"
          },
          {
            "valueString" : "code"
          }]
        }]
      }]
    }]
  },
  {
    "name" : "PatientSummaryFamilyHistorySection",
    "typeMode" : "none",
    "documentation" : "9. ANTÉCÉDENTS FAMILIAUX -> FamilyMemberHistory",
    "input" : [{
      "name" : "section",
      "mode" : "source"
    },
    {
      "name" : "compSection",
      "mode" : "target"
    },
    {
      "name" : "bundle",
      "type" : "Bundle",
      "mode" : "target"
    },
    {
      "name" : "patient",
      "type" : "Patient",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "sectionEntry",
      "source" : [{
        "context" : "section",
        "element" : "entry",
        "variable" : "entry"
      }],
      "rule" : [{
        "name" : "familyHistory",
        "source" : [{
          "context" : "entry",
          "element" : "organizer",
          "variable" : "familyOrganizer"
        }],
        "target" : [{
          "context" : "bundle",
          "contextType" : "variable",
          "element" : "entry",
          "variable" : "familyEntry"
        },
        {
          "context" : "familyEntry",
          "contextType" : "variable",
          "element" : "resource",
          "variable" : "familyHistory",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "FamilyMemberHistory"
          }]
        },
        {
          "context" : "familyHistory",
          "contextType" : "variable",
          "element" : "id",
          "transform" : "uuid"
        },
        {
          "context" : "familyEntry",
          "contextType" : "variable",
          "element" : "fullUrl",
          "transform" : "evaluate",
          "parameter" : [{
            "valueString" : "'urn:uuid:' + %familyHistory.id"
          }]
        }],
        "rule" : [{
          "name" : "statusDefault",
          "source" : [{
            "context" : "familyOrganizer"
          }],
          "target" : [{
            "context" : "familyHistory",
            "contextType" : "variable",
            "element" : "status",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "completed"
            }]
          }]
        },
        {
          "name" : "status",
          "source" : [{
            "context" : "familyOrganizer",
            "element" : "statusCode",
            "variable" : "statusCode"
          }],
          "rule" : [{
            "name" : "statusCompleted",
            "source" : [{
              "context" : "statusCode",
              "element" : "code",
              "variable" : "code",
              "condition" : "code = 'completed'"
            }],
            "target" : [{
              "context" : "familyHistory",
              "contextType" : "variable",
              "element" : "status",
              "transform" : "copy",
              "parameter" : [{
                "valueString" : "completed"
              }]
            }]
          },
          {
            "name" : "statusActive",
            "source" : [{
              "context" : "statusCode",
              "element" : "code",
              "variable" : "code",
              "condition" : "code = 'active'"
            }],
            "target" : [{
              "context" : "familyHistory",
              "contextType" : "variable",
              "element" : "status",
              "transform" : "copy",
              "parameter" : [{
                "valueString" : "partial"
              }]
            }]
          },
          {
            "name" : "statusAborted",
            "source" : [{
              "context" : "statusCode",
              "element" : "code",
              "variable" : "code",
              "condition" : "code = 'aborted'"
            }],
            "target" : [{
              "context" : "familyHistory",
              "contextType" : "variable",
              "element" : "status",
              "transform" : "copy",
              "parameter" : [{
                "valueString" : "entered-in-error"
              }]
            }]
          },
          {
            "name" : "statusCancelled",
            "source" : [{
              "context" : "statusCode",
              "element" : "code",
              "variable" : "code",
              "condition" : "code = 'cancelled'"
            }],
            "target" : [{
              "context" : "familyHistory",
              "contextType" : "variable",
              "element" : "status",
              "transform" : "copy",
              "parameter" : [{
                "valueString" : "entered-in-error"
              }]
            }]
          },
          {
            "name" : "statusSuspended",
            "source" : [{
              "context" : "statusCode",
              "element" : "code",
              "variable" : "code",
              "condition" : "code = 'suspended'"
            }],
            "target" : [{
              "context" : "familyHistory",
              "contextType" : "variable",
              "element" : "status",
              "transform" : "copy",
              "parameter" : [{
                "valueString" : "partial"
              }]
            }]
          }]
        },
        {
          "name" : "identifier",
          "source" : [{
            "context" : "familyOrganizer",
            "element" : "id",
            "variable" : "id"
          }],
          "target" : [{
            "context" : "familyHistory",
            "contextType" : "variable",
            "element" : "identifier",
            "variable" : "identifier",
            "transform" : "create",
            "parameter" : [{
              "valueString" : "Identifier"
            }]
          }],
          "dependent" : [{
            "name" : "II",
            "variable" : ["id", "identifier"]
          }]
        },
        {
          "name" : "patient",
          "source" : [{
            "context" : "familyOrganizer"
          }],
          "target" : [{
            "context" : "familyHistory",
            "contextType" : "variable",
            "element" : "patient",
            "variable" : "patientRef",
            "transform" : "create",
            "parameter" : [{
              "valueString" : "Reference"
            }]
          },
          {
            "context" : "patientRef",
            "contextType" : "variable",
            "element" : "reference",
            "transform" : "evaluate",
            "parameter" : [{
              "valueString" : "'urn:uuid:' + %patient.id"
            }]
          }]
        },
        {
          "name" : "subject",
          "source" : [{
            "context" : "familyOrganizer",
            "element" : "subject",
            "variable" : "subject"
          }],
          "rule" : [{
            "name" : "relatedSubject",
            "source" : [{
              "context" : "subject",
              "element" : "relatedSubject",
              "variable" : "relatedSubject"
            }],
            "rule" : [{
              "name" : "relationshipCode",
              "source" : [{
                "context" : "relatedSubject",
                "element" : "code",
                "variable" : "relationshipCode"
              }],
              "target" : [{
                "context" : "familyHistory",
                "contextType" : "variable",
                "element" : "relationship",
                "variable" : "relationship",
                "transform" : "create",
                "parameter" : [{
                  "valueString" : "CodeableConcept"
                }]
              }],
              "dependent" : [{
                "name" : "CDCodeableConcept",
                "variable" : ["relationshipCode", "relationship"]
              }]
            },
            {
              "name" : "relatedPerson",
              "source" : [{
                "context" : "relatedSubject",
                "element" : "subject",
                "variable" : "relatedPerson"
              }],
              "rule" : [{
                "name" : "sex",
                "source" : [{
                  "context" : "relatedPerson",
                  "element" : "administrativeGenderCode",
                  "variable" : "genderCode"
                }],
                "target" : [{
                  "context" : "familyHistory",
                  "contextType" : "variable",
                  "element" : "sex",
                  "variable" : "sex",
                  "transform" : "create",
                  "parameter" : [{
                    "valueString" : "CodeableConcept"
                  }]
                }],
                "rule" : [{
                  "name" : "sexCoding",
                  "source" : [{
                    "context" : "genderCode",
                    "element" : "code",
                    "variable" : "v"
                  }],
                  "target" : [{
                    "context" : "sex",
                    "contextType" : "variable",
                    "element" : "coding",
                    "variable" : "coding",
                    "transform" : "create",
                    "parameter" : [{
                      "valueString" : "Coding"
                    }]
                  }],
                  "rule" : [{
                    "name" : "sexSystem",
                    "source" : [{
                      "context" : "v"
                    }],
                    "target" : [{
                      "context" : "coding",
                      "contextType" : "variable",
                      "element" : "system",
                      "transform" : "copy",
                      "parameter" : [{
                        "valueString" : "http://hl7.org/fhir/administrative-gender"
                      }]
                    }]
                  },
                  {
                    "name" : "sexCode",
                    "source" : [{
                      "context" : "v"
                    }],
                    "target" : [{
                      "context" : "coding",
                      "contextType" : "variable",
                      "element" : "code",
                      "transform" : "translate",
                      "parameter" : [{
                        "valueId" : "v"
                      },
                      {
                        "valueString" : "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/cm-v3-administrative-gender"
                      },
                      {
                        "valueString" : "code"
                      }]
                    }]
                  },
                  {
                    "name" : "sexDisplayFemale",
                    "source" : [{
                      "context" : "v",
                      "condition" : "v = 'F'"
                    }],
                    "target" : [{
                      "context" : "coding",
                      "contextType" : "variable",
                      "element" : "display",
                      "transform" : "copy",
                      "parameter" : [{
                        "valueString" : "Female"
                      }]
                    }]
                  },
                  {
                    "name" : "sexDisplayMale",
                    "source" : [{
                      "context" : "v",
                      "condition" : "v = 'M'"
                    }],
                    "target" : [{
                      "context" : "coding",
                      "contextType" : "variable",
                      "element" : "display",
                      "transform" : "copy",
                      "parameter" : [{
                        "valueString" : "Male"
                      }]
                    }]
                  },
                  {
                    "name" : "sexDisplayUnknown",
                    "source" : [{
                      "context" : "v",
                      "condition" : "v = 'UN'"
                    }],
                    "target" : [{
                      "context" : "coding",
                      "contextType" : "variable",
                      "element" : "display",
                      "transform" : "copy",
                      "parameter" : [{
                        "valueString" : "Unknown"
                      }]
                    }]
                  }]
                },
                {
                  "name" : "sexText",
                  "source" : [{
                    "context" : "genderCode",
                    "element" : "displayName",
                    "variable" : "display"
                  }],
                  "target" : [{
                    "context" : "sex",
                    "contextType" : "variable",
                    "element" : "text",
                    "transform" : "cast",
                    "parameter" : [{
                      "valueId" : "display"
                    },
                    {
                      "valueString" : "string"
                    }]
                  }]
                }]
              },
              {
                "name" : "name",
                "source" : [{
                  "context" : "relatedPerson",
                  "element" : "name",
                  "variable" : "name"
                }],
                "rule" : [{
                  "name" : "nameText",
                  "source" : [{
                    "context" : "name",
                    "element" : "xmlText",
                    "variable" : "nameText"
                  }],
                  "target" : [{
                    "context" : "familyHistory",
                    "contextType" : "variable",
                    "element" : "name",
                    "transform" : "cast",
                    "parameter" : [{
                      "valueId" : "nameText"
                    },
                    {
                      "valueString" : "string"
                    }]
                  }]
                }]
              },
              {
                "name" : "bornDate",
                "source" : [{
                  "context" : "relatedPerson",
                  "element" : "birthTime",
                  "variable" : "birthTime"
                }],
                "target" : [{
                  "context" : "familyHistory",
                  "contextType" : "variable",
                  "element" : "born",
                  "variable" : "bornDate",
                  "transform" : "create",
                  "parameter" : [{
                    "valueString" : "date"
                  }]
                }],
                "dependent" : [{
                  "name" : "TSDate",
                  "variable" : ["birthTime", "bornDate"]
                }]
              },
              {
                "name" : "deceasedDate",
                "source" : [{
                  "context" : "relatedPerson",
                  "element" : "deceasedTime",
                  "variable" : "deceasedTime"
                }],
                "target" : [{
                  "context" : "familyHistory",
                  "contextType" : "variable",
                  "element" : "deceased",
                  "variable" : "deceasedDate",
                  "transform" : "create",
                  "parameter" : [{
                    "valueString" : "date"
                  }]
                }],
                "dependent" : [{
                  "name" : "TSDate",
                  "variable" : ["deceasedTime", "deceasedDate"]
                }]
              },
              {
                "name" : "deceasedBoolean",
                "source" : [{
                  "context" : "relatedPerson",
                  "element" : "deceasedInd",
                  "variable" : "deceasedInd",
                  "condition" : "relatedPerson.deceasedTime.empty()"
                }],
                "target" : [{
                  "context" : "familyHistory",
                  "contextType" : "variable",
                  "element" : "deceased",
                  "variable" : "deceasedBoolean",
                  "transform" : "create",
                  "parameter" : [{
                    "valueString" : "boolean"
                  }]
                }],
                "rule" : [{
                  "name" : "deceasedBooleanValue",
                  "source" : [{
                    "context" : "deceasedInd",
                    "element" : "value",
                    "variable" : "value"
                  }],
                  "target" : [{
                    "context" : "deceasedBoolean",
                    "contextType" : "variable",
                    "element" : "value",
                    "transform" : "copy",
                    "parameter" : [{
                      "valueId" : "value"
                    }]
                  }]
                }]
              }]
            }]
          }]
        },
        {
          "name" : "participantFallbackNoSubject",
          "source" : [{
            "context" : "familyOrganizer",
            "condition" : "familyOrganizer.subject.empty()"
          }],
          "rule" : [{
            "name" : "participant",
            "source" : [{
              "context" : "familyOrganizer",
              "element" : "participant",
              "variable" : "participant"
            }],
            "rule" : [{
              "name" : "participantRole",
              "source" : [{
                "context" : "participant",
                "element" : "participantRole",
                "variable" : "participantRole"
              }],
              "rule" : [{
                "name" : "relationshipFromParticipant",
                "source" : [{
                  "context" : "participantRole",
                  "element" : "code",
                  "variable" : "relationshipCode"
                }],
                "target" : [{
                  "context" : "familyHistory",
                  "contextType" : "variable",
                  "element" : "relationship",
                  "variable" : "relationship",
                  "transform" : "create",
                  "parameter" : [{
                    "valueString" : "CodeableConcept"
                  }]
                }],
                "dependent" : [{
                  "name" : "CDCodeableConcept",
                  "variable" : ["relationshipCode", "relationship"]
                }]
              }]
            }]
          }]
        },
        {
          "name" : "participantFallbackNoRelationship",
          "source" : [{
            "context" : "familyOrganizer",
            "element" : "subject",
            "variable" : "subject"
          }],
          "rule" : [{
            "name" : "noRelationshipCode",
            "source" : [{
              "context" : "subject",
              "element" : "relatedSubject",
              "variable" : "relatedSubject",
              "condition" : "relatedSubject.code.empty()"
            }],
            "rule" : [{
              "name" : "participant",
              "source" : [{
                "context" : "familyOrganizer",
                "element" : "participant",
                "variable" : "participant"
              }],
              "rule" : [{
                "name" : "participantRole",
                "source" : [{
                  "context" : "participant",
                  "element" : "participantRole",
                  "variable" : "participantRole"
                }],
                "rule" : [{
                  "name" : "relationshipFromParticipant",
                  "source" : [{
                    "context" : "participantRole",
                    "element" : "code",
                    "variable" : "relationshipCode"
                  }],
                  "target" : [{
                    "context" : "familyHistory",
                    "contextType" : "variable",
                    "element" : "relationship",
                    "variable" : "relationship",
                    "transform" : "create",
                    "parameter" : [{
                      "valueString" : "CodeableConcept"
                    }]
                  }],
                  "dependent" : [{
                    "name" : "CDCodeableConcept",
                    "variable" : ["relationshipCode", "relationship"]
                  }]
                }]
              }]
            }]
          }]
        },
        {
          "name" : "relationshipAbsent",
          "source" : [{
            "context" : "familyOrganizer",
            "condition" : "familyOrganizer.subject.empty() and familyOrganizer.participant.empty()"
          }],
          "target" : [{
            "context" : "familyHistory",
            "contextType" : "variable",
            "element" : "relationship",
            "variable" : "relationship",
            "transform" : "create",
            "parameter" : [{
              "valueString" : "CodeableConcept"
            }]
          }],
          "rule" : [{
            "name" : "dataAbsentReason",
            "source" : [{
              "context" : "familyOrganizer"
            }],
            "target" : [{
              "context" : "relationship",
              "contextType" : "variable",
              "element" : "extension",
              "variable" : "absentReason",
              "transform" : "create",
              "parameter" : [{
                "valueString" : "Extension"
              }]
            }],
            "rule" : [{
              "name" : "url",
              "source" : [{
                "context" : "familyOrganizer"
              }],
              "target" : [{
                "context" : "absentReason",
                "contextType" : "variable",
                "element" : "url",
                "transform" : "copy",
                "parameter" : [{
                  "valueString" : "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
                }]
              }]
            },
            {
              "name" : "valueCode",
              "source" : [{
                "context" : "familyOrganizer"
              }],
              "target" : [{
                "context" : "absentReason",
                "contextType" : "variable",
                "element" : "value",
                "transform" : "cast",
                "parameter" : [{
                  "valueString" : "unknown"
                },
                {
                  "valueString" : "code"
                }]
              }]
            }]
          }]
        },
        {
          "name" : "components",
          "source" : [{
            "context" : "familyOrganizer",
            "element" : "component",
            "variable" : "component"
          }],
          "rule" : [{
            "name" : "condition",
            "source" : [{
              "context" : "component",
              "element" : "observation",
              "variable" : "familyObservation"
            }],
            "target" : [{
              "context" : "familyHistory",
              "contextType" : "variable",
              "element" : "condition",
              "variable" : "condition"
            }],
            "rule" : [{
              "name" : "conditionCode",
              "source" : [{
                "context" : "familyObservation",
                "element" : "value",
                "variable" : "value"
              }],
              "target" : [{
                "context" : "condition",
                "contextType" : "variable",
                "element" : "code",
                "variable" : "conditionCode",
                "transform" : "create",
                "parameter" : [{
                  "valueString" : "CodeableConcept"
                }]
              }],
              "dependent" : [{
                "name" : "CDCodeableConcept",
                "variable" : ["value", "conditionCode"]
              }]
            },
            {
              "name" : "observationType",
              "source" : [{
                "context" : "familyObservation",
                "element" : "code",
                "variable" : "observationType"
              }],
              "rule" : [{
                "name" : "observationTypeDisplay",
                "source" : [{
                  "context" : "observationType",
                  "element" : "displayName",
                  "variable" : "display"
                }],
                "target" : [{
                  "context" : "condition",
                  "contextType" : "variable",
                  "element" : "note",
                  "variable" : "note",
                  "transform" : "create",
                  "parameter" : [{
                    "valueString" : "Annotation"
                  }]
                },
                {
                  "context" : "note",
                  "contextType" : "variable",
                  "element" : "text",
                  "transform" : "cast",
                  "parameter" : [{
                    "valueId" : "display"
                  },
                  {
                    "valueString" : "string"
                  }]
                }]
              }]
            },
            {
              "name" : "conditionCodeAbsent",
              "source" : [{
                "context" : "familyObservation",
                "condition" : "familyObservation.value.empty()"
              }],
              "target" : [{
                "context" : "condition",
                "contextType" : "variable",
                "element" : "code",
                "variable" : "conditionCode",
                "transform" : "create",
                "parameter" : [{
                  "valueString" : "CodeableConcept"
                }]
              }],
              "rule" : [{
                "name" : "dataAbsentReason",
                "source" : [{
                  "context" : "familyObservation"
                }],
                "target" : [{
                  "context" : "conditionCode",
                  "contextType" : "variable",
                  "element" : "extension",
                  "variable" : "absentReason",
                  "transform" : "create",
                  "parameter" : [{
                    "valueString" : "Extension"
                  }]
                }],
                "rule" : [{
                  "name" : "url",
                  "source" : [{
                    "context" : "familyObservation"
                  }],
                  "target" : [{
                    "context" : "absentReason",
                    "contextType" : "variable",
                    "element" : "url",
                    "transform" : "copy",
                    "parameter" : [{
                      "valueString" : "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
                    }]
                  }]
                },
                {
                  "name" : "valueCode",
                  "source" : [{
                    "context" : "familyObservation"
                  }],
                  "target" : [{
                    "context" : "absentReason",
                    "contextType" : "variable",
                    "element" : "value",
                    "transform" : "cast",
                    "parameter" : [{
                      "valueString" : "unknown"
                    },
                    {
                      "valueString" : "code"
                    }]
                  }]
                }]
              }]
            },
            {
              "name" : "effectiveTime",
              "source" : [{
                "context" : "familyObservation",
                "element" : "effectiveTime",
                "variable" : "effectiveTime"
              }],
              "rule" : [{
                "name" : "onsetValue",
                "source" : [{
                  "context" : "effectiveTime",
                  "element" : "value",
                  "variable" : "value"
                }],
                "target" : [{
                  "context" : "condition",
                  "contextType" : "variable",
                  "element" : "onset",
                  "variable" : "onsetPeriod",
                  "transform" : "create",
                  "parameter" : [{
                    "valueString" : "Period"
                  }]
                }],
                "rule" : [{
                  "name" : "onsetStart",
                  "source" : [{
                    "context" : "effectiveTime"
                  }],
                  "target" : [{
                    "context" : "onsetPeriod",
                    "contextType" : "variable",
                    "element" : "start",
                    "variable" : "start",
                    "transform" : "create",
                    "parameter" : [{
                      "valueString" : "dateTime"
                    }]
                  }],
                  "dependent" : [{
                    "name" : "TSDateTime",
                    "variable" : ["effectiveTime", "start"]
                  }]
                }]
              },
              {
                "name" : "onsetPeriod",
                "source" : [{
                  "context" : "effectiveTime",
                  "element" : "low",
                  "variable" : "low"
                }],
                "target" : [{
                  "context" : "condition",
                  "contextType" : "variable",
                  "element" : "onset",
                  "variable" : "onsetPeriod",
                  "transform" : "create",
                  "parameter" : [{
                    "valueString" : "Period"
                  }]
                }],
                "rule" : [{
                  "name" : "onsetLow",
                  "source" : [{
                    "context" : "low"
                  }],
                  "target" : [{
                    "context" : "onsetPeriod",
                    "contextType" : "variable",
                    "element" : "start",
                    "variable" : "start",
                    "transform" : "create",
                    "parameter" : [{
                      "valueString" : "dateTime"
                    }]
                  }],
                  "dependent" : [{
                    "name" : "TSDateTime",
                    "variable" : ["low", "start"]
                  }]
                },
                {
                  "name" : "onsetHigh",
                  "source" : [{
                    "context" : "effectiveTime",
                    "element" : "high",
                    "variable" : "high"
                  }],
                  "target" : [{
                    "context" : "onsetPeriod",
                    "contextType" : "variable",
                    "element" : "end",
                    "variable" : "end",
                    "transform" : "create",
                    "parameter" : [{
                      "valueString" : "dateTime"
                    }]
                  }],
                  "dependent" : [{
                    "name" : "TSDateTime",
                    "variable" : ["high", "end"]
                  }]
                }]
              }]
            },
            {
              "name" : "entryRelationship",
              "source" : [{
                "context" : "familyObservation",
                "element" : "entryRelationship",
                "variable" : "er"
              }],
              "rule" : [{
                "name" : "commentAct",
                "source" : [{
                  "context" : "er",
                  "element" : "act",
                  "variable" : "commentAct",
                  "condition" : "er.typeCode = 'SUBJ'"
                }],
                "rule" : [{
                  "name" : "commentTemplate",
                  "source" : [{
                    "context" : "commentAct",
                    "element" : "templateId",
                    "variable" : "tid"
                  }],
                  "rule" : [{
                    "name" : "comment",
                    "source" : [{
                      "context" : "tid",
                      "element" : "root",
                      "variable" : "root",
                      "condition" : "root = '1.2.250.1.213.1.1.3.32'"
                    }],
                    "rule" : [{
                      "name" : "commentText",
                      "source" : [{
                        "context" : "commentAct",
                        "element" : "text",
                        "variable" : "text"
                      }],
                      "rule" : [{
                        "name" : "commentTextReference",
                        "source" : [{
                          "context" : "text",
                          "element" : "reference",
                          "variable" : "reference"
                        }],
                        "rule" : [{
                          "name" : "commentReference",
                          "source" : [{
                            "context" : "reference",
                            "element" : "value",
                            "variable" : "value"
                          }],
                          "target" : [{
                            "context" : "condition",
                            "contextType" : "variable",
                            "element" : "note",
                            "variable" : "note",
                            "transform" : "create",
                            "parameter" : [{
                              "valueString" : "Annotation"
                            }]
                          },
                          {
                            "context" : "note",
                            "contextType" : "variable",
                            "element" : "text",
                            "transform" : "cast",
                            "parameter" : [{
                              "valueId" : "value"
                            },
                            {
                              "valueString" : "string"
                            }]
                          }]
                        }]
                      },
                      {
                        "name" : "commentText",
                        "source" : [{
                          "context" : "text",
                          "element" : "xmlText",
                          "variable" : "xml",
                          "condition" : "text.reference.empty()"
                        }],
                        "target" : [{
                          "context" : "condition",
                          "contextType" : "variable",
                          "element" : "note",
                          "variable" : "note",
                          "transform" : "create",
                          "parameter" : [{
                            "valueString" : "Annotation"
                          }]
                        },
                        {
                          "context" : "note",
                          "contextType" : "variable",
                          "element" : "text",
                          "transform" : "cast",
                          "parameter" : [{
                            "valueId" : "xml"
                          },
                          {
                            "valueString" : "string"
                          }]
                        }]
                      }]
                    }]
                  }]
                }]
              }]
            }]
          }]
        },
        {
          "name" : "sectionEntry",
          "source" : [{
            "context" : "familyOrganizer"
          }],
          "target" : [{
            "context" : "compSection",
            "contextType" : "variable",
            "element" : "entry",
            "variable" : "sectionRef",
            "transform" : "create",
            "parameter" : [{
              "valueString" : "Reference"
            }]
          },
          {
            "context" : "sectionRef",
            "contextType" : "variable",
            "element" : "reference",
            "transform" : "evaluate",
            "parameter" : [{
              "valueString" : "'urn:uuid:' + %familyHistory.id"
            }]
          }]
        }]
      }]
    }]
  },
  {
    "name" : "PatientSummaryMedicalDeviceSection",
    "typeMode" : "none",
    "documentation" : "10. DISPOSITIFS MÉDICAUX",
    "input" : [{
      "name" : "section",
      "mode" : "source"
    },
    {
      "name" : "compSection",
      "mode" : "target"
    },
    {
      "name" : "bundle",
      "type" : "Bundle",
      "mode" : "target"
    },
    {
      "name" : "patient",
      "type" : "Patient",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "sectionTemplate",
      "source" : [{
        "context" : "section",
        "element" : "templateId",
        "variable" : "sectionTid"
      }],
      "rule" : [{
        "name" : "medicalDeviceSection",
        "source" : [{
          "context" : "sectionTid",
          "element" : "root",
          "variable" : "sectionRoot",
          "condition" : "sectionRoot = '1.2.250.1.213.1.1.2.1'"
        }],
        "rule" : [{
          "name" : "sectionEntry",
          "source" : [{
            "context" : "section",
            "element" : "entry",
            "variable" : "entry"
          }],
          "rule" : [{
            "name" : "deviceSupply",
            "source" : [{
              "context" : "entry",
              "element" : "supply",
              "variable" : "supply"
            }],
            "rule" : [{
              "name" : "deviceSupplyTemplate",
              "source" : [{
                "context" : "supply",
                "element" : "templateId",
                "variable" : "supplyTid"
              }],
              "rule" : [{
                "name" : "deviceUseStatement",
                "source" : [{
                  "context" : "supplyTid",
                  "element" : "root",
                  "variable" : "supplyRoot",
                  "condition" : "supplyRoot = '1.2.250.1.213.1.1.3.20'"
                }],
                "target" : [{
                  "context" : "bundle",
                  "contextType" : "variable",
                  "element" : "entry",
                  "variable" : "deviceUseStatementEntry"
                },
                {
                  "context" : "deviceUseStatementEntry",
                  "contextType" : "variable",
                  "element" : "resource",
                  "variable" : "deviceUseStatement",
                  "transform" : "create",
                  "parameter" : [{
                    "valueString" : "DeviceUseStatement"
                  }]
                },
                {
                  "context" : "deviceUseStatement",
                  "contextType" : "variable",
                  "element" : "id",
                  "transform" : "uuid"
                },
                {
                  "context" : "deviceUseStatementEntry",
                  "contextType" : "variable",
                  "element" : "fullUrl",
                  "transform" : "evaluate",
                  "parameter" : [{
                    "valueString" : "'urn:uuid:' + %deviceUseStatement.id"
                  }]
                }],
                "dependent" : [{
                  "name" : "PatientSummaryDeviceUseStatementFromSupply",
                  "variable" : ["supply", "deviceUseStatement", "compSection", "bundle", "patient"]
                }]
              }]
            }]
          }]
        }]
      }]
    }]
  },
  {
    "name" : "PatientSummaryDeviceUseStatementFromSupply",
    "typeMode" : "none",
    "documentation" : "Supply CDA -> DeviceUseStatement",
    "input" : [{
      "name" : "supply",
      "mode" : "source"
    },
    {
      "name" : "deviceUseStatement",
      "type" : "DeviceUseStatement",
      "mode" : "target"
    },
    {
      "name" : "compSection",
      "mode" : "target"
    },
    {
      "name" : "bundle",
      "type" : "Bundle",
      "mode" : "target"
    },
    {
      "name" : "patient",
      "type" : "Patient",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "statusDefault",
      "source" : [{
        "context" : "supply"
      }],
      "target" : [{
        "context" : "deviceUseStatement",
        "contextType" : "variable",
        "element" : "status",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "active"
        }]
      }]
    },
    {
      "name" : "statusFromHigh",
      "source" : [{
        "context" : "supply",
        "element" : "effectiveTime",
        "variable" : "effectiveTime"
      }],
      "rule" : [{
        "name" : "statusCompleted",
        "source" : [{
          "context" : "effectiveTime",
          "element" : "high",
          "variable" : "high"
        }],
        "target" : [{
          "context" : "deviceUseStatement",
          "contextType" : "variable",
          "element" : "status",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "completed"
          }]
        }]
      }]
    },
    {
      "name" : "identifier",
      "source" : [{
        "context" : "supply",
        "element" : "id",
        "variable" : "supplyId"
      }],
      "target" : [{
        "context" : "deviceUseStatement",
        "contextType" : "variable",
        "element" : "identifier",
        "variable" : "identifier",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Identifier"
        }]
      }],
      "dependent" : [{
        "name" : "II",
        "variable" : ["supplyId", "identifier"]
      }]
    },
    {
      "name" : "subject",
      "source" : [{
        "context" : "supply"
      }],
      "target" : [{
        "context" : "deviceUseStatement",
        "contextType" : "variable",
        "element" : "subject",
        "variable" : "subjectRef",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Reference"
        }]
      },
      {
        "context" : "subjectRef",
        "contextType" : "variable",
        "element" : "reference",
        "transform" : "evaluate",
        "parameter" : [{
          "valueString" : "'urn:uuid:' + %patient.id"
        }]
      }]
    },
    {
      "name" : "timing",
      "source" : [{
        "context" : "supply",
        "element" : "effectiveTime",
        "variable" : "effectiveTime"
      }],
      "dependent" : [{
        "name" : "DeviceUseStatementTimingFromEffectiveTime",
        "variable" : ["effectiveTime", "deviceUseStatement"]
      }]
    },
    {
      "name" : "participantDevice",
      "source" : [{
        "context" : "supply",
        "element" : "participant",
        "variable" : "participant"
      }],
      "target" : [{
        "context" : "bundle",
        "contextType" : "variable",
        "element" : "entry",
        "variable" : "deviceEntry"
      },
      {
        "context" : "deviceEntry",
        "contextType" : "variable",
        "element" : "resource",
        "variable" : "device",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Device"
        }]
      },
      {
        "context" : "device",
        "contextType" : "variable",
        "element" : "id",
        "transform" : "uuid"
      },
      {
        "context" : "deviceEntry",
        "contextType" : "variable",
        "element" : "fullUrl",
        "transform" : "evaluate",
        "parameter" : [{
          "valueString" : "'urn:uuid:' + %device.id"
        }]
      }],
      "rule" : [{
        "name" : "device",
        "source" : [{
          "context" : "participant"
        }],
        "dependent" : [{
          "name" : "PatientSummaryDeviceFromParticipant",
          "variable" : ["participant", "device", "patient"]
        }]
      },
      {
        "name" : "deviceReference",
        "source" : [{
          "context" : "participant"
        }],
        "target" : [{
          "context" : "deviceUseStatement",
          "contextType" : "variable",
          "element" : "device",
          "variable" : "deviceRef",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Reference"
          }]
        },
        {
          "context" : "deviceRef",
          "contextType" : "variable",
          "element" : "reference",
          "transform" : "evaluate",
          "parameter" : [{
            "valueString" : "'urn:uuid:' + %device.id"
          }]
        }]
      }]
    },
    {
      "name" : "entryRelationship",
      "source" : [{
        "context" : "supply",
        "element" : "entryRelationship",
        "variable" : "er"
      }],
      "rule" : [{
        "name" : "commentAct",
        "source" : [{
          "context" : "er",
          "element" : "act",
          "variable" : "commentAct",
          "condition" : "er.typeCode = 'SUBJ'"
        }],
        "rule" : [{
          "name" : "commentTemplate",
          "source" : [{
            "context" : "commentAct",
            "element" : "templateId",
            "variable" : "tid"
          }],
          "rule" : [{
            "name" : "commentMapped",
            "source" : [{
              "context" : "tid",
              "element" : "root",
              "variable" : "root",
              "condition" : "root = '1.2.250.1.213.1.1.3.32'"
            }],
            "rule" : [{
              "name" : "commentText",
              "source" : [{
                "context" : "commentAct",
                "element" : "text",
                "variable" : "commentText"
              }],
              "rule" : [{
                "name" : "commentReference",
                "source" : [{
                  "context" : "commentText",
                  "element" : "reference",
                  "variable" : "ref"
                }],
                "rule" : [{
                  "name" : "note",
                  "source" : [{
                    "context" : "ref",
                    "element" : "value",
                    "variable" : "value"
                  }],
                  "target" : [{
                    "context" : "deviceUseStatement",
                    "contextType" : "variable",
                    "element" : "note",
                    "variable" : "note",
                    "transform" : "create",
                    "parameter" : [{
                      "valueString" : "Annotation"
                    }]
                  }],
                  "rule" : [{
                    "name" : "noteText",
                    "source" : [{
                      "context" : "value"
                    }],
                    "target" : [{
                      "context" : "note",
                      "contextType" : "variable",
                      "element" : "text",
                      "transform" : "cast",
                      "parameter" : [{
                        "valueId" : "value"
                      },
                      {
                        "valueString" : "string"
                      }]
                    }]
                  }]
                }]
              }]
            }]
          }]
        }]
      }]
    },
    {
      "name" : "sectionEntry",
      "source" : [{
        "context" : "supply"
      }],
      "target" : [{
        "context" : "compSection",
        "contextType" : "variable",
        "element" : "entry",
        "variable" : "sectionRef",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Reference"
        }]
      },
      {
        "context" : "sectionRef",
        "contextType" : "variable",
        "element" : "reference",
        "transform" : "evaluate",
        "parameter" : [{
          "valueString" : "'urn:uuid:' + %deviceUseStatement.id"
        }]
      }]
    }]
  },
  {
    "name" : "DeviceUseStatementTimingFromEffectiveTime",
    "typeMode" : "none",
    "documentation" : "effectiveTime CDA -> DeviceUseStatement.timing[x]",
    "input" : [{
      "name" : "effectiveTime",
      "mode" : "source"
    },
    {
      "name" : "deviceUseStatement",
      "type" : "DeviceUseStatement",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "timingDateTime",
      "source" : [{
        "context" : "effectiveTime",
        "element" : "value",
        "variable" : "value"
      }],
      "target" : [{
        "context" : "deviceUseStatement",
        "contextType" : "variable",
        "element" : "timing",
        "variable" : "timingDateTime",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "dateTime"
        }]
      }],
      "dependent" : [{
        "name" : "TSDateTime",
        "variable" : ["effectiveTime", "timingDateTime"]
      }]
    },
    {
      "name" : "timingPeriodByLow",
      "source" : [{
        "context" : "effectiveTime",
        "element" : "low",
        "variable" : "low"
      }],
      "target" : [{
        "context" : "deviceUseStatement",
        "contextType" : "variable",
        "element" : "timing",
        "variable" : "period",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Period"
        }]
      }],
      "rule" : [{
        "name" : "start",
        "source" : [{
          "context" : "low"
        }],
        "target" : [{
          "context" : "period",
          "contextType" : "variable",
          "element" : "start",
          "variable" : "start",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "dateTime"
          }]
        }],
        "dependent" : [{
          "name" : "TSDateTime",
          "variable" : ["low", "start"]
        }]
      },
      {
        "name" : "end",
        "source" : [{
          "context" : "effectiveTime",
          "element" : "high",
          "variable" : "high"
        }],
        "target" : [{
          "context" : "period",
          "contextType" : "variable",
          "element" : "end",
          "variable" : "end",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "dateTime"
          }]
        }],
        "dependent" : [{
          "name" : "TSDateTime",
          "variable" : ["high", "end"]
        }]
      }]
    },
    {
      "name" : "timingPeriodByHigh",
      "source" : [{
        "context" : "effectiveTime",
        "element" : "high",
        "variable" : "high",
        "condition" : "effectiveTime.low.empty()"
      }],
      "target" : [{
        "context" : "deviceUseStatement",
        "contextType" : "variable",
        "element" : "timing",
        "variable" : "period",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Period"
        }]
      }],
      "rule" : [{
        "name" : "endOnly",
        "source" : [{
          "context" : "high"
        }],
        "target" : [{
          "context" : "period",
          "contextType" : "variable",
          "element" : "end",
          "variable" : "end",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "dateTime"
          }]
        }],
        "dependent" : [{
          "name" : "TSDateTime",
          "variable" : ["high", "end"]
        }]
      }]
    }]
  },
  {
    "name" : "PatientSummaryDeviceFromParticipant",
    "typeMode" : "none",
    "documentation" : "participant CDA -> Device",
    "input" : [{
      "name" : "participant",
      "mode" : "source"
    },
    {
      "name" : "device",
      "type" : "Device",
      "mode" : "target"
    },
    {
      "name" : "patient",
      "type" : "Patient",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "participantRole",
      "source" : [{
        "context" : "participant",
        "element" : "participantRole",
        "variable" : "participantRole"
      }],
      "rule" : [{
        "name" : "identifier",
        "source" : [{
          "context" : "participantRole",
          "element" : "id",
          "variable" : "deviceId"
        }],
        "target" : [{
          "context" : "device",
          "contextType" : "variable",
          "element" : "identifier",
          "variable" : "identifier",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Identifier"
          }]
        }],
        "dependent" : [{
          "name" : "II",
          "variable" : ["deviceId", "identifier"]
        }]
      },
      {
        "name" : "playingDevice",
        "source" : [{
          "context" : "participantRole",
          "element" : "playingDevice",
          "variable" : "playingDevice"
        }],
        "rule" : [{
          "name" : "type",
          "source" : [{
            "context" : "playingDevice",
            "element" : "code",
            "variable" : "deviceCode"
          }],
          "target" : [{
            "context" : "device",
            "contextType" : "variable",
            "element" : "type",
            "variable" : "type",
            "transform" : "create",
            "parameter" : [{
              "valueString" : "CodeableConcept"
            }]
          }],
          "dependent" : [{
            "name" : "CDCodeableConcept",
            "variable" : ["deviceCode", "type"]
          }]
        }]
      },
      {
        "name" : "patient",
        "source" : [{
          "context" : "participantRole"
        }],
        "target" : [{
          "context" : "device",
          "contextType" : "variable",
          "element" : "patient",
          "variable" : "patientRef",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Reference"
          }]
        },
        {
          "context" : "patientRef",
          "contextType" : "variable",
          "element" : "reference",
          "transform" : "evaluate",
          "parameter" : [{
            "valueString" : "'urn:uuid:' + %patient.id"
          }]
        }]
      }]
    }]
  },
  {
    "name" : "PatientSummaryAddedDocumentsSection",
    "typeMode" : "none",
    "documentation" : "11. DOCUMENTS JOINTS",
    "input" : [{
      "name" : "section",
      "mode" : "source"
    },
    {
      "name" : "compSection",
      "mode" : "target"
    },
    {
      "name" : "bundle",
      "type" : "Bundle",
      "mode" : "target"
    },
    {
      "name" : "patient",
      "type" : "Patient",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "sectionTemplate",
      "source" : [{
        "context" : "section",
        "element" : "templateId",
        "variable" : "sectionTid"
      }],
      "rule" : [{
        "name" : "addedDocumentsSection",
        "source" : [{
          "context" : "sectionTid",
          "element" : "root",
          "variable" : "sectionRoot",
          "condition" : "sectionRoot = '1.2.250.1.213.1.1.2.37'"
        }],
        "rule" : [{
          "name" : "sectionEntry",
          "source" : [{
            "context" : "section",
            "element" : "entry",
            "variable" : "entry"
          }],
          "rule" : [{
            "name" : "attachedDocument",
            "source" : [{
              "context" : "entry",
              "element" : "organizer",
              "variable" : "attachedDocument"
            }],
            "rule" : [{
              "name" : "attachedDocumentTemplate",
              "source" : [{
                "context" : "attachedDocument",
                "element" : "templateId",
                "variable" : "docTid"
              }],
              "rule" : [{
                "name" : "attachedDocument",
                "source" : [{
                  "context" : "docTid",
                  "element" : "root",
                  "variable" : "docRoot",
                  "condition" : "docRoot = '1.2.250.1.213.1.1.3.18'"
                }],
                "target" : [{
                  "context" : "bundle",
                  "contextType" : "variable",
                  "element" : "entry",
                  "variable" : "documentReferenceEntry"
                },
                {
                  "context" : "documentReferenceEntry",
                  "contextType" : "variable",
                  "element" : "resource",
                  "variable" : "documentReference",
                  "transform" : "create",
                  "parameter" : [{
                    "valueString" : "DocumentReference"
                  }]
                },
                {
                  "context" : "documentReference",
                  "contextType" : "variable",
                  "element" : "id",
                  "transform" : "uuid"
                },
                {
                  "context" : "documentReferenceEntry",
                  "contextType" : "variable",
                  "element" : "fullUrl",
                  "transform" : "evaluate",
                  "parameter" : [{
                    "valueString" : "'urn:uuid:' + %documentReference.id"
                  }]
                }],
                "dependent" : [{
                  "name" : "DocumentReferenceFromCdaAttachedDocument",
                  "variable" : ["attachedDocument", "documentReference", "compSection", "patient"]
                }]
              }]
            }]
          },
          {
            "name" : "simpleObservationNotMapped",
            "source" : [{
              "context" : "entry",
              "element" : "observation",
              "variable" : "simpleObservation"
            }]
          }]
        }]
      }]
    }]
  },
  {
    "name" : "DocumentReferenceFromCdaAttachedDocument",
    "typeMode" : "none",
    "documentation" : "Organizer CDA de document attaché -> DocumentReference",
    "input" : [{
      "name" : "attachedDocument",
      "mode" : "source"
    },
    {
      "name" : "documentReference",
      "type" : "DocumentReference",
      "mode" : "target"
    },
    {
      "name" : "compSection",
      "mode" : "target"
    },
    {
      "name" : "patient",
      "type" : "Patient",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "statusDefault",
      "source" : [{
        "context" : "attachedDocument"
      }],
      "target" : [{
        "context" : "documentReference",
        "contextType" : "variable",
        "element" : "status",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "current"
        }]
      }]
    },
    {
      "name" : "identifier",
      "source" : [{
        "context" : "attachedDocument",
        "element" : "id",
        "variable" : "docId"
      }],
      "target" : [{
        "context" : "documentReference",
        "contextType" : "variable",
        "element" : "identifier",
        "variable" : "identifier",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Identifier"
        }]
      }],
      "dependent" : [{
        "name" : "II",
        "variable" : ["docId", "identifier"]
      }]
    },
    {
      "name" : "subject",
      "source" : [{
        "context" : "attachedDocument"
      }],
      "target" : [{
        "context" : "documentReference",
        "contextType" : "variable",
        "element" : "subject",
        "variable" : "subjectRef",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Reference"
        }]
      },
      {
        "context" : "subjectRef",
        "contextType" : "variable",
        "element" : "reference",
        "transform" : "evaluate",
        "parameter" : [{
          "valueString" : "'urn:uuid:' + %patient.id"
        }]
      }]
    },
    {
      "name" : "docStatus",
      "source" : [{
        "context" : "attachedDocument",
        "element" : "statusCode",
        "variable" : "statusCode"
      }],
      "rule" : [{
        "name" : "final",
        "source" : [{
          "context" : "statusCode",
          "element" : "code",
          "variable" : "code",
          "condition" : "code = 'completed'"
        }],
        "target" : [{
          "context" : "documentReference",
          "contextType" : "variable",
          "element" : "docStatus",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "final"
          }]
        }]
      },
      {
        "name" : "preliminary",
        "source" : [{
          "context" : "statusCode",
          "element" : "code",
          "variable" : "code",
          "condition" : "code = 'active'"
        }],
        "target" : [{
          "context" : "documentReference",
          "contextType" : "variable",
          "element" : "docStatus",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "preliminary"
          }]
        }]
      },
      {
        "name" : "aborted",
        "source" : [{
          "context" : "statusCode",
          "element" : "code",
          "variable" : "code",
          "condition" : "code = 'aborted'"
        }],
        "target" : [{
          "context" : "documentReference",
          "contextType" : "variable",
          "element" : "docStatus",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "entered-in-error"
          }]
        }]
      },
      {
        "name" : "cancelled",
        "source" : [{
          "context" : "statusCode",
          "element" : "code",
          "variable" : "code",
          "condition" : "code = 'cancelled'"
        }],
        "target" : [{
          "context" : "documentReference",
          "contextType" : "variable",
          "element" : "docStatus",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "entered-in-error"
          }]
        }]
      }]
    },
    {
      "name" : "date",
      "source" : [{
        "context" : "attachedDocument",
        "element" : "effectiveTime",
        "variable" : "effectiveTime"
      }],
      "rule" : [{
        "name" : "dateTime",
        "source" : [{
          "context" : "effectiveTime",
          "element" : "value",
          "variable" : "value"
        }],
        "target" : [{
          "context" : "documentReference",
          "contextType" : "variable",
          "element" : "date",
          "variable" : "date",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "dateTime"
          }]
        }],
        "dependent" : [{
          "name" : "TSDateTime",
          "variable" : ["effectiveTime", "date"]
        }]
      },
      {
        "name" : "dateLow",
        "source" : [{
          "context" : "effectiveTime",
          "element" : "low",
          "variable" : "low"
        }],
        "target" : [{
          "context" : "documentReference",
          "contextType" : "variable",
          "element" : "date",
          "variable" : "date",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "dateTime"
          }]
        }],
        "dependent" : [{
          "name" : "TSDateTime",
          "variable" : ["low", "date"]
        }]
      }]
    },
    {
      "name" : "typeComponent",
      "source" : [{
        "context" : "attachedDocument",
        "element" : "component",
        "variable" : "component"
      }],
      "rule" : [{
        "name" : "typeObservation",
        "source" : [{
          "context" : "component",
          "element" : "observation",
          "variable" : "typeObservation"
        }],
        "rule" : [{
          "name" : "typeTemplate",
          "source" : [{
            "context" : "typeObservation",
            "element" : "templateId",
            "variable" : "tid"
          }],
          "rule" : [{
            "name" : "typeValue",
            "source" : [{
              "context" : "tid",
              "element" : "root",
              "variable" : "root",
              "condition" : "root = '1.2.250.1.213.1.1.3.48.18'"
            }],
            "rule" : [{
              "name" : "type",
              "source" : [{
                "context" : "typeObservation",
                "element" : "value",
                "variable" : "typeValue"
              }],
              "target" : [{
                "context" : "documentReference",
                "contextType" : "variable",
                "element" : "type",
                "variable" : "type",
                "transform" : "create",
                "parameter" : [{
                  "valueString" : "CodeableConcept"
                }]
              }],
              "dependent" : [{
                "name" : "CDCodeableConcept",
                "variable" : ["typeValue", "type"]
              }]
            }]
          }]
        }]
      }]
    },
    {
      "name" : "mediaComponent",
      "source" : [{
        "context" : "attachedDocument",
        "element" : "component",
        "variable" : "component"
      }],
      "rule" : [{
        "name" : "observationMedia",
        "source" : [{
          "context" : "component",
          "element" : "observationMedia",
          "variable" : "observationMedia"
        }],
        "target" : [{
          "context" : "documentReference",
          "contextType" : "variable",
          "element" : "content",
          "variable" : "content"
        }],
        "rule" : [{
          "name" : "attachment",
          "source" : [{
            "context" : "observationMedia"
          }],
          "dependent" : [{
            "name" : "AttachmentFromObservationMedia",
            "variable" : ["observationMedia", "content"]
          }]
        }]
      }]
    },
    {
      "name" : "sectionEntry",
      "source" : [{
        "context" : "attachedDocument"
      }],
      "target" : [{
        "context" : "compSection",
        "contextType" : "variable",
        "element" : "entry",
        "variable" : "sectionRef",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Reference"
        }]
      },
      {
        "context" : "sectionRef",
        "contextType" : "variable",
        "element" : "reference",
        "transform" : "evaluate",
        "parameter" : [{
          "valueString" : "'urn:uuid:' + %documentReference.id"
        }]
      }]
    }]
  },
  {
    "name" : "AttachmentFromObservationMedia",
    "typeMode" : "none",
    "documentation" : "ObservationMedia CDA -> DocumentReference.content.attachment",
    "input" : [{
      "name" : "observationMedia",
      "mode" : "source"
    },
    {
      "name" : "content",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "attachment",
      "source" : [{
        "context" : "observationMedia"
      }],
      "target" : [{
        "context" : "content",
        "contextType" : "variable",
        "element" : "attachment",
        "variable" : "attachment",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Attachment"
        }]
      }],
      "rule" : [{
        "name" : "attachmentId",
        "source" : [{
          "context" : "observationMedia",
          "element" : "ID",
          "variable" : "mediaId"
        }],
        "target" : [{
          "context" : "attachment",
          "contextType" : "variable",
          "element" : "id",
          "transform" : "cast",
          "parameter" : [{
            "valueId" : "mediaId"
          },
          {
            "valueString" : "string"
          }]
        }]
      },
      {
        "name" : "mediaValue",
        "source" : [{
          "context" : "observationMedia",
          "element" : "value",
          "variable" : "mediaValue"
        }],
        "rule" : [{
          "name" : "contentType",
          "source" : [{
            "context" : "mediaValue",
            "element" : "mediaType",
            "variable" : "mediaType"
          }],
          "target" : [{
            "context" : "attachment",
            "contextType" : "variable",
            "element" : "contentType",
            "transform" : "cast",
            "parameter" : [{
              "valueId" : "mediaType"
            },
            {
              "valueString" : "string"
            }]
          }]
        },
        {
          "name" : "data",
          "source" : [{
            "context" : "mediaValue",
            "element" : "xmlText",
            "variable" : "rawData"
          }],
          "target" : [{
            "context" : "attachment",
            "contextType" : "variable",
            "element" : "data",
            "transform" : "cast",
            "parameter" : [{
              "valueId" : "rawData"
            },
            {
              "valueString" : "base64Binary"
            }]
          }]
        }]
      }]
    }]
  },
  {
    "name" : "PatientSummaryAdvanceDirectiveSection",
    "typeMode" : "none",
    "documentation" : "12 DIRECTIVES ANTICIPEES",
    "input" : [{
      "name" : "section",
      "mode" : "source"
    },
    {
      "name" : "compSection",
      "mode" : "target"
    },
    {
      "name" : "bundle",
      "type" : "Bundle",
      "mode" : "target"
    },
    {
      "name" : "patient",
      "type" : "Patient",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "sectionTemplate",
      "source" : [{
        "context" : "section",
        "element" : "templateId",
        "variable" : "sectionTid"
      }],
      "rule" : [{
        "name" : "advanceDirectiveSection",
        "source" : [{
          "context" : "sectionTid",
          "element" : "root",
          "variable" : "sectionRoot",
          "condition" : "sectionRoot = '1.2.250.1.213.1.1.2.157'"
        }],
        "rule" : [{
          "name" : "sectionEntry",
          "source" : [{
            "context" : "section",
            "element" : "entry",
            "variable" : "entry"
          }],
          "rule" : [{
            "name" : "directiveObservation",
            "source" : [{
              "context" : "entry",
              "element" : "observation",
              "variable" : "directiveObservation"
            }],
            "rule" : [{
              "name" : "advanceDirectiveTemplate",
              "source" : [{
                "context" : "directiveObservation",
                "element" : "templateId",
                "variable" : "directiveTid"
              }],
              "rule" : [{
                "name" : "advanceDirectiveConsent",
                "source" : [{
                  "context" : "directiveTid",
                  "element" : "root",
                  "variable" : "directiveRoot",
                  "condition" : "directiveRoot = '1.2.250.1.213.1.1.3.54'"
                }],
                "target" : [{
                  "context" : "bundle",
                  "contextType" : "variable",
                  "element" : "entry",
                  "variable" : "consentEntry"
                },
                {
                  "context" : "consentEntry",
                  "contextType" : "variable",
                  "element" : "resource",
                  "variable" : "consent",
                  "transform" : "create",
                  "parameter" : [{
                    "valueString" : "Consent"
                  }]
                },
                {
                  "context" : "consent",
                  "contextType" : "variable",
                  "element" : "id",
                  "transform" : "uuid"
                },
                {
                  "context" : "consentEntry",
                  "contextType" : "variable",
                  "element" : "fullUrl",
                  "transform" : "evaluate",
                  "parameter" : [{
                    "valueString" : "'urn:uuid:' + %consent.id"
                  }]
                }],
                "dependent" : [{
                  "name" : "AdvanceDirectiveConsentFromObservation",
                  "variable" : ["directiveObservation", "consent", "compSection", "patient"]
                }]
              }]
            }]
          }]
        }]
      }]
    }]
  },
  {
    "name" : "AdvanceDirectiveConsentFromObservation",
    "typeMode" : "none",
    "documentation" : "Observation CDA FR-Directive-Anticipee -> Consent",
    "input" : [{
      "name" : "directiveObservation",
      "mode" : "source"
    },
    {
      "name" : "consent",
      "type" : "Consent",
      "mode" : "target"
    },
    {
      "name" : "compSection",
      "mode" : "target"
    },
    {
      "name" : "patient",
      "type" : "Patient",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "identifier",
      "source" : [{
        "context" : "directiveObservation",
        "element" : "id",
        "variable" : "directiveId"
      }],
      "target" : [{
        "context" : "consent",
        "contextType" : "variable",
        "element" : "identifier",
        "variable" : "identifier",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Identifier"
        }]
      }],
      "dependent" : [{
        "name" : "II",
        "variable" : ["directiveId", "identifier"]
      }]
    },
    {
      "name" : "patient",
      "source" : [{
        "context" : "directiveObservation"
      }],
      "target" : [{
        "context" : "consent",
        "contextType" : "variable",
        "element" : "patient",
        "variable" : "patientRef",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Reference"
        }]
      },
      {
        "context" : "patientRef",
        "contextType" : "variable",
        "element" : "reference",
        "transform" : "evaluate",
        "parameter" : [{
          "valueString" : "'urn:uuid:' + %patient.id"
        }]
      }]
    },
    {
      "name" : "statusDefault",
      "source" : [{
        "context" : "directiveObservation"
      }],
      "target" : [{
        "context" : "consent",
        "contextType" : "variable",
        "element" : "status",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "active"
        }]
      }]
    },
    {
      "name" : "status",
      "source" : [{
        "context" : "directiveObservation",
        "element" : "statusCode",
        "variable" : "statusCode"
      }],
      "rule" : [{
        "name" : "completedToActive",
        "source" : [{
          "context" : "statusCode",
          "element" : "code",
          "variable" : "code",
          "condition" : "code = 'completed'"
        }],
        "target" : [{
          "context" : "consent",
          "contextType" : "variable",
          "element" : "status",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "active"
          }]
        }]
      },
      {
        "name" : "activeToActive",
        "source" : [{
          "context" : "statusCode",
          "element" : "code",
          "variable" : "code",
          "condition" : "code = 'active'"
        }],
        "target" : [{
          "context" : "consent",
          "contextType" : "variable",
          "element" : "status",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "active"
          }]
        }]
      },
      {
        "name" : "abortedToInactive",
        "source" : [{
          "context" : "statusCode",
          "element" : "code",
          "variable" : "code",
          "condition" : "code = 'aborted'"
        }],
        "target" : [{
          "context" : "consent",
          "contextType" : "variable",
          "element" : "status",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "inactive"
          }]
        }]
      },
      {
        "name" : "cancelledToInactive",
        "source" : [{
          "context" : "statusCode",
          "element" : "code",
          "variable" : "code",
          "condition" : "code = 'cancelled'"
        }],
        "target" : [{
          "context" : "consent",
          "contextType" : "variable",
          "element" : "status",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "inactive"
          }]
        }]
      }]
    },
    {
      "name" : "scope",
      "source" : [{
        "context" : "directiveObservation"
      }],
      "target" : [{
        "context" : "consent",
        "contextType" : "variable",
        "element" : "scope",
        "variable" : "scope",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "rule" : [{
        "name" : "scopeCoding",
        "source" : [{
          "context" : "directiveObservation"
        }],
        "target" : [{
          "context" : "scope",
          "contextType" : "variable",
          "element" : "coding",
          "variable" : "scopeCoding",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Coding"
          }]
        }],
        "rule" : [{
          "name" : "scopeSystem",
          "source" : [{
            "context" : "directiveObservation"
          }],
          "target" : [{
            "context" : "scopeCoding",
            "contextType" : "variable",
            "element" : "system",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "http://terminology.hl7.org/CodeSystem/consentscope"
            }]
          }]
        },
        {
          "name" : "scopeCode",
          "source" : [{
            "context" : "directiveObservation"
          }],
          "target" : [{
            "context" : "scopeCoding",
            "contextType" : "variable",
            "element" : "code",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "adr"
            }]
          }]
        },
        {
          "name" : "scopeDisplay",
          "source" : [{
            "context" : "directiveObservation"
          }],
          "target" : [{
            "context" : "scopeCoding",
            "contextType" : "variable",
            "element" : "display",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "Advanced Care Directive"
            }]
          }]
        }]
      }]
    },
    {
      "name" : "category",
      "source" : [{
        "context" : "directiveObservation",
        "element" : "code",
        "variable" : "directiveCode"
      }],
      "target" : [{
        "context" : "consent",
        "contextType" : "variable",
        "element" : "category",
        "variable" : "category",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "dependent" : [{
        "name" : "CDCodeableConcept",
        "variable" : ["directiveCode", "category"]
      }]
    },
    {
      "name" : "dateTime",
      "source" : [{
        "context" : "directiveObservation",
        "element" : "effectiveTime",
        "variable" : "effectiveTime"
      }],
      "rule" : [{
        "name" : "dateTime",
        "source" : [{
          "context" : "effectiveTime",
          "element" : "value",
          "variable" : "value"
        }],
        "target" : [{
          "context" : "consent",
          "contextType" : "variable",
          "element" : "dateTime",
          "variable" : "consentDateTime",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "dateTime"
          }]
        }],
        "dependent" : [{
          "name" : "TSDateTime",
          "variable" : ["effectiveTime", "consentDateTime"]
        }]
      },
      {
        "name" : "dateLow",
        "source" : [{
          "context" : "effectiveTime",
          "element" : "low",
          "variable" : "low"
        }],
        "target" : [{
          "context" : "consent",
          "contextType" : "variable",
          "element" : "dateTime",
          "variable" : "consentDateTime",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "dateTime"
          }]
        }],
        "dependent" : [{
          "name" : "TSDateTime",
          "variable" : ["low", "consentDateTime"]
        }]
      }]
    },
    {
      "name" : "provision",
      "source" : [{
        "context" : "directiveObservation"
      }],
      "target" : [{
        "context" : "consent",
        "contextType" : "variable",
        "element" : "provision",
        "variable" : "provision"
      }],
      "rule" : [{
        "name" : "provisionCode",
        "source" : [{
          "context" : "directiveObservation",
          "element" : "code",
          "variable" : "directiveCode"
        }],
        "target" : [{
          "context" : "provision",
          "contextType" : "variable",
          "element" : "code",
          "variable" : "provisionCode",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "CodeableConcept"
          }]
        }],
        "dependent" : [{
          "name" : "CDCodeableConcept",
          "variable" : ["directiveCode", "provisionCode"]
        }]
      },
      {
        "name" : "provisionType",
        "source" : [{
          "context" : "directiveObservation",
          "element" : "value",
          "variable" : "directiveValue"
        }],
        "rule" : [{
          "name" : "trueToPermit",
          "source" : [{
            "context" : "directiveValue",
            "element" : "value",
            "variable" : "value",
            "condition" : "value = 'true'"
          }],
          "target" : [{
            "context" : "provision",
            "contextType" : "variable",
            "element" : "type",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "permit"
            }]
          }]
        },
        {
          "name" : "falseToDeny",
          "source" : [{
            "context" : "directiveValue",
            "element" : "value",
            "variable" : "value",
            "condition" : "value = 'false'"
          }],
          "target" : [{
            "context" : "provision",
            "contextType" : "variable",
            "element" : "type",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "deny"
            }]
          }]
        }]
      }]
    },
    {
      "name" : "externalReference",
      "source" : [{
        "context" : "directiveObservation",
        "element" : "reference",
        "variable" : "reference"
      }],
      "rule" : [{
        "name" : "externalDocument",
        "source" : [{
          "context" : "reference",
          "element" : "externalDocument",
          "variable" : "externalDocument"
        }],
        "rule" : [{
          "name" : "externalText",
          "source" : [{
            "context" : "externalDocument",
            "element" : "text",
            "variable" : "externalText"
          }],
          "rule" : [{
            "name" : "externalReference",
            "source" : [{
              "context" : "externalText",
              "element" : "reference",
              "variable" : "externalReference"
            }],
            "rule" : [{
              "name" : "sourceAttachment",
              "source" : [{
                "context" : "externalReference",
                "element" : "value",
                "variable" : "externalUrl"
              }],
              "target" : [{
                "context" : "consent",
                "contextType" : "variable",
                "element" : "source",
                "variable" : "sourceAttachment",
                "transform" : "create",
                "parameter" : [{
                  "valueString" : "Attachment"
                }]
              }],
              "rule" : [{
                "name" : "sourceAttachmentUrl",
                "source" : [{
                  "context" : "externalUrl"
                }],
                "target" : [{
                  "context" : "sourceAttachment",
                  "contextType" : "variable",
                  "element" : "url",
                  "transform" : "cast",
                  "parameter" : [{
                    "valueId" : "externalUrl"
                  },
                  {
                    "valueString" : "url"
                  }]
                }]
              }]
            }]
          }]
        }]
      }]
    },
    {
      "name" : "entryRelationship",
      "source" : [{
        "context" : "directiveObservation",
        "element" : "entryRelationship",
        "variable" : "entryRelationship"
      }],
      "rule" : [{
        "name" : "sourceAttachment",
        "source" : [{
          "context" : "entryRelationship",
          "element" : "observationMedia",
          "variable" : "observationMedia"
        }],
        "target" : [{
          "context" : "consent",
          "contextType" : "variable",
          "element" : "source",
          "variable" : "sourceAttachment",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Attachment"
          }]
        }],
        "dependent" : [{
          "name" : "AdvanceDirectiveAttachmentFromObservationMedia",
          "variable" : ["observationMedia", "sourceAttachment"]
        }]
      },
      {
        "name" : "commentAct",
        "source" : [{
          "context" : "entryRelationship",
          "element" : "act",
          "variable" : "commentAct",
          "condition" : "entryRelationship.typeCode = 'SUBJ'"
        }],
        "rule" : [{
          "name" : "commentTemplate",
          "source" : [{
            "context" : "commentAct",
            "element" : "templateId",
            "variable" : "commentTid"
          }],
          "rule" : [{
            "name" : "commentNotMapped",
            "source" : [{
              "context" : "commentTid",
              "element" : "root",
              "variable" : "commentRoot",
              "condition" : "commentRoot = '1.2.250.1.213.1.1.3.32'"
            }]
          }]
        }]
      }]
    },
    {
      "name" : "sectionEntry",
      "source" : [{
        "context" : "directiveObservation"
      }],
      "target" : [{
        "context" : "compSection",
        "contextType" : "variable",
        "element" : "entry",
        "variable" : "sectionRef",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Reference"
        }]
      },
      {
        "context" : "sectionRef",
        "contextType" : "variable",
        "element" : "reference",
        "transform" : "evaluate",
        "parameter" : [{
          "valueString" : "'urn:uuid:' + %consent.id"
        }]
      }]
    }]
  },
  {
    "name" : "AdvanceDirectiveAttachmentFromObservationMedia",
    "typeMode" : "none",
    "documentation" : "observationMedia CDA -> Consent.sourceAttachment",
    "input" : [{
      "name" : "observationMedia",
      "mode" : "source"
    },
    {
      "name" : "sourceAttachment",
      "type" : "Attachment",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "mediaValue",
      "source" : [{
        "context" : "observationMedia",
        "element" : "value",
        "variable" : "mediaValue"
      }],
      "rule" : [{
        "name" : "contentType",
        "source" : [{
          "context" : "mediaValue",
          "element" : "mediaType",
          "variable" : "mediaType"
        }],
        "target" : [{
          "context" : "sourceAttachment",
          "contextType" : "variable",
          "element" : "contentType",
          "transform" : "cast",
          "parameter" : [{
            "valueId" : "mediaType"
          },
          {
            "valueString" : "string"
          }]
        }]
      },
      {
        "name" : "data",
        "source" : [{
          "context" : "mediaValue",
          "element" : "xmlText",
          "variable" : "rawData"
        }],
        "target" : [{
          "context" : "sourceAttachment",
          "contextType" : "variable",
          "element" : "data",
          "transform" : "cast",
          "parameter" : [{
            "valueId" : "rawData"
          },
          {
            "valueString" : "base64Binary"
          }]
        }]
      },
      {
        "name" : "mediaReference",
        "source" : [{
          "context" : "mediaValue",
          "element" : "reference",
          "variable" : "mediaReference"
        }],
        "rule" : [{
          "name" : "url",
          "source" : [{
            "context" : "mediaReference",
            "element" : "value",
            "variable" : "mediaUrl"
          }],
          "target" : [{
            "context" : "sourceAttachment",
            "contextType" : "variable",
            "element" : "url",
            "transform" : "cast",
            "parameter" : [{
              "valueId" : "mediaUrl"
            },
            {
              "valueString" : "url"
            }]
          }]
        }]
      }]
    }]
  }]
}

```
