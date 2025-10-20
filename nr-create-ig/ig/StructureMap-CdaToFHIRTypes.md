# Mapping de CDA vers les FHIR Types (Oliver Egger) - POC - Mapping CDA to FHIR v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Mapping de CDA vers les FHIR Types (Oliver Egger)**

## StructureMap: Mapping de CDA vers les FHIR Types (Oliver Egger) 

| | |
| :--- | :--- |
| *Official URL*:https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/StructureMap/CdaToFHIRTypes | *Version*:0.1.0 |
| Draft as of 2025-10-20 | *Computable Name*:CdaToFHIRTypes |

 
Mapping de CDA vers les FHIR Types (Oliver Egger) 

```

map "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/StructureMap/CdaToFHIRTypes" = "CdaToFHIRTypes"

// Mapping de CDA vers les FHIR Types (Oliver Egger)

uses "http://hl7.org/cda/stds/core/StructureDefinition/ED" alias ED as source
uses "http://hl7.org/cda/stds/core/StructureDefinition/PN" alias PN as source
uses "http://hl7.org/cda/stds/core/StructureDefinition/II" alias II as source
uses "http://hl7.org/fhir/StructureDefinition/Identifier" alias Identifier as target
uses "http://hl7.org/cda/stds/core/StructureDefinition/TS" alias TS as source
uses "http://hl7.org/fhir/StructureDefinition/instant" alias instant as target
uses "http://hl7.org/cda/stds/core/StructureDefinition/CS" alias CS as source
uses "http://hl7.org/fhir/StructureDefinition/code" alias code as target
uses "http://hl7.org/cda/stds/core/StructureDefinition/CE" alias CE as source
uses "http://hl7.org/fhir/StructureDefinition/CodeableConcept" alias CodeableConcept as target
uses "http://hl7.org/cda/stds/core/StructureDefinition/ST" alias ST as source
uses "http://hl7.org/fhir/StructureDefinition/string" alias string as target
uses "http://hl7.org/cda/stds/core/StructureDefinition/EN" alias EN as source
uses "http://hl7.org/fhir/StructureDefinition/HumanName" alias HumanName as target
uses "http://hl7.org/cda/stds/core/StructureDefinition/AD" alias AD as source
uses "http://hl7.org/fhir/StructureDefinition/Address" alias Address as target
uses "http://hl7.org/cda/stds/core/StructureDefinition/TEL" alias TEL as source
uses "http://hl7.org/fhir/StructureDefinition/ContactPoint" alias ContactPoint as target
uses "http://hl7.org/cda/stds/core/StructureDefinition/BL" alias BL as source
uses "http://hl7.org/fhir/StructureDefinition/boolean" alias boolean as target
uses "http://hl7.org/cda/stds/core/StructureDefinition/IVL-TS" alias IVL_TS as source
uses "http://hl7.org/fhir/StructureDefinition/Period" alias Period as target

group Any(source src, target tgt) {
}

group II(source src : II, target tgt : Identifier) extends Any <<types>> {
  src.root as r where src.extension.exists() -> tgt.system = translate(r, 'http://hl7.org/fhir/ConceptMap/special-oid2uri', 'uri') "root1";
  src.root as r where src.extension.empty() and src.root.matches('[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}') ->  tgt.system = 'urn:ietf:rfc:3986',  tgt.value = ('urn:uuid:' + r.lower()) "rootuuid";
  src.root as r where src.extension.empty() and src.root.contains('.') ->  tgt.system = 'urn:ietf:rfc:3986',  tgt.value = append('urn:oid:', r) "rootoid";
  src.extension as e -> tgt.value = e;
  src.assigningAuthorityName as s ->  tgt.assigner as a,  a.display = s; // there's no equivalent for displayable in FHIR - and it probably will never matter, but if it does, it might map to Identifier.use.
  src.displayable as displayable -> tgt.extension as ext then {
    displayable -> ext.url = 'http://hl7.org/fhir/cdaStructureDefinition/extension-displayable' "url";
    displayable.value as v -> ext.value = cast(v, 'string');
  } "extension";
}

group INT(source src : INT, target tgt : integer) extends Any <<types>> {
  src.value as v -> tgt.value = v "integer";
}

group TemplateID(source template : II, target tgt) {
  template -> tgt.extension as ext then {
    template -> ext.url = 'http://hl7.org/cda/stds/core/StructureDefinition/templateID' "url";
    template -> ext.value = create('Identifier') as value then II(template, value) "value";
  } "templateId";
}

group Negation(source negation : BL, target tgt) {
  negation -> tgt.modifierExtension as ext then {
    negation -> ext.url = 'http://hl7.org/cda/stds/core/StructureDefinition/negationIndicator' "url";
    negation as neg ->  ext.value = create('boolean'),  ext.value = neg "value";
  } "negation";
}

group TSInstant(source src : TS, target tgt : instant) extends Any <<types>> {
  src.value as v -> tgt.value = cast(v, 'string');
}

group TSDateTime(source src : TS, target tgt : dateTime) extends TSInstant <<types>> {
// src.value as v -> tgt.value = cast(v, 'string');
}

group TSDate(source src : TS, target tgt : date) extends TSInstant <<types>> {
}

group IVLTSPeriod(source src : IVL_TS, target tgt : Period) {
// src.low -> tgt.start;
// src.high -> tgt.end;
}

group IVLTSDateTime(source src : IVL_TS, target tgt : dateTime) extends Any <<types>> {
  src.low as s then TSDateTime(s, tgt);
}


```



