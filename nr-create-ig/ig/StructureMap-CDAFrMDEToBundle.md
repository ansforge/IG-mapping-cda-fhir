# Mapping de CDA Mesure de lEnfant vers FHIR Bundle (A partir des sources de Oliver Egger) - POC - Mapping CDA to FHIR v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Mapping de CDA Mesure de lEnfant vers FHIR Bundle (A partir des sources de Oliver Egger)**

## StructureMap: Mapping de CDA Mesure de lEnfant vers FHIR Bundle (A partir des sources de Oliver Egger) 

| | |
| :--- | :--- |
| *Official URL*:https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/StructureMap/CdaFrMDEToBundle | *Version*:0.1.0 |
| Draft as of 2025-10-30 | *Computable Name*:CDAFrMDEToBundle |

 
Mapping de CDA Mesure de lEnfant vers FHIR Bundle (A partir des sources de Oliver Egger) 

```

map "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/StructureMap/CdaFrMDEToBundle" = "CDAFrMDEToBundle"

// Mapping de CDA Mesure de lEnfant vers FHIR Bundle (A partir des sources de Oliver Egger)

uses "http://hl7.org/cda/stds/core/StructureDefinition/OrganizerComponent" alias OrganizerComponent as source
uses "http://hl7.org/fhir/StructureDefinition/Bundle" alias Bundle as target
uses "http://hl7.org/fhir/StructureDefinition/Composition" alias Composition as target
uses "http://hl7.org/fhir/StructureDefinition/Patient" alias Patient as target
uses "http://hl7.org/fhir/StructureDefinition/Practitioner" alias Practitioner as target
uses "http://hl7.org/fhir/StructureDefinition/Organization" alias Organization as target
uses "http://hl7.org/fhir/StructureDefinition/MedicationStatement" alias MedicationStatement as target
uses "http://hl7.org/fhir/StructureDefinition/Dosage" alias Dosage as target
uses "http://hl7.org/fhir/StructureDefinition/Observation" alias Observation as target

imports "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/StructureMap/CdaToFHIRTypes"
imports "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/StructureMap/CdaToBundle"
imports "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/StructureMap/CdaFrToBundle"

// _________________________ Document Level Template  _________________________
// source: https://art-decor.org/art-decor/decor-templates--cdachemed-?section=templates&id=2.16.756.5.30.1.1.10.1.3
// target: http://build.fhir.org/ig/hl7ch/ch-emed/StructureDefinition-ch-emed-composition-medicationcard.html
group CdaChEmedMedicationCardDocumentToBundle(source cda : ClinicalDocument, target bundle : Bundle) {
  cda ->  bundle.entry as e,  e.resource = create('Composition') as composition,  composition.id = uuid() as uuid,  e.fullUrl = append('urn:uuid:', uuid),  bundle.entry as e2,  e2.resource = create('Patient') as patient,  patient.id = uuid() as uuid2,  e2.fullUrl = append('urn:uuid:', uuid2) then ClinicalDocumentChEmedMedicationCardDocumentToBundle(cda, patient, composition, bundle) "ClinicalDocumentToBody";
}

// source: https://art-decor.org/art-decor/decor-templates--cdachemed-?section=templates&id=2.16.756.5.30.1.1.10.1.3
// target: http://build.fhir.org/ig/hl7ch/ch-emed/StructureDefinition-ch-emed-composition-medicationcard.html
group ClinicalDocumentChEmedMedicationCardDocumentToBundle(source cda : ClinicalDocument, target patient : Patient, target composition : Composition, target bundle : Bundle) extends ClinicalDocumentToBundle {
  cda then ClinicalDocumentCompositionFr(cda, composition, patient, bundle) "composition";
  cda.component as component then {
    component.structuredBody as body then {
      body.component as component2 then {
        component2.section as section then {
          section.entry as entry then {
            entry.organizer as org then {
              org.component as oc then {
                oc.observation as ob then {
                  ob ->  bundle.entry as e,  e.resource = create('Observation') as obs,  obs.id = uuid() as uuid,  e.fullUrl = append('urn:uuid:', uuid) then OrganizerComponentToObservation(ob, obs, patient) "mapObservation";
                } "mapObservation";
              } "mapOrganizerComponent";
            } "mapOrganizer";
          } "mapEntryComponent";
        } "mapSection";
      } "mapComponent2";
    } "mapBody";
  } "mapComponent";
}

// _________________________ Section Level Templates _________________________
// source: http://build.fhir.org/ig/hl7ch/ch-emed/StructureDefinition-ch-emed-composition-medicationcard.html
// target: https://art-decor.org/art-decor/decor-templates--cdachemed-?section=templates&id=2.16.756.5.30.1.1.10.3.9
group SectionMedicationCardSectionContentModule(source cda : ClinicalDocument, source src : Section, source patient : Patient, target tgt, target bundle : Bundle) extends ClinicalDocumentSection {
  src.entry as cdaEntry where (substanceAdministration.templateId.where(root = '2.16.756.5.30.1.1.10.4.34')) ->  bundle.entry as e,  e.resource = create('MedicationStatement') as medicationstatement,  medicationstatement.id = uuid() as uuid,  e.fullUrl = append('urn:uuid:', uuid),  tgt.entry = create('Reference') as reference,  reference.reference = append('urn:uuid:', uuid) then {
    cdaEntry.substanceAdministration as substanceAdministration then MedicationTreatmentPlanItemEntryContentModule(src, substanceAdministration, patient, medicationstatement);
  } "cdaEntry";
}

// _________________________ Entry Level Templates   _________________________
// source: https://art-decor.org/art-decor/decor-templates--cdachemed-?section=templates&id=2.16.756.5.30.1.1.10.4.2
// target: Annotation note (e.g. http://build.fhir.org/ig/hl7ch/ch-emed/branches/master/StructureDefinition-ch-emed-medicationstatement.html)
group OrganizerComponentToObservation(source ob : Observation, target obs : Observation, target patient : Patient) {
  // Ajout du statusCode
  // ob.statusCode as c then {
  // c.code as statCode -> obs.value = cast(statCode, 'string') "AjoutValueString";
  // } "SetObsValue";
  ob.statusCode as statCode -> obs.status = create('code') as statusCode then CSCode(statCode, statusCode) "AjoutStatus";
  ob.code as loincCode -> obs.code = create('CodeableConcept') as ccCode then CDCodeableConcept(loincCode, ccCode) "AjoutCode";
  // ob.value as v -> obs.value = cast(v, 'string');
  ob.value as ObsValue -> obs.value = create('Quantity') as quant then PQQuantity(ObsValue, quant) "numerator";
  // ob.value as obValue then {
  // obValue.value as numerator -> obs.value as targetNumerator then PQQuantity(numerator, targetNumerator) "numerator";
  // } "SetObsValue";
  // ob.statusCode as v -> obs.value = v;
  ob ->  obs.subject = create('Reference') as reference,  reference.reference = ('urn:uuid:' + %patient.id) "setObsSubject";
}


```



