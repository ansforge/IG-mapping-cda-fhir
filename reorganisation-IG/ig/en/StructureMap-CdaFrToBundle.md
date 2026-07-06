# Mapping CDA-FR vers FHIR - Socle enrichi français - POC - Mapping CDA to FHIR v0.1.0

## StructureMap: Mapping CDA-FR vers FHIR - Socle enrichi français 

 
Mapping CDA-FR vers FHIR - Socle enrichi français 



## Resource Content

```json
{
  "resourceType" : "StructureMap",
  "id" : "CdaFrToBundle",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/StructureMap/CdaFrToBundle",
  "version" : "0.1.0",
  "name" : "CdaFrToBundle",
  "title" : "Mapping CDA-FR vers FHIR - Socle enrichi français",
  "status" : "draft",
  "date" : "2026-07-06T08:36:02+00:00",
  "publisher" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
  "contact" : [{
    "name" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
    "telecom" : [{
      "system" : "url",
      "value" : "https://esante.gouv.fr"
    }]
  }],
  "description" : "Mapping CDA-FR vers FHIR - Socle enrichi français",
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
    "url" : "http://hl7.org/cda/stds/core/StructureDefinition/PN|2.0.0-sd",
    "mode" : "source",
    "alias" : "PN"
  },
  {
    "url" : "http://hl7.org/cda/stds/core/StructureDefinition/II|2.0.0-sd",
    "mode" : "source",
    "alias" : "II"
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
    "url" : "http://hl7.org/fhir/StructureDefinition/HumanName|4.0.1",
    "mode" : "target",
    "alias" : "HumanName"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/Extension|4.0.1",
    "mode" : "target",
    "alias" : "Extension"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/Address|4.0.1",
    "mode" : "target",
    "alias" : "Address"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/Coding|4.0.1",
    "mode" : "target",
    "alias" : "Coding"
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
    "url" : "http://hl7.org/fhir/StructureDefinition/Meta|4.0.1",
    "mode" : "target",
    "alias" : "Meta"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/code|4.0.1",
    "mode" : "target",
    "alias" : "code"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/string|4.0.1",
    "mode" : "target",
    "alias" : "string"
  }],
  "import" : ["https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/StructureMap/CdaToFHIRTypes",
  "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/StructureMap/CdaToBundle"],
  "group" : [{
    "name" : "TransformClinicalDocumentToFrenchFHIRDocument",
    "typeMode" : "none",
    "documentation" : "GROUPE D’ENTRÉE — CRÉATION DU SOCLE FRANÇAIS\n   Ce groupe crée le Bundle final de l’étape 3 avec Composition et Patient.\n   Les autres ressources administratives sont créées dans les groupes CDA qui\n   les justifient, afin d’éviter les ressources optionnelles vides",
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
        "name" : "OrchestrateClinicalDocumentFrenchTransformation",
        "variable" : ["cda", "patient", "composition", "bundle"]
      }]
    }]
  },
  {
    "name" : "OrchestrateClinicalDocumentFrenchTransformation",
    "typeMode" : "none",
    "documentation" : "GROUPE D’ORCHESTRATION — SOCLE GÉNÉRIQUE + ENRICHISSEMENT FRANÇAIS\n   Ce groupe suit la structure du ClinicalDocument CDA.\n   Il appelle d’abord le traitement français de l’en-tête, où chaque ressource\n   optionnelle est créée dans le groupe correspondant au bloc CDA. Il appelle\n   ensuite le corps générique de l’étape 2 pour créer les sections narratives",
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
      "name" : "body",
      "source" : [{
        "context" : "cda"
      }],
      "dependent" : [{
        "name" : "MapClinicalDocumentBody",
        "variable" : ["cda", "composition", "bundle", "patient"]
      }]
    }]
  },
  {
    "name" : "MapClinicalDocumentHeaderWithFrenchRules",
    "typeMode" : "none",
    "documentation" : "GROUPE — EN-TÊTE CDA AVEC RÈGLES FRANÇAISES\n   Ce groupe reprend l’organisation de l’en-tête CDA. Les ressources optionnelles\n   sont créées dans les sous-groupes correspondant aux blocs CDA, puis remplies\n   avec les groupes génériques de l’étape 2 et enrichies avec les groupes français",
    "input" : [{
      "name" : "cda",
      "type" : "ClinicalDocument",
      "mode" : "source"
    },
    {
      "name" : "bundle",
      "type" : "Bundle",
      "mode" : "target"
    },
    {
      "name" : "composition",
      "type" : "Composition",
      "mode" : "target"
    },
    {
      "name" : "patient",
      "type" : "Patient",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "bundleMetaProfile",
      "source" : [{
        "context" : "cda"
      }],
      "target" : [{
        "context" : "bundle",
        "contextType" : "variable",
        "element" : "meta",
        "variable" : "bundleMeta"
      }],
      "rule" : [{
        "name" : "bundleEUEPSProfile",
        "source" : [{
          "context" : "cda"
        }],
        "target" : [{
          "context" : "bundleMeta",
          "contextType" : "variable",
          "element" : "profile",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "http://hl7.eu/fhir/eps/StructureDefinition/bundle-eu-eps"
          }]
        }]
      }]
    },
    {
      "name" : "compositionMetaProfile",
      "source" : [{
        "context" : "cda"
      }],
      "target" : [{
        "context" : "composition",
        "contextType" : "variable",
        "element" : "meta",
        "variable" : "compositionMeta"
      }],
      "rule" : [{
        "name" : "compositionEUEPSProfile",
        "source" : [{
          "context" : "cda"
        }],
        "target" : [{
          "context" : "compositionMeta",
          "contextType" : "variable",
          "element" : "profile",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "http://hl7.eu/fhir/eps/StructureDefinition/composition-eu-eps"
          }]
        }]
      }]
    },
    {
      "name" : "documentIdentity",
      "source" : [{
        "context" : "cda"
      }],
      "dependent" : [{
        "name" : "MapHeaderDocumentIdentity",
        "variable" : ["cda", "bundle", "composition"]
      }]
    },
    {
      "name" : "documentDescription",
      "source" : [{
        "context" : "cda"
      }],
      "dependent" : [{
        "name" : "MapHeaderDocumentDescription",
        "variable" : ["cda", "composition", "patient"]
      }]
    },
    {
      "name" : "recordTargetBase",
      "source" : [{
        "context" : "cda"
      }],
      "dependent" : [{
        "name" : "MapHeaderRecordTarget",
        "variable" : ["cda", "patient", "composition"]
      }]
    },
    {
      "name" : "recordTargetFR",
      "source" : [{
        "context" : "cda",
        "element" : "recordTarget",
        "variable" : "recordTarget"
      }],
      "rule" : [{
        "name" : "patientFR",
        "source" : [{
          "context" : "recordTarget",
          "element" : "patientRole",
          "variable" : "patientRole"
        }],
        "dependent" : [{
          "name" : "MapCDARecordTargetToFrenchPatient",
          "variable" : ["patientRole", "patient"]
        }]
      }]
    },
    {
      "name" : "custodian",
      "source" : [{
        "context" : "cda"
      }],
      "dependent" : [{
        "name" : "MapHeaderCustodianWithFrenchRules",
        "variable" : ["cda", "composition", "bundle"]
      }]
    },
    {
      "name" : "author",
      "source" : [{
        "context" : "cda"
      }],
      "dependent" : [{
        "name" : "MapHeaderAuthorWithFrenchRules",
        "variable" : ["cda", "composition", "bundle"]
      }]
    },
    {
      "name" : "legalAuthenticator",
      "source" : [{
        "context" : "cda"
      }],
      "dependent" : [{
        "name" : "MapHeaderLegalAuthenticatorWithFrenchRules",
        "variable" : ["cda", "composition", "bundle"]
      }]
    },
    {
      "name" : "documentationOf",
      "source" : [{
        "context" : "cda"
      }],
      "dependent" : [{
        "name" : "MapHeaderDocumentationOf",
        "variable" : ["cda", "composition"]
      }]
    },
    {
      "name" : "encounterContext",
      "source" : [{
        "context" : "cda"
      }],
      "dependent" : [{
        "name" : "MapHeaderEncounterContextWithFrenchRules",
        "variable" : ["cda", "composition", "bundle", "patient"]
      }]
    },
    {
      "name" : "emergencyContact",
      "source" : [{
        "context" : "cda"
      }],
      "dependent" : [{
        "name" : "MapHeaderEmergencyContactWithFrenchRules",
        "variable" : ["cda", "bundle", "patient"]
      }]
    },
    {
      "name" : "trustedPerson",
      "source" : [{
        "context" : "cda"
      }],
      "dependent" : [{
        "name" : "MapHeaderTrustedPersonWithFrenchRules",
        "variable" : ["cda", "bundle", "patient"]
      }]
    },
    {
      "name" : "guardian",
      "source" : [{
        "context" : "cda"
      }],
      "dependent" : [{
        "name" : "MapHeaderGuardianWithFrenchRules",
        "variable" : ["cda", "bundle", "patient"]
      }]
    },
    {
      "name" : "relatedDocument",
      "source" : [{
        "context" : "cda"
      }],
      "dependent" : [{
        "name" : "MapHeaderRelatedDocument",
        "variable" : ["cda", "composition"]
      }]
    }]
  },
  {
    "name" : "MapHeaderCustodianWithFrenchRules",
    "typeMode" : "none",
    "documentation" : "CDA custodian -> création Organization + socle générique + enrichissement français",
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
    }],
    "rule" : [{
      "name" : "custodian",
      "source" : [{
        "context" : "src",
        "element" : "custodian",
        "variable" : "custodian"
      }],
      "rule" : [{
        "name" : "assignedCustodian",
        "source" : [{
          "context" : "custodian",
          "element" : "assignedCustodian",
          "variable" : "assignedCustodian"
        }],
        "rule" : [{
          "name" : "custodianOrganizationResource",
          "source" : [{
            "context" : "assignedCustodian",
            "element" : "representedCustodianOrganization",
            "variable" : "representedOrg"
          }],
          "target" : [{
            "context" : "bundle",
            "contextType" : "variable",
            "element" : "entry",
            "variable" : "custodianOrgEntry"
          },
          {
            "context" : "custodianOrgEntry",
            "contextType" : "variable",
            "element" : "resource",
            "variable" : "custodianOrganization",
            "transform" : "create",
            "parameter" : [{
              "valueString" : "Organization"
            }]
          },
          {
            "context" : "custodianOrganization",
            "contextType" : "variable",
            "element" : "id",
            "transform" : "uuid"
          },
          {
            "context" : "custodianOrgEntry",
            "contextType" : "variable",
            "element" : "fullUrl",
            "transform" : "evaluate",
            "parameter" : [{
              "valueString" : "'urn:uuid:' + %custodianOrganization.id"
            }]
          }],
          "rule" : [{
            "name" : "custodianOrganizationBase",
            "source" : [{
              "context" : "representedOrg"
            }],
            "dependent" : [{
              "name" : "MapCDAOrganizationToOrganization",
              "variable" : ["representedOrg", "custodianOrganization"]
            }]
          },
          {
            "name" : "custodianOrganizationFR",
            "source" : [{
              "context" : "representedOrg"
            }],
            "dependent" : [{
              "name" : "MapCDAOrganizationToFrenchOrganization",
              "variable" : ["representedOrg", "custodianOrganization"]
            }]
          },
          {
            "name" : "custodianRef",
            "source" : [{
              "context" : "representedOrg"
            }],
            "target" : [{
              "context" : "composition",
              "contextType" : "variable",
              "element" : "custodian",
              "variable" : "custodianRef",
              "transform" : "create",
              "parameter" : [{
                "valueString" : "Reference"
              }]
            },
            {
              "context" : "custodianRef",
              "contextType" : "variable",
              "element" : "reference",
              "transform" : "evaluate",
              "parameter" : [{
                "valueString" : "'urn:uuid:' + %custodianOrganization.id"
              }]
            }]
          }]
        }]
      }]
    }]
  },
  {
    "name" : "MapHeaderAuthorWithFrenchRules",
    "typeMode" : "none",
    "documentation" : "CDA author -> création Practitioner / Organization / PractitionerRole + enrichissement français",
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
    }],
    "rule" : [{
      "name" : "author",
      "source" : [{
        "context" : "src",
        "element" : "author",
        "variable" : "author"
      }],
      "rule" : [{
        "name" : "authorPractitionerResource",
        "source" : [{
          "context" : "author",
          "element" : "assignedAuthor",
          "variable" : "assignedAuthor"
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
          "variable" : "authorPractitioner",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Practitioner"
          }]
        },
        {
          "context" : "authorPractitioner",
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
            "valueString" : "'urn:uuid:' + %authorPractitioner.id"
          }]
        }],
        "rule" : [{
          "name" : "authorPractitionerBase",
          "source" : [{
            "context" : "assignedAuthor"
          }],
          "dependent" : [{
            "name" : "MapCDAAssignedEntityToPractitioner",
            "variable" : ["assignedAuthor", "authorPractitioner"]
          }]
        },
        {
          "name" : "authorPractitionerFR",
          "source" : [{
            "context" : "assignedAuthor"
          }],
          "dependent" : [{
            "name" : "MapCDAAssignedEntityToFrenchPractitioner",
            "variable" : ["assignedAuthor", "authorPractitioner"]
          }]
        },
        {
          "name" : "authorWithOrganization",
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
            "variable" : "authorOrganization",
            "transform" : "create",
            "parameter" : [{
              "valueString" : "Organization"
            }]
          },
          {
            "context" : "authorOrganization",
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
              "valueString" : "'urn:uuid:' + %authorOrganization.id"
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
            "variable" : "authorRole",
            "transform" : "create",
            "parameter" : [{
              "valueString" : "PractitionerRole"
            }]
          },
          {
            "context" : "authorRole",
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
              "valueString" : "'urn:uuid:' + %authorRole.id"
            }]
          }],
          "rule" : [{
            "name" : "authorOrganizationBase",
            "source" : [{
              "context" : "representedOrganization"
            }],
            "dependent" : [{
              "name" : "MapCDAOrganizationToOrganization",
              "variable" : ["representedOrganization", "authorOrganization"]
            }]
          },
          {
            "name" : "authorOrganizationFR",
            "source" : [{
              "context" : "representedOrganization"
            }],
            "dependent" : [{
              "name" : "MapCDAOrganizationToFrenchOrganization",
              "variable" : ["representedOrganization", "authorOrganization"]
            }]
          },
          {
            "name" : "authorRoleBase",
            "source" : [{
              "context" : "assignedAuthor"
            }],
            "dependent" : [{
              "name" : "MapCDAAssignedEntityToPractitionerRole",
              "variable" : ["assignedAuthor",
              "authorRole",
              "authorPractitioner",
              "authorOrganization"]
            }]
          },
          {
            "name" : "authorRoleFR",
            "source" : [{
              "context" : "assignedAuthor"
            }],
            "dependent" : [{
              "name" : "MapCDAAssignedEntityToFrenchPractitionerRole",
              "variable" : ["assignedAuthor",
              "authorRole",
              "authorPractitioner",
              "authorOrganization"]
            }]
          },
          {
            "name" : "compositionAuthorRoleRef",
            "source" : [{
              "context" : "assignedAuthor"
            }],
            "target" : [{
              "context" : "composition",
              "contextType" : "variable",
              "element" : "author",
              "variable" : "authorRef"
            },
            {
              "context" : "authorRef",
              "contextType" : "variable",
              "element" : "reference",
              "transform" : "evaluate",
              "parameter" : [{
                "valueString" : "'urn:uuid:' + %authorRole.id"
              }]
            }]
          }]
        },
        {
          "name" : "compositionAuthorPractitionerRef",
          "source" : [{
            "context" : "assignedAuthor",
            "condition" : "assignedAuthor.representedOrganization.empty()"
          }],
          "target" : [{
            "context" : "composition",
            "contextType" : "variable",
            "element" : "author",
            "variable" : "authorRef"
          },
          {
            "context" : "authorRef",
            "contextType" : "variable",
            "element" : "reference",
            "transform" : "evaluate",
            "parameter" : [{
              "valueString" : "'urn:uuid:' + %authorPractitioner.id"
            }]
          }]
        }]
      }]
    }]
  },
  {
    "name" : "MapHeaderLegalAuthenticatorWithFrenchRules",
    "typeMode" : "none",
    "documentation" : "CDA legalAuthenticator -> création Practitioner / Organization / PractitionerRole + enrichissement français",
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
    }],
    "rule" : [{
      "name" : "legalAuthenticator",
      "source" : [{
        "context" : "src",
        "element" : "legalAuthenticator",
        "variable" : "legalAuthenticator"
      }],
      "rule" : [{
        "name" : "legalPractitionerResource",
        "source" : [{
          "context" : "legalAuthenticator",
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
          "variable" : "legalPractitioner",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Practitioner"
          }]
        },
        {
          "context" : "legalPractitioner",
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
            "valueString" : "'urn:uuid:' + %legalPractitioner.id"
          }]
        }],
        "rule" : [{
          "name" : "legalPractitionerBase",
          "source" : [{
            "context" : "assignedEntity"
          }],
          "dependent" : [{
            "name" : "MapCDAAssignedEntityToPractitioner",
            "variable" : ["assignedEntity", "legalPractitioner"]
          }]
        },
        {
          "name" : "legalPractitionerFR",
          "source" : [{
            "context" : "assignedEntity"
          }],
          "dependent" : [{
            "name" : "MapCDAAssignedEntityToFrenchPractitioner",
            "variable" : ["assignedEntity", "legalPractitioner"]
          }]
        },
        {
          "name" : "attester",
          "source" : [{
            "context" : "legalAuthenticator"
          }],
          "target" : [{
            "context" : "composition",
            "contextType" : "variable",
            "element" : "attester",
            "variable" : "attester"
          }],
          "rule" : [{
            "name" : "mode",
            "source" : [{
              "context" : "legalAuthenticator"
            }],
            "target" : [{
              "context" : "attester",
              "contextType" : "variable",
              "element" : "mode",
              "transform" : "copy",
              "parameter" : [{
                "valueString" : "legal"
              }]
            }]
          },
          {
            "name" : "time",
            "source" : [{
              "context" : "legalAuthenticator",
              "element" : "time",
              "variable" : "time"
            }],
            "target" : [{
              "context" : "attester",
              "contextType" : "variable",
              "element" : "time",
              "variable" : "dt",
              "transform" : "create",
              "parameter" : [{
                "valueString" : "dateTime"
              }]
            }],
            "dependent" : [{
              "name" : "TSDateTime",
              "variable" : ["time", "dt"]
            }]
          },
          {
            "name" : "legalWithOrganization",
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
              "variable" : "legalOrganization",
              "transform" : "create",
              "parameter" : [{
                "valueString" : "Organization"
              }]
            },
            {
              "context" : "legalOrganization",
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
                "valueString" : "'urn:uuid:' + %legalOrganization.id"
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
              "variable" : "legalRole",
              "transform" : "create",
              "parameter" : [{
                "valueString" : "PractitionerRole"
              }]
            },
            {
              "context" : "legalRole",
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
                "valueString" : "'urn:uuid:' + %legalRole.id"
              }]
            }],
            "rule" : [{
              "name" : "legalOrganizationBase",
              "source" : [{
                "context" : "representedOrganization"
              }],
              "dependent" : [{
                "name" : "MapCDAOrganizationToOrganization",
                "variable" : ["representedOrganization", "legalOrganization"]
              }]
            },
            {
              "name" : "legalOrganizationFR",
              "source" : [{
                "context" : "representedOrganization"
              }],
              "dependent" : [{
                "name" : "MapCDAOrganizationToFrenchOrganization",
                "variable" : ["representedOrganization", "legalOrganization"]
              }]
            },
            {
              "name" : "legalRoleBase",
              "source" : [{
                "context" : "assignedEntity"
              }],
              "dependent" : [{
                "name" : "MapCDAAssignedEntityToPractitionerRole",
                "variable" : ["assignedEntity",
                "legalRole",
                "legalPractitioner",
                "legalOrganization"]
              }]
            },
            {
              "name" : "legalRoleFR",
              "source" : [{
                "context" : "assignedEntity"
              }],
              "dependent" : [{
                "name" : "MapCDAAssignedEntityToFrenchPractitionerRole",
                "variable" : ["assignedEntity",
                "legalRole",
                "legalPractitioner",
                "legalOrganization"]
              }]
            },
            {
              "name" : "partyRole",
              "source" : [{
                "context" : "assignedEntity"
              }],
              "target" : [{
                "context" : "attester",
                "contextType" : "variable",
                "element" : "party",
                "variable" : "partyRef",
                "transform" : "create",
                "parameter" : [{
                  "valueString" : "Reference"
                }]
              },
              {
                "context" : "partyRef",
                "contextType" : "variable",
                "element" : "reference",
                "transform" : "evaluate",
                "parameter" : [{
                  "valueString" : "'urn:uuid:' + %legalRole.id"
                }]
              }]
            }]
          },
          {
            "name" : "partyPractitioner",
            "source" : [{
              "context" : "assignedEntity",
              "condition" : "assignedEntity.representedOrganization.empty()"
            }],
            "target" : [{
              "context" : "attester",
              "contextType" : "variable",
              "element" : "party",
              "variable" : "partyRef",
              "transform" : "create",
              "parameter" : [{
                "valueString" : "Reference"
              }]
            },
            {
              "context" : "partyRef",
              "contextType" : "variable",
              "element" : "reference",
              "transform" : "evaluate",
              "parameter" : [{
                "valueString" : "'urn:uuid:' + %legalPractitioner.id"
              }]
            }]
          }]
        }]
      }]
    }]
  },
  {
    "name" : "MapHeaderEncounterContextWithFrenchRules",
    "typeMode" : "none",
    "documentation" : "CDA componentOf.encompassingEncounter -> création Encounter / Location / Organization + enrichissement français",
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
      "name" : "componentOf",
      "source" : [{
        "context" : "src",
        "element" : "componentOf",
        "variable" : "componentOf"
      }],
      "rule" : [{
        "name" : "encounterResource",
        "source" : [{
          "context" : "componentOf",
          "element" : "encompassingEncounter",
          "variable" : "encompassingEncounter"
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
          "variable" : "encounter",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Encounter"
          }]
        },
        {
          "context" : "encounter",
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
            "valueString" : "'urn:uuid:' + %encounter.id"
          }]
        }],
        "rule" : [{
          "name" : "compositionEncounterRef",
          "source" : [{
            "context" : "encompassingEncounter"
          }],
          "target" : [{
            "context" : "composition",
            "contextType" : "variable",
            "element" : "encounter",
            "variable" : "encRef",
            "transform" : "create",
            "parameter" : [{
              "valueString" : "Reference"
            }]
          },
          {
            "context" : "encRef",
            "contextType" : "variable",
            "element" : "reference",
            "transform" : "evaluate",
            "parameter" : [{
              "valueString" : "'urn:uuid:' + %encounter.id"
            }]
          }]
        },
        {
          "name" : "location",
          "source" : [{
            "context" : "encompassingEncounter",
            "element" : "location",
            "variable" : "srcLocation"
          }],
          "rule" : [{
            "name" : "facilityResources",
            "source" : [{
              "context" : "srcLocation",
              "element" : "healthCareFacility",
              "variable" : "facility"
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
            },
            {
              "context" : "bundle",
              "contextType" : "variable",
              "element" : "entry",
              "variable" : "facilityOrganizationEntry"
            },
            {
              "context" : "facilityOrganizationEntry",
              "contextType" : "variable",
              "element" : "resource",
              "variable" : "facilityOrganization",
              "transform" : "create",
              "parameter" : [{
                "valueString" : "Organization"
              }]
            },
            {
              "context" : "facilityOrganization",
              "contextType" : "variable",
              "element" : "id",
              "transform" : "uuid"
            },
            {
              "context" : "facilityOrganizationEntry",
              "contextType" : "variable",
              "element" : "fullUrl",
              "transform" : "evaluate",
              "parameter" : [{
                "valueString" : "'urn:uuid:' + %facilityOrganization.id"
              }]
            }],
            "rule" : [{
              "name" : "encounterContextFR",
              "source" : [{
                "context" : "encompassingEncounter"
              }],
              "dependent" : [{
                "name" : "MapCDAEncounterContextToFrenchResources",
                "variable" : ["encompassingEncounter",
                "facility",
                "encounter",
                "patient",
                "location",
                "facilityOrganization"]
              }]
            }]
          }]
        },
        {
          "name" : "encounterOnlyFR",
          "source" : [{
            "context" : "encompassingEncounter",
            "condition" : "encompassingEncounter.location.empty()"
          }],
          "dependent" : [{
            "name" : "MapCDAEncounterOnlyToFrenchResources",
            "variable" : ["encompassingEncounter", "encounter", "patient"]
          }]
        },
        {
          "name" : "encounterOnlyFRWithoutFacility",
          "source" : [{
            "context" : "encompassingEncounter",
            "element" : "location",
            "variable" : "srcLocation",
            "condition" : "srcLocation.healthCareFacility.empty()"
          }],
          "dependent" : [{
            "name" : "MapCDAEncounterOnlyToFrenchResources",
            "variable" : ["encompassingEncounter", "encounter", "patient"]
          }]
        }]
      }]
    }]
  },
  {
    "name" : "MapHeaderEmergencyContactWithFrenchRules",
    "typeMode" : "none",
    "documentation" : "CDA informant ECON -> création RelatedPerson + enrichissement français",
    "input" : [{
      "name" : "src",
      "type" : "ClinicalDocument",
      "mode" : "source"
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
      "name" : "informant",
      "source" : [{
        "context" : "src",
        "element" : "informant",
        "variable" : "informant"
      }],
      "rule" : [{
        "name" : "relatedPersonECON",
        "source" : [{
          "context" : "informant",
          "element" : "relatedEntity",
          "variable" : "relatedEntity",
          "condition" : "relatedEntity.classCode = 'ECON'"
        }],
        "target" : [{
          "context" : "bundle",
          "contextType" : "variable",
          "element" : "entry",
          "variable" : "relatedPersonEntry"
        },
        {
          "context" : "relatedPersonEntry",
          "contextType" : "variable",
          "element" : "resource",
          "variable" : "emergencyContactRelatedPerson",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "RelatedPerson"
          }]
        },
        {
          "context" : "emergencyContactRelatedPerson",
          "contextType" : "variable",
          "element" : "id",
          "transform" : "uuid"
        },
        {
          "context" : "relatedPersonEntry",
          "contextType" : "variable",
          "element" : "fullUrl",
          "transform" : "evaluate",
          "parameter" : [{
            "valueString" : "'urn:uuid:' + %emergencyContactRelatedPerson.id"
          }]
        }],
        "rule" : [{
          "name" : "relatedPersonBase",
          "source" : [{
            "context" : "relatedEntity"
          }],
          "dependent" : [{
            "name" : "MapCDARelatedEntityToRelatedPerson",
            "variable" : ["relatedEntity", "emergencyContactRelatedPerson", "patient"]
          }]
        },
        {
          "name" : "relatedPersonFR",
          "source" : [{
            "context" : "relatedEntity"
          }],
          "dependent" : [{
            "name" : "MapCDAInformantToFrenchRelatedPerson",
            "variable" : ["relatedEntity", "emergencyContactRelatedPerson", "patient"]
          }]
        }]
      }]
    }]
  },
  {
    "name" : "MapHeaderTrustedPersonWithFrenchRules",
    "typeMode" : "none",
    "documentation" : "CDA informant NOK -> création RelatedPerson + enrichissement français",
    "input" : [{
      "name" : "src",
      "type" : "ClinicalDocument",
      "mode" : "source"
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
      "name" : "informant",
      "source" : [{
        "context" : "src",
        "element" : "informant",
        "variable" : "informant"
      }],
      "rule" : [{
        "name" : "relatedPersonNOK",
        "source" : [{
          "context" : "informant",
          "element" : "relatedEntity",
          "variable" : "relatedEntity",
          "condition" : "relatedEntity.classCode = 'NOK'"
        }],
        "target" : [{
          "context" : "bundle",
          "contextType" : "variable",
          "element" : "entry",
          "variable" : "relatedPersonEntry"
        },
        {
          "context" : "relatedPersonEntry",
          "contextType" : "variable",
          "element" : "resource",
          "variable" : "trustedPersonRelatedPerson",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "RelatedPerson"
          }]
        },
        {
          "context" : "trustedPersonRelatedPerson",
          "contextType" : "variable",
          "element" : "id",
          "transform" : "uuid"
        },
        {
          "context" : "relatedPersonEntry",
          "contextType" : "variable",
          "element" : "fullUrl",
          "transform" : "evaluate",
          "parameter" : [{
            "valueString" : "'urn:uuid:' + %trustedPersonRelatedPerson.id"
          }]
        }],
        "rule" : [{
          "name" : "relatedPersonBase",
          "source" : [{
            "context" : "relatedEntity"
          }],
          "dependent" : [{
            "name" : "MapCDARelatedEntityToRelatedPerson",
            "variable" : ["relatedEntity", "trustedPersonRelatedPerson", "patient"]
          }]
        },
        {
          "name" : "relatedPersonFR",
          "source" : [{
            "context" : "relatedEntity"
          }],
          "dependent" : [{
            "name" : "MapCDAInformantToFrenchRelatedPerson",
            "variable" : ["relatedEntity", "trustedPersonRelatedPerson", "patient"]
          }]
        }]
      }]
    }]
  },
  {
    "name" : "MapHeaderGuardianWithFrenchRules",
    "typeMode" : "none",
    "documentation" : "CDA guardian -> création RelatedPerson + enrichissement français",
    "input" : [{
      "name" : "src",
      "type" : "ClinicalDocument",
      "mode" : "source"
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
      "name" : "recordTarget",
      "source" : [{
        "context" : "src",
        "element" : "recordTarget",
        "variable" : "recordTarget"
      }],
      "rule" : [{
        "name" : "patientRole",
        "source" : [{
          "context" : "recordTarget",
          "element" : "patientRole",
          "variable" : "patientRole"
        }],
        "rule" : [{
          "name" : "patient",
          "source" : [{
            "context" : "patientRole",
            "element" : "patient",
            "variable" : "patientCda"
          }],
          "rule" : [{
            "name" : "guardianResource",
            "source" : [{
              "context" : "patientCda",
              "element" : "guardian",
              "variable" : "guardian"
            }],
            "target" : [{
              "context" : "bundle",
              "contextType" : "variable",
              "element" : "entry",
              "variable" : "guardianEntry"
            },
            {
              "context" : "guardianEntry",
              "contextType" : "variable",
              "element" : "resource",
              "variable" : "guardianRelatedPerson",
              "transform" : "create",
              "parameter" : [{
                "valueString" : "RelatedPerson"
              }]
            },
            {
              "context" : "guardianRelatedPerson",
              "contextType" : "variable",
              "element" : "id",
              "transform" : "uuid"
            },
            {
              "context" : "guardianEntry",
              "contextType" : "variable",
              "element" : "fullUrl",
              "transform" : "evaluate",
              "parameter" : [{
                "valueString" : "'urn:uuid:' + %guardianRelatedPerson.id"
              }]
            }],
            "rule" : [{
              "name" : "patientRef",
              "source" : [{
                "context" : "guardian"
              }],
              "target" : [{
                "context" : "guardianRelatedPerson",
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
              "name" : "identifier",
              "source" : [{
                "context" : "guardian",
                "element" : "id",
                "variable" : "id"
              }],
              "target" : [{
                "context" : "guardianRelatedPerson",
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
              "name" : "address",
              "source" : [{
                "context" : "guardian",
                "element" : "addr",
                "variable" : "addr"
              }],
              "target" : [{
                "context" : "guardianRelatedPerson",
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
                "context" : "guardian",
                "element" : "telecom",
                "variable" : "telecom"
              }],
              "target" : [{
                "context" : "guardianRelatedPerson",
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
              "name" : "guardianPerson",
              "source" : [{
                "context" : "guardian",
                "element" : "guardianPerson",
                "variable" : "guardianPerson"
              }],
              "rule" : [{
                "name" : "name",
                "source" : [{
                  "context" : "guardianPerson",
                  "element" : "name",
                  "variable" : "name"
                }],
                "target" : [{
                  "context" : "guardianRelatedPerson",
                  "contextType" : "variable",
                  "element" : "name",
                  "variable" : "humanName",
                  "transform" : "create",
                  "parameter" : [{
                    "valueString" : "HumanName"
                  }]
                }],
                "dependent" : [{
                  "name" : "ENHumanName",
                  "variable" : ["name", "humanName"]
                }]
              }]
            },
            {
              "name" : "guardianFR",
              "source" : [{
                "context" : "guardian"
              }],
              "dependent" : [{
                "name" : "MapCDAGuardianToFrenchRelatedPerson",
                "variable" : ["guardian", "guardianRelatedPerson", "patient"]
              }]
            }]
          }]
        }]
      }]
    }]
  },
  {
    "name" : "MapCDARecordTargetToFrenchPatient",
    "typeMode" : "none",
    "input" : [{
      "name" : "src",
      "type" : "PatientRole",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "Patient",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "meta",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "meta",
        "variable" : "meta"
      }],
      "rule" : [{
        "name" : "patientINSProfile",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "meta",
          "contextType" : "variable",
          "element" : "profile",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-patient-ins"
          }]
        }]
      }]
    },
    {
      "name" : "patientDataFR",
      "source" : [{
        "context" : "src",
        "element" : "patient",
        "variable" : "patient"
      }],
      "rule" : [{
        "name" : "officialName",
        "source" : [{
          "context" : "patient",
          "element" : "name",
          "variable" : "patientName"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "name",
          "variable" : "officialName",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "HumanName"
          }]
        }],
        "dependent" : [{
          "name" : "MapCDAPatientNameToFrenchOfficialName",
          "variable" : ["patientName", "officialName"]
        }]
      },
      {
        "name" : "birthPlace",
        "source" : [{
          "context" : "patient",
          "element" : "birthplace",
          "variable" : "birthplace"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "extension",
          "variable" : "birthPlaceExt",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Extension"
          }]
        }],
        "dependent" : [{
          "name" : "MapCDABirthPlaceToFHIRPatientExtension",
          "variable" : ["birthplace", "birthPlaceExt"]
        }]
      }]
    },
    {
      "name" : "insIdentifiers",
      "source" : [{
        "context" : "src",
        "element" : "id",
        "variable" : "id"
      }],
      "dependent" : [{
        "name" : "MapCDAIIToPatientINSIdentifiers",
        "variable" : ["id", "tgt"]
      }]
    },
    {
      "name" : "otherIdentifiers",
      "source" : [{
        "context" : "src",
        "element" : "id",
        "variable" : "id"
      }],
      "dependent" : [{
        "name" : "MapCDAIIToPatientOtherIdentifiers",
        "variable" : ["id", "tgt"]
      }]
    },
    {
      "name" : "identityReliabilityNIR",
      "source" : [{
        "context" : "src",
        "element" : "id",
        "variable" : "id",
        "condition" : "id.root = '1.2.250.1.213.1.4.8'"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "extension",
        "variable" : "identityReliability",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Extension"
        }]
      }],
      "dependent" : [{
        "name" : "MapCDAIIToIdentityReliabilityVALI",
        "variable" : ["id", "identityReliability"]
      }]
    },
    {
      "name" : "identityReliabilityNIA",
      "source" : [{
        "context" : "src",
        "element" : "id",
        "variable" : "id",
        "condition" : "id.root = '1.2.250.1.213.1.4.9'"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "extension",
        "variable" : "identityReliability",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Extension"
        }]
      }],
      "dependent" : [{
        "name" : "MapCDAIIToIdentityReliabilityVALI",
        "variable" : ["id", "identityReliability"]
      }]
    },
    {
      "name" : "identityReliabilityNIRTest",
      "source" : [{
        "context" : "src",
        "element" : "id",
        "variable" : "id",
        "condition" : "id.root = '1.2.250.1.213.1.4.10'"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "extension",
        "variable" : "identityReliability",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Extension"
        }]
      }],
      "dependent" : [{
        "name" : "MapCDAIIToIdentityReliabilityVALI",
        "variable" : ["id", "identityReliability"]
      }]
    },
    {
      "name" : "identityReliabilityNIRDemo",
      "source" : [{
        "context" : "src",
        "element" : "id",
        "variable" : "id",
        "condition" : "id.root = '1.2.250.1.213.1.4.11'"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "extension",
        "variable" : "identityReliability",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Extension"
        }]
      }],
      "dependent" : [{
        "name" : "MapCDAIIToIdentityReliabilityVALI",
        "variable" : ["id", "identityReliability"]
      }]
    }]
  },
  {
    "name" : "MapCDAPatientNameToFrenchOfficialName",
    "typeMode" : "none",
    "documentation" : "CDA PN patient.name -> FHIR HumanName officiel",
    "input" : [{
      "name" : "src",
      "type" : "PN",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "HumanName",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "use",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "use",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "official"
        }]
      }]
    },
    {
      "name" : "items",
      "source" : [{
        "context" : "src",
        "element" : "item",
        "variable" : "item"
      }],
      "rule" : [{
        "name" : "family",
        "source" : [{
          "context" : "item",
          "element" : "family",
          "variable" : "family",
          "condition" : "family.qualifier = 'BR'"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "family",
          "transform" : "evaluate",
          "parameter" : [{
            "valueString" : "family.xmlText"
          }]
        }]
      },
      {
        "name" : "given",
        "source" : [{
          "context" : "item",
          "element" : "given",
          "variable" : "given",
          "condition" : "given.qualifier = 'BR'"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "given",
          "transform" : "evaluate",
          "parameter" : [{
            "valueString" : "given.xmlText"
          }]
        }]
      },
      {
        "name" : "birthListGivenName",
        "source" : [{
          "context" : "item",
          "element" : "given",
          "variable" : "givenList",
          "condition" : "givenList.qualifier.empty()"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "extension",
          "variable" : "ext",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Extension"
          }]
        }],
        "dependent" : [{
          "name" : "MapCDAGivenNameToBirthListGivenNameExtension",
          "variable" : ["givenList", "ext"]
        }]
      }]
    }]
  },
  {
    "name" : "MapCDAGivenNameToBirthListGivenNameExtension",
    "typeMode" : "none",
    "documentation" : "CDA given sans qualifier -> FHIR extension liste des prénoms de naissance",
    "input" : [{
      "name" : "src",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "Extension",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "url",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "url",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-patient-birth-list-given-name"
        }]
      }]
    },
    {
      "name" : "valueString",
      "source" : [{
        "context" : "src",
        "element" : "xmlText",
        "variable" : "txt"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "value",
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
    "name" : "MapCDABirthPlaceToFHIRPatientExtension",
    "typeMode" : "none",
    "documentation" : "CDA patient.birthplace -> FHIR Patient.extension birthPlace",
    "input" : [{
      "name" : "src",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "Extension",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "url",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "url",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "http://hl7.org/fhir/StructureDefinition/patient-birthPlace"
        }]
      }]
    },
    {
      "name" : "valueAddress",
      "source" : [{
        "context" : "src",
        "element" : "place",
        "variable" : "place"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "value",
        "variable" : "addr",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Address"
        }]
      }],
      "rule" : [{
        "name" : "baseAddress",
        "source" : [{
          "context" : "place",
          "element" : "addr",
          "variable" : "placeAddr"
        }],
        "dependent" : [{
          "name" : "ADAddress",
          "variable" : ["placeAddr", "addr"]
        }]
      },
      {
        "name" : "county",
        "source" : [{
          "context" : "place",
          "element" : "addr",
          "variable" : "placeAddr"
        }],
        "rule" : [{
          "name" : "item",
          "source" : [{
            "context" : "placeAddr",
            "element" : "item",
            "variable" : "item"
          }],
          "rule" : [{
            "name" : "inseeCodeExtension",
            "source" : [{
              "context" : "item",
              "element" : "county",
              "variable" : "insee"
            }],
            "target" : [{
              "context" : "addr",
              "contextType" : "variable",
              "element" : "extension",
              "variable" : "inseeExt",
              "transform" : "create",
              "parameter" : [{
                "valueString" : "Extension"
              }]
            }],
            "rule" : [{
              "name" : "url",
              "source" : [{
                "context" : "insee"
              }],
              "target" : [{
                "context" : "inseeExt",
                "contextType" : "variable",
                "element" : "url",
                "transform" : "copy",
                "parameter" : [{
                  "valueString" : "https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-address-insee-code"
                }]
              }]
            },
            {
              "name" : "valueCoding",
              "source" : [{
                "context" : "insee",
                "element" : "xmlText",
                "variable" : "txt"
              }],
              "target" : [{
                "context" : "inseeExt",
                "contextType" : "variable",
                "element" : "value",
                "variable" : "coding",
                "transform" : "create",
                "parameter" : [{
                  "valueString" : "Coding"
                }]
              }],
              "rule" : [{
                "name" : "code",
                "source" : [{
                  "context" : "txt"
                }],
                "target" : [{
                  "context" : "coding",
                  "contextType" : "variable",
                  "element" : "code",
                  "transform" : "cast",
                  "parameter" : [{
                    "valueId" : "txt"
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
    }]
  },
  {
    "name" : "MapCDAIIToPatientINSIdentifiers",
    "typeMode" : "none",
    "documentation" : "IDENTIFIANTS PATIENT FR\r\nCDA II patientRole.id -> FHIR Patient.identifier INS",
    "input" : [{
      "name" : "src",
      "type" : "II",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "Patient",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "INSNIR",
      "source" : [{
        "context" : "src",
        "condition" : "src.root = '1.2.250.1.213.1.4.8'"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "identifier",
        "variable" : "id",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Identifier"
        }]
      }],
      "dependent" : [{
        "name" : "MapCDAIIToINSNIRIdentifier",
        "variable" : ["src", "id"]
      }]
    },
    {
      "name" : "INSNIA",
      "source" : [{
        "context" : "src",
        "condition" : "src.root = '1.2.250.1.213.1.4.9'"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "identifier",
        "variable" : "id",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Identifier"
        }]
      }],
      "dependent" : [{
        "name" : "MapCDAIIToINSNIAIdentifier",
        "variable" : ["src", "id"]
      }]
    },
    {
      "name" : "INSNIRTEST",
      "source" : [{
        "context" : "src",
        "condition" : "src.root = '1.2.250.1.213.1.4.10'"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "identifier",
        "variable" : "id",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Identifier"
        }]
      }],
      "dependent" : [{
        "name" : "MapCDAIIToINSNIRTestIdentifier",
        "variable" : ["src", "id"]
      }]
    },
    {
      "name" : "INSNIRDEMO",
      "source" : [{
        "context" : "src",
        "condition" : "src.root = '1.2.250.1.213.1.4.11'"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "identifier",
        "variable" : "id",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Identifier"
        }]
      }],
      "dependent" : [{
        "name" : "MapCDAIIToINSNIRDemoIdentifier",
        "variable" : ["src", "id"]
      }]
    }]
  },
  {
    "name" : "MapCDAIIToINSNIRIdentifier",
    "typeMode" : "none",
    "documentation" : "CDA II INS-NIR -> FHIR Identifier INS-NIR",
    "input" : [{
      "name" : "src",
      "type" : "II",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "Identifier",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "base",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable"
      }],
      "dependent" : [{
        "name" : "II",
        "variable" : ["src", "tgt"]
      }]
    },
    {
      "name" : "use",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "use",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "official"
        }]
      }]
    },
    {
      "name" : "type",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "type",
        "variable" : "idType",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "rule" : [{
        "name" : "coding",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "idType",
          "contextType" : "variable",
          "element" : "coding",
          "variable" : "idCoding",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Coding"
          }]
        }],
        "rule" : [{
          "name" : "system",
          "source" : [{
            "context" : "src"
          }],
          "target" : [{
            "context" : "idCoding",
            "contextType" : "variable",
            "element" : "system",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "https://hl7.fr/ig/fhir/core/CodeSystem/fr-core-cs-v2-0203"
            }]
          }]
        },
        {
          "name" : "code",
          "source" : [{
            "context" : "src"
          }],
          "target" : [{
            "context" : "idCoding",
            "contextType" : "variable",
            "element" : "code",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "INS-NIR"
            }]
          }]
        }]
      }]
    }]
  },
  {
    "name" : "MapCDAIIToINSNIAIdentifier",
    "typeMode" : "none",
    "documentation" : "CDA II INS-NIA -> FHIR Identifier INS-NIA",
    "input" : [{
      "name" : "src",
      "type" : "II",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "Identifier",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "base",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable"
      }],
      "dependent" : [{
        "name" : "II",
        "variable" : ["src", "tgt"]
      }]
    },
    {
      "name" : "use",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "use",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "official"
        }]
      }]
    },
    {
      "name" : "type",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "type",
        "variable" : "idType",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "rule" : [{
        "name" : "coding",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "idType",
          "contextType" : "variable",
          "element" : "coding",
          "variable" : "idCoding",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Coding"
          }]
        }],
        "rule" : [{
          "name" : "system",
          "source" : [{
            "context" : "src"
          }],
          "target" : [{
            "context" : "idCoding",
            "contextType" : "variable",
            "element" : "system",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "https://hl7.fr/ig/fhir/core/CodeSystem/fr-core-cs-v2-0203"
            }]
          }]
        },
        {
          "name" : "code",
          "source" : [{
            "context" : "src"
          }],
          "target" : [{
            "context" : "idCoding",
            "contextType" : "variable",
            "element" : "code",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "INS-NIA"
            }]
          }]
        }]
      }]
    }]
  },
  {
    "name" : "MapCDAIIToINSNIRTestIdentifier",
    "typeMode" : "none",
    "documentation" : "CDA II INS-NIR-TEST -> FHIR Identifier INS-NIR-TEST",
    "input" : [{
      "name" : "src",
      "type" : "II",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "Identifier",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "base",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable"
      }],
      "dependent" : [{
        "name" : "II",
        "variable" : ["src", "tgt"]
      }]
    },
    {
      "name" : "use",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "use",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "official"
        }]
      }]
    },
    {
      "name" : "type",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "type",
        "variable" : "idType",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "rule" : [{
        "name" : "coding",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "idType",
          "contextType" : "variable",
          "element" : "coding",
          "variable" : "idCoding",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Coding"
          }]
        }],
        "rule" : [{
          "name" : "system",
          "source" : [{
            "context" : "src"
          }],
          "target" : [{
            "context" : "idCoding",
            "contextType" : "variable",
            "element" : "system",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "https://hl7.fr/ig/fhir/core/CodeSystem/fr-core-cs-v2-0203"
            }]
          }]
        },
        {
          "name" : "code",
          "source" : [{
            "context" : "src"
          }],
          "target" : [{
            "context" : "idCoding",
            "contextType" : "variable",
            "element" : "code",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "INS-NIR-TEST"
            }]
          }]
        }]
      }]
    }]
  },
  {
    "name" : "MapCDAIIToINSNIRDemoIdentifier",
    "typeMode" : "none",
    "documentation" : "CDA II INS-NIR-DEMO -> FHIR Identifier INS-NIR-DEMO",
    "input" : [{
      "name" : "src",
      "type" : "II",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "Identifier",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "base",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable"
      }],
      "dependent" : [{
        "name" : "II",
        "variable" : ["src", "tgt"]
      }]
    },
    {
      "name" : "use",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "use",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "official"
        }]
      }]
    },
    {
      "name" : "type",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "type",
        "variable" : "idType",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "rule" : [{
        "name" : "coding",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "idType",
          "contextType" : "variable",
          "element" : "coding",
          "variable" : "idCoding",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Coding"
          }]
        }],
        "rule" : [{
          "name" : "system",
          "source" : [{
            "context" : "src"
          }],
          "target" : [{
            "context" : "idCoding",
            "contextType" : "variable",
            "element" : "system",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "https://hl7.fr/ig/fhir/core/CodeSystem/fr-core-cs-v2-0203"
            }]
          }]
        },
        {
          "name" : "code",
          "source" : [{
            "context" : "src"
          }],
          "target" : [{
            "context" : "idCoding",
            "contextType" : "variable",
            "element" : "code",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "INS-NIR-DEMO"
            }]
          }]
        }]
      }]
    }]
  },
  {
    "name" : "MapCDAIIToPatientOtherIdentifiers",
    "typeMode" : "none",
    "documentation" : "CDA II hors INS -> FHIR Patient.identifier PI",
    "input" : [{
      "name" : "src",
      "type" : "II",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "Patient",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "otherIdentifier",
      "source" : [{
        "context" : "src",
        "condition" : "(src.root != '1.2.250.1.213.1.4.8') and (src.root != '1.2.250.1.213.1.4.9') and (src.root != '1.2.250.1.213.1.4.10') and (src.root != '1.2.250.1.213.1.4.11')"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "identifier",
        "variable" : "id",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Identifier"
        }]
      }],
      "dependent" : [{
        "name" : "MapCDAIIToPatientPIIdentifier",
        "variable" : ["src", "id"]
      }]
    }]
  },
  {
    "name" : "MapCDAIIToPatientPIIdentifier",
    "typeMode" : "none",
    "documentation" : "CDA II hors INS -> FHIR Identifier PI",
    "input" : [{
      "name" : "src",
      "type" : "II",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "Identifier",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "base",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable"
      }],
      "dependent" : [{
        "name" : "II",
        "variable" : ["src", "tgt"]
      }]
    },
    {
      "name" : "use",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "use",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "usual"
        }]
      }]
    },
    {
      "name" : "type",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "type",
        "variable" : "idType",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "rule" : [{
        "name" : "coding",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "idType",
          "contextType" : "variable",
          "element" : "coding",
          "variable" : "idCoding",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Coding"
          }]
        }],
        "rule" : [{
          "name" : "system",
          "source" : [{
            "context" : "src"
          }],
          "target" : [{
            "context" : "idCoding",
            "contextType" : "variable",
            "element" : "system",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "http://terminology.hl7.org/CodeSystem/v2-0203"
            }]
          }]
        },
        {
          "name" : "code",
          "source" : [{
            "context" : "src"
          }],
          "target" : [{
            "context" : "idCoding",
            "contextType" : "variable",
            "element" : "code",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "PI"
            }]
          }]
        },
        {
          "name" : "display",
          "source" : [{
            "context" : "src"
          }],
          "target" : [{
            "context" : "idCoding",
            "contextType" : "variable",
            "element" : "display",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "Patient internal identifier"
            }]
          }]
        }]
      }]
    }]
  },
  {
    "name" : "MapCDAIIToIdentityReliabilityVALI",
    "typeMode" : "none",
    "documentation" : "CDA II INS reconnu -> FHIR Patient.extension fiabilité VALI",
    "input" : [{
      "name" : "src",
      "type" : "II",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "Extension",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "url",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "url",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-identity-reliability"
        }]
      }]
    },
    {
      "name" : "identityStatus",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "extension",
        "variable" : "statusExt",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Extension"
        }]
      }],
      "rule" : [{
        "name" : "statusUrl",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "statusExt",
          "contextType" : "variable",
          "element" : "url",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "identityStatus"
          }]
        }]
      },
      {
        "name" : "valueCoding",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "statusExt",
          "contextType" : "variable",
          "element" : "value",
          "variable" : "coding",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Coding"
          }]
        }],
        "rule" : [{
          "name" : "system",
          "source" : [{
            "context" : "src"
          }],
          "target" : [{
            "context" : "coding",
            "contextType" : "variable",
            "element" : "system",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "https://hl7.fr/ig/fhir/core/CodeSystem/fr-core-v2-0445"
            }]
          }]
        },
        {
          "name" : "code",
          "source" : [{
            "context" : "src"
          }],
          "target" : [{
            "context" : "coding",
            "contextType" : "variable",
            "element" : "code",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "VALI"
            }]
          }]
        }]
      }]
    }]
  },
  {
    "name" : "MapCDAOrganizationToFrenchOrganization",
    "typeMode" : "none",
    "documentation" : "ORGANIZATION FR\r\nCDA organization-like element -> FHIR Organization profils et identifiants français",
    "input" : [{
      "name" : "src",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "Organization",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "meta",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "meta",
        "variable" : "metaBlock"
      }],
      "rule" : [{
        "name" : "frCoreOrganizationProfile",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "metaBlock",
          "contextType" : "variable",
          "element" : "profile",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-organization"
          }]
        }]
      },
      {
        "name" : "asOrganizationProfile",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "metaBlock",
          "contextType" : "variable",
          "element" : "profile",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "https://interop.esante.gouv.fr/ig/fhir/annuaire/StructureDefinition/as-organization"
          }]
        }]
      }]
    },
    {
      "name" : "identifiers",
      "source" : [{
        "context" : "src",
        "element" : "id",
        "variable" : "id"
      }],
      "dependent" : [{
        "name" : "MapCDAIIToFrenchOrganizationIdentifiers",
        "variable" : ["id", "tgt"]
      }]
    }]
  },
  {
    "name" : "MapCDAHealthCareFacilityToFrenchOrganization",
    "typeMode" : "none",
    "documentation" : "CDA healthCareFacility -> FHIR Organization facility française",
    "input" : [{
      "name" : "src",
      "type" : "HealthCareFacility",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "Organization",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "serviceProviderOrganizationFR",
      "source" : [{
        "context" : "src",
        "element" : "serviceProviderOrganization",
        "variable" : "serviceProviderOrganization"
      }],
      "dependent" : [{
        "name" : "MapCDAOrganizationToFrenchOrganization",
        "variable" : ["serviceProviderOrganization", "tgt"]
      }]
    },
    {
      "name" : "facilityIdentifiers",
      "source" : [{
        "context" : "src",
        "element" : "id",
        "variable" : "id"
      }],
      "dependent" : [{
        "name" : "MapCDAIIToFrenchOrganizationIdentifiers",
        "variable" : ["id", "tgt"]
      }]
    },
    {
      "name" : "facilityFR",
      "source" : [{
        "context" : "src",
        "condition" : "src.serviceProviderOrganization.empty()"
      }],
      "dependent" : [{
        "name" : "MapCDAOrganizationToFrenchOrganization",
        "variable" : ["src", "tgt"]
      }]
    },
    {
      "name" : "facilityOrganizationNameAbsentReason",
      "source" : [{
        "context" : "src",
        "condition" : "src.id.empty() and src.serviceProviderOrganization.empty()"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "name",
        "variable" : "nameString",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "string"
        }]
      }],
      "rule" : [{
        "name" : "dataAbsentReason",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "nameString",
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
      "name" : "serviceProviderOrganizationNameAbsentReason",
      "source" : [{
        "context" : "src",
        "element" : "serviceProviderOrganization",
        "variable" : "serviceProviderOrganization",
        "condition" : "serviceProviderOrganization.name.empty() and serviceProviderOrganization.id.empty()"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "name",
        "variable" : "nameString",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "string"
        }]
      }],
      "rule" : [{
        "name" : "dataAbsentReason",
        "source" : [{
          "context" : "serviceProviderOrganization"
        }],
        "target" : [{
          "context" : "nameString",
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
            "context" : "serviceProviderOrganization"
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
            "context" : "serviceProviderOrganization"
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
    "name" : "MapCDAIIToFrenchOrganizationIdentifiers",
    "typeMode" : "none",
    "documentation" : "CDA II organization.id -> FHIR Organization.identifier français",
    "input" : [{
      "name" : "src",
      "type" : "II",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "Organization",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "idNatSt",
      "source" : [{
        "context" : "src",
        "condition" : "src.root = '1.2.250.1.71.4.2.2'"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "identifier",
        "variable" : "idNatStIdentifier",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Identifier"
        }]
      }],
      "dependent" : [{
        "name" : "MapCDAIIToIdNatStIdentifier",
        "variable" : ["src", "idNatStIdentifier"]
      }]
    },
    {
      "name" : "snr",
      "source" : [{
        "context" : "src",
        "condition" : "src.root = '1.2.250.1.213.4.1'"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "identifier",
        "variable" : "snrIdentifier",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Identifier"
        }]
      }],
      "dependent" : [{
        "name" : "MapCDAIIToSNRIdentifier",
        "variable" : ["src", "snrIdentifier"]
      }]
    },
    {
      "name" : "cofrac",
      "source" : [{
        "context" : "src",
        "condition" : "src.root = '1.2.250.1.213.6.3.1'"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "identifier",
        "variable" : "cofracIdentifier",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Identifier"
        }]
      }],
      "dependent" : [{
        "name" : "MapCDAIIToCOFRACIdentifier",
        "variable" : ["src", "cofracIdentifier"]
      }]
    }]
  },
  {
    "name" : "MapCDAIIToIdNatStIdentifier",
    "typeMode" : "none",
    "documentation" : "CDA II IdNatSt -> FHIR Identifier",
    "input" : [{
      "name" : "src",
      "type" : "II",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "Identifier",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "base",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable"
      }],
      "dependent" : [{
        "name" : "II",
        "variable" : ["src", "tgt"]
      }]
    }]
  },
  {
    "name" : "MapCDAIIToSNRIdentifier",
    "typeMode" : "none",
    "documentation" : "CDA II SNR -> FHIR Identifier",
    "input" : [{
      "name" : "src",
      "type" : "II",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "Identifier",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "system",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "system",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "urn:oid:1.2.250.1.213.4.1"
        }]
      }]
    },
    {
      "name" : "valueFromExtension",
      "source" : [{
        "context" : "src",
        "element" : "extension",
        "variable" : "extension"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "value",
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
      "name" : "defaultValue",
      "source" : [{
        "context" : "src",
        "condition" : "src.extension.empty()"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "value",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "DMP-SNR"
        }]
      }]
    }]
  },
  {
    "name" : "MapCDAIIToCOFRACIdentifier",
    "typeMode" : "none",
    "documentation" : "CDA II COFRAC -> FHIR Identifier",
    "input" : [{
      "name" : "src",
      "type" : "II",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "Identifier",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "base",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable"
      }],
      "dependent" : [{
        "name" : "II",
        "variable" : ["src", "tgt"]
      }]
    },
    {
      "name" : "assigner",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "assigner",
        "variable" : "assigner"
      }],
      "rule" : [{
        "name" : "assignerDisplay",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "assigner",
          "contextType" : "variable",
          "element" : "display",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "COFRAC"
          }]
        }]
      }]
    }]
  },
  {
    "name" : "MapCDAAssignedEntityToFrenchPractitioner",
    "typeMode" : "none",
    "documentation" : "PRACTITIONER / PRACTITIONERROLE FR\r\nCDA assignedEntity-like element -> FHIR Practitioner français",
    "input" : [{
      "name" : "src",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "Practitioner",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "meta",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "meta",
        "variable" : "metaBlock"
      }],
      "rule" : [{
        "name" : "asPractitioner",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "metaBlock",
          "contextType" : "variable",
          "element" : "profile",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "https://interop.esante.gouv.fr/ig/fhir/annuaire/StructureDefinition/as-practitioner"
          }]
        }]
      }]
    },
    {
      "name" : "identifiers",
      "source" : [{
        "context" : "src",
        "element" : "id",
        "variable" : "id"
      }],
      "dependent" : [{
        "name" : "MapCDAIIToFrenchPractitionerIdentifiers",
        "variable" : ["id", "tgt"]
      }]
    },
    {
      "name" : "qualification",
      "source" : [{
        "context" : "src",
        "element" : "code",
        "variable" : "roleCode"
      }],
      "dependent" : [{
        "name" : "MapCDACodeToPractitionerQualification",
        "variable" : ["roleCode", "tgt"]
      }]
    }]
  },
  {
    "name" : "MapCDAIIToFrenchPractitionerIdentifiers",
    "typeMode" : "none",
    "documentation" : "CDA II assignedEntity.id -> FHIR Practitioner.identifier français",
    "input" : [{
      "name" : "src",
      "type" : "II",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "Practitioner",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "idNatPs",
      "source" : [{
        "context" : "src",
        "condition" : "src.root = '1.2.250.1.71.4.2.1'"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "identifier",
        "variable" : "idNatPsIdentifier",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Identifier"
        }]
      }],
      "dependent" : [{
        "name" : "MapCDAIIToIDNPSIdentifier",
        "variable" : ["src", "idNatPsIdentifier"]
      }]
    }]
  },
  {
    "name" : "MapCDAIIToIDNPSIdentifier",
    "typeMode" : "none",
    "documentation" : "CDA II IDNPS -> FHIR Identifier IDNPS",
    "input" : [{
      "name" : "src",
      "type" : "II",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "Identifier",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "base",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable"
      }],
      "dependent" : [{
        "name" : "II",
        "variable" : ["src", "tgt"]
      }]
    },
    {
      "name" : "use",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "use",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "official"
        }]
      }]
    },
    {
      "name" : "type",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "type",
        "variable" : "idType",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "rule" : [{
        "name" : "coding",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "idType",
          "contextType" : "variable",
          "element" : "coding",
          "variable" : "idCoding",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Coding"
          }]
        }],
        "rule" : [{
          "name" : "system",
          "source" : [{
            "context" : "src"
          }],
          "target" : [{
            "context" : "idCoding",
            "contextType" : "variable",
            "element" : "system",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "https://hl7.fr/ig/fhir/core/CodeSystem/fr-core-cs-v2-0203"
            }]
          }]
        },
        {
          "name" : "code",
          "source" : [{
            "context" : "src"
          }],
          "target" : [{
            "context" : "idCoding",
            "contextType" : "variable",
            "element" : "code",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "IDNPS"
            }]
          }]
        }]
      }]
    }]
  },
  {
    "name" : "MapCDACodeToPractitionerQualification",
    "typeMode" : "none",
    "documentation" : "CDA assignedEntity.code -> FHIR Practitioner.qualification.code",
    "input" : [{
      "name" : "roleCode",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "Practitioner",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "qualification",
      "source" : [{
        "context" : "roleCode"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "qualification",
        "variable" : "qualification"
      }],
      "rule" : [{
        "name" : "qualificationCode",
        "source" : [{
          "context" : "roleCode"
        }],
        "target" : [{
          "context" : "qualification",
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
          "variable" : ["roleCode", "cc"]
        }]
      }]
    }]
  },
  {
    "name" : "MapCDAAssignedEntityToFrenchPractitionerRole",
    "typeMode" : "none",
    "documentation" : "CDA assignedEntity-like element -> FHIR PractitionerRole français",
    "input" : [{
      "name" : "src",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "PractitionerRole",
      "mode" : "target"
    },
    {
      "name" : "practitioner",
      "type" : "Practitioner",
      "mode" : "target"
    },
    {
      "name" : "organization",
      "type" : "Organization",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "meta",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "meta",
        "variable" : "metaBlock"
      }],
      "rule" : [{
        "name" : "profile",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "metaBlock",
          "contextType" : "variable",
          "element" : "profile",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "https://interop.esante.gouv.fr/ig/fhir/annuaire/StructureDefinition/as-practitionerrole"
          }]
        }]
      }]
    },
    {
      "name" : "rppsRang",
      "source" : [{
        "context" : "src",
        "element" : "id",
        "variable" : "id",
        "condition" : "id.root = '1.2.250.1.213.1.6.4.3'"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "identifier",
        "variable" : "identifier",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Identifier"
        }]
      }],
      "dependent" : [{
        "name" : "MapCDAIIToRPPSRangIdentifier",
        "variable" : ["id", "identifier"]
      }]
    }]
  },
  {
    "name" : "MapCDAIIToRPPSRangIdentifier",
    "typeMode" : "none",
    "documentation" : "CDA II RPPS rang -> FHIR Identifier",
    "input" : [{
      "name" : "src",
      "type" : "II",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "Identifier",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "base",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable"
      }],
      "dependent" : [{
        "name" : "II",
        "variable" : ["src", "tgt"]
      }]
    },
    {
      "name" : "use",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "use",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "usual"
        }]
      }]
    }]
  },
  {
    "name" : "MapCDAEncounterContextToFrenchResources",
    "typeMode" : "none",
    "documentation" : "ENCOUNTER / LOCATION / FACILITY FR\r\nCDA encompassingEncounter + healthCareFacility -> FHIR Encounter / Location / Organization génériques + français",
    "input" : [{
      "name" : "encompassingEncounter",
      "type" : "EncompassingEncounter",
      "mode" : "source"
    },
    {
      "name" : "facility",
      "type" : "HealthCareFacility",
      "mode" : "source"
    },
    {
      "name" : "encounter",
      "type" : "Encounter",
      "mode" : "target"
    },
    {
      "name" : "patient",
      "type" : "Patient",
      "mode" : "target"
    },
    {
      "name" : "location",
      "type" : "Location",
      "mode" : "target"
    },
    {
      "name" : "facilityOrganization",
      "type" : "Organization",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "encounterBase",
      "source" : [{
        "context" : "encompassingEncounter"
      }],
      "dependent" : [{
        "name" : "MapCDAEncompassingEncounterToEncounter",
        "variable" : ["encompassingEncounter", "encounter", "patient"]
      }]
    },
    {
      "name" : "encounterFR",
      "source" : [{
        "context" : "encompassingEncounter"
      }],
      "dependent" : [{
        "name" : "MapCDAEncompassingEncounterToFrenchEncounter",
        "variable" : ["encompassingEncounter", "encounter", "patient"]
      }]
    },
    {
      "name" : "facilityBase",
      "source" : [{
        "context" : "facility"
      }],
      "dependent" : [{
        "name" : "MapCDAHealthCareFacilityToLocationContext",
        "variable" : ["facility", "encounter", "location", "facilityOrganization"]
      }]
    },
    {
      "name" : "locationFR",
      "source" : [{
        "context" : "facility"
      }],
      "dependent" : [{
        "name" : "MapCDAHealthCareFacilityToFrenchLocation",
        "variable" : ["facility", "location", "facilityOrganization"]
      }]
    },
    {
      "name" : "facilityOrganizationFR",
      "source" : [{
        "context" : "facility"
      }],
      "dependent" : [{
        "name" : "MapCDAHealthCareFacilityToFrenchOrganization",
        "variable" : ["facility", "facilityOrganization"]
      }]
    }]
  },
  {
    "name" : "MapCDAEncounterOnlyToFrenchResources",
    "typeMode" : "none",
    "documentation" : "CDA encompassingEncounter -> FHIR Encounter français\r\nENCOUNTER FR SANS HEALTHCAREFACILITY\r\nCDA encompassingEncounter seul -> FHIR Encounter générique + français",
    "input" : [{
      "name" : "encompassingEncounter",
      "type" : "EncompassingEncounter",
      "mode" : "source"
    },
    {
      "name" : "encounter",
      "type" : "Encounter",
      "mode" : "target"
    },
    {
      "name" : "patient",
      "type" : "Patient",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "encounterBase",
      "source" : [{
        "context" : "encompassingEncounter"
      }],
      "dependent" : [{
        "name" : "MapCDAEncompassingEncounterToEncounter",
        "variable" : ["encompassingEncounter", "encounter", "patient"]
      }]
    },
    {
      "name" : "encounterFR",
      "source" : [{
        "context" : "encompassingEncounter"
      }],
      "dependent" : [{
        "name" : "MapCDAEncompassingEncounterToFrenchEncounter",
        "variable" : ["encompassingEncounter", "encounter", "patient"]
      }]
    }]
  },
  {
    "name" : "MapCDAEncompassingEncounterToFrenchEncounter",
    "typeMode" : "none",
    "input" : [{
      "name" : "src",
      "type" : "EncompassingEncounter",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "Encounter",
      "mode" : "target"
    },
    {
      "name" : "patient",
      "type" : "Patient",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "meta",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "meta",
        "variable" : "metaBlock"
      }],
      "rule" : [{
        "name" : "profile",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "metaBlock",
          "contextType" : "variable",
          "element" : "profile",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-encounter"
          }]
        }]
      }]
    },
    {
      "name" : "encounterType",
      "source" : [{
        "context" : "src",
        "element" : "code",
        "variable" : "srcCode"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "type",
        "variable" : "cc",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "rule" : [{
        "name" : "coding",
        "source" : [{
          "context" : "srcCode",
          "element" : "code",
          "variable" : "code"
        }],
        "target" : [{
          "context" : "cc",
          "contextType" : "variable",
          "element" : "coding",
          "variable" : "coding",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Coding"
          }]
        }],
        "rule" : [{
          "name" : "typeSystem",
          "source" : [{
            "context" : "code"
          }],
          "target" : [{
            "context" : "coding",
            "contextType" : "variable",
            "element" : "system",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "https://mos.esante.gouv.fr/NOS/TRE_R304-HL7v3ActCode/FHIR/TRE-R304-HL7v3ActCode"
            }]
          }]
        },
        {
          "name" : "typeCode",
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
          "name" : "typeDisplay",
          "source" : [{
            "context" : "srcCode",
            "element" : "displayName",
            "variable" : "display"
          }],
          "target" : [{
            "context" : "coding",
            "contextType" : "variable",
            "element" : "display",
            "transform" : "cast",
            "parameter" : [{
              "valueId" : "display"
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
    "name" : "MapCDAHealthCareFacilityToFrenchLocation",
    "typeMode" : "none",
    "documentation" : "CDA healthCareFacility -> FHIR Location française",
    "input" : [{
      "name" : "src",
      "type" : "HealthCareFacility",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "Location",
      "mode" : "target"
    },
    {
      "name" : "facilityOrganization",
      "type" : "Organization",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "meta",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "meta",
        "variable" : "metaBlock"
      }],
      "rule" : [{
        "name" : "frCoreLocationProfile",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "metaBlock",
          "contextType" : "variable",
          "element" : "profile",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-location"
          }]
        }]
      },
      {
        "name" : "asLocationProfile",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "metaBlock",
          "contextType" : "variable",
          "element" : "profile",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "https://interop.esante.gouv.fr/ig/fhir/annuaire/StructureDefinition/as-location"
          }]
        }]
      }]
    },
    {
      "name" : "facilityLocation",
      "source" : [{
        "context" : "src",
        "element" : "location",
        "variable" : "facilityLocation"
      }],
      "rule" : [{
        "name" : "locationName",
        "source" : [{
          "context" : "facilityLocation",
          "element" : "name",
          "variable" : "locName"
        }],
        "rule" : [{
          "name" : "locationName",
          "source" : [{
            "context" : "locName",
            "element" : "item",
            "variable" : "item"
          }],
          "target" : [{
            "context" : "tgt",
            "contextType" : "variable",
            "element" : "name",
            "transform" : "evaluate",
            "parameter" : [{
              "valueString" : "item.xmlText"
            }]
          }]
        }]
      }]
    },
    {
      "name" : "locationNameAbsentReasonNoLocation",
      "source" : [{
        "context" : "src",
        "condition" : "src.location.empty()"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "name",
        "variable" : "nameString",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "string"
        }]
      }],
      "rule" : [{
        "name" : "dataAbsentReason",
        "source" : [{
          "context" : "src"
        }],
        "target" : [{
          "context" : "nameString",
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
      "name" : "locationNameAbsentReasonNoName",
      "source" : [{
        "context" : "src",
        "element" : "location",
        "variable" : "facilityLocation",
        "condition" : "facilityLocation.name.empty()"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "name",
        "variable" : "nameString",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "string"
        }]
      }],
      "rule" : [{
        "name" : "dataAbsentReason",
        "source" : [{
          "context" : "facilityLocation"
        }],
        "target" : [{
          "context" : "nameString",
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
            "context" : "facilityLocation"
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
            "context" : "facilityLocation"
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
      "name" : "locationType",
      "source" : [{
        "context" : "src",
        "element" : "code",
        "variable" : "srcCode"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "type",
        "variable" : "cc",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "rule" : [{
        "name" : "coding",
        "source" : [{
          "context" : "srcCode",
          "element" : "code",
          "variable" : "code"
        }],
        "target" : [{
          "context" : "cc",
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
            "context" : "code"
          }],
          "target" : [{
            "context" : "coding",
            "contextType" : "variable",
            "element" : "system",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "https://mos.esante.gouv.fr/NOS/TRE_R02-SecteurActivite/FHIR/TRE-R02-SecteurActivite"
            }]
          }]
        },
        {
          "name" : "code",
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
          "name" : "display",
          "source" : [{
            "context" : "srcCode",
            "element" : "displayName",
            "variable" : "display"
          }],
          "target" : [{
            "context" : "coding",
            "contextType" : "variable",
            "element" : "display",
            "transform" : "cast",
            "parameter" : [{
              "valueId" : "display"
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
    "name" : "MapCDAInformantToFrenchRelatedPerson",
    "typeMode" : "none",
    "documentation" : "RELATEDPERSON FR\r\nCDA informant.relatedEntity -> FHIR RelatedPerson français",
    "input" : [{
      "name" : "relatedEntity",
      "type" : "RelatedEntity",
      "mode" : "source"
    },
    {
      "name" : "relatedPerson",
      "type" : "RelatedPerson",
      "mode" : "target"
    },
    {
      "name" : "patientResource",
      "type" : "Patient",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "meta",
      "source" : [{
        "context" : "relatedEntity"
      }],
      "target" : [{
        "context" : "relatedPerson",
        "contextType" : "variable",
        "element" : "meta",
        "variable" : "metaBlock"
      }],
      "rule" : [{
        "name" : "profile",
        "source" : [{
          "context" : "relatedEntity"
        }],
        "target" : [{
          "context" : "metaBlock",
          "contextType" : "variable",
          "element" : "profile",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-related-person"
          }]
        }]
      }]
    },
    {
      "name" : "relationshipRole",
      "source" : [{
        "context" : "relatedEntity",
        "element" : "code",
        "variable" : "relationCode"
      }],
      "target" : [{
        "context" : "relatedPerson",
        "contextType" : "variable",
        "element" : "relationship",
        "variable" : "cc",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "rule" : [{
        "name" : "coding",
        "source" : [{
          "context" : "relationCode",
          "element" : "code",
          "variable" : "code"
        }],
        "target" : [{
          "context" : "cc",
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
            "context" : "code"
          }],
          "target" : [{
            "context" : "coding",
            "contextType" : "variable",
            "element" : "system",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "https://mos.esante.gouv.fr/NOS/TRE_R216-HL7RoleCode/FHIR/TRE-R216-HL7RoleCode"
            }]
          }]
        },
        {
          "name" : "code",
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
          "name" : "display",
          "source" : [{
            "context" : "relationCode",
            "element" : "displayName",
            "variable" : "display"
          }],
          "target" : [{
            "context" : "coding",
            "contextType" : "variable",
            "element" : "display",
            "transform" : "cast",
            "parameter" : [{
              "valueId" : "display"
            },
            {
              "valueString" : "string"
            }]
          }]
        }]
      }]
    },
    {
      "name" : "relationshipAbsentReason",
      "source" : [{
        "context" : "relatedEntity",
        "condition" : "relatedEntity.code.empty()"
      }],
      "target" : [{
        "context" : "relatedPerson",
        "contextType" : "variable",
        "element" : "relationship",
        "variable" : "cc",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "rule" : [{
        "name" : "dataAbsentReason",
        "source" : [{
          "context" : "relatedEntity"
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
            "context" : "relatedEntity"
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
            "context" : "relatedEntity"
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
    "name" : "MapCDAGuardianToFrenchRelatedPerson",
    "typeMode" : "none",
    "documentation" : "CDA guardian -> FHIR RelatedPerson français",
    "input" : [{
      "name" : "guardian",
      "mode" : "source"
    },
    {
      "name" : "relatedPerson",
      "type" : "RelatedPerson",
      "mode" : "target"
    },
    {
      "name" : "patientResource",
      "type" : "Patient",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "meta",
      "source" : [{
        "context" : "guardian"
      }],
      "target" : [{
        "context" : "relatedPerson",
        "contextType" : "variable",
        "element" : "meta",
        "variable" : "metaBlock"
      }],
      "rule" : [{
        "name" : "profile",
        "source" : [{
          "context" : "guardian"
        }],
        "target" : [{
          "context" : "metaBlock",
          "contextType" : "variable",
          "element" : "profile",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-related-person"
          }]
        }]
      }]
    },
    {
      "name" : "relationshipRole",
      "source" : [{
        "context" : "guardian",
        "element" : "code",
        "variable" : "relationCode"
      }],
      "target" : [{
        "context" : "relatedPerson",
        "contextType" : "variable",
        "element" : "relationship",
        "variable" : "cc",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "rule" : [{
        "name" : "coding",
        "source" : [{
          "context" : "relationCode",
          "element" : "code",
          "variable" : "code"
        }],
        "target" : [{
          "context" : "cc",
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
            "context" : "code"
          }],
          "target" : [{
            "context" : "coding",
            "contextType" : "variable",
            "element" : "system",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "https://mos.esante.gouv.fr/NOS/TRE_R216-HL7RoleCode/FHIR/TRE-R216-HL7RoleCode"
            }]
          }]
        },
        {
          "name" : "code",
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
          "name" : "display",
          "source" : [{
            "context" : "relationCode",
            "element" : "displayName",
            "variable" : "display"
          }],
          "target" : [{
            "context" : "coding",
            "contextType" : "variable",
            "element" : "display",
            "transform" : "cast",
            "parameter" : [{
              "valueId" : "display"
            },
            {
              "valueString" : "string"
            }]
          }]
        }]
      }]
    },
    {
      "name" : "relationshipAbsentReason",
      "source" : [{
        "context" : "guardian",
        "condition" : "guardian.code.empty()"
      }],
      "target" : [{
        "context" : "relatedPerson",
        "contextType" : "variable",
        "element" : "relationship",
        "variable" : "cc",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "rule" : [{
        "name" : "dataAbsentReason",
        "source" : [{
          "context" : "guardian"
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
            "context" : "guardian"
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
            "context" : "guardian"
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
}

```