## Resource Content

```json
{
  "resourceType" : "StructureMap",
  "id" : "CdaToFHIRTypes",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/StructureMap/CdaToFHIRTypes",
  "version" : "0.1.0",
  "name" : "CdaToFHIRTypes",
  "title" : "Mapping de CDA vers les FHIR Types (Oliver Egger)",
  "status" : "draft",
  "date" : "2025-10-20T09:09:31+00:00",
  "publisher" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
  "contact" : [
    {
      "name" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
      "telecom" : [
        {
          "system" : "url",
          "value" : "https://esante.gouv.fr"
        }
      ]
    }
  ],
  "description" : "Mapping de CDA vers les FHIR Types (Oliver Egger)",
  "jurisdiction" : [
    {
      "coding" : [
        {
          "system" : "urn:iso:std:iso:3166",
          "code" : "FR",
          "display" : "FRANCE"
        }
      ]
    }
  ],
  "structure" : [
    {
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
    }
  ],
  "group" : [
    {
      "name" : "Any",
      "typeMode" : "none",
      "input" : [
        {
          "name" : "src",
          "mode" : "source"
        },
        {
          "name" : "tgt",
          "mode" : "target"
        }
      ]
    },
    {
      "name" : "II",
      "extends" : "Any",
      "typeMode" : "types",
      "input" : [
        {
          "name" : "src",
          "type" : "II",
          "mode" : "source"
        },
        {
          "name" : "tgt",
          "type" : "Identifier",
          "mode" : "target"
        }
      ],
      "rule" : [
        {
          "name" : "root1",
          "source" : [
            {
              "context" : "src",
              "element" : "root",
              "variable" : "r",
              "condition" : "src.extension.exists()"
            }
          ],
          "target" : [
            {
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "system",
              "transform" : "translate",
              "parameter" : [
                {
                  "valueId" : "r"
                },
                {
                  "valueString" : "http://hl7.org/fhir/ConceptMap/special-oid2uri"
                },
                {
                  "valueString" : "uri"
                }
              ]
            }
          ]
        },
        {
          "name" : "rootuuid",
          "source" : [
            {
              "context" : "src",
              "element" : "root",
              "variable" : "r",
              "condition" : "src.extension.empty() and src.root.matches('[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}')"
            }
          ],
          "target" : [
            {
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "system",
              "transform" : "copy",
              "parameter" : [
                {
                  "valueString" : "urn:ietf:rfc:3986"
                }
              ]
            },
            {
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "value",
              "transform" : "evaluate",
              "parameter" : [
                {
                  "valueString" : "'urn:uuid:' + r.lower()"
                }
              ]
            }
          ]
        },
        {
          "name" : "rootoid",
          "source" : [
            {
              "context" : "src",
              "element" : "root",
              "variable" : "r",
              "condition" : "src.extension.empty() and src.root.contains('.')"
            }
          ],
          "target" : [
            {
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "system",
              "transform" : "copy",
              "parameter" : [
                {
                  "valueString" : "urn:ietf:rfc:3986"
                }
              ]
            },
            {
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "value",
              "transform" : "append",
              "parameter" : [
                {
                  "valueString" : "urn:oid:"
                },
                {
                  "valueId" : "r"
                }
              ]
            }
          ]
        },
        {
          "name" : "extension",
          "source" : [
            {
              "context" : "src",
              "element" : "extension",
              "variable" : "e"
            }
          ],
          "target" : [
            {
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "value",
              "transform" : "copy",
              "parameter" : [
                {
                  "valueId" : "e"
                }
              ]
            }
          ]
        },
        {
          "name" : "assigningAuthorityName",
          "source" : [
            {
              "context" : "src",
              "element" : "assigningAuthorityName",
              "variable" : "s"
            }
          ],
          "target" : [
            {
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
              "parameter" : [
                {
                  "valueId" : "s"
                }
              ]
            }
          ],
          "documentation" : "there's no equivalent for displayable in FHIR - and it probably will never matter, but if it does, it might map to Identifier.use."
        },
        {
          "name" : "extension",
          "source" : [
            {
              "context" : "src",
              "element" : "displayable",
              "variable" : "displayable"
            }
          ],
          "target" : [
            {
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "extension",
              "variable" : "ext"
            }
          ],
          "rule" : [
            {
              "name" : "url",
              "source" : [
                {
                  "context" : "displayable"
                }
              ],
              "target" : [
                {
                  "context" : "ext",
                  "contextType" : "variable",
                  "element" : "url",
                  "transform" : "copy",
                  "parameter" : [
                    {
                      "valueString" : "http://hl7.org/fhir/cdaStructureDefinition/extension-displayable"
                    }
                  ]
                }
              ]
            },
            {
              "name" : "value",
              "source" : [
                {
                  "context" : "displayable",
                  "element" : "value",
                  "variable" : "v"
                }
              ],
              "target" : [
                {
                  "context" : "ext",
                  "contextType" : "variable",
                  "element" : "value",
                  "transform" : "cast",
                  "parameter" : [
                    {
                      "valueId" : "v"
                    },
                    {
                      "valueString" : "string"
                    }
                  ]
                }
              ]
            }
          ]
        }
      ]
    },
    {
      "name" : "INT",
      "extends" : "Any",
      "typeMode" : "types",
      "input" : [
        {
          "name" : "src",
          "type" : "INT",
          "mode" : "source"
        },
        {
          "name" : "tgt",
          "type" : "integer",
          "mode" : "target"
        }
      ],
      "rule" : [
        {
          "name" : "integer",
          "source" : [
            {
              "context" : "src",
              "element" : "value",
              "variable" : "v"
            }
          ],
          "target" : [
            {
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "value",
              "transform" : "copy",
              "parameter" : [
                {
                  "valueId" : "v"
                }
              ]
            }
          ]
        }
      ]
    },
    {
      "name" : "TemplateID",
      "typeMode" : "none",
      "input" : [
        {
          "name" : "template",
          "type" : "II",
          "mode" : "source"
        },
        {
          "name" : "tgt",
          "mode" : "target"
        }
      ],
      "rule" : [
        {
          "name" : "templateId",
          "source" : [
            {
              "context" : "template"
            }
          ],
          "target" : [
            {
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "extension",
              "variable" : "ext"
            }
          ],
          "rule" : [
            {
              "name" : "url",
              "source" : [
                {
                  "context" : "template"
                }
              ],
              "target" : [
                {
                  "context" : "ext",
                  "contextType" : "variable",
                  "element" : "url",
                  "transform" : "copy",
                  "parameter" : [
                    {
                      "valueString" : "http://hl7.org/cda/stds/core/StructureDefinition/templateID"
                    }
                  ]
                }
              ]
            },
            {
              "name" : "value",
              "source" : [
                {
                  "context" : "template"
                }
              ],
              "target" : [
                {
                  "context" : "ext",
                  "contextType" : "variable",
                  "element" : "value",
                  "variable" : "value",
                  "transform" : "create",
                  "parameter" : [
                    {
                      "valueString" : "Identifier"
                    }
                  ]
                }
              ],
              "dependent" : [
                {
                  "name" : "II",
                  "variable" : ["template", "value"]
                }
              ]
            }
          ]
        }
      ]
    },
    {
      "name" : "Negation",
      "typeMode" : "none",
      "input" : [
        {
          "name" : "negation",
          "type" : "BL",
          "mode" : "source"
        },
        {
          "name" : "tgt",
          "mode" : "target"
        }
      ],
      "rule" : [
        {
          "name" : "negation",
          "source" : [
            {
              "context" : "negation"
            }
          ],
          "target" : [
            {
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "modifierExtension",
              "variable" : "ext"
            }
          ],
          "rule" : [
            {
              "name" : "url",
              "source" : [
                {
                  "context" : "negation"
                }
              ],
              "target" : [
                {
                  "context" : "ext",
                  "contextType" : "variable",
                  "element" : "url",
                  "transform" : "copy",
                  "parameter" : [
                    {
                      "valueString" : "http://hl7.org/cda/stds/core/StructureDefinition/negationIndicator"
                    }
                  ]
                }
              ]
            },
            {
              "name" : "value",
              "source" : [
                {
                  "context" : "negation",
                  "variable" : "neg"
                }
              ],
              "target" : [
                {
                  "context" : "ext",
                  "contextType" : "variable",
                  "element" : "value",
                  "transform" : "create",
                  "parameter" : [
                    {
                      "valueString" : "boolean"
                    }
                  ]
                },
                {
                  "context" : "ext",
                  "contextType" : "variable",
                  "element" : "value",
                  "transform" : "copy",
                  "parameter" : [
                    {
                      "valueId" : "neg"
                    }
                  ]
                }
              ]
            }
          ]
        }
      ]
    },
    {
      "name" : "TSInstant",
      "extends" : "Any",
      "typeMode" : "types",
      "input" : [
        {
          "name" : "src",
          "type" : "TS",
          "mode" : "source"
        },
        {
          "name" : "tgt",
          "type" : "instant",
          "mode" : "target"
        }
      ],
      "rule" : [
        {
          "name" : "value",
          "source" : [
            {
              "context" : "src",
              "element" : "value",
              "variable" : "v"
            }
          ],
          "target" : [
            {
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "value",
              "transform" : "cast",
              "parameter" : [
                {
                  "valueId" : "v"
                },
                {
                  "valueString" : "string"
                }
              ]
            }
          ]
        }
      ]
    },
    {
      "name" : "TSDateTime",
      "extends" : "TSInstant",
      "typeMode" : "types",
      "input" : [
        {
          "name" : "src",
          "type" : "TS",
          "mode" : "source"
        },
        {
          "name" : "tgt",
          "type" : "dateTime",
          "mode" : "target"
        }
      ]
    },
    {
      "name" : "TSDate",
      "extends" : "TSInstant",
      "typeMode" : "types",
      "input" : [
        {
          "name" : "src",
          "type" : "TS",
          "mode" : "source"
        },
        {
          "name" : "tgt",
          "type" : "date",
          "mode" : "target"
        }
      ]
    },
    {
      "name" : "IVLTSPeriod",
      "typeMode" : "none",
      "input" : [
        {
          "name" : "src",
          "type" : "IVL_TS",
          "mode" : "source"
        },
        {
          "name" : "tgt",
          "type" : "Period",
          "mode" : "target"
        }
      ]
    },
    {
      "name" : "IVLTSDateTime",
      "extends" : "Any",
      "typeMode" : "types",
      "input" : [
        {
          "name" : "src",
          "type" : "IVL_TS",
          "mode" : "source"
        },
        {
          "name" : "tgt",
          "type" : "dateTime",
          "mode" : "target"
        }
      ],
      "rule" : [
        {
          "name" : "low",
          "source" : [
            {
              "context" : "src",
              "element" : "low",
              "variable" : "s"
            }
          ],
          "dependent" : [
            {
              "name" : "TSDateTime",
              "variable" : ["s", "tgt"]
            }
          ]
        }
      ]
    }
  ]
}

```