## Resource Content

```json
{
  "resourceType" : "StructureMap",
  "id" : "CDAFrMDEToBundle",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/StructureMap/CdaFrMDEToBundle",
  "version" : "0.1.0",
  "name" : "CDAFrMDEToBundle",
  "title" : "Mapping de CDA Mesure de lEnfant vers FHIR Bundle (A partir des sources de Oliver Egger)",
  "status" : "draft",
  "date" : "2025-10-30T13:05:17+00:00",
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
  "description" : "Mapping de CDA Mesure de lEnfant vers FHIR Bundle (A partir des sources de Oliver Egger)",
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
      "url" : "http://hl7.org/cda/stds/core/StructureDefinition/OrganizerComponent",
      "mode" : "source",
      "alias" : "OrganizerComponent"
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
      "url" : "http://hl7.org/fhir/StructureDefinition/Practitioner",
      "mode" : "target",
      "alias" : "Practitioner"
    },
    {
      "url" : "http://hl7.org/fhir/StructureDefinition/Organization",
      "mode" : "target",
      "alias" : "Organization"
    },
    {
      "url" : "http://hl7.org/fhir/StructureDefinition/MedicationStatement",
      "mode" : "target",
      "alias" : "MedicationStatement"
    },
    {
      "url" : "http://hl7.org/fhir/StructureDefinition/Dosage",
      "mode" : "target",
      "alias" : "Dosage"
    },
    {
      "url" : "http://hl7.org/fhir/StructureDefinition/Observation",
      "mode" : "target",
      "alias" : "Observation"
    }
  ],
  "import" : [
    "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/StructureMap/CdaToFHIRTypes",
    "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/StructureMap/CdaToBundle",
    "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/StructureMap/CdaFrToBundle"
  ],
  "group" : [
    {
      "name" : "CdaChEmedMedicationCardDocumentToBundle",
      "typeMode" : "none",
      "documentation" : "_________________________ Document Level Template  _________________________\r\nsource: https://art-decor.org/art-decor/decor-templates--cdachemed-?section=templates&id=2.16.756.5.30.1.1.10.1.3\r\ntarget: http://build.fhir.org/ig/hl7ch/ch-emed/StructureDefinition-ch-emed-composition-medicationcard.html",
      "input" : [
        {
          "name" : "cda",
          "type" : "ClinicalDocument",
          "mode" : "source"
        },
        {
          "name" : "bundle",
          "type" : "Bundle",
          "mode" : "target"
        }
      ],
      "rule" : [
        {
          "name" : "ClinicalDocumentToBody",
          "source" : [
            {
              "context" : "cda"
            }
          ],
          "target" : [
            {
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
              "parameter" : [
                {
                  "valueString" : "Composition"
                }
              ]
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
              "parameter" : [
                {
                  "valueString" : "urn:uuid:"
                },
                {
                  "valueId" : "uuid"
                }
              ]
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
              "parameter" : [
                {
                  "valueString" : "Patient"
                }
              ]
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
              "parameter" : [
                {
                  "valueString" : "urn:uuid:"
                },
                {
                  "valueId" : "uuid2"
                }
              ]
            }
          ],
          "dependent" : [
            {
              "name" : "ClinicalDocumentChEmedMedicationCardDocumentToBundle",
              "variable" : ["cda", "patient", "composition", "bundle"]
            }
          ]
        }
      ]
    },
    {
      "name" : "ClinicalDocumentChEmedMedicationCardDocumentToBundle",
      "extends" : "ClinicalDocumentToBundle",
      "typeMode" : "none",
      "documentation" : "source: https://art-decor.org/art-decor/decor-templates--cdachemed-?section=templates&id=2.16.756.5.30.1.1.10.1.3\r\ntarget: http://build.fhir.org/ig/hl7ch/ch-emed/StructureDefinition-ch-emed-composition-medicationcard.html",
      "input" : [
        {
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
        }
      ],
      "rule" : [
        {
          "name" : "composition",
          "source" : [
            {
              "context" : "cda"
            }
          ],
          "dependent" : [
            {
              "name" : "ClinicalDocumentCompositionFr",
              "variable" : ["cda", "composition", "patient", "bundle"]
            }
          ]
        },
        {
          "name" : "mapComponent",
          "source" : [
            {
              "context" : "cda",
              "element" : "component",
              "variable" : "component"
            }
          ],
          "rule" : [
            {
              "name" : "mapBody",
              "source" : [
                {
                  "context" : "component",
                  "element" : "structuredBody",
                  "variable" : "body"
                }
              ],
              "rule" : [
                {
                  "name" : "mapComponent2",
                  "source" : [
                    {
                      "context" : "body",
                      "element" : "component",
                      "variable" : "component2"
                    }
                  ],
                  "rule" : [
                    {
                      "name" : "mapSection",
                      "source" : [
                        {
                          "context" : "component2",
                          "element" : "section",
                          "variable" : "section"
                        }
                      ],
                      "rule" : [
                        {
                          "name" : "mapEntryComponent",
                          "source" : [
                            {
                              "context" : "section",
                              "element" : "entry",
                              "variable" : "entry"
                            }
                          ],
                          "rule" : [
                            {
                              "name" : "mapOrganizer",
                              "source" : [
                                {
                                  "context" : "entry",
                                  "element" : "organizer",
                                  "variable" : "org"
                                }
                              ],
                              "rule" : [
                                {
                                  "name" : "mapOrganizerComponent",
                                  "source" : [
                                    {
                                      "context" : "org",
                                      "element" : "component",
                                      "variable" : "oc"
                                    }
                                  ],
                                  "rule" : [
                                    {
                                      "name" : "mapObservation",
                                      "source" : [
                                        {
                                          "context" : "oc",
                                          "element" : "observation",
                                          "variable" : "ob"
                                        }
                                      ],
                                      "rule" : [
                                        {
                                          "name" : "mapObservation",
                                          "source" : [
                                            {
                                              "context" : "ob"
                                            }
                                          ],
                                          "target" : [
                                            {
                                              "context" : "bundle",
                                              "contextType" : "variable",
                                              "element" : "entry",
                                              "variable" : "e"
                                            },
                                            {
                                              "context" : "e",
                                              "contextType" : "variable",
                                              "element" : "resource",
                                              "variable" : "obs",
                                              "transform" : "create",
                                              "parameter" : [
                                                {
                                                  "valueString" : "Observation"
                                                }
                                              ]
                                            },
                                            {
                                              "context" : "obs",
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
                                              "parameter" : [
                                                {
                                                  "valueString" : "urn:uuid:"
                                                },
                                                {
                                                  "valueId" : "uuid"
                                                }
                                              ]
                                            }
                                          ],
                                          "dependent" : [
                                            {
                                              "name" : "OrganizerComponentToObservation",
                                              "variable" : ["ob", "obs", "patient"]
                                            }
                                          ]
                                        }
                                      ]
                                    }
                                  ]
                                }
                              ]
                            }
                          ]
                        }
                      ]
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
      "name" : "SectionMedicationCardSectionContentModule",
      "extends" : "ClinicalDocumentSection",
      "typeMode" : "none",
      "documentation" : "_________________________ Section Level Templates _________________________\r\nsource: http://build.fhir.org/ig/hl7ch/ch-emed/StructureDefinition-ch-emed-composition-medicationcard.html\r\ntarget: https://art-decor.org/art-decor/decor-templates--cdachemed-?section=templates&id=2.16.756.5.30.1.1.10.3.9",
      "input" : [
        {
          "name" : "cda",
          "type" : "ClinicalDocument",
          "mode" : "source"
        },
        {
          "name" : "src",
          "type" : "Section",
          "mode" : "source"
        },
        {
          "name" : "patient",
          "type" : "Patient",
          "mode" : "source"
        },
        {
          "name" : "tgt",
          "mode" : "target"
        },
        {
          "name" : "bundle",
          "type" : "Bundle",
          "mode" : "target"
        }
      ],
      "rule" : [
        {
          "name" : "cdaEntry",
          "source" : [
            {
              "context" : "src",
              "element" : "entry",
              "variable" : "cdaEntry",
              "condition" : "(substanceAdministration.templateId.where(root = '2.16.756.5.30.1.1.10.4.34'))"
            }
          ],
          "target" : [
            {
              "context" : "bundle",
              "contextType" : "variable",
              "element" : "entry",
              "variable" : "e"
            },
            {
              "context" : "e",
              "contextType" : "variable",
              "element" : "resource",
              "variable" : "medicationstatement",
              "transform" : "create",
              "parameter" : [
                {
                  "valueString" : "MedicationStatement"
                }
              ]
            },
            {
              "context" : "medicationstatement",
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
              "parameter" : [
                {
                  "valueString" : "urn:uuid:"
                },
                {
                  "valueId" : "uuid"
                }
              ]
            },
            {
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "entry",
              "variable" : "reference",
              "transform" : "create",
              "parameter" : [
                {
                  "valueString" : "Reference"
                }
              ]
            },
            {
              "context" : "reference",
              "contextType" : "variable",
              "element" : "reference",
              "transform" : "append",
              "parameter" : [
                {
                  "valueString" : "urn:uuid:"
                },
                {
                  "valueId" : "uuid"
                }
              ]
            }
          ],
          "rule" : [
            {
              "name" : "substanceAdministration",
              "source" : [
                {
                  "context" : "cdaEntry",
                  "element" : "substanceAdministration",
                  "variable" : "substanceAdministration"
                }
              ],
              "dependent" : [
                {
                  "name" : "MedicationTreatmentPlanItemEntryContentModule",
                  "variable" : ["src", "substanceAdministration", "patient", "medicationstatement"]
                }
              ]
            }
          ]
        }
      ]
    },
    {
      "name" : "OrganizerComponentToObservation",
      "typeMode" : "none",
      "documentation" : "_________________________ Entry Level Templates   _________________________\r\nsource: https://art-decor.org/art-decor/decor-templates--cdachemed-?section=templates&id=2.16.756.5.30.1.1.10.4.2\r\ntarget: Annotation note (e.g. http://build.fhir.org/ig/hl7ch/ch-emed/branches/master/StructureDefinition-ch-emed-medicationstatement.html)",
      "input" : [
        {
          "name" : "ob",
          "type" : "Observation",
          "mode" : "source"
        },
        {
          "name" : "obs",
          "type" : "Observation",
          "mode" : "target"
        },
        {
          "name" : "patient",
          "type" : "Patient",
          "mode" : "target"
        }
      ],
      "rule" : [
        {
          "name" : "AjoutStatus",
          "source" : [
            {
              "context" : "ob",
              "element" : "statusCode",
              "variable" : "statCode"
            }
          ],
          "target" : [
            {
              "context" : "obs",
              "contextType" : "variable",
              "element" : "status",
              "variable" : "statusCode",
              "transform" : "create",
              "parameter" : [
                {
                  "valueString" : "code"
                }
              ]
            }
          ],
          "dependent" : [
            {
              "name" : "CSCode",
              "variable" : ["statCode", "statusCode"]
            }
          ]
        },
        {
          "name" : "AjoutCode",
          "source" : [
            {
              "context" : "ob",
              "element" : "code",
              "variable" : "loincCode"
            }
          ],
          "target" : [
            {
              "context" : "obs",
              "contextType" : "variable",
              "element" : "code",
              "variable" : "ccCode",
              "transform" : "create",
              "parameter" : [
                {
                  "valueString" : "CodeableConcept"
                }
              ]
            }
          ],
          "dependent" : [
            {
              "name" : "CDCodeableConcept",
              "variable" : ["loincCode", "ccCode"]
            }
          ]
        },
        {
          "name" : "numerator",
          "source" : [
            {
              "context" : "ob",
              "element" : "value",
              "variable" : "ObsValue"
            }
          ],
          "target" : [
            {
              "context" : "obs",
              "contextType" : "variable",
              "element" : "value",
              "variable" : "quant",
              "transform" : "create",
              "parameter" : [
                {
                  "valueString" : "Quantity"
                }
              ]
            }
          ],
          "dependent" : [
            {
              "name" : "PQQuantity",
              "variable" : ["ObsValue", "quant"]
            }
          ]
        },
        {
          "name" : "setObsSubject",
          "source" : [
            {
              "context" : "ob"
            }
          ],
          "target" : [
            {
              "context" : "obs",
              "contextType" : "variable",
              "element" : "subject",
              "variable" : "reference",
              "transform" : "create",
              "parameter" : [
                {
                  "valueString" : "Reference"
                }
              ]
            },
            {
              "context" : "reference",
              "contextType" : "variable",
              "element" : "reference",
              "transform" : "evaluate",
              "parameter" : [
                {
                  "valueString" : "'urn:uuid:' + %patient.id"
                }
              ]
            }
          ]
        }
      ]
    }
  ]
}

```
