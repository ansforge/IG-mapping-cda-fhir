# Mapping de CDA vers les FHIR Types (A partir des sources de Oliver Egger) - POC - Mapping CDA to FHIR v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Mapping de CDA vers les FHIR Types (A partir des sources de Oliver Egger)**

## StructureMap: Mapping de CDA vers les FHIR Types (A partir des sources de Oliver Egger) 

| | |
| :--- | :--- |
| *Official URL*:https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/StructureMap/CdaToFHIRTypes | *Version*:0.1.0 |
| Draft as of 2025-10-21 | *Computable Name*:CdaToFHIRTypes |

 
Mapping de CDA vers les FHIR Types (A partir des sources de Oliver Egger) 

```

map "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/StructureMap/CdaToFHIRTypes" = "CdaToFHIRTypes"

// Mapping de CDA vers les FHIR Types (A partir des sources de Oliver Egger)

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
}

group TSDate(source src : TS, target tgt : date) extends TSInstant <<types>> {
}

group IVLTSPeriod(source src : IVL_TS, target tgt : Period) extends Any <<types>> {
  src.low as low -> tgt.start = low;
  src.high as high -> tgt.end = high;
}

group IVLTSDateTime(source src : IVL_TS, target tgt : dateTime) extends Any <<types>> {
  src.low as s then TSDateTime(s, tgt);
}

group STstring(source src : ST, target tgt : string) {
  src as v -> tgt.value = cast(v, 'string') "value";
}

group EDstring(source src : ED, target tgt : string) extends STstring <<types>> {
}

group ONstring(source src : ON, target tgt : string) extends STstring <<types>> {
}

group CSCode(source src : CS, target tgt : code) {
  src.code as c -> tgt.value = cast(c, 'string');
}

group CECode(source src : CE, target tgt : code) extends CSCode <<types>> {
}

group CDCode(source src : CD, target tgt : code) extends CSCode <<types>> {
}

group CECodeableConcept(source src : CE, target tgt : CodeableConcept) {
  src.originalText as originalText -> tgt.text = originalText "setOriginalText";
  src -> tgt.coding as coding then {
    src.code as code -> coding.code = cast(code, 'string');
    // src.codeSystem as system -> coding.system = translate(system, 'http://hl7.org/fhir/ConceptMap/special-oid2uri', 'uri');
    src.displayName as display -> coding.display = cast(display, 'string');
  } "code";
  src.translation as translation -> tgt.coding as coding then {
    translation.code as code -> coding.code = cast(code, 'string');
    // translation.codeSystem as system -> coding.system = translate(system, 'http://hl7.org/fhir/ConceptMap/special-oid2uri', 'uri');
    translation.displayName as display -> coding.display = cast(display, 'string');
  };
}

group CSCodeableConcept(source src : CS, target tgt : CodeableConcept) extends CECodeableConcept <<types>> {
}

group CDCodeableConcept(source src : CD, target tgt : CodeableConcept) extends CECodeableConcept <<types>> {
}

group ENHumanName(source src : EN, target tgt : HumanName) {
  src.item as item then {
    item.family as v -> tgt.family = (v.xmlText);
    item.given as v -> tgt.given = (v.xmlText);
    item.prefix as v -> tgt.prefix = (v.xmlText);
    item.suffix as v -> tgt.suffix = (v.xmlText);
  };
  src.validTime as validTime -> tgt.period = validTime;
}

group PNHumanName(source src : PN, target tgt : HumanName) extends ENHumanName <<types>> {
}

group ADAddress(source src : AD, target tgt : Address) {
  src.item as item then {
    item.country as v -> tgt.country = (v.xmlText);
    item.state as v -> tgt.state = (v.xmlText);
    item.county as v -> tgt.district = (v.xmlText);
    item.city as v -> tgt.city = (v.xmlText);
    item.postalCode as v -> tgt.postalCode = (v.xmlText);
    item.streetAddressLine as v -> tgt.line = (v.xmlText);
    item -> tgt.line as line then {
      item where src.censusTract.exists() then {
        item.censusTract as v -> line.extension as ext1 then CensusTract(v, ext1) "line";
      } "sfgfdsg";
    } "CensusTract";
    // as streetAddress then{
    // src.censusTract as v->tgt.line as line, line.extension as ext1 then CensusTract(v, ext1) "line";
    // src.censusTract as v ->tgt.line as line, line.extension as ext1 then CensusTract(v, ext1) "line";
    item.streetName as v -> tgt.line = (v.xmlText);
    item.houseNumber as v -> tgt.line = (v.xmlText);
  };
  src.useablePeriod as useablePeriod -> tgt.period = useablePeriod;
}

group TELContactPoint(source src : TEL, target tgt : ContactPoint) {
  src.value as v where (src.value.startsWith('tel:')) ->  tgt.value = (v.substring(4)),  tgt.system = 'phone' "valuetel";
  src.value as v where (src.value.startsWith('fax:')) ->  tgt.value = (v.substring(4)),  tgt.system = 'fax' "valuefax";
  src.value as v where (src.value.startsWith('mailto:')) ->  tgt.value = (v.substring(7)),  tgt.system = 'email' "valuemail";
  src.value as v where (src.value.startsWith('http:')) ->  tgt.value = (v.substring(5)),  tgt.system = 'url' "valuehttp";
  src.use where (src.use.startsWith('H')) -> tgt.use = 'home' "usehome";
  src.use where ((src.use = 'WP') or (src.use = 'DIR') or (src.use = 'PUB')) -> tgt.use = 'work' "usework";
  src.use where (src.use = 'BAD') -> tgt.use = 'old' "usebad";
  src.use where (src.use = 'TMP') -> tgt.use = 'temp' "usetmp";
  src.use where (src.use = 'MC') -> tgt.use = 'mobile' "usemobile";
  src.useablePeriod as useablePeriod -> tgt.period = useablePeriod; // use: for src.use as c make tgt.use = translate(c, 'http://hl7.org/fhir/ConceptMap/cm-telecom-use-v3', 'code')
}

group PQQuantity(source src : PQ, target tgt : Quantity) {
  // src.unit as unit -> tgt.code = unit;
  src.unit as unit -> tgt.unit = unit;
  src.value as value -> tgt.value = value;
}

group RTOPQPQRatio(source src : RTO_PQ_PQ, target tgt : Ratio) {
  src.numerator as numerator -> tgt.numerator as targetNumerator then PQQuantity(numerator, targetNumerator);
  src.denominator as denominator -> tgt.denominator as targetDenominator then PQQuantity(denominator, targetDenominator);
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
  "title" : "Mapping de CDA vers les FHIR Types (A partir des sources de Oliver Egger)",
  "status" : "draft",
  "date" : "2025-10-21T09:02:47+00:00",
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
  "description" : "Mapping de CDA vers les FHIR Types (A partir des sources de Oliver Egger)",
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
          "type" : "Period",
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
              "variable" : "low"
            }
          ],
          "target" : [
            {
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "start",
              "transform" : "copy",
              "parameter" : [
                {
                  "valueId" : "low"
                }
              ]
            }
          ]
        },
        {
          "name" : "high",
          "source" : [
            {
              "context" : "src",
              "element" : "high",
              "variable" : "high"
            }
          ],
          "target" : [
            {
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "end",
              "transform" : "copy",
              "parameter" : [
                {
                  "valueId" : "high"
                }
              ]
            }
          ]
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
    },
    {
      "name" : "STstring",
      "typeMode" : "none",
      "input" : [
        {
          "name" : "src",
          "type" : "ST",
          "mode" : "source"
        },
        {
          "name" : "tgt",
          "type" : "string",
          "mode" : "target"
        }
      ],
      "rule" : [
        {
          "name" : "value",
          "source" : [
            {
              "context" : "src",
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
      "name" : "EDstring",
      "extends" : "STstring",
      "typeMode" : "types",
      "input" : [
        {
          "name" : "src",
          "type" : "ED",
          "mode" : "source"
        },
        {
          "name" : "tgt",
          "type" : "string",
          "mode" : "target"
        }
      ]
    },
    {
      "name" : "ONstring",
      "extends" : "STstring",
      "typeMode" : "types",
      "input" : [
        {
          "name" : "src",
          "type" : "ON",
          "mode" : "source"
        },
        {
          "name" : "tgt",
          "type" : "string",
          "mode" : "target"
        }
      ]
    },
    {
      "name" : "CSCode",
      "typeMode" : "none",
      "input" : [
        {
          "name" : "src",
          "type" : "CS",
          "mode" : "source"
        },
        {
          "name" : "tgt",
          "type" : "code",
          "mode" : "target"
        }
      ],
      "rule" : [
        {
          "name" : "code",
          "source" : [
            {
              "context" : "src",
              "element" : "code",
              "variable" : "c"
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
                  "valueId" : "c"
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
      "name" : "CECode",
      "extends" : "CSCode",
      "typeMode" : "types",
      "input" : [
        {
          "name" : "src",
          "type" : "CE",
          "mode" : "source"
        },
        {
          "name" : "tgt",
          "type" : "code",
          "mode" : "target"
        }
      ]
    },
    {
      "name" : "CDCode",
      "extends" : "CSCode",
      "typeMode" : "types",
      "input" : [
        {
          "name" : "src",
          "type" : "CD",
          "mode" : "source"
        },
        {
          "name" : "tgt",
          "type" : "code",
          "mode" : "target"
        }
      ]
    },
    {
      "name" : "CECodeableConcept",
      "typeMode" : "none",
      "input" : [
        {
          "name" : "src",
          "type" : "CE",
          "mode" : "source"
        },
        {
          "name" : "tgt",
          "type" : "CodeableConcept",
          "mode" : "target"
        }
      ],
      "rule" : [
        {
          "name" : "setOriginalText",
          "source" : [
            {
              "context" : "src",
              "element" : "originalText",
              "variable" : "originalText"
            }
          ],
          "target" : [
            {
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "text",
              "transform" : "copy",
              "parameter" : [
                {
                  "valueId" : "originalText"
                }
              ]
            }
          ]
        },
        {
          "name" : "code",
          "source" : [
            {
              "context" : "src"
            }
          ],
          "target" : [
            {
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "coding",
              "variable" : "coding"
            }
          ],
          "rule" : [
            {
              "name" : "code",
              "source" : [
                {
                  "context" : "src",
                  "element" : "code",
                  "variable" : "code"
                }
              ],
              "target" : [
                {
                  "context" : "coding",
                  "contextType" : "variable",
                  "element" : "code",
                  "transform" : "cast",
                  "parameter" : [
                    {
                      "valueId" : "code"
                    },
                    {
                      "valueString" : "string"
                    }
                  ]
                }
              ]
            },
            {
              "name" : "displayName",
              "source" : [
                {
                  "context" : "src",
                  "element" : "displayName",
                  "variable" : "display"
                }
              ],
              "target" : [
                {
                  "context" : "coding",
                  "contextType" : "variable",
                  "element" : "display",
                  "transform" : "cast",
                  "parameter" : [
                    {
                      "valueId" : "display"
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
          "name" : "translation",
          "source" : [
            {
              "context" : "src",
              "element" : "translation",
              "variable" : "translation"
            }
          ],
          "target" : [
            {
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "coding",
              "variable" : "coding"
            }
          ],
          "rule" : [
            {
              "name" : "code",
              "source" : [
                {
                  "context" : "translation",
                  "element" : "code",
                  "variable" : "code"
                }
              ],
              "target" : [
                {
                  "context" : "coding",
                  "contextType" : "variable",
                  "element" : "code",
                  "transform" : "cast",
                  "parameter" : [
                    {
                      "valueId" : "code"
                    },
                    {
                      "valueString" : "string"
                    }
                  ]
                }
              ]
            },
            {
              "name" : "displayName",
              "source" : [
                {
                  "context" : "translation",
                  "element" : "displayName",
                  "variable" : "display"
                }
              ],
              "target" : [
                {
                  "context" : "coding",
                  "contextType" : "variable",
                  "element" : "display",
                  "transform" : "cast",
                  "parameter" : [
                    {
                      "valueId" : "display"
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
      "name" : "CSCodeableConcept",
      "extends" : "CECodeableConcept",
      "typeMode" : "types",
      "input" : [
        {
          "name" : "src",
          "type" : "CS",
          "mode" : "source"
        },
        {
          "name" : "tgt",
          "type" : "CodeableConcept",
          "mode" : "target"
        }
      ]
    },
    {
      "name" : "CDCodeableConcept",
      "extends" : "CECodeableConcept",
      "typeMode" : "types",
      "input" : [
        {
          "name" : "src",
          "type" : "CD",
          "mode" : "source"
        },
        {
          "name" : "tgt",
          "type" : "CodeableConcept",
          "mode" : "target"
        }
      ]
    },
    {
      "name" : "ENHumanName",
      "typeMode" : "none",
      "input" : [
        {
          "name" : "src",
          "type" : "EN",
          "mode" : "source"
        },
        {
          "name" : "tgt",
          "type" : "HumanName",
          "mode" : "target"
        }
      ],
      "rule" : [
        {
          "name" : "item",
          "source" : [
            {
              "context" : "src",
              "element" : "item",
              "variable" : "item"
            }
          ],
          "rule" : [
            {
              "name" : "family",
              "source" : [
                {
                  "context" : "item",
                  "element" : "family",
                  "variable" : "v"
                }
              ],
              "target" : [
                {
                  "context" : "tgt",
                  "contextType" : "variable",
                  "element" : "family",
                  "transform" : "evaluate",
                  "parameter" : [
                    {
                      "valueString" : "v.xmlText"
                    }
                  ]
                }
              ]
            },
            {
              "name" : "given",
              "source" : [
                {
                  "context" : "item",
                  "element" : "given",
                  "variable" : "v"
                }
              ],
              "target" : [
                {
                  "context" : "tgt",
                  "contextType" : "variable",
                  "element" : "given",
                  "transform" : "evaluate",
                  "parameter" : [
                    {
                      "valueString" : "v.xmlText"
                    }
                  ]
                }
              ]
            },
            {
              "name" : "prefix",
              "source" : [
                {
                  "context" : "item",
                  "element" : "prefix",
                  "variable" : "v"
                }
              ],
              "target" : [
                {
                  "context" : "tgt",
                  "contextType" : "variable",
                  "element" : "prefix",
                  "transform" : "evaluate",
                  "parameter" : [
                    {
                      "valueString" : "v.xmlText"
                    }
                  ]
                }
              ]
            },
            {
              "name" : "suffix",
              "source" : [
                {
                  "context" : "item",
                  "element" : "suffix",
                  "variable" : "v"
                }
              ],
              "target" : [
                {
                  "context" : "tgt",
                  "contextType" : "variable",
                  "element" : "suffix",
                  "transform" : "evaluate",
                  "parameter" : [
                    {
                      "valueString" : "v.xmlText"
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "name" : "validTime",
          "source" : [
            {
              "context" : "src",
              "element" : "validTime",
              "variable" : "validTime"
            }
          ],
          "target" : [
            {
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "period",
              "transform" : "copy",
              "parameter" : [
                {
                  "valueId" : "validTime"
                }
              ]
            }
          ]
        }
      ]
    },
    {
      "name" : "PNHumanName",
      "extends" : "ENHumanName",
      "typeMode" : "types",
      "input" : [
        {
          "name" : "src",
          "type" : "PN",
          "mode" : "source"
        },
        {
          "name" : "tgt",
          "type" : "HumanName",
          "mode" : "target"
        }
      ]
    },
    {
      "name" : "ADAddress",
      "typeMode" : "none",
      "input" : [
        {
          "name" : "src",
          "type" : "AD",
          "mode" : "source"
        },
        {
          "name" : "tgt",
          "type" : "Address",
          "mode" : "target"
        }
      ],
      "rule" : [
        {
          "name" : "item",
          "source" : [
            {
              "context" : "src",
              "element" : "item",
              "variable" : "item"
            }
          ],
          "rule" : [
            {
              "name" : "country",
              "source" : [
                {
                  "context" : "item",
                  "element" : "country",
                  "variable" : "v"
                }
              ],
              "target" : [
                {
                  "context" : "tgt",
                  "contextType" : "variable",
                  "element" : "country",
                  "transform" : "evaluate",
                  "parameter" : [
                    {
                      "valueString" : "v.xmlText"
                    }
                  ]
                }
              ]
            },
            {
              "name" : "state",
              "source" : [
                {
                  "context" : "item",
                  "element" : "state",
                  "variable" : "v"
                }
              ],
              "target" : [
                {
                  "context" : "tgt",
                  "contextType" : "variable",
                  "element" : "state",
                  "transform" : "evaluate",
                  "parameter" : [
                    {
                      "valueString" : "v.xmlText"
                    }
                  ]
                }
              ]
            },
            {
              "name" : "county",
              "source" : [
                {
                  "context" : "item",
                  "element" : "county",
                  "variable" : "v"
                }
              ],
              "target" : [
                {
                  "context" : "tgt",
                  "contextType" : "variable",
                  "element" : "district",
                  "transform" : "evaluate",
                  "parameter" : [
                    {
                      "valueString" : "v.xmlText"
                    }
                  ]
                }
              ]
            },
            {
              "name" : "city",
              "source" : [
                {
                  "context" : "item",
                  "element" : "city",
                  "variable" : "v"
                }
              ],
              "target" : [
                {
                  "context" : "tgt",
                  "contextType" : "variable",
                  "element" : "city",
                  "transform" : "evaluate",
                  "parameter" : [
                    {
                      "valueString" : "v.xmlText"
                    }
                  ]
                }
              ]
            },
            {
              "name" : "postalCode",
              "source" : [
                {
                  "context" : "item",
                  "element" : "postalCode",
                  "variable" : "v"
                }
              ],
              "target" : [
                {
                  "context" : "tgt",
                  "contextType" : "variable",
                  "element" : "postalCode",
                  "transform" : "evaluate",
                  "parameter" : [
                    {
                      "valueString" : "v.xmlText"
                    }
                  ]
                }
              ]
            },
            {
              "name" : "streetAddressLine",
              "source" : [
                {
                  "context" : "item",
                  "element" : "streetAddressLine",
                  "variable" : "v"
                }
              ],
              "target" : [
                {
                  "context" : "tgt",
                  "contextType" : "variable",
                  "element" : "line",
                  "transform" : "evaluate",
                  "parameter" : [
                    {
                      "valueString" : "v.xmlText"
                    }
                  ]
                }
              ]
            },
            {
              "name" : "CensusTract",
              "source" : [
                {
                  "context" : "item"
                }
              ],
              "target" : [
                {
                  "context" : "tgt",
                  "contextType" : "variable",
                  "element" : "line",
                  "variable" : "line"
                }
              ],
              "rule" : [
                {
                  "name" : "sfgfdsg",
                  "source" : [
                    {
                      "context" : "item",
                      "condition" : "src.censusTract.exists()"
                    }
                  ],
                  "rule" : [
                    {
                      "name" : "line",
                      "source" : [
                        {
                          "context" : "item",
                          "element" : "censusTract",
                          "variable" : "v"
                        }
                      ],
                      "target" : [
                        {
                          "context" : "line",
                          "contextType" : "variable",
                          "element" : "extension",
                          "variable" : "ext1"
                        }
                      ],
                      "dependent" : [
                        {
                          "name" : "CensusTract",
                          "variable" : ["v", "ext1"]
                        }
                      ]
                    }
                  ]
                }
              ]
            },
            {
              "name" : "streetName",
              "source" : [
                {
                  "context" : "item",
                  "element" : "streetName",
                  "variable" : "v"
                }
              ],
              "target" : [
                {
                  "context" : "tgt",
                  "contextType" : "variable",
                  "element" : "line",
                  "transform" : "evaluate",
                  "parameter" : [
                    {
                      "valueString" : "v.xmlText"
                    }
                  ]
                }
              ]
            },
            {
              "name" : "houseNumber",
              "source" : [
                {
                  "context" : "item",
                  "element" : "houseNumber",
                  "variable" : "v"
                }
              ],
              "target" : [
                {
                  "context" : "tgt",
                  "contextType" : "variable",
                  "element" : "line",
                  "transform" : "evaluate",
                  "parameter" : [
                    {
                      "valueString" : "v.xmlText"
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "name" : "useablePeriod",
          "source" : [
            {
              "context" : "src",
              "element" : "useablePeriod",
              "variable" : "useablePeriod"
            }
          ],
          "target" : [
            {
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "period",
              "transform" : "copy",
              "parameter" : [
                {
                  "valueId" : "useablePeriod"
                }
              ]
            }
          ]
        }
      ]
    },
    {
      "name" : "TELContactPoint",
      "typeMode" : "none",
      "input" : [
        {
          "name" : "src",
          "type" : "TEL",
          "mode" : "source"
        },
        {
          "name" : "tgt",
          "type" : "ContactPoint",
          "mode" : "target"
        }
      ],
      "rule" : [
        {
          "name" : "valuetel",
          "source" : [
            {
              "context" : "src",
              "element" : "value",
              "variable" : "v",
              "condition" : "(src.value.startsWith('tel:'))"
            }
          ],
          "target" : [
            {
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "value",
              "transform" : "evaluate",
              "parameter" : [
                {
                  "valueString" : "v.substring(4)"
                }
              ]
            },
            {
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "system",
              "transform" : "copy",
              "parameter" : [
                {
                  "valueString" : "phone"
                }
              ]
            }
          ]
        },
        {
          "name" : "valuefax",
          "source" : [
            {
              "context" : "src",
              "element" : "value",
              "variable" : "v",
              "condition" : "(src.value.startsWith('fax:'))"
            }
          ],
          "target" : [
            {
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "value",
              "transform" : "evaluate",
              "parameter" : [
                {
                  "valueString" : "v.substring(4)"
                }
              ]
            },
            {
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "system",
              "transform" : "copy",
              "parameter" : [
                {
                  "valueString" : "fax"
                }
              ]
            }
          ]
        },
        {
          "name" : "valuemail",
          "source" : [
            {
              "context" : "src",
              "element" : "value",
              "variable" : "v",
              "condition" : "(src.value.startsWith('mailto:'))"
            }
          ],
          "target" : [
            {
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "value",
              "transform" : "evaluate",
              "parameter" : [
                {
                  "valueString" : "v.substring(7)"
                }
              ]
            },
            {
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "system",
              "transform" : "copy",
              "parameter" : [
                {
                  "valueString" : "email"
                }
              ]
            }
          ]
        },
        {
          "name" : "valuehttp",
          "source" : [
            {
              "context" : "src",
              "element" : "value",
              "variable" : "v",
              "condition" : "(src.value.startsWith('http:'))"
            }
          ],
          "target" : [
            {
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "value",
              "transform" : "evaluate",
              "parameter" : [
                {
                  "valueString" : "v.substring(5)"
                }
              ]
            },
            {
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "system",
              "transform" : "copy",
              "parameter" : [
                {
                  "valueString" : "url"
                }
              ]
            }
          ]
        },
        {
          "name" : "usehome",
          "source" : [
            {
              "context" : "src",
              "element" : "use",
              "condition" : "(src.use.startsWith('H'))"
            }
          ],
          "target" : [
            {
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "use",
              "transform" : "copy",
              "parameter" : [
                {
                  "valueString" : "home"
                }
              ]
            }
          ]
        },
        {
          "name" : "usework",
          "source" : [
            {
              "context" : "src",
              "element" : "use",
              "condition" : "((src.use = 'WP') or (src.use = 'DIR') or (src.use = 'PUB'))"
            }
          ],
          "target" : [
            {
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "use",
              "transform" : "copy",
              "parameter" : [
                {
                  "valueString" : "work"
                }
              ]
            }
          ]
        },
        {
          "name" : "usebad",
          "source" : [
            {
              "context" : "src",
              "element" : "use",
              "condition" : "(src.use = 'BAD')"
            }
          ],
          "target" : [
            {
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "use",
              "transform" : "copy",
              "parameter" : [
                {
                  "valueString" : "old"
                }
              ]
            }
          ]
        },
        {
          "name" : "usetmp",
          "source" : [
            {
              "context" : "src",
              "element" : "use",
              "condition" : "(src.use = 'TMP')"
            }
          ],
          "target" : [
            {
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "use",
              "transform" : "copy",
              "parameter" : [
                {
                  "valueString" : "temp"
                }
              ]
            }
          ]
        },
        {
          "name" : "usemobile",
          "source" : [
            {
              "context" : "src",
              "element" : "use",
              "condition" : "(src.use = 'MC')"
            }
          ],
          "target" : [
            {
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "use",
              "transform" : "copy",
              "parameter" : [
                {
                  "valueString" : "mobile"
                }
              ]
            }
          ]
        },
        {
          "name" : "useablePeriod",
          "source" : [
            {
              "context" : "src",
              "element" : "useablePeriod",
              "variable" : "useablePeriod"
            }
          ],
          "target" : [
            {
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "period",
              "transform" : "copy",
              "parameter" : [
                {
                  "valueId" : "useablePeriod"
                }
              ]
            }
          ],
          "documentation" : "use: for src.use as c make tgt.use = translate(c, 'http://hl7.org/fhir/ConceptMap/cm-telecom-use-v3', 'code')"
        }
      ]
    },
    {
      "name" : "PQQuantity",
      "typeMode" : "none",
      "input" : [
        {
          "name" : "src",
          "type" : "PQ",
          "mode" : "source"
        },
        {
          "name" : "tgt",
          "type" : "Quantity",
          "mode" : "target"
        }
      ],
      "rule" : [
        {
          "name" : "unit",
          "source" : [
            {
              "context" : "src",
              "element" : "unit",
              "variable" : "unit"
            }
          ],
          "target" : [
            {
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "unit",
              "transform" : "copy",
              "parameter" : [
                {
                  "valueId" : "unit"
                }
              ]
            }
          ]
        },
        {
          "name" : "value",
          "source" : [
            {
              "context" : "src",
              "element" : "value",
              "variable" : "value"
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
                  "valueId" : "value"
                }
              ]
            }
          ]
        }
      ]
    },
    {
      "name" : "RTOPQPQRatio",
      "typeMode" : "none",
      "input" : [
        {
          "name" : "src",
          "type" : "RTO_PQ_PQ",
          "mode" : "source"
        },
        {
          "name" : "tgt",
          "type" : "Ratio",
          "mode" : "target"
        }
      ],
      "rule" : [
        {
          "name" : "numerator",
          "source" : [
            {
              "context" : "src",
              "element" : "numerator",
              "variable" : "numerator"
            }
          ],
          "target" : [
            {
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "numerator",
              "variable" : "targetNumerator"
            }
          ],
          "dependent" : [
            {
              "name" : "PQQuantity",
              "variable" : ["numerator", "targetNumerator"]
            }
          ]
        },
        {
          "name" : "denominator",
          "source" : [
            {
              "context" : "src",
              "element" : "denominator",
              "variable" : "denominator"
            }
          ],
          "target" : [
            {
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "denominator",
              "variable" : "targetDenominator"
            }
          ],
          "dependent" : [
            {
              "name" : "PQQuantity",
              "variable" : ["denominator", "targetDenominator"]
            }
          ]
        }
      ]
    }
  ]
}

```
