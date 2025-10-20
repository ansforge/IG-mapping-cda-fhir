# Mapping de CDAFr vers FHIR Bundle (Source : Oliver Egger) - POC - Mapping CDA to FHIR v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Mapping de CDAFr vers FHIR Bundle (Source : Oliver Egger)**

## StructureMap: Mapping de CDAFr vers FHIR Bundle (Source : Oliver Egger) 

| | |
| :--- | :--- |
| *Official URL*:https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/StructureMap/CdaFrToBundle | *Version*:0.1.0 |
| Draft as of 2025-10-20 | *Computable Name*:CdaFrToBundle |

 
Mapping de CDAFr vers FHIR Bundle (Source : Oliver Egger) 

```

map "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/StructureMap/CdaFrToBundle" = "CdaFrToBundle"

// Mapping de CDAFr vers FHIR Bundle (Source : Oliver Egger)

uses "http://hl7.org/cda/stds/core/StructureDefinition/ClinicalDocument" alias ClinicalDocument as source
uses "http://hl7.org/cda/stds/core/StructureDefinition/Section" alias Section as source
uses "http://hl7.org/cda/stds/core/StructureDefinition/PatientRole" alias PatientRole as source
uses "http://hl7.org/cda/stds/core/StructureDefinition/DataEnterer" alias DataEnterer as source
uses "http://hl7.org/fhir/StructureDefinition/Bundle" alias Bundle as target
uses "http://hl7.org/fhir/StructureDefinition/Composition" alias Composition as target
uses "http://hl7.org/fhir/StructureDefinition/Patient" alias Patient as target
uses "http://hl7.org/fhir/StructureDefinition/Person" alias Person as target
uses "http://hl7.org/fhir/StructureDefinition/Practitioner" alias Practitioner as target
uses "http://hl7.org/fhir/StructureDefinition/PractitionerRole" alias PractitionerRole as target
uses "http://hl7.org/fhir/StructureDefinition/Organization" alias Organization as target

imports "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/StructureMap/CdaToFhirTypes"
imports "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/StructureMap/CdaToBundle"

// _________________________ Document Level Template  _________________________
// source: https://art-decor.org/art-decor/decor-templates--hl7chcda-?id=2.16.756.5.30.1.1.10.1.14
// target: http://build.fhir.org/ig/hl7ch/ch-core/branches/master/StructureDefinition-ch-core-document.html
group CdaFrToBundle(source cda : ClinicalDocument, target bundle : Bundle) {
  cda ->  bundle.entry as e,  e.resource = create('Composition') as composition,  composition.id = uuid() as uuid,  e.fullUrl = append('urn:uuid:', uuid),  bundle.entry as e2,  e2.resource = create('Patient') as patient,  patient.id = uuid() as uuid2,  e2.fullUrl = append('urn:uuid:', uuid2) then ClinicalDocumentFrToBundle(cda, patient, composition, bundle) "ClinicalDocumentToBody";
}

// source: https://art-decor.org/art-decor/decor-templates--hl7chcda-?id=2.16.756.5.30.1.1.10.1.14
// target: http://build.fhir.org/ig/hl7ch/ch-core/branches/master/StructureDefinition-ch-core-document.html
// group ClinicalDocumentFrToBundle(source cda : ClinicalDocument, target patient : Patient, target composition : Composition, target bundle : Bundle)
// extends ClinicalDocumentToBundle {
// cda then ClinicalDocumentCompositionFr(cda, composition, patient, bundle) "composition";
// cda.component as component then {
// component.structuredBody as body then {
// body.component as component then {
// component.section as srcSection where (templateId.where(root='2.16.756.5.30.1.1.10.3.2')) -> composition.section as tgtSection
// then ClinicalDocumentSection(cda, srcSection, patient, tgtSection, bundle);
// component.section as srcSection where (templateId.where(root='2.16.756.5.30.1.1.10.3.45')) -> composition.section as tgtSection
// then SectionOriginalRepresentation(cda, srcSection, patient, tgtSection, bundle);
// } "component";
// } "body";
// } "component";
// }
// _________________________ Section Level Templates _________________________
// source: https://art-decor.org/art-decor/decor-templates--hl7chcda-?id=2.16.756.5.30.1.1.10.1.14
// target: http://build.fhir.org/ig/hl7ch/ch-core/branches/master/StructureDefinition-ch-core-composition-definitions.html#Composition.section
// TODO: not excplicitly modeled in CH-Core
group SectionOriginalRepresentation(source cda : ClinicalDocument, source src : Section, source patient : Patient, target tgt, target bundle : Bundle) extends ClinicalDocumentSection {
  src.entry as cdaEntry ->  bundle.entry as e,  e.resource = create('Binary') as binary,  binary.id = uuid() as uuid,  e.fullUrl = append('urn:uuid:', uuid) as urnuuid,  tgt.entry = create('Reference') as reference,  reference.reference = urnuuid then {
    cdaEntry.observationMedia as observationMedia then {
      observationMedia then ObservationMedia(observationMedia, binary) "observationMedia";
      observationMedia.ID as value -> reference.extension as ext then NarrativeLink(value, ext) "narrativeLink";
    };
  } "cdaEntry";
}

// _________________________ Entry Level Templates   ________________________
// source: https://art-decor.org/art-decor/decor-templates--hl7chcda-?id=2.16.756.5.30.1.1.10.4.83
// TODO: not excplicitly modeled in CH-Core
group ObservationMedia(source observationMedia, target binary : Binary) {
  observationMedia.value as value then {
    value.mediaType as mediaType -> binary.contentType = mediaType "contentType";
    value -> binary.data = (value.dataBase64Binary) "dataString";
  };
  observationMedia.languageCode as languageCode then {
    languageCode.code as lang -> binary.language = lang "lang";
  };
}

// _________________________ Header Level Templates _________________________
// source: https://art-decor.org/art-decor/decor-templates--hl7chcda-?id=2.16.756.5.30.1.1.10.9.36
// target: http://build.fhir.org/ig/hl7ch/ch-core/branches/master/StructureDefinition-ch-ext-epr-confidentialitycode.html
group ChExtEprConfidentialityCode(source src : CE, target ext : Extension) {
  src -> ext.url = 'http://fhir.ch/ig/ch-core/StructureDefinition/ch-ext-epr-confidentialitycode' "url";
  src -> ext.value = create('CodeableConcept') as value then CECodeableConcept(src, value) "code";
}

// source: https://art-decor.org/art-decor/decor-templates--hl7chcda-?id=2.16.756.5.30.1.1.10.9.36
// target: http://build.fhir.org/ig/hl7ch/ch-core/branches/master/StructureDefinition-ch-ext-epr-versionnumber.html
group ChExtEprVersionNumber(source src : INT, target ext : Extension) {
  src -> ext.url = 'http://fhir.ch/ig/ch-core/StructureDefinition/ch-ext-epr-versionnumber' "url";
  src -> ext.value = create('unsignedInt') as value then INT(src, value) "value";
}

group ChExtEprVersionNumber1(source src, target ext : Extension) {
  src -> ext.url = 'http://fhir.ch/ig/ch-core/StructureDefinition/ch-ext-epr-versionnumber' "url";
  src ->  ext.value = create('unsignedInt') as value,  value.value = '1' "value";
}

// source: https://art-decor.org/art-decor/decor-templates--hl7chcda-?id=2.16.756.5.30.1.1.10.9.36
// target: http://build.fhir.org/ig/hl7ch/ch-core/branches/master/StructureDefinition-ch-ext-epr-informationrecipient.html
group ChExtEprInformationRecipient(source src : IntendedRecipient, target patient : Patient, target ext : Extension) {
  src -> ext.url = 'http://fhir.ch/ig/ch-core/StructureDefinition/ch-ext-epr-informationrecipient' "url";
  src ->  ext.value = create('Reference') as reference,  reference.reference = ('urn:uuid:' + %patient.id) "value";
  src.addr as addr -> patient.address as address then ADAddress(addr, address) "address";
  src.informationRecipient as informationRecipient then {
    informationRecipient.name as cdaname -> patient.name as fhirname then ENHumanName(cdaname, fhirname);
  };
}

// source: https://art-decor.org/art-decor/decor-templates--hl7chcda-?id=2.16.756.5.30.1.1.10.9.36
// target: http://build.fhir.org/ig/hl7ch/ch-core/branches/master/StructureDefinition-ch-ext-epr-informationrecipient.html
group ChExtEprInformationRecipientOrganization(source src : IntendedRecipient, target organization : Organization, target ext : Extension) {
  src -> ext.url = 'http://fhir.ch/ig/ch-core/StructureDefinition/ch-ext-epr-informationrecipient' "url";
  src ->  ext.value = create('Reference') as reference,  reference.reference = ('urn:uuid:' + %organization.id) "value";
  src.receivedOrganization as receivedOrganization then ClinicalDocumentOrganization(receivedOrganization, organization) "organization";
}

// source: https://art-decor.org/art-decor/decor-templates--hl7chcda-?section=templates&id=2.16.756.5.30.1.1.10.2.7
// target: http://build.fhir.org/ig/hl7ch/ch-core/StructureDefinition-ch-ext-epr-dataenterer.html
group ChExtEprDataEnterer(source src : DataEnterer, target bundle : Bundle, target practitionerRole : PractitionerRole, target ext : Extension) {
  src -> ext.url = 'http://fhir.ch/ig/ch-core/StructureDefinition/ch-ext-epr-dataenterer' "url";
  src.assignedEntity as assignedEntity ->  ext.extension as ext,  ext.url = 'enterer',  ext.value = create('Reference') as reference,  reference.reference = ('urn:uuid:' + %practitionerRole.id) "PractitionerRole";
  src.time as time -> ext.extension as exttime then ChExtEprTime(time, exttime);
  src.assignedEntity as assignedEntity then {
    assignedEntity ->  bundle.entry as e,  e.resource = create('Practitioner') as practitioner,  practitioner.id = uuid() as uuid,  e.fullUrl = append('urn:uuid:', uuid),  practitionerRole.practitioner = create('Reference') as reference,  reference.reference = append('urn:uuid:', uuid) then ClinicalDocumentEntityPractitioner(assignedEntity, practitioner) "Practitioner";
    assignedEntity.representedOrganization as representedOrganization ->  bundle.entry as e,  e.resource = create('Organization') as organization,  organization.id = uuid() as uuid2,  e.fullUrl = append('urn:uuid:', uuid2),  practitionerRole.organization = create('Reference') as referenceOrg,  referenceOrg.reference = append('urn:uuid:', uuid2) then ClinicalDocumentOrganization(representedOrganization, organization) "Organization";
  };
}


```



