# Mapping de CDA vers FHIR Bundle (A partir des sources de Oliver Egger) - POC - Mapping CDA to FHIR v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Mapping de CDA vers FHIR Bundle (A partir des sources de Oliver Egger)**

## StructureMap: Mapping de CDA vers FHIR Bundle (A partir des sources de Oliver Egger) 

| | |
| :--- | :--- |
| *Official URL*:https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/StructureMap/CdaToBundle | *Version*:0.1.0 |
| Draft as of 2025-10-30 | *Computable Name*:CdaToBundle |

 
Mapping de CDA vers FHIR Bundle (A partir des sources de Oliver Egger) 

```

map "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/StructureMap/CdaToBundle" = "CdaToBundle"

// Mapping de CDA vers FHIR Bundle (A partir des sources de Oliver Egger)

uses "http://hl7.org/cda/stds/core/StructureDefinition/ClinicalDocument" alias ClinicalDocument as source
uses "http://hl7.org/cda/stds/core/StructureDefinition/AssignedAuthor" alias AssignedAuthor as source
uses "http://hl7.org/cda/stds/core/StructureDefinition/AssignedEntity" alias AssignedEntity as source
uses "http://hl7.org/cda/stds/core/StructureDefinition/CustodianOrganization" alias CustodianOrganization as source
uses "http://hl7.org/cda/stds/core/StructureDefinition/Section" alias Section as source
uses "http://hl7.org/cda/stds/core/StructureDefinition/PatientRole" alias PatientRole as source
uses "http://hl7.org/fhir/StructureDefinition/Bundle" alias Bundle as target
uses "http://hl7.org/fhir/StructureDefinition/Composition" alias Composition as target
uses "http://hl7.org/fhir/StructureDefinition/Patient" alias Patient as target
uses "http://hl7.org/fhir/StructureDefinition/Person" alias Person as target
uses "http://hl7.org/fhir/StructureDefinition/Practitioner" alias Practitioner as target
uses "http://hl7.org/fhir/StructureDefinition/Organization" alias Organization as target

imports "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/StructureMap/CdaToFHIRTypes"

// _________________________ Document Level Template  _________________________
group CdaToBundle(source cda : ClinicalDocument, target bundle : Bundle) {
  cda ->  bundle.entry as e,  e.resource = create('Composition') as composition,  composition.id = uuid() as uuid,  e.fullUrl = append('urn:uuid:', uuid),  bundle.entry as e2,  e2.resource = create('Patient') as patient,  patient.id = uuid() as uuid2,  e2.fullUrl = append('urn:uuid:', uuid2) then {
    cda then ClinicalDocumentToBundle(cda, patient, composition, bundle) "cdatobundle";
  } "ClinicalDocumentToBody";
}

group ClinicalDocumentToBundle(source cda : ClinicalDocument, target patient : Patient, target composition : Composition, target bundle : Bundle) {
  cda -> bundle.id = uuid() "id";
  cda.id as addIdentifier -> bundle.identifier = addIdentifier "identifier";
  cda -> bundle.type = 'document' "type";
  cda.effectiveTime as timestamp -> bundle.timestamp = timestamp;
  cda then ClinicalDocumentComposition(cda, composition, patient, bundle) "composition";
  cda.component as cdaComponent then {
    cdaComponent.structuredBody as body then {
      body.component as bodyComponent then {
        bodyComponent.section as srcSection where $this.code.empty() -> composition.section as tgtSection then ClinicalDocumentSection(cda, srcSection, patient, tgtSection, bundle);
      } "bodyComponent";
    } "body";
  } "cdaComponent";
}

// // _________________________ Section Level Templates _________________________
group ClinicalDocumentSection(source cda : ClinicalDocument, source src : Section, source patient : Patient, target tgt, target bundle : Bundle) {
  src.title as t -> tgt.title = (t.xmlText);
  src.code as srcCode -> tgt.code = srcCode;
  src.text as cdaText -> tgt.text as fhirText then {
    cdaText -> fhirText.status = 'generated' "narrativeStatus";
    cdaText as t -> fhirText.div = t "narrativeText";
  } "cdaText";
  src.section as srcSection -> tgt.section as tgtSection then ClinicalDocumentSection(cda, srcSection, patient, tgtSection, bundle);
}

// _________________________ Entry Level Templates   ________________________
// _________________________ Header Level Templates _________________________
group ClinicalDocumentComposition(source src : ClinicalDocument, target tgt : Composition, target patientResource : Patient, target bundle : Bundle) {
  src.languageCode as languageCode -> tgt.language = languageCode;
  src.id as id where src.setId.exists().not() -> tgt.identifier = id "identifier";
  src.setId as setIdentifier -> tgt.identifier = setIdentifier "identifier";
  src -> tgt.status = 'final' "status";
  src.code as srcCode -> tgt.type = srcCode;
  src.title as t -> tgt.title = (t.xmlText);
  src.recordTarget as recordTarget then {
    recordTarget.patientRole as patient ->  tgt.subject = create('Reference') as reference,  reference.reference = ('urn:uuid:' + %patientResource.id) then ClinicalDocumentPatientRole(patient, patientResource, bundle) "subject";
  } "patientRole";
  src.componentOf as comp ->  bundle.entry as e,  e.resource = create('Encounter') as encounter,  encounter.id = uuid() as uuid,  e.fullUrl = append('urn:uuid:', uuid) then {
    comp.encompassingEncounter as srcEnc ->  tgt.encounter = create('Reference') as reference,  reference.reference = ('urn:uuid:' + %encounter.id) then ClinicalDocumentEncounter(srcEnc, bundle, encounter) "srcEncounter";
  } "encompassingEncounter";
  src.effectiveTime as effectiveTime -> tgt.date = effectiveTime;
  src.author as srcAuthor ->  bundle.entry as e,  e.resource = create('Practitioner') as practitioner,  practitioner.id = uuid() as uuid2,  e.fullUrl = append('urn:uuid:', uuid2),  tgt.author = create('Reference') as reference,  reference.reference = ('urn:uuid:' + %practitioner.id) then {
    srcAuthor.assignedAuthor as assignedAuthor then {
      assignedAuthor.id as id -> practitioner.identifier = id;
      assignedAuthor.addr as addr -> practitioner.address = addr;
      assignedAuthor.telecom as tlc -> practitioner.telecom = tlc;
      assignedAuthor.assignedPerson as assPerson then {
        assPerson.name as pName -> practitioner.name = pName;
      } "name";
      assignedAuthor.representedOrganization as srcOrg ->  bundle.entry as e2,  e2.resource = create('Organization') as organization,  organization.id = uuid() as uuid3,  e2.fullUrl = append('urn:uuid:', uuid3),  tgt.author = create('Reference') as reference2,  reference2.reference = ('urn:uuid:' + %organization.id) then ClinicalDocumentOrganization(srcOrg, organization);
    } "author";
  } "srcAuthor";
  src.confidentialityCode as confCode -> tgt.confidentiality = confCode;
  src.legalAuthenticator as legalAuth ->  bundle.entry as e,  e.resource = create('Practitioner') as practitioner,  practitioner.id = uuid() as uuid2,  e.fullUrl = append('urn:uuid:', uuid2) then {
    legalAuth -> tgt.attester as attester then {
      legalAuth -> attester.mode = 'legal' "mode";
      legalAuth.time as time -> attester.time = time;
      legalAuth.assignedEntity as entity ->  attester.party = create('Reference') as reference,  reference.reference = ('urn:uuid:' + %practitioner.id) then ClinicalDocumentEntityPractitioner(entity, practitioner) "entity";
    } "attester";
  } "legalAuth";
  src.authenticator as auth ->  bundle.entry as e,  e.resource = create('Practitioner') as practitioner,  practitioner.id = uuid() as uuid2,  e.fullUrl = append('urn:uuid:', uuid2) then {
    auth -> tgt.attester as attester then {
      auth -> attester.mode = 'official' "mode";
      auth.time as time -> attester.time = time;
      auth.assignedEntity as entity ->  attester.party = create('Reference') as reference,  reference.reference = ('urn:uuid:' + %practitioner.id) then ClinicalDocumentEntityPractitioner(entity, practitioner) "entity";
    } "attester";
  } "auth";
  src.custodian as custodian -> bundle.entry as e then {
    custodian.assignedCustodian as assignedCustodian ->  e.resource = create('Organization') as organization,  organization.id = uuid() as uuid3,  e.fullUrl = append('urn:uuid:', uuid3) then {
      assignedCustodian.representedCustodianOrganization as srcOrg ->  tgt.custodian = create('Reference') as reference,  reference.reference = ('urn:uuid:' + %organization.id) then ClinicalDocumentOrganization(srcOrg, organization) "assignedCustodian";
    } "custodian";
  } "cust";
  src.documentationOf as docOf then {
    docOf.serviceEvent as serviceEvent -> tgt.event as event then {
      serviceEvent.code as eventCode -> event.code = eventCode "eventCode";
      serviceEvent.effectiveTime as effectivetime -> event.period = effectivetime "eventTime"; // performerType: for src.performer.typeCode ...
    } "docOf";
  };
  src.relatedDocument as relatedDoc -> tgt.relatesTo as relates then {
    relatedDoc.typeCode as typeCode -> relates.code = typeCode;
    relatedDoc.parentDocument as parentDoc then {
      parentDoc.setId as sid -> relates.targetIdentifier = sid;
    } "parentDoc";
  } "relatedDoc";
}

group ClinicalDocumentEntityPractitioner(source src : AssignedEntity, target tgt : Practitioner) {
  src.id as srcId -> tgt.identifier = srcId;
  src.addr as srcAddr -> tgt.address = srcAddr;
  src.telecom as srcTelecom -> tgt.telecom = srcTelecom;
  src.assignedPerson as person then {
    person.name as pName -> tgt.name = pName;
  } "name";
}

group ClinicalDocumentOrganization(source src : CustodianOrganization, target tgt : Organization) {
  src.id as srcId -> tgt.identifier = srcId;
  src.name as v -> tgt.name = (v.other);
  src.telecom as srcTelecom -> tgt.telecom = srcTelecom;
  src.addr as srcAddr -> tgt.address = srcAddr;
}

group ClinicalDocumentPatientRole(source src : PatientRole, target tgt : Patient, target bundle : Bundle) {
  // src.id -> tgt.identifier;
  // Patient.identifier.type for EPR context, because there is only the identifier "LocalPid" allowed, LocalPid requires an type -> http://build.fhir.org/ig/hl7ch/ch-core/branches/master/StructureDefinition-ch-core-composition-patient-epr.html
  // Modification NR
  src.id as id -> tgt.identifier = create('Identifier') as identifier then setFrPatientIdentifier(id, identifier);
  src.addr as srcAddr -> tgt.address = srcAddr;
  src.telecom as srcTelecom -> tgt.telecom = srcTelecom;
  src.patient as patient then {
    patient.name as patientName -> tgt.name = patientName;
    patient.administrativeGenderCode as gender then {
      gender.code as v -> tgt.gender = translate(v, 'https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/cm-v3-administrative-gender', 'code') "gender";
    } "gender";
    patient.birthTime as birthTime -> tgt.birthDate = birthTime "birthDate";
    patient.deceasedInd as indicator where patient.deceasedTime.empty() -> tgt.deceased = create('boolean') as bool then boolean(indicator, bool) "deceasedBL";
    patient.deceasedTime as dTime -> tgt.deceased = dTime;
    patient.maritalStatusCode as mStatus -> tgt.maritalStatus = mStatus "maritalStatus";
    patient.languageCommunication as language -> tgt.communication as communication then {
      language.languageCode as lCode -> communication.language = lCode "communication"; // preference: for language.preferenceInd make communication.preferred
    } "language";
  } "patientrole";
  src.providerOrganization as org ->  bundle.entry as e,  e.resource = create('Organization') as organization,  organization.id = uuid() as uuid3,  e.fullUrl = append('urn:uuid:', uuid3) then {
    org ->  tgt.managingOrganization = create('Reference') as reference,  reference.reference = ('urn:uuid:' + %organization.id) "reference";
    org.id as orgId -> organization.identifier = orgId;
    org.name as v -> organization.name = (v.other);
    org.telecom as orgTel -> organization.telecom = orgTel;
    org.addr as orgAddr -> organization.address = orgAddr;
  } "organization";
}

group setFrPatientIdentifier(source id : II, target identifier : Identifier) {
  id ->  identifier,  identifier.type as type,  type.coding as coding,  coding.system as system,  coding.code as code then {
    // src -> system.value = 'http://terminology.hl7.org/CodeSystem/v2-0203' "system";
    // INS-NIR - 1.2.250.1.213.1.4.8
    id where (id.root = '1.2.250.1.213.1.4.8') -> system.value = 'https://hl7.fr/ig/fhir/core/CodeSystem/fr-core-cs-v2-0203' "system";
    id where (id.root = '1.2.250.1.213.1.4.8') -> code.value = 'INS-NIR' "code";
    // IPP - 1.2.3.4.5.6.7.8.9.10
    id where (id.root = '1.2.3.4.5.6.7.8.9.10') -> system.value = 'http://terminology.hl7.org/CodeSystem/v2-0203' "system";
    id where (id.root = '1.2.3.4.5.6.7.8.9.10') -> code.value = 'PI' "code";
  } "identifierType";
  id.extension as extension ->  identifier.value as value,  value.value = extension;
  id.root as root ->  identifier.system as system,  system.value = append('urn:oid:', root);
}

// Fin modification NR
// Etat initial
// src -> tgt.identifier as identifier then {
// src.id as id -> identifier.type as type, type.coding as coding, coding.system as system, coding.code as code then {
// src -> system.value = 'http://terminology.hl7.org/CodeSystem/v2-0203' "system";
// src -> code.value = 'MR' "code";
// id.extension as extension -> identifier.value as value, value.value = extension "extension";
// id.root as root -> identifier.system as system, system.value = append('urn:oid:', root) "root";
// } "id";
// } "identifier";
// Fin état initial
group ClinicalDocumentEncounter(source src : EncompassingEncounter, target bundle : Bundle, target tgt : Encounter) {
  src.id as Id -> tgt.identifier = Id;
  src.code as srcCode -> tgt.type = srcCode;
  src.effectiveTime as effTime -> tgt.period = effTime;
  src where admissionReferralSourceCode.exists() or dischargeDispositionCode.exists() -> tgt.hospitalization as hosp then {
    src.admissionReferralSourceCode as admRef -> hosp.admitSource = admRef "adminReferral";
    src.dischargeDispositionCode as discDispo -> hosp.dischargeDisposition = discDispo "discDisposition";
  } "hospitalization";
  src.encounterParticipant as srcPart -> tgt.participant as tgtPart then {
    srcPart.typeCode as code -> tgtPart.type = cc('http://terminology.hl7.org/CodeSystem/v3-ParticipationType', code);
    srcPart.time as srcTime -> tgtPart.period = srcTime;
    srcPart.assignedEntity as entity ->  bundle.entry as e,  e.resource = create('Practitioner') as practitioner,  practitioner.id = uuid() as uuid2,  e.fullUrl = append('urn:uuid:', uuid2) then {
      entity ->  tgtPart.individual = create('Reference') as reference,  reference.reference = ('urn:uuid:' + %practitioner.id) then ClinicalDocumentEntityPractitioner(entity, practitioner) "entry";
    } "entity";
  } "participant";
  src.location as srcLocation then {
    srcLocation.healthCareFacility as facility ->  bundle.entry as e,  e.resource = create('Location') as location,  location.id = uuid() as uuid2,  e.fullUrl = append('urn:uuid:', uuid2) then {
      facility ->  tgt.location as tgtLocation,  tgtLocation.location = create('Reference') as reference,  reference.reference = ('urn:uuid:' + %location.id) then ClinicalDocumentLocation(facility, bundle, location) "facLocation";
    } "facility";
  };
}

group ClinicalDocumentLocation(source src : HealthCareFacility, target bundle : Bundle, target tgt : Location) {
  src.id as srcIdentifier -> tgt.identifier = srcIdentifier;
  src.code as srcCode -> tgt.type = srcCode;
  src.location as location then {
    // place names are usually stored with no parts    location.name as srcName -> tgt.name = cast(srcName, 'string');
    location.addr as locAddr -> tgt.address = locAddr;
    location.serviceProviderOrganization as srcOrg ->  bundle.entry as e,  e.resource = create('Organization') as organization,  organization.id = uuid() as uuid3,  e.fullUrl = append('urn:uuid:', uuid3) then {
      srcOrg ->  tgt.managingOrganization = create('Reference') as reference,  reference.reference = ('urn:uuid:' + %organization.id) then ClinicalDocumentOrganization(srcOrg, organization) "organization";
    } "org";
  }; // place names are usually stored with no parts
}

// _________________________ Template Type not specified  ___________________
group NarrativeLink(source url, target ext : Extension) {
  url -> ext.url = 'http://hl7.org/fhir/StructureDefinition/narrativeLink' "url";
  url ->  ext.value = create('url') as value,  value.value = url "value";
}


```



