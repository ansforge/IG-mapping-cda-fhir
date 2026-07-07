# Mapping CDA vers FHIR - Étape 2 socle générique orienté CDA - POC - Mapping CDA to FHIR v0.1.0

## StructureMap: Mapping CDA vers FHIR - Étape 2 socle générique orienté CDA 

 
Mapping CDA vers FHIR - Étape 2 socle générique orienté CDA 



## Resource Content

```json
{
  "resourceType" : "StructureMap",
  "id" : "CdaToBundle",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/StructureMap/CdaToBundle",
  "version" : "0.1.0",
  "name" : "CdaToBundle",
  "title" : "Mapping CDA vers FHIR - Étape 2 socle générique orienté CDA",
  "status" : "draft",
  "date" : "2026-07-07T12:36:21+00:00",
  "publisher" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
  "contact" : [{
    "name" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
    "telecom" : [{
      "system" : "url",
      "value" : "https://esante.gouv.fr"
    }]
  }],
  "description" : "Mapping CDA vers FHIR - Étape 2 socle générique orienté CDA",
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
    "url" : "http://hl7.org/fhir/StructureDefinition/Organization|4.0.1",
    "mode" : "target",
    "alias" : "Organization"
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
    "url" : "http://hl7.org/fhir/StructureDefinition/HumanName|4.0.1",
    "mode" : "target",
    "alias" : "HumanName"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/Address|4.0.1",
    "mode" : "target",
    "alias" : "Address"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/ContactPoint|4.0.1",
    "mode" : "target",
    "alias" : "ContactPoint"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/Period|4.0.1",
    "mode" : "target",
    "alias" : "Period"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/Extension|4.0.1",
    "mode" : "target",
    "alias" : "Extension"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/Narrative|4.0.1",
    "mode" : "target",
    "alias" : "Narrative"
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
    "url" : "http://hl7.org/fhir/StructureDefinition/instant|4.0.1",
    "mode" : "target",
    "alias" : "instant"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/boolean|4.0.1",
    "mode" : "target",
    "alias" : "boolean"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/uri|4.0.1",
    "mode" : "target",
    "alias" : "uri"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/string|4.0.1",
    "mode" : "target",
    "alias" : "string"
  }],
  "import" : ["https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/StructureMap/CdaToFHIRTypes|0.1.0"],
  "group" : [{
    "name" : "TransformClinicalDocumentToFHIRDocument",
    "typeMode" : "none",
    "documentation" : "GROUPE D’ENTRÉE — INITIALISATION DU DOCUMENT FHIR À PARTIR DU CDA\n\n   À partir de l’analyse du ClinicalDocument CDA, ce groupe initialise les\n   ressources FHIR nécessaires pour représenter les éléments CDA principaux :\n   Composition et Patient.\n\n   Ces ressources sont créées vides avec un uuid(), ajoutées au Bundle, puis\n   transmises au groupe d’orchestration.\n\n   Les autres ressources seront créées ultérieurement, dans les groupes\n   correspondant aux blocs CDA traités.",
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
        "name" : "OrchestrateClinicalDocumentTransformation",
        "variable" : ["cda", "patient", "composition", "bundle"]
      }]
    }]
  },
  {
    "name" : "OrchestrateClinicalDocumentTransformation",
    "typeMode" : "none",
    "documentation" : "GROUPE D’ORCHESTRATION — TRAITEMENT DU CLINICALDOCUMENT CDA\n\n   Ce groupe permet de traiter le ClinicalDocument CDA en deux parties :\n   - l’en-tête CDA via l'appel du groupe MapClinicalDocumentHeader ;\n   - le corps CDA via l'appelle du groupe MapClinicalDocumentBody.\n\n   Les ressources initialisées dans le groupe d’entrée, Bundle, Composition et\n   Patient, servent de support de sortie pour le traitement CDA",
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
      "name" : "header",
      "source" : [{
        "context" : "cda"
      }],
      "dependent" : [{
        "name" : "MapClinicalDocumentHeader",
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
    "name" : "MapClinicalDocumentHeader",
    "typeMode" : "none",
    "documentation" : "GROUPE — TRAITEMENT DE L’EN-TÊTE DU CLINICALDOCUMENT CDA\n\n   Ce groupe traite l’en-tête du ClinicalDocument CDA bloc par bloc.\n\n   Pour chaque élément de l’en-tête CDA, il appelle le groupe spécialisé\n   correspondant :\n   - id, setId, versionNumber et effectiveTime sont transmis à\n     MapHeaderDocumentIdentity pour alimenter les métadonnées du Bundle et de\n     la Composition ;\n   - languageCode, code, title, effectiveTime et confidentialityCode sont transmis\n     à MapHeaderDocumentDescription pour alimenter la description documentaire ;\n   - recordTarget.patientRole est transmis à MapHeaderRecordTarget pour alimenter\n     le Patient et la référence Composition.subject ;\n   - custodian est transmis à MapHeaderCustodian pour créer et alimenter\n     l’Organization responsable de la conservation du document ;\n   - author est transmis à MapHeaderAuthor pour créer et alimenter le Practitioner,\n     l’Organization et le PractitionerRole de l’auteur ;\n   - legalAuthenticator est transmis à MapHeaderLegalAuthenticator pour créer et\n     alimenter le signataire légal ;\n   - documentationOf.serviceEvent est transmis à MapHeaderDocumentationOf pour\n     alimenter Composition.event ;\n   - componentOf.encompassingEncounter est transmis à MapHeaderEncounterContext\n     pour créer et alimenter Encounter, Location et Organization si le bloc CDA\n     est présent ;\n   - informant.relatedEntity classCode=ECON est transmis à MapHeaderEmergencyContact\n     pour créer la RelatedPerson correspondant à la personne à prévenir ;\n   - informant.relatedEntity classCode=NOK est transmis à MapHeaderTrustedPerson\n     pour créer la RelatedPerson correspondant à la personne de confiance ;\n   - recordTarget.patientRole.patient.guardian est transmis à MapHeaderGuardian\n     pour créer la RelatedPerson correspondant au guardian ;\n   - relatedDocument est transmis à MapHeaderRelatedDocument pour alimenter\n     Composition.relatesTo.\n\n   Les ressources optionnelles sont créées dans le groupe qui traite le bloc CDA\n   correspondant. Ainsi, une ressource FHIR n’est créée que lorsqu’un élément CDA\n   justifie son existence",
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
      "name" : "recordTarget",
      "source" : [{
        "context" : "cda"
      }],
      "dependent" : [{
        "name" : "MapHeaderRecordTarget",
        "variable" : ["cda", "patient", "composition"]
      }]
    },
    {
      "name" : "custodian",
      "source" : [{
        "context" : "cda"
      }],
      "dependent" : [{
        "name" : "MapHeaderCustodian",
        "variable" : ["cda", "composition", "bundle"]
      }]
    },
    {
      "name" : "author",
      "source" : [{
        "context" : "cda"
      }],
      "dependent" : [{
        "name" : "MapHeaderAuthor",
        "variable" : ["cda", "composition", "bundle"]
      }]
    },
    {
      "name" : "legalAuthenticator",
      "source" : [{
        "context" : "cda"
      }],
      "dependent" : [{
        "name" : "MapHeaderLegalAuthenticator",
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
        "name" : "MapHeaderEncounterContext",
        "variable" : ["cda", "composition", "bundle", "patient"]
      }]
    },
    {
      "name" : "emergencyContact",
      "source" : [{
        "context" : "cda"
      }],
      "dependent" : [{
        "name" : "MapHeaderEmergencyContact",
        "variable" : ["cda", "bundle", "patient"]
      }]
    },
    {
      "name" : "trustedPerson",
      "source" : [{
        "context" : "cda"
      }],
      "dependent" : [{
        "name" : "MapHeaderTrustedPerson",
        "variable" : ["cda", "bundle", "patient"]
      }]
    },
    {
      "name" : "guardian",
      "source" : [{
        "context" : "cda"
      }],
      "dependent" : [{
        "name" : "MapHeaderGuardian",
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
    "name" : "MapHeaderDocumentIdentity",
    "typeMode" : "none",
    "documentation" : "groupe qui traite l'identité du document CDA -> métadonnées Bundle / Composition FHIR",
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
      "name" : "composition",
      "type" : "Composition",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "bundleId",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "bundle",
        "contextType" : "variable",
        "element" : "id",
        "transform" : "uuid"
      }]
    },
    {
      "name" : "bundleType",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "bundle",
        "contextType" : "variable",
        "element" : "type",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "document"
        }]
      }]
    },
    {
      "name" : "bundleMeta",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "bundle",
        "contextType" : "variable",
        "element" : "meta",
        "variable" : "bundleMeta"
      }],
      "rule" : [{
        "name" : "bundleVersionNumber",
        "source" : [{
          "context" : "src",
          "element" : "versionNumber",
          "variable" : "versionNumber"
        }],
        "rule" : [{
          "name" : "bundleMetaVersionId",
          "source" : [{
            "context" : "versionNumber",
            "element" : "value",
            "variable" : "version"
          }],
          "target" : [{
            "context" : "bundleMeta",
            "contextType" : "variable",
            "element" : "versionId",
            "transform" : "cast",
            "parameter" : [{
              "valueId" : "version"
            },
            {
              "valueString" : "string"
            }]
          }]
        }]
      },
      {
        "name" : "bundleMetaLastUpdated",
        "source" : [{
          "context" : "src",
          "element" : "effectiveTime",
          "variable" : "effectiveTime"
        }],
        "target" : [{
          "context" : "bundleMeta",
          "contextType" : "variable",
          "element" : "lastUpdated",
          "variable" : "lastUpdated",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "instant"
          }]
        }],
        "dependent" : [{
          "name" : "TSInstant",
          "variable" : ["effectiveTime", "lastUpdated"]
        }]
      }]
    },
    {
      "name" : "bundleIdentifier",
      "source" : [{
        "context" : "src",
        "element" : "id",
        "variable" : "cdaId"
      }],
      "target" : [{
        "context" : "bundle",
        "contextType" : "variable",
        "element" : "identifier",
        "variable" : "identifier",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Identifier"
        }]
      }],
      "rule" : [{
        "name" : "bundleIdentifierSystemWithExtension",
        "source" : [{
          "context" : "cdaId",
          "element" : "root",
          "variable" : "root",
          "condition" : "cdaId.extension.exists()"
        }],
        "target" : [{
          "context" : "identifier",
          "contextType" : "variable",
          "element" : "system",
          "transform" : "append",
          "parameter" : [{
            "valueString" : "urn:oid:"
          },
          {
            "valueId" : "root"
          }]
        }]
      },
      {
        "name" : "bundleIdentifierValueWithExtension",
        "source" : [{
          "context" : "cdaId",
          "element" : "extension",
          "variable" : "extension"
        }],
        "target" : [{
          "context" : "identifier",
          "contextType" : "variable",
          "element" : "value",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "extension"
          }]
        }]
      },
      {
        "name" : "bundleIdentifierSystemOid",
        "source" : [{
          "context" : "cdaId",
          "element" : "root",
          "variable" : "root",
          "condition" : "cdaId.extension.empty()"
        }],
        "target" : [{
          "context" : "identifier",
          "contextType" : "variable",
          "element" : "system",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "urn:ietf:rfc:3986"
          }]
        }]
      },
      {
        "name" : "bundleIdentifierValueOid",
        "source" : [{
          "context" : "cdaId",
          "element" : "root",
          "variable" : "root",
          "condition" : "cdaId.extension.empty()"
        }],
        "target" : [{
          "context" : "identifier",
          "contextType" : "variable",
          "element" : "value",
          "transform" : "append",
          "parameter" : [{
            "valueString" : "urn:oid:"
          },
          {
            "valueId" : "root"
          }]
        }]
      }]
    },
    {
      "name" : "bundleTimestamp",
      "source" : [{
        "context" : "src",
        "element" : "effectiveTime",
        "variable" : "effectiveTime"
      }],
      "target" : [{
        "context" : "bundle",
        "contextType" : "variable",
        "element" : "timestamp",
        "variable" : "timestamp",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "instant"
        }]
      }],
      "dependent" : [{
        "name" : "TSInstant",
        "variable" : ["effectiveTime", "timestamp"]
      }]
    },
    {
      "name" : "compositionSetIdentifier",
      "source" : [{
        "context" : "src",
        "element" : "setId",
        "variable" : "setId"
      }],
      "target" : [{
        "context" : "composition",
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
        "variable" : ["setId", "identifier"]
      }]
    },
    {
      "name" : "compositionIdentifier",
      "source" : [{
        "context" : "src",
        "element" : "id",
        "variable" : "id",
        "condition" : "src.setId.empty()"
      }],
      "target" : [{
        "context" : "composition",
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
      "name" : "compositionStatus",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "composition",
        "contextType" : "variable",
        "element" : "status",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "final"
        }]
      }]
    },
    {
      "name" : "compositionMeta",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "composition",
        "contextType" : "variable",
        "element" : "meta",
        "variable" : "compositionMeta"
      }],
      "rule" : [{
        "name" : "compositionVersionNumber",
        "source" : [{
          "context" : "src",
          "element" : "versionNumber",
          "variable" : "versionNumber"
        }],
        "rule" : [{
          "name" : "compositionMetaVersionId",
          "source" : [{
            "context" : "versionNumber",
            "element" : "value",
            "variable" : "version"
          }],
          "target" : [{
            "context" : "compositionMeta",
            "contextType" : "variable",
            "element" : "versionId",
            "transform" : "cast",
            "parameter" : [{
              "valueId" : "version"
            },
            {
              "valueString" : "string"
            }]
          }]
        }]
      },
      {
        "name" : "compositionMetaLastUpdated",
        "source" : [{
          "context" : "src",
          "element" : "effectiveTime",
          "variable" : "effectiveTime"
        }],
        "target" : [{
          "context" : "compositionMeta",
          "contextType" : "variable",
          "element" : "lastUpdated",
          "variable" : "lastUpdated",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "instant"
          }]
        }],
        "dependent" : [{
          "name" : "TSInstant",
          "variable" : ["effectiveTime", "lastUpdated"]
        }]
      }]
    }]
  },
  {
    "name" : "MapHeaderDocumentDescription",
    "typeMode" : "none",
    "documentation" : "groupe qui traite la description du document CDA -> FHIR Composition",
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
      "name" : "patient",
      "type" : "Patient",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "language",
      "source" : [{
        "context" : "src",
        "element" : "languageCode",
        "variable" : "languageCode"
      }],
      "target" : [{
        "context" : "composition",
        "contextType" : "variable",
        "element" : "language",
        "variable" : "code",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "code"
        }]
      }],
      "dependent" : [{
        "name" : "CSCode",
        "variable" : ["languageCode", "code"]
      }]
    },
    {
      "name" : "type",
      "source" : [{
        "context" : "src",
        "element" : "code",
        "variable" : "srcCode"
      }],
      "target" : [{
        "context" : "composition",
        "contextType" : "variable",
        "element" : "type",
        "variable" : "cc",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "dependent" : [{
        "name" : "CDCodeableConcept",
        "variable" : ["srcCode", "cc"]
      }]
    },
    {
      "name" : "title",
      "source" : [{
        "context" : "src",
        "element" : "title",
        "variable" : "title"
      }],
      "target" : [{
        "context" : "composition",
        "contextType" : "variable",
        "element" : "title",
        "transform" : "evaluate",
        "parameter" : [{
          "valueString" : "title.xmlText"
        }]
      }]
    },
    {
      "name" : "subject",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "composition",
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
      "name" : "date",
      "source" : [{
        "context" : "src",
        "element" : "effectiveTime",
        "variable" : "effectiveTime"
      }],
      "target" : [{
        "context" : "composition",
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
      "name" : "confidentiality",
      "source" : [{
        "context" : "src",
        "element" : "confidentialityCode",
        "variable" : "confCode"
      }],
      "target" : [{
        "context" : "composition",
        "contextType" : "variable",
        "element" : "confidentiality",
        "variable" : "code",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "code"
        }]
      }],
      "dependent" : [{
        "name" : "CSCode",
        "variable" : ["confCode", "code"]
      }]
    }]
  },
  {
    "name" : "MapHeaderRecordTarget",
    "typeMode" : "none",
    "documentation" : "groupe qui traite: CDA recordTarget.patientRole -> FHIR Patient",
    "input" : [{
      "name" : "src",
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
          "name" : "address",
          "source" : [{
            "context" : "patientRole",
            "element" : "addr",
            "variable" : "srcAddr"
          }],
          "target" : [{
            "context" : "patient",
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
            "variable" : ["srcAddr", "address"]
          }]
        },
        {
          "name" : "telecom",
          "source" : [{
            "context" : "patientRole",
            "element" : "telecom",
            "variable" : "srcTelecom"
          }],
          "target" : [{
            "context" : "patient",
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
            "variable" : ["srcTelecom", "contactPoint"]
          }]
        },
        {
          "name" : "patientData",
          "source" : [{
            "context" : "patientRole",
            "element" : "patient",
            "variable" : "patientCda"
          }],
          "rule" : [{
            "name" : "gender",
            "source" : [{
              "context" : "patientCda",
              "element" : "administrativeGenderCode",
              "variable" : "gender"
            }],
            "rule" : [{
              "name" : "gender",
              "source" : [{
                "context" : "gender",
                "element" : "code",
                "variable" : "v"
              }],
              "target" : [{
                "context" : "patient",
                "contextType" : "variable",
                "element" : "gender",
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
            }]
          },
          {
            "name" : "birthDate",
            "source" : [{
              "context" : "patientCda",
              "element" : "birthTime",
              "variable" : "birthTime"
            }],
            "target" : [{
              "context" : "patient",
              "contextType" : "variable",
              "element" : "birthDate",
              "variable" : "date",
              "transform" : "create",
              "parameter" : [{
                "valueString" : "date"
              }]
            }],
            "dependent" : [{
              "name" : "TSDate",
              "variable" : ["birthTime", "date"]
            }]
          },
          {
            "name" : "deceasedBoolean",
            "source" : [{
              "context" : "patientCda",
              "element" : "deceasedInd",
              "variable" : "indicator",
              "condition" : "patientCda.deceasedTime.empty()"
            }],
            "target" : [{
              "context" : "patient",
              "contextType" : "variable",
              "element" : "deceased",
              "variable" : "bool",
              "transform" : "create",
              "parameter" : [{
                "valueString" : "boolean"
              }]
            }],
            "rule" : [{
              "name" : "value",
              "source" : [{
                "context" : "indicator",
                "element" : "value",
                "variable" : "v"
              }],
              "target" : [{
                "context" : "bool",
                "contextType" : "variable",
                "element" : "value",
                "transform" : "copy",
                "parameter" : [{
                  "valueId" : "v"
                }]
              }]
            }]
          },
          {
            "name" : "deceasedDateTime",
            "source" : [{
              "context" : "patientCda",
              "element" : "deceasedTime",
              "variable" : "dTime"
            }],
            "target" : [{
              "context" : "patient",
              "contextType" : "variable",
              "element" : "deceased",
              "variable" : "dt",
              "transform" : "create",
              "parameter" : [{
                "valueString" : "dateTime"
              }]
            }],
            "dependent" : [{
              "name" : "TSDateTime",
              "variable" : ["dTime", "dt"]
            }]
          }]
        }]
      }]
    }]
  },
  {
    "name" : "MapHeaderCustodian",
    "typeMode" : "none",
    "documentation" : "groupe qui traite custodian  (l'organisation)\nL’Organization est créée uniquement si le bloc custodian existe dans le CDA.",
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
            "name" : "custodianOrganization",
            "source" : [{
              "context" : "representedOrg"
            }],
            "dependent" : [{
              "name" : "MapCDAOrganizationToOrganization",
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
    "name" : "MapHeaderAuthor",
    "typeMode" : "none",
    "documentation" : "GROUPE — TRAITEMENT DE L’AUTEUR DU DOCUMENT CDA\n\n   Ce groupe traite le bloc author de l’en-tête CDA.\n\n   Si le bloc author existe, il crée un Practitioner pour représenter l’auteur.\n   Si author.assignedAuthor.representedOrganization est présent, il crée aussi\n   une Organization et un PractitionerRole afin de représenter l’auteur dans son\n   organisation.\n\n   La Composition référence ensuite le PractitionerRole si l’organisation existe,\n   sinon elle référence directement le Practitioner.",
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
          "name" : "authorPractitioner",
          "source" : [{
            "context" : "assignedAuthor"
          }],
          "dependent" : [{
            "name" : "MapCDAAssignedEntityToPractitioner",
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
            "name" : "authorOrganization",
            "source" : [{
              "context" : "representedOrganization"
            }],
            "dependent" : [{
              "name" : "MapCDAOrganizationToOrganization",
              "variable" : ["representedOrganization", "authorOrganization"]
            }]
          },
          {
            "name" : "authorRole",
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
    "name" : "MapHeaderLegalAuthenticator",
    "typeMode" : "none",
    "documentation" : "GROUPE — TRAITEMENT DU SIGNATAIRE LÉGAL CDA\n   Ce groupe traite le bloc legalAuthenticator de l’en-tête CDA\n\n   Si le bloc legalAuthenticator existe, il crée un Practitioner pour représenter\n   le signataire légal. Si legalAuthenticator.assignedEntity.representedOrganization\n   est présent, il crée aussi une Organization et un PractitionerRole.\n\n   La Composition est alimentée via Composition.attester. La partie attester.party\n   référence le PractitionerRole si l’organisation existe, sinon elle référence\n   directement le Practitioner.",
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
          "name" : "legalPractitioner",
          "source" : [{
            "context" : "assignedEntity"
          }],
          "dependent" : [{
            "name" : "MapCDAAssignedEntityToPractitioner",
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
              "name" : "legalOrganization",
              "source" : [{
                "context" : "representedOrganization"
              }],
              "dependent" : [{
                "name" : "MapCDAOrganizationToOrganization",
                "variable" : ["representedOrganization", "legalOrganization"]
              }]
            },
            {
              "name" : "legalRole",
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
    "name" : "MapHeaderDocumentationOf",
    "typeMode" : "none",
    "documentation" : "GROUPE — TRAITEMENT DE L’ÉVÉNEMENT DOCUMENTÉ CDA",
    "input" : [{
      "name" : "src",
      "type" : "ClinicalDocument",
      "mode" : "source"
    },
    {
      "name" : "composition",
      "type" : "Composition",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "documentationOf",
      "source" : [{
        "context" : "src",
        "element" : "documentationOf",
        "variable" : "documentationOf"
      }],
      "rule" : [{
        "name" : "event",
        "source" : [{
          "context" : "documentationOf",
          "element" : "serviceEvent",
          "variable" : "serviceEvent"
        }],
        "target" : [{
          "context" : "composition",
          "contextType" : "variable",
          "element" : "event",
          "variable" : "event"
        }],
        "rule" : [{
          "name" : "eventCode",
          "source" : [{
            "context" : "serviceEvent",
            "element" : "code",
            "variable" : "eventCode"
          }],
          "target" : [{
            "context" : "event",
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
            "variable" : ["eventCode", "cc"]
          }]
        },
        {
          "name" : "eventPeriod",
          "source" : [{
            "context" : "serviceEvent",
            "element" : "effectiveTime",
            "variable" : "eff"
          }],
          "target" : [{
            "context" : "event",
            "contextType" : "variable",
            "element" : "period",
            "variable" : "period",
            "transform" : "create",
            "parameter" : [{
              "valueString" : "Period"
            }]
          }],
          "dependent" : [{
            "name" : "IVLTSPeriod",
            "variable" : ["eff", "period"]
          }]
        }]
      }]
    }]
  },
  {
    "name" : "MapHeaderEncounterContext",
    "typeMode" : "none",
    "documentation" : "GROUPE — TRAITEMENT DU CONTEXTE DE PRISE EN CHARGE CDA\n\n   Ce groupe traite le bloc componentOf.encompassingEncounter de l’en-tête CDA.\n\n   Si encompassingEncounter existe, il crée une ressource Encounter et l’associe\n   à la Composition.\n\n   Le remplissage générique de l’Encounter est délégué au groupe commun :\n   MapCDAEncompassingEncounterToEncounter.\n\n   Si encompassingEncounter.location.healthCareFacility est également présent,\n   il crée une Location et une Organization pour représenter le lieu et la\n   structure de prise en charge, puis appelle :\n   MapCDAHealthCareFacilityToLocationContext.",
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
          "name" : "location",
          "source" : [{
            "context" : "encompassingEncounter",
            "element" : "location",
            "variable" : "srcLocation"
          }],
          "rule" : [{
            "name" : "facilityContext",
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
            "dependent" : [{
              "name" : "MapCDAHealthCareFacilityToLocationContext",
              "variable" : ["facility", "encounter", "location", "facilityOrganization"]
            }]
          }]
        }]
      }]
    }]
  },
  {
    "name" : "MapCDAEncompassingEncounterToEncounter",
    "typeMode" : "none",
    "documentation" : "GROUPE COMMUN — ENCOMPASSINGENCOUNTER CDA VERS ENCOUNTER FHIR\n\n   Ce groupe transforme les informations génériques du bloc CDA\n   componentOf.encompassingEncounter vers une ressource FHIR Encounter déjà créée\n   par le groupe appelant.\n\n   Il alimente :\n   - Encounter.identifier ;\n   - Encounter.subject ;\n   - Encounter.status ;\n   - Encounter.class ;\n   - Encounter.period.\n\n   Si le code CDA de l’encompassingEncounter est absent, Encounter.class est\n   créé avec l’extension data-absent-reason afin de respecter l’obligation FHIR\n   sans inventer une information absente du CDA",
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
      "name" : "identifier",
      "source" : [{
        "context" : "encompassingEncounter",
        "element" : "id",
        "variable" : "id"
      }],
      "target" : [{
        "context" : "encounter",
        "contextType" : "variable",
        "element" : "identifier",
        "variable" : "identifier",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Identifier"
        }]
      }],
      "rule" : [{
        "name" : "baseIdentifier",
        "source" : [{
          "context" : "id"
        }],
        "target" : [{
          "context" : "identifier",
          "contextType" : "variable"
        }],
        "dependent" : [{
          "name" : "II",
          "variable" : ["id", "identifier"]
        }]
      },
      {
        "name" : "type",
        "source" : [{
          "context" : "id"
        }],
        "target" : [{
          "context" : "identifier",
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
            "context" : "id"
          }],
          "target" : [{
            "context" : "idType",
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
              "context" : "id"
            }],
            "target" : [{
              "context" : "coding",
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
              "context" : "id"
            }],
            "target" : [{
              "context" : "coding",
              "contextType" : "variable",
              "element" : "code",
              "transform" : "copy",
              "parameter" : [{
                "valueString" : "VN"
              }]
            }]
          },
          {
            "name" : "display",
            "source" : [{
              "context" : "id"
            }],
            "target" : [{
              "context" : "coding",
              "contextType" : "variable",
              "element" : "display",
              "transform" : "copy",
              "parameter" : [{
                "valueString" : "Visit number"
              }]
            }]
          }]
        }]
      }]
    },
    {
      "name" : "subject",
      "source" : [{
        "context" : "encompassingEncounter"
      }],
      "target" : [{
        "context" : "encounter",
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
      "name" : "status",
      "source" : [{
        "context" : "encompassingEncounter"
      }],
      "target" : [{
        "context" : "encounter",
        "contextType" : "variable",
        "element" : "status",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "finished"
        }]
      }]
    },
    {
      "name" : "class",
      "source" : [{
        "context" : "encompassingEncounter",
        "element" : "code",
        "variable" : "srcCode"
      }],
      "target" : [{
        "context" : "encounter",
        "contextType" : "variable",
        "element" : "class",
        "variable" : "coding",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Coding"
        }]
      }],
      "dependent" : [{
        "name" : "CDCoding",
        "variable" : ["srcCode", "coding"]
      }]
    },
    {
      "name" : "classAbsentReason",
      "source" : [{
        "context" : "encompassingEncounter",
        "condition" : "encompassingEncounter.code.empty()"
      }],
      "target" : [{
        "context" : "encounter",
        "contextType" : "variable",
        "element" : "class",
        "variable" : "coding",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Coding"
        }]
      }],
      "rule" : [{
        "name" : "dataAbsentReason",
        "source" : [{
          "context" : "encompassingEncounter"
        }],
        "target" : [{
          "context" : "coding",
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
            "context" : "encompassingEncounter"
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
            "context" : "encompassingEncounter"
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
      "name" : "period",
      "source" : [{
        "context" : "encompassingEncounter",
        "element" : "effectiveTime",
        "variable" : "effTime",
        "condition" : "effTime.value.exists() or effTime.low.exists() or effTime.high.exists()"
      }],
      "target" : [{
        "context" : "encounter",
        "contextType" : "variable",
        "element" : "period",
        "variable" : "period",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Period"
        }]
      }],
      "dependent" : [{
        "name" : "IVLTSPeriod",
        "variable" : ["effTime", "period"]
      }]
    }]
  },
  {
    "name" : "MapHeaderEmergencyContact",
    "typeMode" : "none",
    "documentation" : "GROUPE — TRAITEMENT DE LA PERSONNE À PRÉVENIR CDA\n\n   Ce groupe traite les blocs informant.relatedEntity dont classCode = ECON.\n\n   Si un informant ECON est présent dans le CDA, il crée une RelatedPerson pour\n   représenter la personne à prévenir en cas d’urgence, puis l’associe au Patient.\n\n   La ressource RelatedPerson est donc créée uniquement si ce bloc CDA existe",
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
        "dependent" : [{
          "name" : "MapCDARelatedEntityToRelatedPerson",
          "variable" : ["relatedEntity", "emergencyContactRelatedPerson", "patient"]
        }]
      }]
    }]
  },
  {
    "name" : "MapHeaderTrustedPerson",
    "typeMode" : "none",
    "documentation" : "GROUPE — TRAITEMENT DE LA PERSONNE DE CONFIANCE CDA\n\n   Ce groupe traite les blocs informant.relatedEntity dont classCode = NOK.\n\n   Si un informant NOK est présent dans le CDA, il crée une RelatedPerson pour\n   représenter la personne de confiance, puis l’associe au Patient.\n\n   La ressource RelatedPerson est donc créée uniquement si ce bloc CDA existe.",
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
        "dependent" : [{
          "name" : "MapCDARelatedEntityToRelatedPerson",
          "variable" : ["relatedEntity", "trustedPersonRelatedPerson", "patient"]
        }]
      }]
    }]
  },
  {
    "name" : "MapHeaderGuardian",
    "typeMode" : "none",
    "documentation" : "GROUPE — TRAITEMENT DU GUARDIAN CDA\n\n   Ce groupe traite le bloc recordTarget.patientRole.patient.guardian.\n\n   Si un guardian est présent dans le CDA, il crée une RelatedPerson pour\n   représenter le représentant légal ou responsable du patient.\n\n   La ressource RelatedPerson est donc créée uniquement si le bloc guardian existe",
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
            }]
          }]
        }]
      }]
    }]
  },
  {
    "name" : "MapHeaderRelatedDocument",
    "typeMode" : "none",
    "documentation" : "GROUPE — TRAITEMENT DU DOCUMENT LIÉ CDA\n\n   Ce groupe traite le bloc relatedDocument du CDA.\n\n   Si relatedDocument est présent, il alimente Composition.relatesTo afin de\n   représenter le lien avec un document antérieur, par exemple un document\n   remplacé.\n\n   Ce groupe ne crée pas de ressource FHIR indépendante. Il complète uniquement\n   la Composition déjà initialisée",
    "input" : [{
      "name" : "src",
      "type" : "ClinicalDocument",
      "mode" : "source"
    },
    {
      "name" : "composition",
      "type" : "Composition",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "relatedDocument",
      "source" : [{
        "context" : "src",
        "element" : "relatedDocument",
        "variable" : "relatedDoc"
      }],
      "target" : [{
        "context" : "composition",
        "contextType" : "variable",
        "element" : "relatesTo",
        "variable" : "relatesTo"
      }],
      "rule" : [{
        "name" : "replaces",
        "source" : [{
          "context" : "relatedDoc",
          "element" : "typeCode",
          "variable" : "typeCode",
          "condition" : "typeCode = 'RPLC'"
        }],
        "target" : [{
          "context" : "relatesTo",
          "contextType" : "variable",
          "element" : "code",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "replaces"
          }]
        }]
      },
      {
        "name" : "parentDocument",
        "source" : [{
          "context" : "relatedDoc",
          "element" : "parentDocument",
          "variable" : "parentDoc"
        }],
        "rule" : [{
          "name" : "targetIdentifier",
          "source" : [{
            "context" : "parentDoc",
            "element" : "id",
            "variable" : "id"
          }],
          "target" : [{
            "context" : "relatesTo",
            "contextType" : "variable",
            "element" : "target",
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
        }]
      }]
    }]
  },
  {
    "name" : "MapCDAOrganizationToOrganization",
    "typeMode" : "none",
    "documentation" : "GROUPE COMMUN — ORGANISATION CDA VERS ORGANIZATION FHIR\n\n   Ce groupe transforme un élément CDA de type organisation vers une ressource\n   FHIR Organization déjà créée par le groupe appelant.\n\n   Il alimente les informations génériques de l’organisation :\n   identifier, name, telecom et address",
    "input" : [{
      "name" : "src",
      "mode" : "source"
    },
    {
      "name" : "organization",
      "type" : "Organization",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "identifier",
      "source" : [{
        "context" : "src",
        "element" : "id",
        "variable" : "id"
      }],
      "target" : [{
        "context" : "organization",
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
      "name" : "orgName",
      "source" : [{
        "context" : "src",
        "element" : "name",
        "variable" : "orgName"
      }],
      "rule" : [{
        "name" : "name",
        "source" : [{
          "context" : "orgName",
          "element" : "item",
          "variable" : "item"
        }],
        "target" : [{
          "context" : "organization",
          "contextType" : "variable",
          "element" : "name",
          "transform" : "evaluate",
          "parameter" : [{
            "valueString" : "item.xmlText"
          }]
        }]
      }]
    },
    {
      "name" : "telecom",
      "source" : [{
        "context" : "src",
        "element" : "telecom",
        "variable" : "srcTelecom"
      }],
      "target" : [{
        "context" : "organization",
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
        "variable" : ["srcTelecom", "contactPoint"]
      }]
    },
    {
      "name" : "address",
      "source" : [{
        "context" : "src",
        "element" : "addr",
        "variable" : "srcAddr"
      }],
      "target" : [{
        "context" : "organization",
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
        "variable" : ["srcAddr", "address"]
      }]
    }]
  },
  {
    "name" : "MapCDAAssignedEntityToPractitioner",
    "typeMode" : "none",
    "documentation" : "GROUPE COMMUN — ASSIGNEDENTITY CDA VERS PRACTITIONER FHIR\n\n   Ce groupe transforme un élément CDA de type assignedEntity vers une ressource\n   FHIR Practitioner déjà créée par le groupe appelant.\n\n   Il alimente les informations génériques du professionnel :\n   identifier, address, telecom et name",
    "input" : [{
      "name" : "src",
      "mode" : "source"
    },
    {
      "name" : "practitioner",
      "type" : "Practitioner",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "identifier",
      "source" : [{
        "context" : "src",
        "element" : "id",
        "variable" : "id"
      }],
      "target" : [{
        "context" : "practitioner",
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
        "context" : "src",
        "element" : "addr",
        "variable" : "addr"
      }],
      "target" : [{
        "context" : "practitioner",
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
        "context" : "src",
        "element" : "telecom",
        "variable" : "telecom"
      }],
      "target" : [{
        "context" : "practitioner",
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
      "name" : "assignedPerson",
      "source" : [{
        "context" : "src",
        "element" : "assignedPerson",
        "variable" : "person"
      }],
      "rule" : [{
        "name" : "assignedName",
        "source" : [{
          "context" : "person",
          "element" : "name",
          "variable" : "pName"
        }],
        "target" : [{
          "context" : "practitioner",
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
          "variable" : ["pName", "humanName"]
        }]
      }]
    }]
  },
  {
    "name" : "MapCDAAssignedEntityToPractitionerRole",
    "typeMode" : "none",
    "documentation" : "GROUPE COMMUN — ASSIGNEDENTITY CDA VERS PRACTITIONERROLE FHIR\n\n   Ce groupe transforme le lien fonctionnel porté par un assignedEntity CDA vers\n   une ressource FHIR PractitionerRole déjà créée par le groupe appelant.\n\n   Il alimente les références PractitionerRole.practitioner et\n   PractitionerRole.organization à partir des ressources Practitioner et\n   Organization déjà créées",
    "input" : [{
      "name" : "src",
      "mode" : "source"
    },
    {
      "name" : "role",
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
      "name" : "practitionerRef",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "role",
        "contextType" : "variable",
        "element" : "practitioner",
        "variable" : "refPractitioner",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Reference"
        }]
      },
      {
        "context" : "refPractitioner",
        "contextType" : "variable",
        "element" : "reference",
        "transform" : "evaluate",
        "parameter" : [{
          "valueString" : "'urn:uuid:' + %practitioner.id"
        }]
      }]
    },
    {
      "name" : "organizationRef",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "role",
        "contextType" : "variable",
        "element" : "organization",
        "variable" : "refOrganization",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Reference"
        }]
      },
      {
        "context" : "refOrganization",
        "contextType" : "variable",
        "element" : "reference",
        "transform" : "evaluate",
        "parameter" : [{
          "valueString" : "'urn:uuid:' + %organization.id"
        }]
      }]
    }]
  },
  {
    "name" : "MapCDARelatedEntityToRelatedPerson",
    "typeMode" : "none",
    "documentation" : "GROUPE COMMUN — RELATEDENTITY CDA VERS RELATEDPERSON FHIR\n\n   Ce groupe transforme un relatedEntity CDA vers une ressource FHIR RelatedPerson\n   déjà créée par le groupe appelant.\n\n   Il alimente le lien avec le Patient ainsi que les informations génériques :\n   identifier, address, telecom et name.\n\n   Le champ relationship n’est pas alimenté dans cette étape afin d’éviter un\n   double mapping. Il est enrichi ensuite dans l’étape française avec le système\n   NOS approprié",
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
      "name" : "patient",
      "type" : "Patient",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "patientRef",
      "source" : [{
        "context" : "relatedEntity"
      }],
      "target" : [{
        "context" : "relatedPerson",
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
        "context" : "relatedEntity",
        "element" : "id",
        "variable" : "id"
      }],
      "target" : [{
        "context" : "relatedPerson",
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
        "context" : "relatedEntity",
        "element" : "addr",
        "variable" : "addr"
      }],
      "target" : [{
        "context" : "relatedPerson",
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
        "context" : "relatedEntity",
        "element" : "telecom",
        "variable" : "telecom"
      }],
      "target" : [{
        "context" : "relatedPerson",
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
      "name" : "relatedPerson",
      "source" : [{
        "context" : "relatedEntity",
        "element" : "relatedPerson",
        "variable" : "person"
      }],
      "rule" : [{
        "name" : "name",
        "source" : [{
          "context" : "person",
          "element" : "name",
          "variable" : "name"
        }],
        "target" : [{
          "context" : "relatedPerson",
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
    }]
  },
  {
    "name" : "MapCDAHealthCareFacilityToLocationContext",
    "typeMode" : "none",
    "documentation" : "GROUPE COMMUN — HEALTHCAREFACILITY CDA VERS CONTEXTE DE LIEU FHIR\n\n   Ce groupe traite le bloc healthCareFacility du CDA.\n\n   Il complète les ressources Encounter, Location et Organization déjà créées\n   par le groupe appelant lorsque le bloc healthCareFacility existe.\n\n   Il alimente notamment :\n   - Encounter.location ;\n   - Encounter.serviceProvider ;\n   - Location.managingOrganization ;\n   - Location.name ;\n   - Location.type ;\n   - Organization représentant la structure de prise en charge.",
    "input" : [{
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
      "name" : "encounterLocation",
      "source" : [{
        "context" : "facility"
      }],
      "target" : [{
        "context" : "encounter",
        "contextType" : "variable",
        "element" : "location",
        "variable" : "encLocation"
      }],
      "rule" : [{
        "name" : "locationRef",
        "source" : [{
          "context" : "facility"
        }],
        "target" : [{
          "context" : "encLocation",
          "contextType" : "variable",
          "element" : "location",
          "variable" : "locRef",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Reference"
          }]
        },
        {
          "context" : "locRef",
          "contextType" : "variable",
          "element" : "reference",
          "transform" : "evaluate",
          "parameter" : [{
            "valueString" : "'urn:uuid:' + %location.id"
          }]
        }]
      }]
    },
    {
      "name" : "serviceProvider",
      "source" : [{
        "context" : "facility"
      }],
      "target" : [{
        "context" : "encounter",
        "contextType" : "variable",
        "element" : "serviceProvider",
        "variable" : "orgRef",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Reference"
        }]
      },
      {
        "context" : "orgRef",
        "contextType" : "variable",
        "element" : "reference",
        "transform" : "evaluate",
        "parameter" : [{
          "valueString" : "'urn:uuid:' + %facilityOrganization.id"
        }]
      }]
    },
    {
      "name" : "managingOrganization",
      "source" : [{
        "context" : "facility"
      }],
      "target" : [{
        "context" : "location",
        "contextType" : "variable",
        "element" : "managingOrganization",
        "variable" : "managingOrgRef",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Reference"
        }]
      },
      {
        "context" : "managingOrgRef",
        "contextType" : "variable",
        "element" : "reference",
        "transform" : "evaluate",
        "parameter" : [{
          "valueString" : "'urn:uuid:' + %facilityOrganization.id"
        }]
      }]
    },
    {
      "name" : "facilityLocation",
      "source" : [{
        "context" : "facility",
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
            "context" : "location",
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
      "name" : "locationType",
      "source" : [{
        "context" : "facility",
        "element" : "code",
        "variable" : "facilityCode"
      }],
      "target" : [{
        "context" : "location",
        "contextType" : "variable",
        "element" : "type",
        "variable" : "cc",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "CodeableConcept"
        }]
      }],
      "dependent" : [{
        "name" : "CDCodeableConcept",
        "variable" : ["facilityCode", "cc"]
      }]
    },
    {
      "name" : "serviceProviderOrganization",
      "source" : [{
        "context" : "facility",
        "element" : "serviceProviderOrganization",
        "variable" : "serviceProviderOrganization"
      }],
      "rule" : [{
        "name" : "facilityOrganization",
        "source" : [{
          "context" : "serviceProviderOrganization"
        }],
        "dependent" : [{
          "name" : "MapCDAOrganizationToOrganization",
          "variable" : ["serviceProviderOrganization", "facilityOrganization"]
        }]
      }]
    }]
  },
  {
    "name" : "MapClinicalDocumentBody",
    "typeMode" : "none",
    "documentation" : "CORPS CDA -> SECTIONS FHIR\n\n   Cette partie transforme uniquement le squelette du structuredBody CDA.\n   Les entries métier ne sont pas transformées dans l’étape 2\r\nCDA component.structuredBody -> FHIR Composition.section",
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
            }]
          }]
        }]
      }]
    }]
  },
  {
    "name" : "MapCDASectionToCompositionSection",
    "typeMode" : "none",
    "documentation" : "CDA section -> FHIR Composition.section title/code/text",
    "input" : [{
      "name" : "section",
      "mode" : "source"
    },
    {
      "name" : "compSection",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "sectionTitle",
      "source" : [{
        "context" : "section",
        "element" : "title",
        "variable" : "sectionTitle"
      }],
      "target" : [{
        "context" : "compSection",
        "contextType" : "variable",
        "element" : "title",
        "transform" : "evaluate",
        "parameter" : [{
          "valueString" : "sectionTitle.xmlText"
        }]
      }]
    },
    {
      "name" : "sectionCode",
      "source" : [{
        "context" : "section",
        "element" : "code",
        "variable" : "sectionCode"
      }],
      "target" : [{
        "context" : "compSection",
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
        "variable" : ["sectionCode", "cc"]
      }]
    },
    {
      "name" : "sectionText",
      "source" : [{
        "context" : "section",
        "element" : "text",
        "variable" : "sectionText"
      }],
      "target" : [{
        "context" : "compSection",
        "contextType" : "variable",
        "element" : "text",
        "variable" : "narrative",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Narrative"
        }]
      }],
      "rule" : [{
        "name" : "narrativeStatus",
        "source" : [{
          "context" : "sectionText"
        }],
        "target" : [{
          "context" : "narrative",
          "contextType" : "variable",
          "element" : "status",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "generated"
          }]
        }]
      },
      {
        "name" : "narrativeDiv",
        "source" : [{
          "context" : "sectionText"
        }],
        "target" : [{
          "context" : "narrative",
          "contextType" : "variable",
          "element" : "div",
          "transform" : "cast",
          "parameter" : [{
            "valueId" : "sectionText"
          },
          {
            "valueString" : "string"
          }]
        }]
      }]
    }]
  }]
}

```
