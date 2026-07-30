# Mapping de CDA vers les FHIR Types (A partir des sources de Oliver Egger) - Mapping CDA to FHIR (Preuve de concept) v0.1.0

## StructureMap: Mapping de CDA vers les FHIR Types (A partir des sources de Oliver Egger) 

 
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
  "date" : "2026-07-30T13:25:45+00:00",
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
      "display" : "France (la)"
    }]
  }],
  "structure" : [{
    "url" : "http://hl7.org/cda/stds/core/StructureDefinition/ED|2.0.0-sd",
    "mode" : "source",
    "alias" : "ED",
    "documentation" : "Adapted from https://github.com/HL7/ccda-to-fhir/tree/master/mappings\r\nCDA:  http://build.fhir.org/ig/ahdis/cda-core-2.0/branches/master/index.html\r\nFHIR: http://hl7.org/fhir/r4/\r\nDéclaration des types CDA utilisés comme sources"
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
    "url" : "http://hl7.org/cda/stds/core/StructureDefinition/TS|2.0.0-sd",
    "mode" : "source",
    "alias" : "TS"
  },
  {
    "url" : "http://hl7.org/cda/stds/core/StructureDefinition/CS|2.0.0-sd",
    "mode" : "source",
    "alias" : "CS"
  },
  {
    "url" : "http://hl7.org/cda/stds/core/StructureDefinition/CE|2.0.0-sd",
    "mode" : "source",
    "alias" : "CE"
  },
  {
    "url" : "http://hl7.org/cda/stds/core/StructureDefinition/ST|2.0.0-sd",
    "mode" : "source",
    "alias" : "ST"
  },
  {
    "url" : "http://hl7.org/cda/stds/core/StructureDefinition/ON|2.0.0-sd",
    "mode" : "source",
    "alias" : "ON"
  },
  {
    "url" : "http://hl7.org/cda/stds/core/StructureDefinition/EN|2.0.0-sd",
    "mode" : "source",
    "alias" : "EN"
  },
  {
    "url" : "http://hl7.org/cda/stds/core/StructureDefinition/AD|2.0.0-sd",
    "mode" : "source",
    "alias" : "AD"
  },
  {
    "url" : "http://hl7.org/cda/stds/core/StructureDefinition/TEL|2.0.0-sd",
    "mode" : "source",
    "alias" : "TEL"
  },
  {
    "url" : "http://hl7.org/cda/stds/core/StructureDefinition/BL|2.0.0-sd",
    "mode" : "source",
    "alias" : "BL"
  },
  {
    "url" : "http://hl7.org/cda/stds/core/StructureDefinition/IVL-TS|2.0.0-sd",
    "mode" : "source",
    "alias" : "IVL_TS"
  },
  {
    "url" : "http://hl7.org/cda/stds/core/StructureDefinition/INT|2.0.0-sd",
    "mode" : "source",
    "alias" : "INT"
  },
  {
    "url" : "http://hl7.org/cda/stds/core/StructureDefinition/CD|2.0.0-sd",
    "mode" : "source",
    "alias" : "CD"
  },
  {
    "url" : "http://hl7.org/cda/stds/core/StructureDefinition/PQ|2.0.0-sd",
    "mode" : "source",
    "alias" : "PQ"
  },
  {
    "url" : "http://hl7.org/cda/stds/core/StructureDefinition/RTO-PQ-PQ|2.0.0-sd",
    "mode" : "source",
    "alias" : "RTO_PQ_PQ"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/Identifier|4.0.1",
    "mode" : "target",
    "alias" : "Identifier",
    "documentation" : "Déclaration des types FHIR utilisés comme cibles"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/instant|4.0.1",
    "mode" : "target",
    "alias" : "instant"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/code|4.0.1",
    "mode" : "target",
    "alias" : "code"
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
    "url" : "http://hl7.org/fhir/StructureDefinition/string|4.0.1",
    "mode" : "target",
    "alias" : "string"
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
    "url" : "http://hl7.org/fhir/StructureDefinition/boolean|4.0.1",
    "mode" : "target",
    "alias" : "boolean"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/Period|4.0.1",
    "mode" : "target",
    "alias" : "Period"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/integer|4.0.1",
    "mode" : "target",
    "alias" : "integer"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/dateTime|4.0.1",
    "mode" : "target",
    "alias" : "dateTime"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/date|4.0.1",
    "mode" : "target",
    "alias" : "date"
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
    "url" : "http://hl7.org/fhir/StructureDefinition/DomainResource|4.0.1",
    "mode" : "target",
    "alias" : "DomainResource"
  }],
  "group" : [{
    "name" : "Any",
    "typeMode" : "none",
    "documentation" : "Groupe générique de base (Sert de groupe parent pour les autres mappings)",
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
      }],
      "documentation" : "Mapping de base sans transformation spécifique"
    }]
  },
  {
    "name" : "II",
    "extends" : "Any",
    "typeMode" : "none",
    "documentation" : "Mapping CDA II vers FHIR Identifier\nII = Identifiant CDA\nIdentifier = Identifiant FHIR",
    "input" : [{
      "name" : "src",
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
      }],
      "documentation" : "Si root existe avec une extension, alors root devient le system en urn:oid"
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
          "valueString" : "'urn:uuid:' + %r.lower()"
        }]
      }],
      "documentation" : "Si root est un UUID sans extension, alors il est mappé comme urn:uuid"
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
      }],
      "documentation" : "Si root est un OID sans extension, alors il devient une valeur urn:oid"
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
      }],
      "documentation" : "L’extension CDA devient la valeur de l’Identifier FHIR"
    },
    {
      "name" : "assigner",
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
      }],
      "rule" : [{
        "name" : "display",
        "source" : [{
          "context" : "s"
        }],
        "target" : [{
          "context" : "a",
          "contextType" : "variable",
          "element" : "display",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "s"
          }]
        }]
      }],
      "documentation" : "Le nom de l’autorité d’assignation devient le display de l’assigner"
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
        }],
        "documentation" : "URL de l’extension displayable"
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
        }],
        "documentation" : "Valeur de displayable convertie en string"
      }],
      "documentation" : "Mapping de l’attribut displayable sous forme d’extension FHIR"
    }]
  },
  {
    "name" : "INT",
    "extends" : "Any",
    "typeMode" : "types",
    "documentation" : "Mapping CDA INT vers FHIR integer\nINT = entier CDA\ninteger = entier FHIR",
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
      }],
      "documentation" : "La valeur CDA devient la valeur FHIR"
    }]
  },
  {
    "name" : "TemplateID",
    "typeMode" : "none",
    "documentation" : "Mapping des templateId CDA (Les templateId sont conservés dans des extensions FHIR)",
    "input" : [{
      "name" : "template",
      "type" : "II",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "DomainResource",
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
        }],
        "documentation" : "URL de l’extension templateID"
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
        }],
        "documentation" : "Le templateId est transformé en Identifier FHIR"
      }],
      "documentation" : "Création d’une extension pour stocker le templateId CDA"
    }]
  },
  {
    "name" : "Negation",
    "typeMode" : "none",
    "documentation" : "Mapping du negationIndicator CDA (La négation CDA est représentée comme modifierExtension FHIR)",
    "input" : [{
      "name" : "negation",
      "type" : "BL",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "DomainResource",
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
        }],
        "documentation" : "URL de l’extension negationIndicator"
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
        }],
        "documentation" : "Valeur booléenne de la négation"
      }],
      "documentation" : "Création d’une modifierExtension pour indiquer la négation"
    }]
  },
  {
    "name" : "TSInstant",
    "extends" : "Any",
    "typeMode" : "none",
    "documentation" : "Mapping CDA TS vers FHIR instant (TS = timestamp CDA)",
    "input" : [{
      "name" : "src",
      "mode" : "source"
    },
    {
      "name" : "tgt",
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
      }],
      "documentation" : "La valeur temporelle CDA est convertie en string pour alimenter l’instant FHIR"
    }]
  },
  {
    "name" : "TSDateTime",
    "extends" : "TSInstant",
    "typeMode" : "none",
    "documentation" : "Mapping CDA TS vers FHIR dateTime (Hérite du mapping TSInstant)",
    "input" : [{
      "name" : "src",
      "mode" : "source"
    },
    {
      "name" : "tgt",
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
      }],
      "documentation" : "Réutilisation du mapping parent"
    }]
  },
  {
    "name" : "TSDate",
    "extends" : "TSInstant",
    "typeMode" : "none",
    "documentation" : "Mapping CDA TS vers FHIR date (Hérite aussi du mapping TSInstant)",
    "input" : [{
      "name" : "src",
      "mode" : "source"
    },
    {
      "name" : "tgt",
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
      }],
      "documentation" : "Réutilisation du mapping parent"
    }]
  },
  {
    "name" : "IVLTSPeriod",
    "extends" : "Any",
    "typeMode" : "none",
    "documentation" : "Mapping CDA IVL_TS vers FHIR Period\nIVL_TS = intervalle de temps CDA\nPeriod = période FHIR avec start et end",
    "input" : [{
      "name" : "src",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "low",
      "source" : [{
        "context" : "src",
        "element" : "low",
        "variable" : "low"
      }],
      "rule" : [{
        "name" : "start",
        "source" : [{
          "context" : "low",
          "element" : "value",
          "variable" : "value"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "start",
          "transform" : "cast",
          "parameter" : [{
            "valueId" : "value"
          },
          {
            "valueString" : "dateTime"
          }]
        }]
      }],
      "documentation" : "La borne basse CDA devient le start FHIR"
    },
    {
      "name" : "high",
      "source" : [{
        "context" : "src",
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
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "end",
          "transform" : "cast",
          "parameter" : [{
            "valueId" : "value"
          },
          {
            "valueString" : "dateTime"
          }]
        }]
      }],
      "documentation" : "La borne haute CDA devient le end FHIR"
    }]
  },
  {
    "name" : "IVLTSDateTime",
    "extends" : "Any",
    "typeMode" : "types",
    "documentation" : "Mapping CDA IVL_TS vers FHIR dateTime (On utilise uniquement la borne basse low)",
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
        "variable" : "low"
      }],
      "rule" : [{
        "name" : "value",
        "source" : [{
          "context" : "low",
          "element" : "value",
          "variable" : "value"
        }],
        "target" : [{
          "context" : "tgt",
          "contextType" : "variable",
          "element" : "value",
          "transform" : "cast",
          "parameter" : [{
            "valueId" : "value"
          },
          {
            "valueString" : "string"
          }]
        }]
      }],
      "documentation" : "La borne basse est transformée en dateTime"
    }]
  },
  {
    "name" : "STstring",
    "typeMode" : "none",
    "documentation" : "Mapping CDA ST vers FHIR string (ST = texte simple CDA)",
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
      }],
      "documentation" : "Le texte CDA est converti en string FHIR"
    }]
  },
  {
    "name" : "EDstring",
    "extends" : "STstring",
    "typeMode" : "types",
    "documentation" : "Mapping CDA ED vers FHIR string (ED hérite du comportement de STstring)",
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
      }],
      "documentation" : "Réutilisation du mapping STstring"
    }]
  },
  {
    "name" : "ONstring",
    "extends" : "STstring",
    "typeMode" : "types",
    "documentation" : "Mapping CDA ON vers FHIR string (ON = Organization Name CDA)",
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
      }],
      "documentation" : "Réutilisation du mapping STstring"
    }]
  },
  {
    "name" : "CSCode",
    "typeMode" : "none",
    "documentation" : "Mapping CDA CS vers FHIR code (CS = coded simple CDA)",
    "input" : [{
      "name" : "src",
      "mode" : "source"
    },
    {
      "name" : "tgt",
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
      }],
      "documentation" : "Le code CDA devient la valeur du code FHIR"
    }]
  },
  {
    "name" : "CECode",
    "extends" : "CSCode",
    "typeMode" : "types",
    "documentation" : "Mapping CDA CE vers FHIR code (CE hérite du mapping CSCode)",
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
      }],
      "documentation" : "Réutilisation du mapping CSCode"
    }]
  },
  {
    "name" : "CDCode",
    "extends" : "CSCode",
    "typeMode" : "types",
    "documentation" : "Mapping CDA CD vers FHIR code (CD hérite du mapping CSCode)",
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
      }],
      "documentation" : "Réutilisation du mapping CSCode"
    }]
  },
  {
    "name" : "CECodeableConcept",
    "typeMode" : "none",
    "input" : [{
      "name" : "src",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "CodeableConcept",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "originalText",
      "source" : [{
        "context" : "src",
        "element" : "originalText",
        "variable" : "originalText"
      }],
      "rule" : [{
        "name" : "originalTextReference",
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
            "context" : "tgt",
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
      }],
      "documentation" : "originalText CDA -> FHIR CodeableConcept.text\r\nExemple CDA :\r\n<originalText>\r\n<reference value=\"#allergie-01-agent\"/>\r\n</originalText>\r\nRésultat FHIR attendu :\r\n\"text\": \"#allergie-01-agent\"\r\nOn récupère uniquement reference.value, pas tout l’objet originalText."
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
            "valueString" : "code"
          }]
        }],
        "documentation" : "CDA code -> FHIR Coding.code."
      },
      {
        "name" : "systemLoinc",
        "source" : [{
          "context" : "src",
          "element" : "codeSystem",
          "variable" : "system",
          "condition" : "system = '2.16.840.1.113883.6.1'"
        }],
        "target" : [{
          "context" : "coding",
          "contextType" : "variable",
          "element" : "system",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "http://loinc.org"
          }]
        }],
        "documentation" : "CDA codeSystem LOINC -> FHIR Coding.system."
      },
      {
        "name" : "systemSnomed",
        "source" : [{
          "context" : "src",
          "element" : "codeSystem",
          "variable" : "system",
          "condition" : "system = '2.16.840.1.113883.6.96'"
        }],
        "target" : [{
          "context" : "coding",
          "contextType" : "variable",
          "element" : "system",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "http://snomed.info/sct"
          }]
        }],
        "documentation" : "CDA codeSystem SNOMED CT -> FHIR Coding.system."
      },
      {
        "name" : "systemActCode",
        "source" : [{
          "context" : "src",
          "element" : "codeSystem",
          "variable" : "system",
          "condition" : "system = '2.16.840.1.113883.5.4'"
        }],
        "target" : [{
          "context" : "coding",
          "contextType" : "variable",
          "element" : "system",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "http://terminology.hl7.org/CodeSystem/v3-ActCode"
          }]
        }],
        "documentation" : "CDA codeSystem HL7 v3 ActCode -> FHIR Coding.system."
      },
      {
        "name" : "systemTREA02",
        "source" : [{
          "context" : "src",
          "element" : "codeSystem",
          "variable" : "system",
          "condition" : "system = '1.2.250.1.213.1.1.4.5'"
        }],
        "target" : [{
          "context" : "coding",
          "contextType" : "variable",
          "element" : "system",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "https://mos.esante.gouv.fr/NOS/TRE_A02-ProfessionSavFaire-CISIS/FHIR/TRE-A02-ProfessionSavFaire-CISIS"
          }]
        }],
        "documentation" : "CDA codeSystem TRE_A02 -> FHIR Coding.system NOS."
      },
      {
        "name" : "systemFallback",
        "source" : [{
          "context" : "src",
          "element" : "codeSystem",
          "variable" : "system",
          "condition" : "(system != '2.16.840.1.113883.6.1') and (system != '2.16.840.1.113883.6.96') and (system != '2.16.840.1.113883.5.4') and (system != '1.2.250.1.213.1.1.4.5')"
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
        }],
        "documentation" : "CDA autres codeSystem OID -> FHIR Coding.system urn:oid."
      },
      {
        "name" : "display",
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
        }],
        "documentation" : "CDA displayName -> FHIR Coding.display.\r\nIci on met le display pour tous les systèmes, y compris LOINC."
      }],
      "documentation" : "Création du coding principal à partir du code CDA"
    }]
  },
  {
    "name" : "CSCodeableConcept",
    "extends" : "CECodeableConcept",
    "typeMode" : "types",
    "documentation" : "Mapping CDA CS vers FHIR CodeableConcept (CS réutilise la logique CECodeableConcept)",
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
      }],
      "documentation" : "Réutilisation du mapping CECodeableConcept"
    }]
  },
  {
    "name" : "CDCodeableConcept",
    "extends" : "CECodeableConcept",
    "typeMode" : "none",
    "documentation" : "Mapping CDA CD vers FHIR CodeableConcept (CD réutilise la logique CECodeableConcept)",
    "input" : [{
      "name" : "src",
      "mode" : "source"
    },
    {
      "name" : "tgt",
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
      }],
      "documentation" : "Réutilisation du mapping CECodeableConcept"
    }]
  },
  {
    "name" : "CDCoding",
    "typeMode" : "none",
    "documentation" : "Mapping CDA CD / CE vers FHIR Coding (Utilisé quand la cible FHIR attend directement un Coding, par exemple Encounter.class)",
    "input" : [{
      "name" : "src",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "type" : "Coding",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "code",
      "source" : [{
        "context" : "src",
        "element" : "code",
        "variable" : "code"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "code",
        "transform" : "cast",
        "parameter" : [{
          "valueId" : "code"
        },
        {
          "valueString" : "code"
        }]
      }],
      "documentation" : "CDA code -> FHIR Coding.code"
    },
    {
      "name" : "systemLoinc",
      "source" : [{
        "context" : "src",
        "element" : "codeSystem",
        "variable" : "system",
        "condition" : "system = '2.16.840.1.113883.6.1'"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "system",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "http://loinc.org"
        }]
      }],
      "documentation" : "CDA codeSystem LOINC -> FHIR Coding.system"
    },
    {
      "name" : "systemSnomed",
      "source" : [{
        "context" : "src",
        "element" : "codeSystem",
        "variable" : "system",
        "condition" : "system = '2.16.840.1.113883.6.96'"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "system",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "http://snomed.info/sct"
        }]
      }],
      "documentation" : "CDA codeSystem SNOMED CT -> FHIR Coding.system"
    },
    {
      "name" : "systemActCode",
      "source" : [{
        "context" : "src",
        "element" : "codeSystem",
        "variable" : "system",
        "condition" : "system = '2.16.840.1.113883.5.4'"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "system",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "http://terminology.hl7.org/CodeSystem/v3-ActCode"
        }]
      }],
      "documentation" : "CDA codeSystem HL7 v3 ActCode -> FHIR Coding.system"
    },
    {
      "name" : "systemTREA02",
      "source" : [{
        "context" : "src",
        "element" : "codeSystem",
        "variable" : "system",
        "condition" : "system = '1.2.250.1.213.1.1.4.5'"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "system",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "https://mos.esante.gouv.fr/NOS/TRE_A02-ProfessionSavFaire-CISIS/FHIR/TRE-A02-ProfessionSavFaire-CISIS"
        }]
      }],
      "documentation" : "CDA codeSystem TRE_A02 -> FHIR Coding.system NOS"
    },
    {
      "name" : "systemFallback",
      "source" : [{
        "context" : "src",
        "element" : "codeSystem",
        "variable" : "system",
        "condition" : "(system != '2.16.840.1.113883.6.1') and (system != '2.16.840.1.113883.6.96') and (system != '2.16.840.1.113883.5.4') and (system != '1.2.250.1.213.1.1.4.5')"
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
          "valueId" : "system"
        }]
      }],
      "documentation" : "CDA autres codeSystem OID -> FHIR Coding.system urn:oid"
    },
    {
      "name" : "display",
      "source" : [{
        "context" : "src",
        "element" : "displayName",
        "variable" : "display"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "display",
        "transform" : "cast",
        "parameter" : [{
          "valueId" : "display"
        },
        {
          "valueString" : "string"
        }]
      }],
      "documentation" : "CDA displayName -> FHIR Coding.display"
    }]
  },
  {
    "name" : "ENHumanName",
    "typeMode" : "none",
    "documentation" : "Mapping CDA EN vers FHIR HumanName\nEN = Entity Name CDA\nHumanName = nom humain FHIR",
    "input" : [{
      "name" : "src",
      "mode" : "source"
    },
    {
      "name" : "tgt",
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
            "valueString" : "%v.xmlText"
          }]
        }],
        "documentation" : "Nom de famille"
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
            "valueString" : "%v.xmlText"
          }]
        }],
        "documentation" : "Prénom"
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
            "valueString" : "%v.xmlText"
          }]
        }],
        "documentation" : "Préfixe du nom"
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
            "valueString" : "%v.xmlText"
          }]
        }],
        "documentation" : "Suffixe du nom"
      }],
      "documentation" : "Parcours des composants du nom CDA"
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
      }],
      "documentation" : "La période de validité CDA devient period FHIR"
    }]
  },
  {
    "name" : "PNHumanName",
    "extends" : "ENHumanName",
    "typeMode" : "types",
    "documentation" : "Mapping CDA PN vers FHIR HumanName\nPN = Person Name CDA\nPN hérite du mapping ENHumanName",
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
      }],
      "documentation" : "Réutilisation du mapping ENHumanName"
    }]
  },
  {
    "name" : "ADAddress",
    "typeMode" : "none",
    "documentation" : "Mapping CDA AD vers FHIR Address\nAD = adresse CDA\nAddress = adresse FHIR",
    "input" : [{
      "name" : "src",
      "mode" : "source"
    },
    {
      "name" : "tgt",
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
            "valueString" : "%v.xmlText"
          }]
        }],
        "documentation" : "Pays"
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
            "valueString" : "%v.xmlText"
          }]
        }],
        "documentation" : "Région / état"
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
            "valueString" : "%v.xmlText"
          }]
        }],
        "documentation" : "Département / district"
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
            "valueString" : "%v.xmlText"
          }]
        }],
        "documentation" : "Ville"
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
            "valueString" : "%v.xmlText"
          }]
        }],
        "documentation" : "Code postal"
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
            "valueString" : "%v.xmlText"
          }]
        }],
        "documentation" : "Ligne d’adresse complète"
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
            "valueString" : "%v.xmlText"
          }]
        }],
        "documentation" : "Nom de rue"
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
            "valueString" : "%v.xmlText"
          }]
        }],
        "documentation" : "Numéro de maison"
      }],
      "documentation" : "Parcours des composants de l’adresse CDA"
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
      "documentation" : "Période d’utilisation de l’adresse"
    }]
  },
  {
    "name" : "TELContactPoint",
    "typeMode" : "none",
    "documentation" : "Mapping CDA TEL vers FHIR ContactPoint\nTEL = téléphone/email/url CDA\nContactPoint = moyen de contact FHIR",
    "input" : [{
      "name" : "src",
      "mode" : "source"
    },
    {
      "name" : "tgt",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "valuetel",
      "source" : [{
        "context" : "src",
        "element" : "value",
        "variable" : "v",
        "condition" : "src.value.startsWith('tel:')"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "value",
        "transform" : "evaluate",
        "parameter" : [{
          "valueString" : "%v.substring(4)"
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
      }],
      "documentation" : "Si la valeur commence par tel:, c’est un téléphone"
    },
    {
      "name" : "valuefax",
      "source" : [{
        "context" : "src",
        "element" : "value",
        "variable" : "v",
        "condition" : "src.value.startsWith('fax:')"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "value",
        "transform" : "evaluate",
        "parameter" : [{
          "valueString" : "%v.substring(4)"
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
      }],
      "documentation" : "Si la valeur commence par fax:, c’est un fax"
    },
    {
      "name" : "valuemail",
      "source" : [{
        "context" : "src",
        "element" : "value",
        "variable" : "v",
        "condition" : "src.value.startsWith('mailto:')"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "value",
        "transform" : "evaluate",
        "parameter" : [{
          "valueString" : "%v.substring(7)"
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
      }],
      "documentation" : "Si la valeur commence par mailto:, c’est un email"
    },
    {
      "name" : "valuehttp",
      "source" : [{
        "context" : "src",
        "element" : "value",
        "variable" : "v",
        "condition" : "src.value.startsWith('http:')"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "value",
        "transform" : "evaluate",
        "parameter" : [{
          "valueString" : "%v.substring(5)"
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
      }],
      "documentation" : "Si la valeur commence par http:, c’est une URL"
    },
    {
      "name" : "usehome",
      "source" : [{
        "context" : "src",
        "element" : "use",
        "condition" : "src.use.startsWith('H')"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "use",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "home"
        }]
      }],
      "documentation" : "Usage domicile"
    },
    {
      "name" : "usework",
      "source" : [{
        "context" : "src",
        "element" : "use",
        "condition" : "(src.use = 'WP') or (src.use = 'DIR') or (src.use = 'PUB')"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "use",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "work"
        }]
      }],
      "documentation" : "Usage professionnel"
    },
    {
      "name" : "usebad",
      "source" : [{
        "context" : "src",
        "element" : "use",
        "condition" : "src.use = 'BAD'"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "use",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "old"
        }]
      }],
      "documentation" : "Ancien contact / mauvais contact"
    },
    {
      "name" : "usetmp",
      "source" : [{
        "context" : "src",
        "element" : "use",
        "condition" : "src.use = 'TMP'"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "use",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "temp"
        }]
      }],
      "documentation" : "Contact temporaire"
    },
    {
      "name" : "usemobile",
      "source" : [{
        "context" : "src",
        "element" : "use",
        "condition" : "src.use = 'MC'"
      }],
      "target" : [{
        "context" : "tgt",
        "contextType" : "variable",
        "element" : "use",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "mobile"
        }]
      }],
      "documentation" : "Contact mobile"
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
      "documentation" : "Période d’utilisation du contact"
    }]
  },
  {
    "name" : "PQQuantity",
    "typeMode" : "none",
    "documentation" : "Mapping CDA PQ vers FHIR Quantity\nPQ = quantité physique CDA\nQuantity = quantité FHIR",
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
      }],
      "documentation" : "Unité lisible"
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
      }],
      "documentation" : "Code de l’unité"
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
      }],
      "documentation" : "Système UCUM pour les unités"
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
      }],
      "documentation" : "Valeur numérique de la quantité"
    }]
  },
  {
    "name" : "RTOPQPQRatio",
    "typeMode" : "none",
    "documentation" : "Mapping CDA RTO_PQ_PQ vers FHIR Ratio\nRTO_PQ_PQ = ratio CDA composé d’un numérateur et d’un dénominateur\nRatio = ratio FHIR",
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
      "rule" : [{
        "name" : "unit",
        "source" : [{
          "context" : "numerator",
          "element" : "unit",
          "variable" : "unit"
        }],
        "target" : [{
          "context" : "targetNumerator",
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
          "context" : "numerator",
          "element" : "unit",
          "variable" : "unit"
        }],
        "target" : [{
          "context" : "targetNumerator",
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
          "context" : "numerator",
          "element" : "unit",
          "variable" : "unit"
        }],
        "target" : [{
          "context" : "targetNumerator",
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
          "context" : "numerator",
          "element" : "value",
          "variable" : "value"
        }],
        "target" : [{
          "context" : "targetNumerator",
          "contextType" : "variable",
          "element" : "value",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "value"
          }]
        }]
      }],
      "documentation" : "Mapping du numérateur"
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
      "rule" : [{
        "name" : "unit",
        "source" : [{
          "context" : "denominator",
          "element" : "unit",
          "variable" : "unit"
        }],
        "target" : [{
          "context" : "targetDenominator",
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
          "context" : "denominator",
          "element" : "unit",
          "variable" : "unit"
        }],
        "target" : [{
          "context" : "targetDenominator",
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
          "context" : "denominator",
          "element" : "unit",
          "variable" : "unit"
        }],
        "target" : [{
          "context" : "targetDenominator",
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
          "context" : "denominator",
          "element" : "value",
          "variable" : "value"
        }],
        "target" : [{
          "context" : "targetDenominator",
          "contextType" : "variable",
          "element" : "value",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "value"
          }]
        }]
      }],
      "documentation" : "Mapping du dénominateur"
    }]
  }]
}

```