## Resource Content

```json
{
  "resourceType" : "StructureMap",
  "id" : "CdaToBundle",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/StructureMap/CdaToBundle",
  "version" : "0.1.0",
  "name" : "CdaToBundle",
  "title" : "Mapping de CDA vers FHIR Bundle (A partir des sources de Oliver Egger)",
  "status" : "draft",
  "date" : "2025-10-30T16:59:01+00:00",
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
  "description" : "Mapping de CDA vers FHIR Bundle (A partir des sources de Oliver Egger)",
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
      "url" : "http://hl7.org/cda/stds/core/StructureDefinition/AssignedAuthor",
      "mode" : "source",
      "alias" : "AssignedAuthor"
    },
    {
      "url" : "http://hl7.org/cda/stds/core/StructureDefinition/AssignedEntity",
      "mode" : "source",
      "alias" : "AssignedEntity"
    },
    {
      "url" : "http://hl7.org/cda/stds/core/StructureDefinition/CustodianOrganization",
      "mode" : "source",
      "alias" : "CustodianOrganization"
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
      "url" : "http://hl7.org/fhir/StructureDefinition/Organization",
      "mode" : "target",
      "alias" : "Organization"
    }
  ],
  "import" : [
    "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/StructureMap/CdaToFHIRTypes"
  ],
  "group" : [
    {
      "name" : "CdaToBundle",
      "typeMode" : "none",
      "documentation" : "_________________________ Document Level Template  _________________________",
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
          "rule" : [
            {
              "name" : "cdatobundle",
              "source" : [
                {
                  "context" : "cda"
                }
              ],
              "dependent" : [
                {
                  "name" : "ClinicalDocumentToBundle",
                  "variable" : ["cda", "patient", "composition", "bundle"]
                }
              ]
            }
          ]
        }
      ]
    },
    {
      "name" : "ClinicalDocumentToBundle",
      "typeMode" : "none",
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
          "name" : "id",
          "source" : [
            {
              "context" : "cda"
            }
          ],
          "target" : [
            {
              "context" : "bundle",
              "contextType" : "variable",
              "element" : "id",
              "transform" : "uuid"
            }
          ]
        },
        {
          "name" : "identifier",
          "source" : [
            {
              "context" : "cda",
              "element" : "id",
              "variable" : "addIdentifier"
            }
          ],
          "target" : [
            {
              "context" : "bundle",
              "contextType" : "variable",
              "element" : "identifier",
              "transform" : "copy",
              "parameter" : [
                {
                  "valueId" : "addIdentifier"
                }
              ]
            }
          ]
        },
        {
          "name" : "type",
          "source" : [
            {
              "context" : "cda"
            }
          ],
          "target" : [
            {
              "context" : "bundle",
              "contextType" : "variable",
              "element" : "type",
              "transform" : "copy",
              "parameter" : [
                {
                  "valueString" : "document"
                }
              ]
            }
          ]
        },
        {
          "name" : "effectiveTime",
          "source" : [
            {
              "context" : "cda",
              "element" : "effectiveTime",
              "variable" : "timestamp"
            }
          ],
          "target" : [
            {
              "context" : "bundle",
              "contextType" : "variable",
              "element" : "timestamp",
              "transform" : "copy",
              "parameter" : [
                {
                  "valueId" : "timestamp"
                }
              ]
            }
          ]
        },
        {
          "name" : "composition",
          "source" : [
            {
              "context" : "cda"
            }
          ],
          "dependent" : [
            {
              "name" : "ClinicalDocumentComposition",
              "variable" : ["cda", "composition", "patient", "bundle"]
            }
          ]
        },
        {
          "name" : "cdaComponent",
          "source" : [
            {
              "context" : "cda",
              "element" : "component",
              "variable" : "cdaComponent"
            }
          ],
          "rule" : [
            {
              "name" : "body",
              "source" : [
                {
                  "context" : "cdaComponent",
                  "element" : "structuredBody",
                  "variable" : "body"
                }
              ],
              "rule" : [
                {
                  "name" : "bodyComponent",
                  "source" : [
                    {
                      "context" : "body",
                      "element" : "component",
                      "variable" : "bodyComponent"
                    }
                  ],
                  "rule" : [
                    {
                      "name" : "section",
                      "source" : [
                        {
                          "context" : "bodyComponent",
                          "element" : "section",
                          "variable" : "srcSection",
                          "condition" : "$this.code.empty()"
                        }
                      ],
                      "target" : [
                        {
                          "context" : "composition",
                          "contextType" : "variable",
                          "element" : "section",
                          "variable" : "tgtSection"
                        }
                      ],
                      "dependent" : [
                        {
                          "name" : "ClinicalDocumentSection",
                          "variable" : ["cda", "srcSection", "patient", "tgtSection", "bundle"]
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
      "name" : "ClinicalDocumentSection",
      "typeMode" : "none",
      "documentation" : "// _________________________ Section Level Templates _________________________",
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
          "name" : "title",
          "source" : [
            {
              "context" : "src",
              "element" : "title",
              "variable" : "t"
            }
          ],
          "target" : [
            {
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "title",
              "transform" : "evaluate",
              "parameter" : [
                {
                  "valueString" : "t.xmlText"
                }
              ]
            }
          ]
        },
        {
          "name" : "code",
          "source" : [
            {
              "context" : "src",
              "element" : "code",
              "variable" : "srcCode"
            }
          ],
          "target" : [
            {
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "code",
              "transform" : "copy",
              "parameter" : [
                {
                  "valueId" : "srcCode"
                }
              ]
            }
          ]
        },
        {
          "name" : "cdaText",
          "source" : [
            {
              "context" : "src",
              "element" : "text",
              "variable" : "cdaText"
            }
          ],
          "target" : [
            {
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "text",
              "variable" : "fhirText"
            }
          ],
          "rule" : [
            {
              "name" : "narrativeStatus",
              "source" : [
                {
                  "context" : "cdaText"
                }
              ],
              "target" : [
                {
                  "context" : "fhirText",
                  "contextType" : "variable",
                  "element" : "status",
                  "transform" : "copy",
                  "parameter" : [
                    {
                      "valueString" : "generated"
                    }
                  ]
                }
              ]
            },
            {
              "name" : "narrativeText",
              "source" : [
                {
                  "context" : "cdaText",
                  "variable" : "t"
                }
              ],
              "target" : [
                {
                  "context" : "fhirText",
                  "contextType" : "variable",
                  "element" : "div",
                  "transform" : "copy",
                  "parameter" : [
                    {
                      "valueId" : "t"
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "name" : "section",
          "source" : [
            {
              "context" : "src",
              "element" : "section",
              "variable" : "srcSection"
            }
          ],
          "target" : [
            {
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "section",
              "variable" : "tgtSection"
            }
          ],
          "dependent" : [
            {
              "name" : "ClinicalDocumentSection",
              "variable" : ["cda", "srcSection", "patient", "tgtSection", "bundle"]
            }
          ]
        }
      ]
    },
    {
      "name" : "ClinicalDocumentComposition",
      "typeMode" : "none",
      "documentation" : "_________________________ Entry Level Templates   ________________________\r\n_________________________ Header Level Templates _________________________",
      "input" : [
        {
          "name" : "src",
          "type" : "ClinicalDocument",
          "mode" : "source"
        },
        {
          "name" : "tgt",
          "type" : "Composition",
          "mode" : "target"
        },
        {
          "name" : "patientResource",
          "type" : "Patient",
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
          "name" : "languageCode",
          "source" : [
            {
              "context" : "src",
              "element" : "languageCode",
              "variable" : "languageCode"
            }
          ],
          "target" : [
            {
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "language",
              "transform" : "copy",
              "parameter" : [
                {
                  "valueId" : "languageCode"
                }
              ]
            }
          ]
        },
        {
          "name" : "identifier",
          "source" : [
            {
              "context" : "src",
              "element" : "id",
              "variable" : "id",
              "condition" : "src.setId.exists().not()"
            }
          ],
          "target" : [
            {
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "identifier",
              "transform" : "copy",
              "parameter" : [
                {
                  "valueId" : "id"
                }
              ]
            }
          ]
        },
        {
          "name" : "identifier",
          "source" : [
            {
              "context" : "src",
              "element" : "setId",
              "variable" : "setIdentifier"
            }
          ],
          "target" : [
            {
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "identifier",
              "transform" : "copy",
              "parameter" : [
                {
                  "valueId" : "setIdentifier"
                }
              ]
            }
          ]
        },
        {
          "name" : "status",
          "source" : [
            {
              "context" : "src"
            }
          ],
          "target" : [
            {
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "status",
              "transform" : "copy",
              "parameter" : [
                {
                  "valueString" : "final"
                }
              ]
            }
          ]
        },
        {
          "name" : "code",
          "source" : [
            {
              "context" : "src",
              "element" : "code",
              "variable" : "srcCode"
            }
          ],
          "target" : [
            {
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "type",
              "transform" : "copy",
              "parameter" : [
                {
                  "valueId" : "srcCode"
                }
              ]
            }
          ]
        },
        {
          "name" : "title",
          "source" : [
            {
              "context" : "src",
              "element" : "title",
              "variable" : "t"
            }
          ],
          "target" : [
            {
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "title",
              "transform" : "evaluate",
              "parameter" : [
                {
                  "valueString" : "t.xmlText"
                }
              ]
            }
          ]
        },
        {
          "name" : "patientRole",
          "source" : [
            {
              "context" : "src",
              "element" : "recordTarget",
              "variable" : "recordTarget"
            }
          ],
          "rule" : [
            {
              "name" : "subject",
              "source" : [
                {
                  "context" : "recordTarget",
                  "element" : "patientRole",
                  "variable" : "patient"
                }
              ],
              "target" : [
                {
                  "context" : "tgt",
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
                      "valueString" : "'urn:uuid:' + %patientResource.id"
                    }
                  ]
                }
              ],
              "dependent" : [
                {
                  "name" : "ClinicalDocumentPatientRole",
                  "variable" : ["patient", "patientResource", "bundle"]
                }
              ]
            }
          ]
        },
        {
          "name" : "encompassingEncounter",
          "source" : [
            {
              "context" : "src",
              "element" : "componentOf",
              "variable" : "comp"
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
              "variable" : "encounter",
              "transform" : "create",
              "parameter" : [
                {
                  "valueString" : "Encounter"
                }
              ]
            },
            {
              "context" : "encounter",
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
          "rule" : [
            {
              "name" : "srcEncounter",
              "source" : [
                {
                  "context" : "comp",
                  "element" : "encompassingEncounter",
                  "variable" : "srcEnc"
                }
              ],
              "target" : [
                {
                  "context" : "tgt",
                  "contextType" : "variable",
                  "element" : "encounter",
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
                      "valueString" : "'urn:uuid:' + %encounter.id"
                    }
                  ]
                }
              ],
              "dependent" : [
                {
                  "name" : "ClinicalDocumentEncounter",
                  "variable" : ["srcEnc", "bundle", "encounter"]
                }
              ]
            }
          ]
        },
        {
          "name" : "effectiveTime",
          "source" : [
            {
              "context" : "src",
              "element" : "effectiveTime",
              "variable" : "effectiveTime"
            }
          ],
          "target" : [
            {
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "date",
              "transform" : "copy",
              "parameter" : [
                {
                  "valueId" : "effectiveTime"
                }
              ]
            }
          ]
        },
        {
          "name" : "srcAuthor",
          "source" : [
            {
              "context" : "src",
              "element" : "author",
              "variable" : "srcAuthor"
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
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "author",
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
                  "valueString" : "'urn:uuid:' + %practitioner.id"
                }
              ]
            }
          ],
          "rule" : [
            {
              "name" : "author",
              "source" : [
                {
                  "context" : "srcAuthor",
                  "element" : "assignedAuthor",
                  "variable" : "assignedAuthor"
                }
              ],
              "rule" : [
                {
                  "name" : "id",
                  "source" : [
                    {
                      "context" : "assignedAuthor",
                      "element" : "id",
                      "variable" : "id"
                    }
                  ],
                  "target" : [
                    {
                      "context" : "practitioner",
                      "contextType" : "variable",
                      "element" : "identifier",
                      "transform" : "copy",
                      "parameter" : [
                        {
                          "valueId" : "id"
                        }
                      ]
                    }
                  ]
                },
                {
                  "name" : "addr",
                  "source" : [
                    {
                      "context" : "assignedAuthor",
                      "element" : "addr",
                      "variable" : "addr"
                    }
                  ],
                  "target" : [
                    {
                      "context" : "practitioner",
                      "contextType" : "variable",
                      "element" : "address",
                      "transform" : "copy",
                      "parameter" : [
                        {
                          "valueId" : "addr"
                        }
                      ]
                    }
                  ]
                },
                {
                  "name" : "telecom",
                  "source" : [
                    {
                      "context" : "assignedAuthor",
                      "element" : "telecom",
                      "variable" : "tlc"
                    }
                  ],
                  "target" : [
                    {
                      "context" : "practitioner",
                      "contextType" : "variable",
                      "element" : "telecom",
                      "transform" : "copy",
                      "parameter" : [
                        {
                          "valueId" : "tlc"
                        }
                      ]
                    }
                  ]
                },
                {
                  "name" : "name",
                  "source" : [
                    {
                      "context" : "assignedAuthor",
                      "element" : "assignedPerson",
                      "variable" : "assPerson"
                    }
                  ],
                  "rule" : [
                    {
                      "name" : "name",
                      "source" : [
                        {
                          "context" : "assPerson",
                          "element" : "name",
                          "variable" : "pName"
                        }
                      ],
                      "target" : [
                        {
                          "context" : "practitioner",
                          "contextType" : "variable",
                          "element" : "name",
                          "transform" : "copy",
                          "parameter" : [
                            {
                              "valueId" : "pName"
                            }
                          ]
                        }
                      ]
                    }
                  ]
                },
                {
                  "name" : "representedOrganization",
                  "source" : [
                    {
                      "context" : "assignedAuthor",
                      "element" : "representedOrganization",
                      "variable" : "srcOrg"
                    }
                  ],
                  "target" : [
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
                      "variable" : "uuid3",
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
                          "valueId" : "uuid3"
                        }
                      ]
                    },
                    {
                      "context" : "tgt",
                      "contextType" : "variable",
                      "element" : "author",
                      "variable" : "reference2",
                      "transform" : "create",
                      "parameter" : [
                        {
                          "valueString" : "Reference"
                        }
                      ]
                    },
                    {
                      "context" : "reference2",
                      "contextType" : "variable",
                      "element" : "reference",
                      "transform" : "evaluate",
                      "parameter" : [
                        {
                          "valueString" : "'urn:uuid:' + %organization.id"
                        }
                      ]
                    }
                  ],
                  "dependent" : [
                    {
                      "name" : "ClinicalDocumentOrganization",
                      "variable" : ["srcOrg", "organization"]
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "name" : "confidentialityCode",
          "source" : [
            {
              "context" : "src",
              "element" : "confidentialityCode",
              "variable" : "confCode"
            }
          ],
          "target" : [
            {
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "confidentiality",
              "transform" : "copy",
              "parameter" : [
                {
                  "valueId" : "confCode"
                }
              ]
            }
          ]
        },
        {
          "name" : "legalAuth",
          "source" : [
            {
              "context" : "src",
              "element" : "legalAuthenticator",
              "variable" : "legalAuth"
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
            }
          ],
          "rule" : [
            {
              "name" : "attester",
              "source" : [
                {
                  "context" : "legalAuth"
                }
              ],
              "target" : [
                {
                  "context" : "tgt",
                  "contextType" : "variable",
                  "element" : "attester",
                  "variable" : "attester"
                }
              ],
              "rule" : [
                {
                  "name" : "mode",
                  "source" : [
                    {
                      "context" : "legalAuth"
                    }
                  ],
                  "target" : [
                    {
                      "context" : "attester",
                      "contextType" : "variable",
                      "element" : "mode",
                      "transform" : "copy",
                      "parameter" : [
                        {
                          "valueString" : "legal"
                        }
                      ]
                    }
                  ]
                },
                {
                  "name" : "time",
                  "source" : [
                    {
                      "context" : "legalAuth",
                      "element" : "time",
                      "variable" : "time"
                    }
                  ],
                  "target" : [
                    {
                      "context" : "attester",
                      "contextType" : "variable",
                      "element" : "time",
                      "transform" : "copy",
                      "parameter" : [
                        {
                          "valueId" : "time"
                        }
                      ]
                    }
                  ]
                },
                {
                  "name" : "entity",
                  "source" : [
                    {
                      "context" : "legalAuth",
                      "element" : "assignedEntity",
                      "variable" : "entity"
                    }
                  ],
                  "target" : [
                    {
                      "context" : "attester",
                      "contextType" : "variable",
                      "element" : "party",
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
                          "valueString" : "'urn:uuid:' + %practitioner.id"
                        }
                      ]
                    }
                  ],
                  "dependent" : [
                    {
                      "name" : "ClinicalDocumentEntityPractitioner",
                      "variable" : ["entity", "practitioner"]
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "name" : "auth",
          "source" : [
            {
              "context" : "src",
              "element" : "authenticator",
              "variable" : "auth"
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
            }
          ],
          "rule" : [
            {
              "name" : "attester",
              "source" : [
                {
                  "context" : "auth"
                }
              ],
              "target" : [
                {
                  "context" : "tgt",
                  "contextType" : "variable",
                  "element" : "attester",
                  "variable" : "attester"
                }
              ],
              "rule" : [
                {
                  "name" : "mode",
                  "source" : [
                    {
                      "context" : "auth"
                    }
                  ],
                  "target" : [
                    {
                      "context" : "attester",
                      "contextType" : "variable",
                      "element" : "mode",
                      "transform" : "copy",
                      "parameter" : [
                        {
                          "valueString" : "official"
                        }
                      ]
                    }
                  ]
                },
                {
                  "name" : "time",
                  "source" : [
                    {
                      "context" : "auth",
                      "element" : "time",
                      "variable" : "time"
                    }
                  ],
                  "target" : [
                    {
                      "context" : "attester",
                      "contextType" : "variable",
                      "element" : "time",
                      "transform" : "copy",
                      "parameter" : [
                        {
                          "valueId" : "time"
                        }
                      ]
                    }
                  ]
                },
                {
                  "name" : "entity",
                  "source" : [
                    {
                      "context" : "auth",
                      "element" : "assignedEntity",
                      "variable" : "entity"
                    }
                  ],
                  "target" : [
                    {
                      "context" : "attester",
                      "contextType" : "variable",
                      "element" : "party",
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
                          "valueString" : "'urn:uuid:' + %practitioner.id"
                        }
                      ]
                    }
                  ],
                  "dependent" : [
                    {
                      "name" : "ClinicalDocumentEntityPractitioner",
                      "variable" : ["entity", "practitioner"]
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "name" : "cust",
          "source" : [
            {
              "context" : "src",
              "element" : "custodian",
              "variable" : "custodian"
            }
          ],
          "target" : [
            {
              "context" : "bundle",
              "contextType" : "variable",
              "element" : "entry",
              "variable" : "e"
            }
          ],
          "rule" : [
            {
              "name" : "custodian",
              "source" : [
                {
                  "context" : "custodian",
                  "element" : "assignedCustodian",
                  "variable" : "assignedCustodian"
                }
              ],
              "target" : [
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
                  "variable" : "uuid3",
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
                      "valueId" : "uuid3"
                    }
                  ]
                }
              ],
              "rule" : [
                {
                  "name" : "assignedCustodian",
                  "source" : [
                    {
                      "context" : "assignedCustodian",
                      "element" : "representedCustodianOrganization",
                      "variable" : "srcOrg"
                    }
                  ],
                  "target" : [
                    {
                      "context" : "tgt",
                      "contextType" : "variable",
                      "element" : "custodian",
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
                  ],
                  "dependent" : [
                    {
                      "name" : "ClinicalDocumentOrganization",
                      "variable" : ["srcOrg", "organization"]
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "name" : "documentationOf",
          "source" : [
            {
              "context" : "src",
              "element" : "documentationOf",
              "variable" : "docOf"
            }
          ],
          "rule" : [
            {
              "name" : "docOf",
              "source" : [
                {
                  "context" : "docOf",
                  "element" : "serviceEvent",
                  "variable" : "serviceEvent"
                }
              ],
              "target" : [
                {
                  "context" : "tgt",
                  "contextType" : "variable",
                  "element" : "event",
                  "variable" : "event"
                }
              ],
              "rule" : [
                {
                  "name" : "eventCode",
                  "source" : [
                    {
                      "context" : "serviceEvent",
                      "element" : "code",
                      "variable" : "eventCode"
                    }
                  ],
                  "target" : [
                    {
                      "context" : "event",
                      "contextType" : "variable",
                      "element" : "code",
                      "transform" : "copy",
                      "parameter" : [
                        {
                          "valueId" : "eventCode"
                        }
                      ]
                    }
                  ]
                },
                {
                  "name" : "eventTime",
                  "source" : [
                    {
                      "context" : "serviceEvent",
                      "element" : "effectiveTime",
                      "variable" : "effectivetime"
                    }
                  ],
                  "target" : [
                    {
                      "context" : "event",
                      "contextType" : "variable",
                      "element" : "period",
                      "transform" : "copy",
                      "parameter" : [
                        {
                          "valueId" : "effectivetime"
                        }
                      ]
                    }
                  ],
                  "documentation" : "performerType: for src.performer.typeCode ..."
                }
              ]
            }
          ]
        },
        {
          "name" : "relatedDoc",
          "source" : [
            {
              "context" : "src",
              "element" : "relatedDocument",
              "variable" : "relatedDoc"
            }
          ],
          "target" : [
            {
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "relatesTo",
              "variable" : "relates"
            }
          ],
          "rule" : [
            {
              "name" : "typeCode",
              "source" : [
                {
                  "context" : "relatedDoc",
                  "element" : "typeCode",
                  "variable" : "typeCode"
                }
              ],
              "target" : [
                {
                  "context" : "relates",
                  "contextType" : "variable",
                  "element" : "code",
                  "transform" : "copy",
                  "parameter" : [
                    {
                      "valueId" : "typeCode"
                    }
                  ]
                }
              ]
            },
            {
              "name" : "parentDoc",
              "source" : [
                {
                  "context" : "relatedDoc",
                  "element" : "parentDocument",
                  "variable" : "parentDoc"
                }
              ],
              "rule" : [
                {
                  "name" : "setId",
                  "source" : [
                    {
                      "context" : "parentDoc",
                      "element" : "setId",
                      "variable" : "sid"
                    }
                  ],
                  "target" : [
                    {
                      "context" : "relates",
                      "contextType" : "variable",
                      "element" : "targetIdentifier",
                      "transform" : "copy",
                      "parameter" : [
                        {
                          "valueId" : "sid"
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
      "name" : "ClinicalDocumentEntityPractitioner",
      "typeMode" : "none",
      "input" : [
        {
          "name" : "src",
          "type" : "AssignedEntity",
          "mode" : "source"
        },
        {
          "name" : "tgt",
          "type" : "Practitioner",
          "mode" : "target"
        }
      ],
      "rule" : [
        {
          "name" : "id",
          "source" : [
            {
              "context" : "src",
              "element" : "id",
              "variable" : "srcId"
            }
          ],
          "target" : [
            {
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "identifier",
              "transform" : "copy",
              "parameter" : [
                {
                  "valueId" : "srcId"
                }
              ]
            }
          ]
        },
        {
          "name" : "addr",
          "source" : [
            {
              "context" : "src",
              "element" : "addr",
              "variable" : "srcAddr"
            }
          ],
          "target" : [
            {
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "address",
              "transform" : "copy",
              "parameter" : [
                {
                  "valueId" : "srcAddr"
                }
              ]
            }
          ]
        },
        {
          "name" : "telecom",
          "source" : [
            {
              "context" : "src",
              "element" : "telecom",
              "variable" : "srcTelecom"
            }
          ],
          "target" : [
            {
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "telecom",
              "transform" : "copy",
              "parameter" : [
                {
                  "valueId" : "srcTelecom"
                }
              ]
            }
          ]
        },
        {
          "name" : "name",
          "source" : [
            {
              "context" : "src",
              "element" : "assignedPerson",
              "variable" : "person"
            }
          ],
          "rule" : [
            {
              "name" : "name",
              "source" : [
                {
                  "context" : "person",
                  "element" : "name",
                  "variable" : "pName"
                }
              ],
              "target" : [
                {
                  "context" : "tgt",
                  "contextType" : "variable",
                  "element" : "name",
                  "transform" : "copy",
                  "parameter" : [
                    {
                      "valueId" : "pName"
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
      "name" : "ClinicalDocumentOrganization",
      "typeMode" : "none",
      "input" : [
        {
          "name" : "src",
          "type" : "CustodianOrganization",
          "mode" : "source"
        },
        {
          "name" : "tgt",
          "type" : "Organization",
          "mode" : "target"
        }
      ],
      "rule" : [
        {
          "name" : "id",
          "source" : [
            {
              "context" : "src",
              "element" : "id",
              "variable" : "srcId"
            }
          ],
          "target" : [
            {
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "identifier",
              "transform" : "copy",
              "parameter" : [
                {
                  "valueId" : "srcId"
                }
              ]
            }
          ]
        },
        {
          "name" : "name",
          "source" : [
            {
              "context" : "src",
              "element" : "name",
              "variable" : "v"
            }
          ],
          "target" : [
            {
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "name",
              "transform" : "evaluate",
              "parameter" : [
                {
                  "valueString" : "v.other"
                }
              ]
            }
          ]
        },
        {
          "name" : "telecom",
          "source" : [
            {
              "context" : "src",
              "element" : "telecom",
              "variable" : "srcTelecom"
            }
          ],
          "target" : [
            {
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "telecom",
              "transform" : "copy",
              "parameter" : [
                {
                  "valueId" : "srcTelecom"
                }
              ]
            }
          ]
        },
        {
          "name" : "addr",
          "source" : [
            {
              "context" : "src",
              "element" : "addr",
              "variable" : "srcAddr"
            }
          ],
          "target" : [
            {
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "address",
              "transform" : "copy",
              "parameter" : [
                {
                  "valueId" : "srcAddr"
                }
              ]
            }
          ]
        }
      ]
    },
    {
      "name" : "ClinicalDocumentPatientRole",
      "typeMode" : "none",
      "input" : [
        {
          "name" : "src",
          "type" : "PatientRole",
          "mode" : "source"
        },
        {
          "name" : "tgt",
          "type" : "Patient",
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
          "name" : "id",
          "source" : [
            {
              "context" : "src",
              "element" : "id",
              "variable" : "id"
            }
          ],
          "target" : [
            {
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "identifier",
              "variable" : "identifier",
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
              "name" : "setFrPatientIdentifier",
              "variable" : ["id", "identifier"]
            }
          ]
        },
        {
          "name" : "addr",
          "source" : [
            {
              "context" : "src",
              "element" : "addr",
              "variable" : "srcAddr"
            }
          ],
          "target" : [
            {
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "address",
              "transform" : "copy",
              "parameter" : [
                {
                  "valueId" : "srcAddr"
                }
              ]
            }
          ]
        },
        {
          "name" : "telecom",
          "source" : [
            {
              "context" : "src",
              "element" : "telecom",
              "variable" : "srcTelecom"
            }
          ],
          "target" : [
            {
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "telecom",
              "transform" : "copy",
              "parameter" : [
                {
                  "valueId" : "srcTelecom"
                }
              ]
            }
          ]
        },
        {
          "name" : "patientrole",
          "source" : [
            {
              "context" : "src",
              "element" : "patient",
              "variable" : "patient"
            }
          ],
          "rule" : [
            {
              "name" : "name",
              "source" : [
                {
                  "context" : "patient",
                  "element" : "name",
                  "variable" : "patientName"
                }
              ],
              "target" : [
                {
                  "context" : "tgt",
                  "contextType" : "variable",
                  "element" : "name",
                  "transform" : "copy",
                  "parameter" : [
                    {
                      "valueId" : "patientName"
                    }
                  ]
                }
              ]
            },
            {
              "name" : "gender",
              "source" : [
                {
                  "context" : "patient",
                  "element" : "administrativeGenderCode",
                  "variable" : "gender"
                }
              ],
              "rule" : [
                {
                  "name" : "gender",
                  "source" : [
                    {
                      "context" : "gender",
                      "element" : "code",
                      "variable" : "v"
                    }
                  ],
                  "target" : [
                    {
                      "context" : "tgt",
                      "contextType" : "variable",
                      "element" : "gender",
                      "transform" : "translate",
                      "parameter" : [
                        {
                          "valueId" : "v"
                        },
                        {
                          "valueString" : "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/cm-v3-administrative-gender"
                        },
                        {
                          "valueString" : "code"
                        }
                      ]
                    }
                  ]
                }
              ]
            },
            {
              "name" : "birthDate",
              "source" : [
                {
                  "context" : "patient",
                  "element" : "birthTime",
                  "variable" : "birthTime"
                }
              ],
              "target" : [
                {
                  "context" : "tgt",
                  "contextType" : "variable",
                  "element" : "birthDate",
                  "transform" : "copy",
                  "parameter" : [
                    {
                      "valueId" : "birthTime"
                    }
                  ]
                }
              ]
            },
            {
              "name" : "deceasedBL",
              "source" : [
                {
                  "context" : "patient",
                  "element" : "deceasedInd",
                  "variable" : "indicator",
                  "condition" : "patient.deceasedTime.empty()"
                }
              ],
              "target" : [
                {
                  "context" : "tgt",
                  "contextType" : "variable",
                  "element" : "deceased",
                  "variable" : "bool",
                  "transform" : "create",
                  "parameter" : [
                    {
                      "valueString" : "boolean"
                    }
                  ]
                }
              ],
              "dependent" : [
                {
                  "name" : "boolean",
                  "variable" : ["indicator", "bool"]
                }
              ]
            },
            {
              "name" : "deceasedTime",
              "source" : [
                {
                  "context" : "patient",
                  "element" : "deceasedTime",
                  "variable" : "dTime"
                }
              ],
              "target" : [
                {
                  "context" : "tgt",
                  "contextType" : "variable",
                  "element" : "deceased",
                  "transform" : "copy",
                  "parameter" : [
                    {
                      "valueId" : "dTime"
                    }
                  ]
                }
              ]
            },
            {
              "name" : "maritalStatus",
              "source" : [
                {
                  "context" : "patient",
                  "element" : "maritalStatusCode",
                  "variable" : "mStatus"
                }
              ],
              "target" : [
                {
                  "context" : "tgt",
                  "contextType" : "variable",
                  "element" : "maritalStatus",
                  "transform" : "copy",
                  "parameter" : [
                    {
                      "valueId" : "mStatus"
                    }
                  ]
                }
              ]
            },
            {
              "name" : "language",
              "source" : [
                {
                  "context" : "patient",
                  "element" : "languageCommunication",
                  "variable" : "language"
                }
              ],
              "target" : [
                {
                  "context" : "tgt",
                  "contextType" : "variable",
                  "element" : "communication",
                  "variable" : "communication"
                }
              ],
              "rule" : [
                {
                  "name" : "communication",
                  "source" : [
                    {
                      "context" : "language",
                      "element" : "languageCode",
                      "variable" : "lCode"
                    }
                  ],
                  "target" : [
                    {
                      "context" : "communication",
                      "contextType" : "variable",
                      "element" : "language",
                      "transform" : "copy",
                      "parameter" : [
                        {
                          "valueId" : "lCode"
                        }
                      ]
                    }
                  ],
                  "documentation" : "preference: for language.preferenceInd make communication.preferred"
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
              "element" : "providerOrganization",
              "variable" : "org"
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
              "variable" : "uuid3",
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
                  "valueId" : "uuid3"
                }
              ]
            }
          ],
          "rule" : [
            {
              "name" : "reference",
              "source" : [
                {
                  "context" : "org"
                }
              ],
              "target" : [
                {
                  "context" : "tgt",
                  "contextType" : "variable",
                  "element" : "managingOrganization",
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
              "name" : "id",
              "source" : [
                {
                  "context" : "org",
                  "element" : "id",
                  "variable" : "orgId"
                }
              ],
              "target" : [
                {
                  "context" : "organization",
                  "contextType" : "variable",
                  "element" : "identifier",
                  "transform" : "copy",
                  "parameter" : [
                    {
                      "valueId" : "orgId"
                    }
                  ]
                }
              ]
            },
            {
              "name" : "name",
              "source" : [
                {
                  "context" : "org",
                  "element" : "name",
                  "variable" : "v"
                }
              ],
              "target" : [
                {
                  "context" : "organization",
                  "contextType" : "variable",
                  "element" : "name",
                  "transform" : "evaluate",
                  "parameter" : [
                    {
                      "valueString" : "v.other"
                    }
                  ]
                }
              ]
            },
            {
              "name" : "telecom",
              "source" : [
                {
                  "context" : "org",
                  "element" : "telecom",
                  "variable" : "orgTel"
                }
              ],
              "target" : [
                {
                  "context" : "organization",
                  "contextType" : "variable",
                  "element" : "telecom",
                  "transform" : "copy",
                  "parameter" : [
                    {
                      "valueId" : "orgTel"
                    }
                  ]
                }
              ]
            },
            {
              "name" : "addr",
              "source" : [
                {
                  "context" : "org",
                  "element" : "addr",
                  "variable" : "orgAddr"
                }
              ],
              "target" : [
                {
                  "context" : "organization",
                  "contextType" : "variable",
                  "element" : "address",
                  "transform" : "copy",
                  "parameter" : [
                    {
                      "valueId" : "orgAddr"
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
      "name" : "setFrPatientIdentifier",
      "typeMode" : "none",
      "input" : [
        {
          "name" : "id",
          "type" : "II",
          "mode" : "source"
        },
        {
          "name" : "identifier",
          "type" : "Identifier",
          "mode" : "target"
        }
      ],
      "rule" : [
        {
          "name" : "identifierType",
          "source" : [
            {
              "context" : "id"
            }
          ],
          "target" : [
            {
              "context" : "identifier",
              "contextType" : "variable"
            },
            {
              "context" : "identifier",
              "contextType" : "variable",
              "element" : "type",
              "variable" : "type"
            },
            {
              "context" : "type",
              "contextType" : "variable",
              "element" : "coding",
              "variable" : "coding"
            },
            {
              "context" : "coding",
              "contextType" : "variable",
              "element" : "system",
              "variable" : "system"
            },
            {
              "context" : "coding",
              "contextType" : "variable",
              "element" : "code",
              "variable" : "code"
            }
          ],
          "rule" : [
            {
              "name" : "system",
              "source" : [
                {
                  "context" : "id",
                  "condition" : "(id.root = '1.2.250.1.213.1.4.8')"
                }
              ],
              "target" : [
                {
                  "context" : "system",
                  "contextType" : "variable",
                  "element" : "value",
                  "transform" : "copy",
                  "parameter" : [
                    {
                      "valueString" : "https://hl7.fr/ig/fhir/core/CodeSystem/fr-core-cs-v2-0203"
                    }
                  ]
                }
              ]
            },
            {
              "name" : "code",
              "source" : [
                {
                  "context" : "id",
                  "condition" : "(id.root = '1.2.250.1.213.1.4.8')"
                }
              ],
              "target" : [
                {
                  "context" : "code",
                  "contextType" : "variable",
                  "element" : "value",
                  "transform" : "copy",
                  "parameter" : [
                    {
                      "valueString" : "INS-NIR"
                    }
                  ]
                }
              ]
            },
            {
              "name" : "system",
              "source" : [
                {
                  "context" : "id",
                  "condition" : "(id.root = '1.2.3.4.5.6.7.8.9.10')"
                }
              ],
              "target" : [
                {
                  "context" : "system",
                  "contextType" : "variable",
                  "element" : "value",
                  "transform" : "copy",
                  "parameter" : [
                    {
                      "valueString" : "http://terminology.hl7.org/CodeSystem/v2-0203"
                    }
                  ]
                }
              ]
            },
            {
              "name" : "code",
              "source" : [
                {
                  "context" : "id",
                  "condition" : "(id.root = '1.2.3.4.5.6.7.8.9.10')"
                }
              ],
              "target" : [
                {
                  "context" : "code",
                  "contextType" : "variable",
                  "element" : "value",
                  "transform" : "copy",
                  "parameter" : [
                    {
                      "valueString" : "PI"
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "name" : "extension",
          "source" : [
            {
              "context" : "id",
              "element" : "extension",
              "variable" : "extension"
            }
          ],
          "target" : [
            {
              "context" : "identifier",
              "contextType" : "variable",
              "element" : "value",
              "variable" : "value"
            },
            {
              "context" : "value",
              "contextType" : "variable",
              "element" : "value",
              "transform" : "copy",
              "parameter" : [
                {
                  "valueId" : "extension"
                }
              ]
            }
          ]
        },
        {
          "name" : "root",
          "source" : [
            {
              "context" : "id",
              "element" : "root",
              "variable" : "root"
            }
          ],
          "target" : [
            {
              "context" : "identifier",
              "contextType" : "variable",
              "element" : "system",
              "variable" : "system"
            },
            {
              "context" : "system",
              "contextType" : "variable",
              "element" : "value",
              "transform" : "append",
              "parameter" : [
                {
                  "valueString" : "urn:oid:"
                },
                {
                  "valueId" : "root"
                }
              ]
            }
          ]
        }
      ]
    },
    {
      "name" : "ClinicalDocumentEncounter",
      "typeMode" : "none",
      "documentation" : "Fin modification NR\r\nEtat initial\r\nsrc -> tgt.identifier as identifier then {\r\nsrc.id as id -> identifier.type as type, type.coding as coding, coding.system as system, coding.code as code then {\r\nsrc -> system.value = 'http://terminology.hl7.org/CodeSystem/v2-0203' \"system\";\r\nsrc -> code.value = 'MR' \"code\";\r\nid.extension as extension -> identifier.value as value, value.value = extension \"extension\";\r\nid.root as root -> identifier.system as system, system.value = append('urn:oid:', root) \"root\";\r\n} \"id\";\r\n} \"identifier\";\r\nFin état initial",
      "input" : [
        {
          "name" : "src",
          "type" : "EncompassingEncounter",
          "mode" : "source"
        },
        {
          "name" : "bundle",
          "type" : "Bundle",
          "mode" : "target"
        },
        {
          "name" : "tgt",
          "type" : "Encounter",
          "mode" : "target"
        }
      ],
      "rule" : [
        {
          "name" : "id",
          "source" : [
            {
              "context" : "src",
              "element" : "id",
              "variable" : "Id"
            }
          ],
          "target" : [
            {
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "identifier",
              "transform" : "copy",
              "parameter" : [
                {
                  "valueId" : "Id"
                }
              ]
            }
          ]
        },
        {
          "name" : "code",
          "source" : [
            {
              "context" : "src",
              "element" : "code",
              "variable" : "srcCode"
            }
          ],
          "target" : [
            {
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "type",
              "transform" : "copy",
              "parameter" : [
                {
                  "valueId" : "srcCode"
                }
              ]
            }
          ]
        },
        {
          "name" : "effectiveTime",
          "source" : [
            {
              "context" : "src",
              "element" : "effectiveTime",
              "variable" : "effTime"
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
                  "valueId" : "effTime"
                }
              ]
            }
          ]
        },
        {
          "name" : "hospitalization",
          "source" : [
            {
              "context" : "src",
              "condition" : "admissionReferralSourceCode.exists() or dischargeDispositionCode.exists()"
            }
          ],
          "target" : [
            {
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "hospitalization",
              "variable" : "hosp"
            }
          ],
          "rule" : [
            {
              "name" : "adminReferral",
              "source" : [
                {
                  "context" : "src",
                  "element" : "admissionReferralSourceCode",
                  "variable" : "admRef"
                }
              ],
              "target" : [
                {
                  "context" : "hosp",
                  "contextType" : "variable",
                  "element" : "admitSource",
                  "transform" : "copy",
                  "parameter" : [
                    {
                      "valueId" : "admRef"
                    }
                  ]
                }
              ]
            },
            {
              "name" : "discDisposition",
              "source" : [
                {
                  "context" : "src",
                  "element" : "dischargeDispositionCode",
                  "variable" : "discDispo"
                }
              ],
              "target" : [
                {
                  "context" : "hosp",
                  "contextType" : "variable",
                  "element" : "dischargeDisposition",
                  "transform" : "copy",
                  "parameter" : [
                    {
                      "valueId" : "discDispo"
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "name" : "participant",
          "source" : [
            {
              "context" : "src",
              "element" : "encounterParticipant",
              "variable" : "srcPart"
            }
          ],
          "target" : [
            {
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "participant",
              "variable" : "tgtPart"
            }
          ],
          "rule" : [
            {
              "name" : "typeCode",
              "source" : [
                {
                  "context" : "srcPart",
                  "element" : "typeCode",
                  "variable" : "code"
                }
              ],
              "target" : [
                {
                  "context" : "tgtPart",
                  "contextType" : "variable",
                  "element" : "type",
                  "transform" : "cc",
                  "parameter" : [
                    {
                      "valueString" : "http://terminology.hl7.org/CodeSystem/v3-ParticipationType"
                    },
                    {
                      "valueId" : "code"
                    }
                  ]
                }
              ]
            },
            {
              "name" : "time",
              "source" : [
                {
                  "context" : "srcPart",
                  "element" : "time",
                  "variable" : "srcTime"
                }
              ],
              "target" : [
                {
                  "context" : "tgtPart",
                  "contextType" : "variable",
                  "element" : "period",
                  "transform" : "copy",
                  "parameter" : [
                    {
                      "valueId" : "srcTime"
                    }
                  ]
                }
              ]
            },
            {
              "name" : "entity",
              "source" : [
                {
                  "context" : "srcPart",
                  "element" : "assignedEntity",
                  "variable" : "entity"
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
                }
              ],
              "rule" : [
                {
                  "name" : "entry",
                  "source" : [
                    {
                      "context" : "entity"
                    }
                  ],
                  "target" : [
                    {
                      "context" : "tgtPart",
                      "contextType" : "variable",
                      "element" : "individual",
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
                          "valueString" : "'urn:uuid:' + %practitioner.id"
                        }
                      ]
                    }
                  ],
                  "dependent" : [
                    {
                      "name" : "ClinicalDocumentEntityPractitioner",
                      "variable" : ["entity", "practitioner"]
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "name" : "location",
          "source" : [
            {
              "context" : "src",
              "element" : "location",
              "variable" : "srcLocation"
            }
          ],
          "rule" : [
            {
              "name" : "facility",
              "source" : [
                {
                  "context" : "srcLocation",
                  "element" : "healthCareFacility",
                  "variable" : "facility"
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
                  "variable" : "location",
                  "transform" : "create",
                  "parameter" : [
                    {
                      "valueString" : "Location"
                    }
                  ]
                },
                {
                  "context" : "location",
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
                }
              ],
              "rule" : [
                {
                  "name" : "facLocation",
                  "source" : [
                    {
                      "context" : "facility"
                    }
                  ],
                  "target" : [
                    {
                      "context" : "tgt",
                      "contextType" : "variable",
                      "element" : "location",
                      "variable" : "tgtLocation"
                    },
                    {
                      "context" : "tgtLocation",
                      "contextType" : "variable",
                      "element" : "location",
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
                          "valueString" : "'urn:uuid:' + %location.id"
                        }
                      ]
                    }
                  ],
                  "dependent" : [
                    {
                      "name" : "ClinicalDocumentLocation",
                      "variable" : ["facility", "bundle", "location"]
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
      "name" : "ClinicalDocumentLocation",
      "typeMode" : "none",
      "input" : [
        {
          "name" : "src",
          "type" : "HealthCareFacility",
          "mode" : "source"
        },
        {
          "name" : "bundle",
          "type" : "Bundle",
          "mode" : "target"
        },
        {
          "name" : "tgt",
          "type" : "Location",
          "mode" : "target"
        }
      ],
      "rule" : [
        {
          "name" : "id",
          "source" : [
            {
              "context" : "src",
              "element" : "id",
              "variable" : "srcIdentifier"
            }
          ],
          "target" : [
            {
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "identifier",
              "transform" : "copy",
              "parameter" : [
                {
                  "valueId" : "srcIdentifier"
                }
              ]
            }
          ]
        },
        {
          "name" : "code",
          "source" : [
            {
              "context" : "src",
              "element" : "code",
              "variable" : "srcCode"
            }
          ],
          "target" : [
            {
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "type",
              "transform" : "copy",
              "parameter" : [
                {
                  "valueId" : "srcCode"
                }
              ]
            }
          ]
        },
        {
          "name" : "location",
          "source" : [
            {
              "context" : "src",
              "element" : "location",
              "variable" : "location"
            }
          ],
          "rule" : [
            {
              "name" : "addr",
              "source" : [
                {
                  "context" : "location",
                  "element" : "addr",
                  "variable" : "locAddr"
                }
              ],
              "target" : [
                {
                  "context" : "tgt",
                  "contextType" : "variable",
                  "element" : "address",
                  "transform" : "copy",
                  "parameter" : [
                    {
                      "valueId" : "locAddr"
                    }
                  ]
                }
              ]
            },
            {
              "name" : "org",
              "source" : [
                {
                  "context" : "location",
                  "element" : "serviceProviderOrganization",
                  "variable" : "srcOrg"
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
                  "variable" : "uuid3",
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
                      "valueId" : "uuid3"
                    }
                  ]
                }
              ],
              "rule" : [
                {
                  "name" : "organization",
                  "source" : [
                    {
                      "context" : "srcOrg"
                    }
                  ],
                  "target" : [
                    {
                      "context" : "tgt",
                      "contextType" : "variable",
                      "element" : "managingOrganization",
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
                  ],
                  "dependent" : [
                    {
                      "name" : "ClinicalDocumentOrganization",
                      "variable" : ["srcOrg", "organization"]
                    }
                  ]
                }
              ]
            }
          ],
          "documentation" : "place names are usually stored with no parts"
        }
      ]
    },
    {
      "name" : "NarrativeLink",
      "typeMode" : "none",
      "documentation" : "_________________________ Template Type not specified  ___________________",
      "input" : [
        {
          "name" : "url",
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
              "context" : "url"
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
                  "valueString" : "http://hl7.org/fhir/StructureDefinition/narrativeLink"
                }
              ]
            }
          ]
        },
        {
          "name" : "value",
          "source" : [
            {
              "context" : "url"
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
                  "valueString" : "url"
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
                  "valueId" : "url"
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
