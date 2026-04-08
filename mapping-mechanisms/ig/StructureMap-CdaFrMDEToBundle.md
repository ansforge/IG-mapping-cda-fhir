# Mapping CSE-MDE vers FHIR Bundle - Contexte Français - POC - Mapping CDA to FHIR v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Mapping CSE-MDE vers FHIR Bundle - Contexte Français**

## StructureMap: Mapping CSE-MDE vers FHIR Bundle - Contexte Français 

| | |
| :--- | :--- |
| *Official URL*:https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/StructureMap/CdaFrMDEToBundle | *Version*:0.1.0 |
| Draft as of 2026-04-08 | *Computable Name*:CdaFrMDEToBundle |

 
Mapping CSE-MDE vers FHIR Bundle - Contexte Français 



## Resource Content

```json
{
  "resourceType" : "StructureMap",
  "id" : "CdaFrMDEToBundle",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/StructureMap/CdaFrMDEToBundle",
  "version" : "0.1.0",
  "name" : "CdaFrMDEToBundle",
  "title" : "Mapping CSE-MDE vers FHIR Bundle - Contexte Français",
  "status" : "draft",
  "date" : "2026-04-08T07:34:22+00:00",
  "publisher" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
  "contact" : [{
    "name" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
    "telecom" : [{
      "system" : "url",
      "value" : "https://esante.gouv.fr"
    }]
  }],
  "description" : "Mapping CSE-MDE vers FHIR Bundle - Contexte Français",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "FR",
      "display" : "FRANCE"
    }]
  }],
  "structure" : [{
    "url" : "http://hl7.org/cda/stds/core/StructureDefinition/ClinicalDocument",
    "mode" : "source",
    "alias" : "ClinicalDocument"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/Bundle",
    "mode" : "target",
    "alias" : "Bundle"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/Composition",
    "mode" : "target",
    "alias" : "Composition"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/Patient",
    "mode" : "target",
    "alias" : "Patient"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/Observation",
    "mode" : "target",
    "alias" : "Observation"
  }],
  "import" : ["https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/StructureMap/CdaToFHIRTypes",
  "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/StructureMap/CdaToBundle",
  "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/StructureMap/CdaFrToBundle"],
  "group" : [{
    "name" : "CdaFrMDEToBundle",
    "typeMode" : "none",
    "documentation" : "Entry point",
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
        "variable" : "e"
      },
      {
        "context" : "e",
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
        "variable" : "uuid",
        "transform" : "uuid"
      },
      {
        "context" : "e",
        "contextType" : "variable",
        "element" : "fullUrl",
        "transform" : "append",
        "parameter" : [{
          "valueString" : "urn:uuid:"
        },
        {
          "valueId" : "uuid"
        }]
      },
      {
        "context" : "bundle",
        "contextType" : "variable",
        "element" : "entry",
        "variable" : "e2"
      },
      {
        "context" : "e2",
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
        "variable" : "uuid2",
        "transform" : "uuid"
      },
      {
        "context" : "e2",
        "contextType" : "variable",
        "element" : "fullUrl",
        "transform" : "append",
        "parameter" : [{
          "valueString" : "urn:uuid:"
        },
        {
          "valueId" : "uuid2"
        }]
      }],
      "dependent" : [{
        "name" : "CdaFrMDEMapping",
        "variable" : ["cda", "patient", "composition", "bundle"]
      }]
    }]
  },
  {
    "name" : "CdaFrMDEMapping",
    "typeMode" : "none",
    "documentation" : "Main mapping group",
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
      "name" : "bundleId",
      "source" : [{
        "context" : "cda"
      }],
      "target" : [{
        "context" : "bundle",
        "contextType" : "variable",
        "element" : "id",
        "transform" : "uuid"
      }]
    },
    {
      "name" : "bundleIdentifier",
      "source" : [{
        "context" : "cda",
        "element" : "id",
        "variable" : "cdaId"
      }],
      "target" : [{
        "context" : "bundle",
        "contextType" : "variable",
        "element" : "identifier",
        "variable" : "identifier"
      }],
      "rule" : [{
        "name" : "system",
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
          "transform" : "translate",
          "parameter" : [{
            "valueId" : "root"
          },
          {
            "valueString" : "#oid2uri"
          },
          {
            "valueString" : "uri"
          }]
        }]
      },
      {
        "name" : "value",
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
        "name" : "systemOid",
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
        "name" : "valueOid",
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
      "name" : "bundleType",
      "source" : [{
        "context" : "cda"
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
      "name" : "bundleTimestamp",
      "source" : [{
        "context" : "cda",
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
      "name" : "composition",
      "source" : [{
        "context" : "cda"
      }],
      "target" : [{
        "context" : "composition",
        "contextType" : "variable"
      }],
      "dependent" : [{
        "name" : "ClinicalDocumentComposition",
        "variable" : ["cda", "composition", "patient", "bundle"]
      }]
    },
    {
      "name" : "recordTargetGender",
      "source" : [{
        "context" : "cda",
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
          "name" : "cdaPatient",
          "source" : [{
            "context" : "patientRole",
            "element" : "patient",
            "variable" : "cdaPatient"
          }],
          "rule" : [{
            "name" : "patientGender",
            "source" : [{
              "context" : "cdaPatient",
              "element" : "administrativeGenderCode",
              "variable" : "gender"
            }],
            "dependent" : [{
              "name" : "MapGender",
              "variable" : ["gender", "patient"]
            }]
          }]
        }]
      }]
    },
    {
      "name" : "cdaComponent",
      "source" : [{
        "context" : "cda",
        "element" : "component",
        "variable" : "cdaComp"
      }],
      "rule" : [{
        "name" : "structuredBody",
        "source" : [{
          "context" : "cdaComp",
          "element" : "structuredBody",
          "variable" : "body"
        }],
        "rule" : [{
          "name" : "bodyComponent",
          "source" : [{
            "context" : "body",
            "element" : "component",
            "variable" : "bodyComp"
          }],
          "rule" : [{
            "name" : "section",
            "source" : [{
              "context" : "bodyComp",
              "element" : "section",
              "variable" : "section"
            }],
            "rule" : [{
              "name" : "compSection",
              "source" : [{
                "context" : "section"
              }],
              "target" : [{
                "context" : "composition",
                "contextType" : "variable",
                "element" : "section",
                "variable" : "compSection"
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
                  "transform" : "copy",
                  "parameter" : [{
                    "valueId" : "sectionText"
                  }]
                }]
              },
              {
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
                    "name" : "orgComponent",
                    "source" : [{
                      "context" : "organizer",
                      "element" : "component",
                      "variable" : "orgComp"
                    }],
                    "rule" : [{
                      "name" : "observation",
                      "source" : [{
                        "context" : "orgComp",
                        "element" : "observation",
                        "variable" : "obs"
                      }],
                      "rule" : [{
                        "name" : "processObs",
                        "source" : [{
                          "context" : "obs"
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
                          "variable" : "obsUuid",
                          "transform" : "uuid"
                        },
                        {
                          "context" : "obsEntry",
                          "contextType" : "variable",
                          "element" : "fullUrl",
                          "transform" : "append",
                          "parameter" : [{
                            "valueString" : "urn:uuid:"
                          },
                          {
                            "valueId" : "obsUuid"
                          }]
                        },
                        {
                          "context" : "compSection",
                          "contextType" : "variable",
                          "element" : "entry",
                          "variable" : "obsRef",
                          "transform" : "create",
                          "parameter" : [{
                            "valueString" : "Reference"
                          }]
                        },
                        {
                          "context" : "obsRef",
                          "contextType" : "variable",
                          "element" : "reference",
                          "transform" : "append",
                          "parameter" : [{
                            "valueString" : "urn:uuid:"
                          },
                          {
                            "valueId" : "obsUuid"
                          }]
                        }],
                        "dependent" : [{
                          "name" : "ProcessObservation",
                          "variable" : ["cda", "obs", "observation", "patient", "composition"]
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
    "name" : "ProcessObservation",
    "typeMode" : "none",
    "documentation" : "Process individual observation using CdaToFHIRTypes functions",
    "input" : [{
      "name" : "cda",
      "type" : "ClinicalDocument",
      "mode" : "source"
    },
    {
      "name" : "obs",
      "mode" : "source"
    },
    {
      "name" : "observation",
      "type" : "Observation",
      "mode" : "target"
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
      "name" : "metaWeight",
      "source" : [{
        "context" : "obs",
        "element" : "code",
        "variable" : "obsCode",
        "condition" : "code = '29463-7'"
      }],
      "target" : [{
        "context" : "observation",
        "contextType" : "variable",
        "element" : "meta",
        "variable" : "meta",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Meta"
        }]
      }],
      "rule" : [{
        "name" : "profileWeight",
        "source" : [{
          "context" : "obsCode"
        }],
        "target" : [{
          "context" : "meta",
          "contextType" : "variable",
          "element" : "profile",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "https://interop.esante.gouv.fr/ig/fhir/mesures/StructureDefinition/mesures-fr-observation-body-weight"
          }]
        }]
      }]
    },
    {
      "name" : "metaHeight",
      "source" : [{
        "context" : "obs",
        "element" : "code",
        "variable" : "obsCode",
        "condition" : "code = '8302-2'"
      }],
      "target" : [{
        "context" : "observation",
        "contextType" : "variable",
        "element" : "meta",
        "variable" : "meta",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Meta"
        }]
      }],
      "rule" : [{
        "name" : "profileHeight",
        "source" : [{
          "context" : "obsCode"
        }],
        "target" : [{
          "context" : "meta",
          "contextType" : "variable",
          "element" : "profile",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "https://interop.esante.gouv.fr/ig/fhir/mesures/StructureDefinition/mesures-fr-observation-bodyheight"
          }]
        }]
      }]
    },
    {
      "name" : "metaHeadCirc",
      "source" : [{
        "context" : "obs",
        "element" : "code",
        "variable" : "obsCode",
        "condition" : "code = '8287-5'"
      }],
      "target" : [{
        "context" : "observation",
        "contextType" : "variable",
        "element" : "meta",
        "variable" : "meta",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Meta"
        }]
      }],
      "rule" : [{
        "name" : "profileHeadCirc",
        "source" : [{
          "context" : "obsCode"
        }],
        "target" : [{
          "context" : "meta",
          "contextType" : "variable",
          "element" : "profile",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "https://interop.esante.gouv.fr/ig/fhir/mesures/StructureDefinition/mesures-observation-head-circumference"
          }]
        }]
      }]
    },
    {
      "name" : "statusCompleted",
      "source" : [{
        "context" : "obs",
        "element" : "statusCode",
        "variable" : "statusCode",
        "condition" : "code = 'completed'"
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
      "name" : "statusOther",
      "source" : [{
        "context" : "obs",
        "element" : "statusCode",
        "variable" : "statusCode",
        "condition" : "code != 'completed'"
      }],
      "target" : [{
        "context" : "observation",
        "contextType" : "variable",
        "element" : "status",
        "variable" : "status",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "code"
        }]
      }],
      "dependent" : [{
        "name" : "CSCode",
        "variable" : ["statusCode", "status"]
      }]
    },
    {
      "name" : "category",
      "source" : [{
        "context" : "obs"
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
        "name" : "coding",
        "source" : [{
          "context" : "obs"
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
          "name" : "system",
          "source" : [{
            "context" : "obs"
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
          "name" : "code",
          "source" : [{
            "context" : "obs"
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
        }]
      }]
    },
    {
      "name" : "obsCode",
      "source" : [{
        "context" : "obs",
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
      "name" : "effectiveDateTime",
      "source" : [{
        "context" : "obs",
        "element" : "effectiveTime",
        "variable" : "effectiveTime"
      }],
      "target" : [{
        "context" : "observation",
        "contextType" : "variable",
        "element" : "effective",
        "variable" : "dt",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "dateTime"
        }]
      }],
      "dependent" : [{
        "name" : "TSDateTime",
        "variable" : ["effectiveTime", "dt"]
      }]
    },
    {
      "name" : "obsValue",
      "source" : [{
        "context" : "obs",
        "element" : "value",
        "variable" : "value"
      }],
      "target" : [{
        "context" : "observation",
        "contextType" : "variable",
        "element" : "value",
        "variable" : "qty",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Quantity"
        }]
      }],
      "dependent" : [{
        "name" : "PQQuantity",
        "variable" : ["value", "qty"]
      }]
    },
    {
      "name" : "obsSubject",
      "source" : [{
        "context" : "obs"
      }],
      "target" : [{
        "context" : "observation",
        "contextType" : "variable",
        "element" : "subject",
        "variable" : "ref",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Reference"
        }]
      },
      {
        "context" : "ref",
        "contextType" : "variable",
        "element" : "reference",
        "transform" : "evaluate",
        "parameter" : [{
          "valueString" : "'urn:uuid:' + %patient.id"
        }]
      }]
    }]
  },
  {
    "name" : "MapGender",
    "typeMode" : "none",
    "documentation" : "Map CDA v3 administrative gender to FHIR gender",
    "input" : [{
      "name" : "src",
      "mode" : "source"
    },
    {
      "name" : "patient",
      "type" : "Patient",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "genderMale",
      "source" : [{
        "context" : "src",
        "condition" : "code = 'M'"
      }],
      "target" : [{
        "context" : "patient",
        "contextType" : "variable",
        "element" : "gender",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "male"
        }]
      }]
    },
    {
      "name" : "genderFemale",
      "source" : [{
        "context" : "src",
        "condition" : "code = 'F'"
      }],
      "target" : [{
        "context" : "patient",
        "contextType" : "variable",
        "element" : "gender",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "female"
        }]
      }]
    },
    {
      "name" : "genderOther",
      "source" : [{
        "context" : "src",
        "condition" : "code = 'UN'"
      }],
      "target" : [{
        "context" : "patient",
        "contextType" : "variable",
        "element" : "gender",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "other"
        }]
      }]
    },
    {
      "name" : "genderUnknown",
      "source" : [{
        "context" : "src",
        "condition" : "code = 'UNK'"
      }],
      "target" : [{
        "context" : "patient",
        "contextType" : "variable",
        "element" : "gender",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "unknown"
        }]
      }]
    }]
  }]
}

```
