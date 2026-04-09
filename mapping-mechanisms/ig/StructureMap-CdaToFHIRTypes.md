# Mapping de CDA vers les FHIR Types (A partir des sources de Oliver Egger) - POC - Mapping CDA to FHIR v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Mapping de CDA vers les FHIR Types (A partir des sources de Oliver Egger)**

## StructureMap: Mapping de CDA vers les FHIR Types (A partir des sources de Oliver Egger) 

| | |
| :--- | :--- |
| *Official URL*:https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/StructureMap/CdaToFHIRTypes | *Version*:0.1.0 |
| Draft as of 2026-04-09 | *Computable Name*:CdaToFHIRTypes |

 
Mapping de CDA vers les FHIR Types (A partir des sources de Oliver Egger) 



## Resource Content

```json
{
  "resourceType" : "StructureMap",
  "id" : "CdaToFHIRTypes",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/StructureMap/CdaToFHIRTypes",
  "version" : "0.1.0",
  "name" : "CdaToFHIRTypes",
  "title" : "Mapping de CDA vers les FHIR Types (A partir des sources de Oliver Egger)",
  "status" : "draft",
  "date" : "2026-04-09T10:02:36+00:00",
  "publisher" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
  "contact" : [{
    "name" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
    "telecom" : [{
      "system" : "url",
      "value" : "https://esante.gouv.fr"
    }]
  }],
  "description" : "Mapping de CDA vers les FHIR Types (A partir des sources de Oliver Egger)",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "FR",
      "display" : "FRANCE"
    }]
  }],
  "structure" : [{
    "url" : "http://hl7.org/cda/stds/core/StructureDefinition/ED",
    "mode" : "source",
    "alias" : "ED"
  },
  {
    "url" : "http://hl7.org/cda/stds/core/StructureDefinition/PN",
    "mode" : "source",
    "alias" : "PN"
  },
  {
    "url" : "http://hl7.org/cda/stds/core/StructureDefinition/II",
    "mode" : "source",
    "alias" : "II"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/Identifier",
    "mode" : "target",
    "alias" : "Identifier"
  },
  {
    "url" : "http://hl7.org/cda/stds/core/StructureDefinition/TS",
    "mode" : "source",
    "alias" : "TS"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/instant",
    "mode" : "target",
    "alias" : "instant"
  },
  {
    "url" : "http://hl7.org/cda/stds/core/StructureDefinition/CS",
    "mode" : "source",
    "alias" : "CS"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/code",
    "mode" : "target",
    "alias" : "code"
  },
  {
    "url" : "http://hl7.org/cda/stds/core/StructureDefinition/CE",
    "mode" : "source",
    "alias" : "CE"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/CodeableConcept",
    "mode" : "target",
    "alias" : "CodeableConcept"
  },
  {
    "url" : "http://hl7.org/cda/stds/core/StructureDefinition/ST",
    "mode" : "source",
    "alias" : "ST"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/string",
    "mode" : "target",
    "alias" : "string"
  },
  {
    "url" : "http://hl7.org/cda/stds/core/StructureDefinition/EN",
    "mode" : "source",
    "alias" : "EN"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/HumanName",
    "mode" : "target",
    "alias" : "HumanName"
  },
  {
    "url" : "http://hl7.org/cda/stds/core/StructureDefinition/AD",
    "mode" : "source",
    "alias" : "AD"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/Address",
    "mode" : "target",
    "alias" : "Address"
  },
  {
    "url" : "http://hl7.org/cda/stds/core/StructureDefinition/TEL",
    "mode" : "source",
    "alias" : "TEL"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/ContactPoint",
    "mode" : "target",
    "alias" : "ContactPoint"
  },
  {
    "url" : "http://hl7.org/cda/stds/core/StructureDefinition/BL",
    "mode" : "source",
    "alias" : "BL"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/boolean",
    "mode" : "target",
    "alias" : "boolean"
  },
  {
    "url" : "http://hl7.org/cda/stds/core/StructureDefinition/IVL-TS",
    "mode" : "source",
    "alias" : "IVL_TS"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/Period",
    "mode" : "target",
    "alias" : "Period"
  }],
  "group" : [{
    "name" : "Any",
    "typeMode" : "none",
    "input" : [{
      "name" : "src",
      "mode" : "source"
    },
    {
      "name" : "tgt",
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
      }]
    }]
  },
  {
    "name" : "II",
    "extends" : "Any",
    "typeMode" : "types",
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
      "name" : "root1",
      "source" : [{
        "context" : "src",
        "element" : "root",
        "variable" : "r",
        "condition" : "src.extension.exists()"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "system",
        "transform" : "append",
        "parameter" : [{
          "valueString" : "urn:oid:"
        },
        {
          "valueId" : "r"
        }]
      }]
    },
    {
      "name" : "rootuuid",
      "source" : [{
        "context" : "src",
        "element" : "root",
        "variable" : "r",
        "condition" : "src.extension.empty() and src.root.matches('[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}')"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "system",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "urn:ietf:rfc:3986"
        }]
      },
      {
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "value",
        "transform" : "evaluate",
        "parameter" : [{
          "valueString" : "'urn:uuid:' + r.lower()"
        }]
      }]
    },
    {
      "name" : "rootoid",
      "source" : [{
        "context" : "src",
        "element" : "root",
        "variable" : "r",
        "condition" : "src.extension.empty() and src.root.contains('.')"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "system",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "urn:ietf:rfc:3986"
        }]
      },
      {
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "value",
        "transform" : "append",
        "parameter" : [{
          "valueString" : "urn:oid:"
        },
        {
          "valueId" : "r"
        }]
      }]
    },
    {
      "name" : "extension",
      "source" : [{
        "context" : "src",
        "element" : "extension",
        "variable" : "e"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "value",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "e"
        }]
      }]
    },
    {
      "name" : "assigningAuthorityName",
      "source" : [{
        "context" : "src",
        "element" : "assigningAuthorityName",
        "variable" : "s"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "assigner",
        "variable" : "a"
      },
      {
        "context" : "a",
        "contextType" : "variable",
        "element" : "display",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "s"
        }]
      }],
      "documentation" : "there's no equivalent for displayable in FHIR - and it probably will never matter, but if it does, it might map to Identifier.use."
    },
    {
      "name" : "extension",
      "source" : [{
        "context" : "src",
        "element" : "displayable",
        "variable" : "displayable"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "extension",
        "variable" : "ext"
      }],
      "rule" : [{
        "name" : "url",
        "source" : [{
          "context" : "displayable"
        }],
        "target" : [{
          "context" : "ext",
          "contextType" : "variable",
          "element" : "url",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "http://hl7.org/fhir/cdaStructureDefinition/extension-displayable"
          }]
        }]
      },
      {
        "name" : "value",
        "source" : [{
          "context" : "displayable",
          "element" : "value",
          "variable" : "v"
        }],
        "target" : [{
          "context" : "ext",
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
    }]
  },
  {
    "name" : "INT",
    "extends" : "Any",
    "typeMode" : "types",
    "input" : [{
      "name" : "src",
      "type" : "INT",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "integer",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "integer",
      "source" : [{
        "context" : "src",
        "element" : "value",
        "variable" : "v"
      }],
      "target" : [{
        "context" : "tgt",
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
    "name" : "TemplateID",
    "typeMode" : "none",
    "input" : [{
      "name" : "template",
      "type" : "II",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "templateId",
      "source" : [{
        "context" : "template"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "extension",
        "variable" : "ext"
      }],
      "rule" : [{
        "name" : "url",
        "source" : [{
          "context" : "template"
        }],
        "target" : [{
          "context" : "ext",
          "contextType" : "variable",
          "element" : "url",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "http://hl7.org/cda/stds/core/StructureDefinition/templateID"
          }]
        }]
      },
      {
        "name" : "value",
        "source" : [{
          "context" : "template"
        }],
        "target" : [{
          "context" : "ext",
          "contextType" : "variable",
          "element" : "value",
          "variable" : "value",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Identifier"
          }]
        }],
        "dependent" : [{
          "name" : "II",
          "variable" : ["template", "value"]
        }]
      }]
    }]
  },
  {
    "name" : "Negation",
    "typeMode" : "none",
    "input" : [{
      "name" : "negation",
      "type" : "BL",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "negation",
      "source" : [{
        "context" : "negation"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "modifierExtension",
        "variable" : "ext"
      }],
      "rule" : [{
        "name" : "url",
        "source" : [{
          "context" : "negation"
        }],
        "target" : [{
          "context" : "ext",
          "contextType" : "variable",
          "element" : "url",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "http://hl7.org/cda/stds/core/StructureDefinition/negationIndicator"
          }]
        }]
      },
      {
        "name" : "value",
        "source" : [{
          "context" : "negation",
          "variable" : "neg"
        }],
        "target" : [{
          "context" : "ext",
          "contextType" : "variable",
          "element" : "value",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "boolean"
          }]
        },
        {
          "context" : "ext",
          "contextType" : "variable",
          "element" : "value",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "neg"
          }]
        }]
      }]
    }]
  },
  {
    "name" : "TSInstant",
    "extends" : "Any",
    "typeMode" : "types",
    "input" : [{
      "name" : "src",
      "type" : "TS",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "instant",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "value",
      "source" : [{
        "context" : "src",
        "element" : "value",
        "variable" : "v"
      }],
      "target" : [{
        "context" : "tgt",
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
    "name" : "TSDateTime",
    "extends" : "TSInstant",
    "typeMode" : "types",
    "input" : [{
      "name" : "src",
      "type" : "TS",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "dateTime",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "inherit",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable"
      }]
    }]
  },
  {
    "name" : "TSDate",
    "extends" : "TSInstant",
    "typeMode" : "types",
    "input" : [{
      "name" : "src",
      "type" : "TS",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "date",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "inherit",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable"
      }]
    }]
  },
  {
    "name" : "IVLTSPeriod",
    "extends" : "Any",
    "typeMode" : "types",
    "input" : [{
      "name" : "src",
      "type" : "IVL_TS",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "Period",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "low",
      "source" : [{
        "context" : "src",
        "element" : "low",
        "variable" : "low"
      }],
      "target" : [{
        "context" : "tgt",
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
        "context" : "src",
        "element" : "high",
        "variable" : "high"
      }],
      "target" : [{
        "context" : "tgt",
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
    "name" : "IVLTSDateTime",
    "extends" : "Any",
    "typeMode" : "types",
    "input" : [{
      "name" : "src",
      "type" : "IVL_TS",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "dateTime",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "low",
      "source" : [{
        "context" : "src",
        "element" : "low",
        "variable" : "s"
      }],
      "dependent" : [{
        "name" : "TSDateTime",
        "variable" : ["s", "tgt"]
      }]
    }]
  },
  {
    "name" : "STstring",
    "typeMode" : "none",
    "input" : [{
      "name" : "src",
      "type" : "ST",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "string",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "value",
      "source" : [{
        "context" : "src",
        "variable" : "v"
      }],
      "target" : [{
        "context" : "tgt",
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
    "name" : "EDstring",
    "extends" : "STstring",
    "typeMode" : "types",
    "input" : [{
      "name" : "src",
      "type" : "ED",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "string",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "inherit",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable"
      }]
    }]
  },
  {
    "name" : "ONstring",
    "extends" : "STstring",
    "typeMode" : "types",
    "input" : [{
      "name" : "src",
      "type" : "ON",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "string",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "inherit",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable"
      }]
    }]
  },
  {
    "name" : "CSCode",
    "typeMode" : "none",
    "input" : [{
      "name" : "src",
      "type" : "CS",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "code",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "code",
      "source" : [{
        "context" : "src",
        "element" : "code",
        "variable" : "c"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "value",
        "transform" : "cast",
        "parameter" : [{
          "valueId" : "c"
        },
        {
          "valueString" : "string"
        }]
      }]
    }]
  },
  {
    "name" : "CECode",
    "extends" : "CSCode",
    "typeMode" : "types",
    "input" : [{
      "name" : "src",
      "type" : "CE",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "code",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "inherit",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable"
      }]
    }]
  },
  {
    "name" : "CDCode",
    "extends" : "CSCode",
    "typeMode" : "types",
    "input" : [{
      "name" : "src",
      "type" : "CD",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "code",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "inherit",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable"
      }]
    }]
  },
  {
    "name" : "CECodeableConcept",
    "typeMode" : "none",
    "input" : [{
      "name" : "src",
      "type" : "CE",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "CodeableConcept",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "setOriginalText",
      "source" : [{
        "context" : "src",
        "element" : "originalText",
        "variable" : "originalText"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "text",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "originalText"
        }]
      }]
    },
    {
      "name" : "code",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "coding",
        "variable" : "coding"
      }],
      "rule" : [{
        "name" : "code",
        "source" : [{
          "context" : "src",
          "element" : "code",
          "variable" : "code"
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
            "valueString" : "string"
          }]
        }]
      },
      {
        "name" : "codeSystem",
        "source" : [{
          "context" : "src",
          "element" : "codeSystem",
          "variable" : "system"
        }],
        "target" : [{
          "context" : "coding",
          "contextType" : "variable",
          "element" : "system",
          "transform" : "append",
          "parameter" : [{
            "valueString" : "urn:oid:"
          },
          {
            "valueId" : "system"
          }]
        }]
      },
      {
        "name" : "displayName",
        "source" : [{
          "context" : "src",
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
    },
    {
      "name" : "translation",
      "source" : [{
        "context" : "src",
        "element" : "translation",
        "variable" : "translation"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "coding",
        "variable" : "coding"
      }],
      "rule" : [{
        "name" : "code",
        "source" : [{
          "context" : "translation",
          "element" : "code",
          "variable" : "code"
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
            "valueString" : "string"
          }]
        }]
      },
      {
        "name" : "codeSystem",
        "source" : [{
          "context" : "translation",
          "element" : "codeSystem",
          "variable" : "system"
        }],
        "target" : [{
          "context" : "coding",
          "contextType" : "variable",
          "element" : "system",
          "transform" : "append",
          "parameter" : [{
            "valueString" : "urn:oid:"
          },
          {
            "valueId" : "system"
          }]
        }]
      },
      {
        "name" : "displayName",
        "source" : [{
          "context" : "translation",
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
    "name" : "CSCodeableConcept",
    "extends" : "CECodeableConcept",
    "typeMode" : "types",
    "input" : [{
      "name" : "src",
      "type" : "CS",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "CodeableConcept",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "inherit",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable"
      }]
    }]
  },
  {
    "name" : "CDCodeableConcept",
    "extends" : "CECodeableConcept",
    "typeMode" : "types",
    "input" : [{
      "name" : "src",
      "type" : "CD",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "CodeableConcept",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "inherit",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable"
      }]
    }]
  },
  {
    "name" : "ENHumanName",
    "typeMode" : "none",
    "input" : [{
      "name" : "src",
      "type" : "EN",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "HumanName",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "item",
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
          "variable" : "v"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "family",
          "transform" : "evaluate",
          "parameter" : [{
            "valueString" : "v.xmlText"
          }]
        }]
      },
      {
        "name" : "given",
        "source" : [{
          "context" : "item",
          "element" : "given",
          "variable" : "v"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "given",
          "transform" : "evaluate",
          "parameter" : [{
            "valueString" : "v.xmlText"
          }]
        }]
      },
      {
        "name" : "prefix",
        "source" : [{
          "context" : "item",
          "element" : "prefix",
          "variable" : "v"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "prefix",
          "transform" : "evaluate",
          "parameter" : [{
            "valueString" : "v.xmlText"
          }]
        }]
      },
      {
        "name" : "suffix",
        "source" : [{
          "context" : "item",
          "element" : "suffix",
          "variable" : "v"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "suffix",
          "transform" : "evaluate",
          "parameter" : [{
            "valueString" : "v.xmlText"
          }]
        }]
      }]
    },
    {
      "name" : "validTime",
      "source" : [{
        "context" : "src",
        "element" : "validTime",
        "variable" : "validTime"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "period",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "validTime"
        }]
      }]
    }]
  },
  {
    "name" : "PNHumanName",
    "extends" : "ENHumanName",
    "typeMode" : "types",
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
      "name" : "inherit",
      "source" : [{
        "context" : "src"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable"
      }]
    }]
  },
  {
    "name" : "ADAddress",
    "typeMode" : "none",
    "input" : [{
      "name" : "src",
      "type" : "AD",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "Address",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "item",
      "source" : [{
        "context" : "src",
        "element" : "item",
        "variable" : "item"
      }],
      "rule" : [{
        "name" : "country",
        "source" : [{
          "context" : "item",
          "element" : "country",
          "variable" : "v"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "country",
          "transform" : "evaluate",
          "parameter" : [{
            "valueString" : "v.xmlText"
          }]
        }]
      },
      {
        "name" : "state",
        "source" : [{
          "context" : "item",
          "element" : "state",
          "variable" : "v"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "state",
          "transform" : "evaluate",
          "parameter" : [{
            "valueString" : "v.xmlText"
          }]
        }]
      },
      {
        "name" : "county",
        "source" : [{
          "context" : "item",
          "element" : "county",
          "variable" : "v"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "district",
          "transform" : "evaluate",
          "parameter" : [{
            "valueString" : "v.xmlText"
          }]
        }]
      },
      {
        "name" : "city",
        "source" : [{
          "context" : "item",
          "element" : "city",
          "variable" : "v"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "city",
          "transform" : "evaluate",
          "parameter" : [{
            "valueString" : "v.xmlText"
          }]
        }]
      },
      {
        "name" : "postalCode",
        "source" : [{
          "context" : "item",
          "element" : "postalCode",
          "variable" : "v"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "postalCode",
          "transform" : "evaluate",
          "parameter" : [{
            "valueString" : "v.xmlText"
          }]
        }]
      },
      {
        "name" : "streetAddressLine",
        "source" : [{
          "context" : "item",
          "element" : "streetAddressLine",
          "variable" : "v"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "line",
          "transform" : "evaluate",
          "parameter" : [{
            "valueString" : "v.xmlText"
          }]
        }]
      },
      {
        "name" : "CensusTract",
        "source" : [{
          "context" : "item"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "line",
          "variable" : "line"
        }],
        "rule" : [{
          "name" : "sfgfdsg",
          "source" : [{
            "context" : "item",
            "condition" : "src.censusTract.exists()"
          }],
          "rule" : [{
            "name" : "line",
            "source" : [{
              "context" : "item",
              "element" : "censusTract",
              "variable" : "v"
            }],
            "target" : [{
              "context" : "line",
              "contextType" : "variable",
              "element" : "extension",
              "variable" : "ext1"
            }],
            "dependent" : [{
              "name" : "CensusTract",
              "variable" : ["v", "ext1"]
            }]
          }]
        }]
      },
      {
        "name" : "streetName",
        "source" : [{
          "context" : "item",
          "element" : "streetName",
          "variable" : "v"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "line",
          "transform" : "evaluate",
          "parameter" : [{
            "valueString" : "v.xmlText"
          }]
        }]
      },
      {
        "name" : "houseNumber",
        "source" : [{
          "context" : "item",
          "element" : "houseNumber",
          "variable" : "v"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "line",
          "transform" : "evaluate",
          "parameter" : [{
            "valueString" : "v.xmlText"
          }]
        }]
      }]
    },
    {
      "name" : "useablePeriod",
      "source" : [{
        "context" : "src",
        "element" : "useablePeriod",
        "variable" : "useablePeriod"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "period",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "useablePeriod"
        }]
      }]
    }]
  },
  {
    "name" : "TELContactPoint",
    "typeMode" : "none",
    "input" : [{
      "name" : "src",
      "type" : "TEL",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "ContactPoint",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "valuetel",
      "source" : [{
        "context" : "src",
        "element" : "value",
        "variable" : "v",
        "condition" : "(src.value.startsWith('tel:'))"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "value",
        "transform" : "evaluate",
        "parameter" : [{
          "valueString" : "v.substring(4)"
        }]
      },
      {
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "system",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "phone"
        }]
      }]
    },
    {
      "name" : "valuefax",
      "source" : [{
        "context" : "src",
        "element" : "value",
        "variable" : "v",
        "condition" : "(src.value.startsWith('fax:'))"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "value",
        "transform" : "evaluate",
        "parameter" : [{
          "valueString" : "v.substring(4)"
        }]
      },
      {
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "system",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "fax"
        }]
      }]
    },
    {
      "name" : "valuemail",
      "source" : [{
        "context" : "src",
        "element" : "value",
        "variable" : "v",
        "condition" : "(src.value.startsWith('mailto:'))"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "value",
        "transform" : "evaluate",
        "parameter" : [{
          "valueString" : "v.substring(7)"
        }]
      },
      {
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "system",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "email"
        }]
      }]
    },
    {
      "name" : "valuehttp",
      "source" : [{
        "context" : "src",
        "element" : "value",
        "variable" : "v",
        "condition" : "(src.value.startsWith('http:'))"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "value",
        "transform" : "evaluate",
        "parameter" : [{
          "valueString" : "v.substring(5)"
        }]
      },
      {
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "system",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "url"
        }]
      }]
    },
    {
      "name" : "usehome",
      "source" : [{
        "context" : "src",
        "element" : "use",
        "condition" : "(src.use.startsWith('H'))"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "use",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "home"
        }]
      }]
    },
    {
      "name" : "usework",
      "source" : [{
        "context" : "src",
        "element" : "use",
        "condition" : "((src.use = 'WP') or (src.use = 'DIR') or (src.use = 'PUB'))"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "use",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "work"
        }]
      }]
    },
    {
      "name" : "usebad",
      "source" : [{
        "context" : "src",
        "element" : "use",
        "condition" : "(src.use = 'BAD')"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "use",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "old"
        }]
      }]
    },
    {
      "name" : "usetmp",
      "source" : [{
        "context" : "src",
        "element" : "use",
        "condition" : "(src.use = 'TMP')"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "use",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "temp"
        }]
      }]
    },
    {
      "name" : "usemobile",
      "source" : [{
        "context" : "src",
        "element" : "use",
        "condition" : "(src.use = 'MC')"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "use",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "mobile"
        }]
      }]
    },
    {
      "name" : "useablePeriod",
      "source" : [{
        "context" : "src",
        "element" : "useablePeriod",
        "variable" : "useablePeriod"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "period",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "useablePeriod"
        }]
      }],
      "documentation" : "use: for src.use as c make tgt.use = translate(c, 'http://hl7.org/fhir/ConceptMap/cm-telecom-use-v3', 'code')"
    }]
  },
  {
    "name" : "PQQuantity",
    "typeMode" : "none",
    "input" : [{
      "name" : "src",
      "type" : "PQ",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "Quantity",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "unit",
      "source" : [{
        "context" : "src",
        "element" : "unit",
        "variable" : "unit"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "unit",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "unit"
        }]
      }]
    },
    {
      "name" : "unit",
      "source" : [{
        "context" : "src",
        "element" : "unit",
        "variable" : "unit"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "code",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "unit"
        }]
      }]
    },
    {
      "name" : "unit",
      "source" : [{
        "context" : "src",
        "element" : "unit",
        "variable" : "unit"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "system",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "http://unitsofmeasure.org"
        }]
      }]
    },
    {
      "name" : "value",
      "source" : [{
        "context" : "src",
        "element" : "value",
        "variable" : "value"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "value",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "value"
        }]
      }]
    }]
  },
  {
    "name" : "RTOPQPQRatio",
    "typeMode" : "none",
    "input" : [{
      "name" : "src",
      "type" : "RTO_PQ_PQ",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "Ratio",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "numerator",
      "source" : [{
        "context" : "src",
        "element" : "numerator",
        "variable" : "numerator"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "numerator",
        "variable" : "targetNumerator"
      }],
      "dependent" : [{
        "name" : "PQQuantity",
        "variable" : ["numerator", "targetNumerator"]
      }]
    },
    {
      "name" : "denominator",
      "source" : [{
        "context" : "src",
        "element" : "denominator",
        "variable" : "denominator"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "denominator",
        "variable" : "targetDenominator"
      }],
      "dependent" : [{
        "name" : "PQQuantity",
        "variable" : ["denominator", "targetDenominator"]
      }]
    }]
  }]
}

```