## Resource Content

```json
{
  "resourceType" : "StructureMap",
  "id" : "CdaFrToBundle",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/StructureMap/CdaFrToBundle",
  "version" : "0.1.0",
  "name" : "CdaFrToBundle",
  "title" : "Mapping de CDAFr vers FHIR Bundle (Source : Oliver Egger)",
  "status" : "draft",
  "date" : "2025-10-20T12:37:37+00:00",
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
  "description" : "Mapping de CDAFr vers FHIR Bundle (Source : Oliver Egger)",
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
      "url" : "http://hl7.org/cda/stds/core/StructureDefinition/ClinicalDocument",
      "mode" : "source",
      "alias" : "ClinicalDocument"
    },
    {
      "url" : "http://hl7.org/cda/stds/core/StructureDefinition/Section",
      "mode" : "source",
      "alias" : "Section"
    },
    {
      "url" : "http://hl7.org/cda/stds/core/StructureDefinition/PatientRole",
      "mode" : "source",
      "alias" : "PatientRole"
    },
    {
      "url" : "http://hl7.org/cda/stds/core/StructureDefinition/DataEnterer",
      "mode" : "source",
      "alias" : "DataEnterer"
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
      "url" : "http://hl7.org/fhir/StructureDefinition/Person",
      "mode" : "target",
      "alias" : "Person"
    },
    {
      "url" : "http://hl7.org/fhir/StructureDefinition/Practitioner",
      "mode" : "target",
      "alias" : "Practitioner"
    },
    {
      "url" : "http://hl7.org/fhir/StructureDefinition/PractitionerRole",
      "mode" : "target",
      "alias" : "PractitionerRole"
    },
    {
      "url" : "http://hl7.org/fhir/StructureDefinition/Organization",
      "mode" : "target",
      "alias" : "Organization"
    }
  ],
  "import" : [
    "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/StructureMap/CdaToFhirTypes",
    "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/StructureMap/CdaToBundle"
  ],
  "group" : [
    {
      "name" : "CdaFrToBundle",
      "typeMode" : "none",
      "documentation" : "_________________________ Document Level Template  _________________________\r\nsource: https://art-decor.org/art-decor/decor-templates--hl7chcda-?id=2.16.756.5.30.1.1.10.1.14\r\ntarget: http://build.fhir.org/ig/hl7ch/ch-core/branches/master/StructureDefinition-ch-core-document.html",
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
              "name" : "ClinicalDocumentFrToBundle",
              "variable" : ["cda", "patient", "composition", "bundle"]
            }
          ]
        }
      ]
    },
    {
      "name" : "SectionOriginalRepresentation",
      "extends" : "ClinicalDocumentSection",
      "typeMode" : "none",
      "documentation" : "source: https://art-decor.org/art-decor/decor-templates--hl7chcda-?id=2.16.756.5.30.1.1.10.1.14\r\ntarget: http://build.fhir.org/ig/hl7ch/ch-core/branches/master/StructureDefinition-ch-core-document.html\r\ngroup ClinicalDocumentFrToBundle(source cda : ClinicalDocument, target patient : Patient, target composition : Composition, target bundle : Bundle)\r\nextends ClinicalDocumentToBundle {\r\ncda then ClinicalDocumentCompositionFr(cda, composition, patient, bundle) \"composition\";\r\ncda.component as component then {\r\ncomponent.structuredBody as body then {\r\nbody.component as component then {\r\ncomponent.section as srcSection where (templateId.where(root='2.16.756.5.30.1.1.10.3.2')) -> composition.section as tgtSection\r\nthen ClinicalDocumentSection(cda, srcSection, patient, tgtSection, bundle);\r\ncomponent.section as srcSection where (templateId.where(root='2.16.756.5.30.1.1.10.3.45')) -> composition.section as tgtSection\r\nthen SectionOriginalRepresentation(cda, srcSection, patient, tgtSection, bundle);\r\n} \"component\";\r\n} \"body\";\r\n} \"component\";\r\n}\r\n_________________________ Section Level Templates _________________________\r\nsource: https://art-decor.org/art-decor/decor-templates--hl7chcda-?id=2.16.756.5.30.1.1.10.1.14\r\ntarget: http://build.fhir.org/ig/hl7ch/ch-core/branches/master/StructureDefinition-ch-core-composition-definitions.html#Composition.section\r\nTODO: not excplicitly modeled in CH-Core",
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
              "variable" : "cdaEntry"
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
              "variable" : "binary",
              "transform" : "create",
              "parameter" : [
                {
                  "valueString" : "Binary"
                }
              ]
            },
            {
              "context" : "binary",
              "contextType" : "variable",
              "element" : "id",
              "variable" : "uuid",
              "transform" : "uuid"
            },
            {
              "context" : "e",
              "contextType" : "variable",
              "element" : "fullUrl",
              "variable" : "urnuuid",
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
              "transform" : "copy",
              "parameter" : [
                {
                  "valueId" : "urnuuid"
                }
              ]
            }
          ],
          "rule" : [
            {
              "name" : "observationMedia",
              "source" : [
                {
                  "context" : "cdaEntry",
                  "element" : "observationMedia",
                  "variable" : "observationMedia"
                }
              ],
              "rule" : [
                {
                  "name" : "observationMedia",
                  "source" : [
                    {
                      "context" : "observationMedia"
                    }
                  ],
                  "dependent" : [
                    {
                      "name" : "ObservationMedia",
                      "variable" : ["observationMedia", "binary"]
                    }
                  ]
                },
                {
                  "name" : "narrativeLink",
                  "source" : [
                    {
                      "context" : "observationMedia",
                      "element" : "ID",
                      "variable" : "value"
                    }
                  ],
                  "target" : [
                    {
                      "context" : "reference",
                      "contextType" : "variable",
                      "element" : "extension",
                      "variable" : "ext"
                    }
                  ],
                  "dependent" : [
                    {
                      "name" : "NarrativeLink",
                      "variable" : ["value", "ext"]
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
      "name" : "ObservationMedia",
      "typeMode" : "none",
      "documentation" : "_________________________ Entry Level Templates   ________________________\r\nsource: https://art-decor.org/art-decor/decor-templates--hl7chcda-?id=2.16.756.5.30.1.1.10.4.83\r\nTODO: not excplicitly modeled in CH-Core",
      "input" : [
        {
          "name" : "observationMedia",
          "mode" : "source"
        },
        {
          "name" : "binary",
          "type" : "Binary",
          "mode" : "target"
        }
      ],
      "rule" : [
        {
          "name" : "value",
          "source" : [
            {
              "context" : "observationMedia",
              "element" : "value",
              "variable" : "value"
            }
          ],
          "rule" : [
            {
              "name" : "contentType",
              "source" : [
                {
                  "context" : "value",
                  "element" : "mediaType",
                  "variable" : "mediaType"
                }
              ],
              "target" : [
                {
                  "context" : "binary",
                  "contextType" : "variable",
                  "element" : "contentType",
                  "transform" : "copy",
                  "parameter" : [
                    {
                      "valueId" : "mediaType"
                    }
                  ]
                }
              ]
            },
            {
              "name" : "dataString",
              "source" : [
                {
                  "context" : "value"
                }
              ],
              "target" : [
                {
                  "context" : "binary",
                  "contextType" : "variable",
                  "element" : "data",
                  "transform" : "evaluate",
                  "parameter" : [
                    {
                      "valueString" : "value.dataBase64Binary"
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "name" : "languageCode",
          "source" : [
            {
              "context" : "observationMedia",
              "element" : "languageCode",
              "variable" : "languageCode"
            }
          ],
          "rule" : [
            {
              "name" : "lang",
              "source" : [
                {
                  "context" : "languageCode",
                  "element" : "code",
                  "variable" : "lang"
                }
              ],
              "target" : [
                {
                  "context" : "binary",
                  "contextType" : "variable",
                  "element" : "language",
                  "transform" : "copy",
                  "parameter" : [
                    {
                      "valueId" : "lang"
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
      "name" : "ChExtEprConfidentialityCode",
      "typeMode" : "none",
      "documentation" : "_________________________ Header Level Templates _________________________\r\nsource: https://art-decor.org/art-decor/decor-templates--hl7chcda-?id=2.16.756.5.30.1.1.10.9.36\r\ntarget: http://build.fhir.org/ig/hl7ch/ch-core/branches/master/StructureDefinition-ch-ext-epr-confidentialitycode.html",
      "input" : [
        {
          "name" : "src",
          "type" : "CE",
          "mode" : "source"
        },
        {
          "name" : "ext",
          "type" : "Extension",
          "mode" : "target"
        }
      ],
      "rule" : [
        {
          "name" : "url",
          "source" : [
            {
              "context" : "src"
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
                  "valueString" : "http://fhir.ch/ig/ch-core/StructureDefinition/ch-ext-epr-confidentialitycode"
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
              "context" : "ext",
              "contextType" : "variable",
              "element" : "value",
              "variable" : "value",
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
              "name" : "CECodeableConcept",
              "variable" : ["src", "value"]
            }
          ]
        }
      ]
    },
    {
      "name" : "ChExtEprVersionNumber",
      "typeMode" : "none",
      "documentation" : "source: https://art-decor.org/art-decor/decor-templates--hl7chcda-?id=2.16.756.5.30.1.1.10.9.36\r\ntarget: http://build.fhir.org/ig/hl7ch/ch-core/branches/master/StructureDefinition-ch-ext-epr-versionnumber.html",
      "input" : [
        {
          "name" : "src",
          "type" : "INT",
          "mode" : "source"
        },
        {
          "name" : "ext",
          "type" : "Extension",
          "mode" : "target"
        }
      ],
      "rule" : [
        {
          "name" : "url",
          "source" : [
            {
              "context" : "src"
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
                  "valueString" : "http://fhir.ch/ig/ch-core/StructureDefinition/ch-ext-epr-versionnumber"
                }
              ]
            }
          ]
        },
        {
          "name" : "value",
          "source" : [
            {
              "context" : "src"
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
                  "valueString" : "unsignedInt"
                }
              ]
            }
          ],
          "dependent" : [
            {
              "name" : "INT",
              "variable" : ["src", "value"]
            }
          ]
        }
      ]
    },
    {
      "name" : "ChExtEprVersionNumber1",
      "typeMode" : "none",
      "input" : [
        {
          "name" : "src",
          "mode" : "source"
        },
        {
          "name" : "ext",
          "type" : "Extension",
          "mode" : "target"
        }
      ],
      "rule" : [
        {
          "name" : "url",
          "source" : [
            {
              "context" : "src"
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
                  "valueString" : "http://fhir.ch/ig/ch-core/StructureDefinition/ch-ext-epr-versionnumber"
                }
              ]
            }
          ]
        },
        {
          "name" : "value",
          "source" : [
            {
              "context" : "src"
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
                  "valueString" : "unsignedInt"
                }
              ]
            },
            {
              "context" : "value",
              "contextType" : "variable",
              "element" : "value",
              "transform" : "copy",
              "parameter" : [
                {
                  "valueString" : "1"
                }
              ]
            }
          ]
        }
      ]
    },
    {
      "name" : "ChExtEprInformationRecipient",
      "typeMode" : "none",
      "documentation" : "source: https://art-decor.org/art-decor/decor-templates--hl7chcda-?id=2.16.756.5.30.1.1.10.9.36\r\ntarget: http://build.fhir.org/ig/hl7ch/ch-core/branches/master/StructureDefinition-ch-ext-epr-informationrecipient.html",
      "input" : [
        {
          "name" : "src",
          "type" : "IntendedRecipient",
          "mode" : "source"
        },
        {
          "name" : "patient",
          "type" : "Patient",
          "mode" : "target"
        },
        {
          "name" : "ext",
          "type" : "Extension",
          "mode" : "target"
        }
      ],
      "rule" : [
        {
          "name" : "url",
          "source" : [
            {
              "context" : "src"
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
                  "valueString" : "http://fhir.ch/ig/ch-core/StructureDefinition/ch-ext-epr-informationrecipient"
                }
              ]
            }
          ]
        },
        {
          "name" : "value",
          "source" : [
            {
              "context" : "src"
            }
          ],
          "target" : [
            {
              "context" : "ext",
              "contextType" : "variable",
              "element" : "value",
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
        },
        {
          "name" : "address",
          "source" : [
            {
              "context" : "src",
              "element" : "addr",
              "variable" : "addr"
            }
          ],
          "target" : [
            {
              "context" : "patient",
              "contextType" : "variable",
              "element" : "address",
              "variable" : "address"
            }
          ],
          "dependent" : [
            {
              "name" : "ADAddress",
              "variable" : ["addr", "address"]
            }
          ]
        },
        {
          "name" : "informationRecipient",
          "source" : [
            {
              "context" : "src",
              "element" : "informationRecipient",
              "variable" : "informationRecipient"
            }
          ],
          "rule" : [
            {
              "name" : "name",
              "source" : [
                {
                  "context" : "informationRecipient",
                  "element" : "name",
                  "variable" : "cdaname"
                }
              ],
              "target" : [
                {
                  "context" : "patient",
                  "contextType" : "variable",
                  "element" : "name",
                  "variable" : "fhirname"
                }
              ],
              "dependent" : [
                {
                  "name" : "ENHumanName",
                  "variable" : ["cdaname", "fhirname"]
                }
              ]
            }
          ]
        }
      ]
    },
    {
      "name" : "ChExtEprInformationRecipientOrganization",
      "typeMode" : "none",
      "documentation" : "source: https://art-decor.org/art-decor/decor-templates--hl7chcda-?id=2.16.756.5.30.1.1.10.9.36\r\ntarget: http://build.fhir.org/ig/hl7ch/ch-core/branches/master/StructureDefinition-ch-ext-epr-informationrecipient.html",
      "input" : [
        {
          "name" : "src",
          "type" : "IntendedRecipient",
          "mode" : "source"
        },
        {
          "name" : "organization",
          "type" : "Organization",
          "mode" : "target"
        },
        {
          "name" : "ext",
          "type" : "Extension",
          "mode" : "target"
        }
      ],
      "rule" : [
        {
          "name" : "url",
          "source" : [
            {
              "context" : "src"
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
                  "valueString" : "http://fhir.ch/ig/ch-core/StructureDefinition/ch-ext-epr-informationrecipient"
                }
              ]
            }
          ]
        },
        {
          "name" : "value",
          "source" : [
            {
              "context" : "src"
            }
          ],
          "target" : [
            {
              "context" : "ext",
              "contextType" : "variable",
              "element" : "value",
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
                  "valueString" : "'urn:uuid:' + %organization.id"
                }
              ]
            }
          ]
        },
        {
          "name" : "organization",
          "source" : [
            {
              "context" : "src",
              "element" : "receivedOrganization",
              "variable" : "receivedOrganization"
            }
          ],
          "dependent" : [
            {
              "name" : "ClinicalDocumentOrganization",
              "variable" : ["receivedOrganization", "organization"]
            }
          ]
        }
      ]
    },
    {
      "name" : "ChExtEprDataEnterer",
      "typeMode" : "none",
      "documentation" : "source: https://art-decor.org/art-decor/decor-templates--hl7chcda-?section=templates&id=2.16.756.5.30.1.1.10.2.7\r\ntarget: http://build.fhir.org/ig/hl7ch/ch-core/StructureDefinition-ch-ext-epr-dataenterer.html",
      "input" : [
        {
          "name" : "src",
          "type" : "DataEnterer",
          "mode" : "source"
        },
        {
          "name" : "bundle",
          "type" : "Bundle",
          "mode" : "target"
        },
        {
          "name" : "practitionerRole",
          "type" : "PractitionerRole",
          "mode" : "target"
        },
        {
          "name" : "ext",
          "type" : "Extension",
          "mode" : "target"
        }
      ],
      "rule" : [
        {
          "name" : "url",
          "source" : [
            {
              "context" : "src"
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
                  "valueString" : "http://fhir.ch/ig/ch-core/StructureDefinition/ch-ext-epr-dataenterer"
                }
              ]
            }
          ]
        },
        {
          "name" : "PractitionerRole",
          "source" : [
            {
              "context" : "src",
              "element" : "assignedEntity",
              "variable" : "assignedEntity"
            }
          ],
          "target" : [
            {
              "context" : "ext",
              "contextType" : "variable",
              "element" : "extension",
              "variable" : "ext"
            },
            {
              "context" : "ext",
              "contextType" : "variable",
              "element" : "url",
              "transform" : "copy",
              "parameter" : [
                {
                  "valueString" : "enterer"
                }
              ]
            },
            {
              "context" : "ext",
              "contextType" : "variable",
              "element" : "value",
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
                  "valueString" : "'urn:uuid:' + %practitionerRole.id"
                }
              ]
            }
          ]
        },
        {
          "name" : "time",
          "source" : [
            {
              "context" : "src",
              "element" : "time",
              "variable" : "time"
            }
          ],
          "target" : [
            {
              "context" : "ext",
              "contextType" : "variable",
              "element" : "extension",
              "variable" : "exttime"
            }
          ],
          "dependent" : [
            {
              "name" : "ChExtEprTime",
              "variable" : ["time", "exttime"]
            }
          ]
        },
        {
          "name" : "assignedEntity",
          "source" : [
            {
              "context" : "src",
              "element" : "assignedEntity",
              "variable" : "assignedEntity"
            }
          ],
          "rule" : [
            {
              "name" : "Practitioner",
              "source" : [
                {
                  "context" : "assignedEntity"
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
                  "variable" : "practitioner",
                  "transform" : "create",
                  "parameter" : [
                    {
                      "valueString" : "Practitioner"
                    }
                  ]
                },
                {
                  "context" : "practitioner",
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
                  "context" : "practitionerRole",
                  "contextType" : "variable",
                  "element" : "practitioner",
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
              "dependent" : [
                {
                  "name" : "ClinicalDocumentEntityPractitioner",
                  "variable" : ["assignedEntity", "practitioner"]
                }
              ]
            },
            {
              "name" : "Organization",
              "source" : [
                {
                  "context" : "assignedEntity",
                  "element" : "representedOrganization",
                  "variable" : "representedOrganization"
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
                  "variable" : "organization",
                  "transform" : "create",
                  "parameter" : [
                    {
                      "valueString" : "Organization"
                    }
                  ]
                },
                {
                  "context" : "organization",
                  "contextType" : "variable",
                  "element" : "id",
                  "variable" : "uuid2",
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
                      "valueId" : "uuid2"
                    }
                  ]
                },
                {
                  "context" : "practitionerRole",
                  "contextType" : "variable",
                  "element" : "organization",
                  "variable" : "referenceOrg",
                  "transform" : "create",
                  "parameter" : [
                    {
                      "valueString" : "Reference"
                    }
                  ]
                },
                {
                  "context" : "referenceOrg",
                  "contextType" : "variable",
                  "element" : "reference",
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
                  "name" : "ClinicalDocumentOrganization",
                  "variable" : ["representedOrganization", "organization"]
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
