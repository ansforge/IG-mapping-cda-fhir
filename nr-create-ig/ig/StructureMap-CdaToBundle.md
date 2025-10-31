# Mapping de CDA vers FHIR Bundle (A partir des sources de Oliver Egger) - POC - Mapping CDA to FHIR v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Mapping de CDA vers FHIR Bundle (A partir des sources de Oliver Egger)**

## StructureMap: Mapping de CDA vers FHIR Bundle (A partir des sources de Oliver Egger) 

| | |
| :--- | :--- |
| *Official URL*:https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/StructureMap/CdaToBundle | *Version*:0.1.0 |
| Draft as of 2025-10-31 | *Computable Name*:CdaToBundle |

 
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
  cda.id as cdaId -> bundle.identifier as identifier then {
    cdaId.root as root where cdaId.extension.exists() -> identifier.system = translate(root, '#oid2uri', 'uri') "system";
    cdaId.extension as extension -> identifier.value = extension "value";
    cdaId.root as root where cdaId.extension.empty() -> identifier.system = 'urn:ietf:rfc:3986' "systemOid";
    cdaId.root as root where cdaId.extension.empty() -> identifier.value = append('urn:oid:', root) "valueOid";
  } "identifier";
  cda -> bundle.type = 'document' "type";
  cda.effectiveTime as effectiveTime -> bundle.timestamp = create('instant') as timestamp then TSInstant(effectiveTime, timestamp) "timestamp";
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
  src.languageCode as languageCode -> tgt.language = create('code') as code then CSCode(languageCode, code);
  src.id as id where src.setId.exists().not() -> tgt.identifier = create('Identifier') as identifier then II(id, identifier) "identifier";
  src.setId as setId -> tgt.identifier = create('Identifier') as identifier then II(setId, identifier) "setIdentifier";
  src -> tgt.status = 'final' "status";
  src.code as srcCode -> tgt.type = create('CodeableConcept') as cc then CDCodeableConcept(srcCode, cc);
  src.title as t -> tgt.title = (t.xmlText);
  src.recordTarget as recordTarget then {
    recordTarget.patientRole as patient ->  tgt.subject = create('Reference') as reference,  reference.reference = ('urn:uuid:' + %patientResource.id) then ClinicalDocumentPatientRole(patient, patientResource, bundle) "subject";
  } "patientRole";
  src.componentOf as comp ->  bundle.entry as e,  e.resource = create('Encounter') as encounter,  encounter.id = uuid() as uuid,  e.fullUrl = append('urn:uuid:', uuid) then {
    comp.encompassingEncounter as srcEnc ->  tgt.encounter = create('Reference') as reference,  reference.reference = ('urn:uuid:' + %encounter.id) then ClinicalDocumentEncounter(srcEnc, bundle, encounter) "srcEncounter";
  } "encompassingEncounter";
  src.effectiveTime as effectiveTime -> tgt.date = create('dateTime') as date then TSDateTime(effectiveTime, date) "compositionDate";
  src.author as srcAuthor ->  bundle.entry as e,  e.resource = create('Practitioner') as practitioner,  practitioner.id = uuid() as uuid2,  e.fullUrl = append('urn:uuid:', uuid2),  bundle.entry as eRole,  eRole.resource = create('PractitionerRole') as practitionerRole,  practitionerRole.id = uuid() as uuidRole,  eRole.fullUrl = append('urn:uuid:', uuidRole),  tgt.author = create('Reference') as reference,  reference.reference = ('urn:uuid:' + %practitionerRole.id) then {
    srcAuthor -> practitioner.meta = create('Meta') as meta then {
      srcAuthor -> meta.profile = 'https://interop.esante.gouv.fr/ig/fhir/annuaire/StructureDefinition/as-practitioner' "practitionerProfile";
    } "practitionerMeta";
    srcAuthor -> practitionerRole.meta = create('Meta') as metaRole then {
      srcAuthor -> metaRole.profile = 'https://interop.esante.gouv.fr/ig/fhir/annuaire/StructureDefinition/as-practitionerrole' "practitionerRoleProfile";
    } "practitionerRoleMeta";
    srcAuthor ->  practitionerRole.practitioner = create('Reference') as refPract,  refPract.reference = ('urn:uuid:' + %practitioner.id) "practitionerRef";
    srcAuthor.assignedAuthor as assignedAuthor then {
      assignedAuthor.id as id -> practitioner.identifier = create('Identifier') as identifier then II(id, identifier);
      assignedAuthor.addr as addr -> practitioner.address = create('Address') as address then ADAddress(addr, address);
      assignedAuthor.telecom as tlc -> practitioner.telecom = create('ContactPoint') as contactPoint then TELContactPoint(tlc, contactPoint);
      assignedAuthor.assignedPerson as assPerson then {
        assPerson.name as pName -> practitioner.name = create('HumanName') as humanName then ENHumanName(pName, humanName);
      } "name";
      assignedAuthor.code as roleCode -> practitionerRole.code = create('CodeableConcept') as cc then CDCodeableConcept(roleCode, cc) "roleCode";
      assignedAuthor.code as roleCode where code.contains('/') -> practitioner.qualification as qualification then {
        roleCode -> qualification.code = create('CodeableConcept') as qualCode then {
          roleCode.code as fullCode -> qualCode.coding = create('Coding') as coding then {
            fullCode -> coding.code = (%fullCode.substring(%fullCode.indexOf('/') + 1)) "savoirFaireCode";
            fullCode -> coding.system = 'https://mos.esante.gouv.fr/NOS/TRE_R38-SpecialiteOrdinale/FHIR/TRE-R38-SpecialiteOrdinale' "systemSavoirFaire";
            roleCode.displayName as display -> coding.display = display "display";
          } "coding";
        } "qualCode";
      } "savoirFaire";
      assignedAuthor.code as roleCode where code.contains('/') and code.contains('_') -> practitioner.qualification as qualification then {
        roleCode -> qualification.code = create('CodeableConcept') as qualCode then {
          roleCode.code as fullCode -> qualCode.coding = create('Coding') as coding then {
            fullCode -> coding.code = (%fullCode.substring(%fullCode.indexOf('_') + 1).substring(0, %fullCode.substring(%fullCode.indexOf('_') + 1).indexOf('/'))) "professionCode";
            fullCode -> coding.system = 'https://mos.esante.gouv.fr/NOS/TRE_G15-ProfessionSante/FHIR/TRE-G15-ProfessionSante' "systemProfession";
            fullCode where %fullCode.substring(%fullCode.indexOf('_') + 1).substring(0, %fullCode.substring(%fullCode.indexOf('_') + 1).indexOf('/')) = '10' -> coding.display = 'Médecin' "displayMedecin";
          } "coding";
        } "qualCode";
      } "profession";
      assignedAuthor.representedOrganization as srcOrg ->  bundle.entry as e2,  e2.resource = create('Organization') as organization,  organization.id = uuid() as uuid3,  e2.fullUrl = append('urn:uuid:', uuid3),  practitionerRole.organization = create('Reference') as refOrg,  refOrg.reference = ('urn:uuid:' + %organization.id) then ClinicalDocumentOrganization(srcOrg, organization);
    } "author";
  } "srcAuthor";
  src.informant as srcInformant ->  bundle.entry as e,  e.resource = create('RelatedPerson') as relatedPerson,  relatedPerson.id = uuid() as uuidRelated,  e.fullUrl = append('urn:uuid:', uuidRelated) then {
    srcInformant.relatedEntity as relatedEntity then {
      relatedEntity ->  relatedPerson.patient = create('Reference') as patientRef,  patientRef.reference = ('urn:uuid:' + %patientResource.id) "patientRef";
      relatedEntity.code as relationCode -> relatedPerson.relationship = create('CodeableConcept') as cc then CDCodeableConcept(relationCode, cc) "relationship";
      relatedEntity.addr as addr -> relatedPerson.address = create('Address') as address then ADAddress(addr, address) "address";
      relatedEntity.telecom as tlc -> relatedPerson.telecom = create('ContactPoint') as contactPoint then TELContactPoint(tlc, contactPoint);
      relatedEntity.relatedPerson as relPerson then {
        relPerson.name as pName -> relatedPerson.name = create('HumanName') as humanName then ENHumanName(pName, humanName);
      } "relatedPersonName";
    };
  };
  src.confidentialityCode as confCode -> tgt.confidentiality = create('code') as code then CSCode(confCode, code);
  src.legalAuthenticator as legalAuth ->  bundle.entry as e,  e.resource = create('Practitioner') as practitioner,  practitioner.id = uuid() as uuid2,  e.fullUrl = append('urn:uuid:', uuid2) then {
    legalAuth -> tgt.attester as attester then {
      legalAuth -> attester.mode = 'legal' "mode";
      legalAuth.time as time -> attester.time = create('dateTime') as dt then TSDateTime(time, dt);
      legalAuth.assignedEntity as entity ->  attester.party = create('Reference') as reference,  reference.reference = ('urn:uuid:' + %practitioner.id) then ClinicalDocumentEntityPractitioner(entity, practitioner) "entity";
    } "attester";
  } "legalAuth";
  src.authenticator as auth ->  bundle.entry as e,  e.resource = create('Practitioner') as practitioner,  practitioner.id = uuid() as uuid2,  e.fullUrl = append('urn:uuid:', uuid2) then {
    auth -> tgt.attester as attester then {
      auth -> attester.mode = 'official' "mode";
      auth.time as time -> attester.time = create('dateTime') as dt then TSDateTime(time, dt);
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
      serviceEvent.code as eventCode -> event.code = create('CodeableConcept') as cc then CDCodeableConcept(eventCode, cc) "eventCode";
      serviceEvent.effectiveTime as effectivetime -> event.period = create('Period') as period then IVLTSPeriod(effectivetime, period) "eventTime"; // performerType: for src.performer.typeCode ...
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
  src -> tgt.meta = create('Meta') as meta then {
    src -> meta.profile = 'https://interop.esante.gouv.fr/ig/fhir/annuaire/StructureDefinition/as-practitioner' "profile";
  } "meta";
  src.id as srcId -> tgt.identifier = create('Identifier') as identifier then II(srcId, identifier);
  src.addr as srcAddr -> tgt.address = create('Address') as address then ADAddress(srcAddr, address);
  src.telecom as srcTelecom -> tgt.telecom = create('ContactPoint') as contactPoint then TELContactPoint(srcTelecom, contactPoint);
  src.assignedPerson as person then {
    person.name as pName -> tgt.name = create('HumanName') as humanName then ENHumanName(pName, humanName);
  } "name";
}

group ClinicalDocumentOrganization(source src : CustodianOrganization, target tgt : Organization) {
  src -> tgt.meta = create('Meta') as meta then {
    src -> meta.profile = 'https://interop.esante.gouv.fr/ig/fhir/annuaire/StructureDefinition/as-organization' "profile";
  } "meta";
  src.id as srcId -> tgt.identifier = create('Identifier') as identifier then II(srcId, identifier);
  src.name as v -> tgt.name = (v.other);
  src.telecom as srcTelecom -> tgt.telecom = create('ContactPoint') as contactPoint then TELContactPoint(srcTelecom, contactPoint);
  src.addr as srcAddr -> tgt.address = create('Address') as address then ADAddress(srcAddr, address);
}

group ClinicalDocumentPatientRole(source src : PatientRole, target tgt : Patient, target bundle : Bundle) {
  // src.id -> tgt.identifier;
  // Patient.identifier.type for EPR context, because there is only the identifier "LocalPid" allowed, LocalPid requires an type -> http://build.fhir.org/ig/hl7ch/ch-core/branches/master/StructureDefinition-ch-core-composition-patient-epr.html
  // Modification NR
  src.id as id -> tgt.identifier = create('Identifier') as identifier then setFrPatientIdentifier(id, identifier);
  src.addr as srcAddr -> tgt.address = create('Address') as address then ADAddress(srcAddr, address);
  src.telecom as srcTelecom -> tgt.telecom = create('ContactPoint') as contactPoint then TELContactPoint(srcTelecom, contactPoint);
  src.patient as patient then {
    patient.name as patientName -> tgt.name = create('HumanName') as humanName then ENHumanName(patientName, humanName);
    patient.administrativeGenderCode as gender then {
      gender.code as v -> tgt.gender = translate(v, 'https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/cm-v3-administrative-gender', 'code') "gender";
    } "gender";
    patient.birthTime as birthTime -> tgt.birthDate = create('date') as date then TSDate(birthTime, date) "birthDate";
    patient.deceasedInd as indicator where patient.deceasedTime.empty() -> tgt.deceased = create('boolean') as bool then boolean(indicator, bool) "deceasedBL";
    patient.deceasedTime as dTime -> tgt.deceased = dTime;
    patient.maritalStatusCode as mStatus -> tgt.maritalStatus = mStatus "maritalStatus";
    patient.languageCommunication as language -> tgt.communication as communication then {
      language.languageCode as lCode -> communication.language = lCode "communication"; // preference: for language.preferenceInd make communication.preferred
    } "language";
  } "patientrole";
  src.providerOrganization as org ->  bundle.entry as e,  e.resource = create('Organization') as organization,  organization.id = uuid() as uuid3,  e.fullUrl = append('urn:uuid:', uuid3) then {
    org ->  tgt.managingOrganization = create('Reference') as reference,  reference.reference = ('urn:uuid:' + %organization.id) "reference";
    org.id as orgId -> organization.identifier = create('Identifier') as identifier then II(orgId, identifier);
    org.name as v -> organization.name = (v.other);
    org.telecom as orgTel -> organization.telecom = create('ContactPoint') as contactPoint then TELContactPoint(orgTel, contactPoint);
    org.addr as orgAddr -> organization.address = create('Address') as address then ADAddress(orgAddr, address);
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
  src.id as Id -> tgt.identifier = create('Identifier') as identifier then II(Id, identifier);
  src -> tgt.status = 'finished' "status";
  src.code as srcCode -> tgt.class = create('Coding') as coding then {
    srcCode.code as code -> coding.code = cast(code, 'string');
    srcCode.codeSystem as system -> coding.system = translate(system, 'http://hl7.org/fhir/ConceptMap/special-oid2uri', 'uri');
    srcCode.displayName as display -> coding.display = cast(display, 'string');
  } "class";
  src.code as srcCode -> tgt.type = create('CodeableConcept') as cc then CDCodeableConcept(srcCode, cc);
  src.effectiveTime as effTime -> tgt.period = create('Period') as period then IVLTSPeriod(effTime, period);
  src where admissionReferralSourceCode.exists() or dischargeDispositionCode.exists() -> tgt.hospitalization as hosp then {
    src.admissionReferralSourceCode as admRef -> hosp.admitSource = create('CodeableConcept') as cc then CDCodeableConcept(admRef, cc) "adminReferral";
    src.dischargeDispositionCode as discDispo -> hosp.dischargeDisposition = create('CodeableConcept') as cc then CDCodeableConcept(discDispo, cc) "discDisposition";
  } "hospitalization";
  src.encounterParticipant as srcPart -> tgt.participant as tgtPart then {
    srcPart.typeCode as code -> tgtPart.type = cc('http://terminology.hl7.org/CodeSystem/v3-ParticipationType', code);
    srcPart.time as srcTime -> tgtPart.period = create('Period') as period then IVLTSPeriod(srcTime, period);
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
  src.id as srcIdentifier -> tgt.identifier = create('Identifier') as identifier then II(srcIdentifier, identifier);
  src.code as srcCode -> tgt.type = create('CodeableConcept') as cc then CDCodeableConcept(srcCode, cc);
  src.location as location then {
    // place names are usually stored with no parts    location.name as srcName -> tgt.name = cast(srcName, 'string');
    location.addr as locAddr -> tgt.address = create('Address') as address then ADAddress(locAddr, address);
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
  "date" : "2025-10-31T16:13:56+00:00",
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
              "variable" : "cdaId"
            }
          ],
          "target" : [
            {
              "context" : "bundle",
              "contextType" : "variable",
              "element" : "identifier",
              "variable" : "identifier"
            }
          ],
          "rule" : [
            {
              "name" : "system",
              "source" : [
                {
                  "context" : "cdaId",
                  "element" : "root",
                  "variable" : "root",
                  "condition" : "cdaId.extension.exists()"
                }
              ],
              "target" : [
                {
                  "context" : "identifier",
                  "contextType" : "variable",
                  "element" : "system",
                  "transform" : "translate",
                  "parameter" : [
                    {
                      "valueId" : "root"
                    },
                    {
                      "valueString" : "#oid2uri"
                    },
                    {
                      "valueString" : "uri"
                    }
                  ]
                }
              ]
            },
            {
              "name" : "value",
              "source" : [
                {
                  "context" : "cdaId",
                  "element" : "extension",
                  "variable" : "extension"
                }
              ],
              "target" : [
                {
                  "context" : "identifier",
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
              "name" : "systemOid",
              "source" : [
                {
                  "context" : "cdaId",
                  "element" : "root",
                  "variable" : "root",
                  "condition" : "cdaId.extension.empty()"
                }
              ],
              "target" : [
                {
                  "context" : "identifier",
                  "contextType" : "variable",
                  "element" : "system",
                  "transform" : "copy",
                  "parameter" : [
                    {
                      "valueString" : "urn:ietf:rfc:3986"
                    }
                  ]
                }
              ]
            },
            {
              "name" : "valueOid",
              "source" : [
                {
                  "context" : "cdaId",
                  "element" : "root",
                  "variable" : "root",
                  "condition" : "cdaId.extension.empty()"
                }
              ],
              "target" : [
                {
                  "context" : "identifier",
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
          "name" : "timestamp",
          "source" : [
            {
              "context" : "cda",
              "element" : "effectiveTime",
              "variable" : "effectiveTime"
            }
          ],
          "target" : [
            {
              "context" : "bundle",
              "contextType" : "variable",
              "element" : "timestamp",
              "variable" : "timestamp",
              "transform" : "create",
              "parameter" : [
                {
                  "valueString" : "instant"
                }
              ]
            }
          ],
          "dependent" : [
            {
              "name" : "TSInstant",
              "variable" : ["effectiveTime", "timestamp"]
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
              "variable" : "code",
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
              "variable" : ["languageCode", "code"]
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
              "name" : "II",
              "variable" : ["id", "identifier"]
            }
          ]
        },
        {
          "name" : "setIdentifier",
          "source" : [
            {
              "context" : "src",
              "element" : "setId",
              "variable" : "setId"
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
              "name" : "II",
              "variable" : ["setId", "identifier"]
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
              "variable" : "cc",
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
              "variable" : ["srcCode", "cc"]
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
          "name" : "compositionDate",
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
              "variable" : "date",
              "transform" : "create",
              "parameter" : [
                {
                  "valueString" : "dateTime"
                }
              ]
            }
          ],
          "dependent" : [
            {
              "name" : "TSDateTime",
              "variable" : ["effectiveTime", "date"]
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
              "context" : "bundle",
              "contextType" : "variable",
              "element" : "entry",
              "variable" : "eRole"
            },
            {
              "context" : "eRole",
              "contextType" : "variable",
              "element" : "resource",
              "variable" : "practitionerRole",
              "transform" : "create",
              "parameter" : [
                {
                  "valueString" : "PractitionerRole"
                }
              ]
            },
            {
              "context" : "practitionerRole",
              "contextType" : "variable",
              "element" : "id",
              "variable" : "uuidRole",
              "transform" : "uuid"
            },
            {
              "context" : "eRole",
              "contextType" : "variable",
              "element" : "fullUrl",
              "transform" : "append",
              "parameter" : [
                {
                  "valueString" : "urn:uuid:"
                },
                {
                  "valueId" : "uuidRole"
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
                  "valueString" : "'urn:uuid:' + %practitionerRole.id"
                }
              ]
            }
          ],
          "rule" : [
            {
              "name" : "practitionerMeta",
              "source" : [
                {
                  "context" : "srcAuthor"
                }
              ],
              "target" : [
                {
                  "context" : "practitioner",
                  "contextType" : "variable",
                  "element" : "meta",
                  "variable" : "meta",
                  "transform" : "create",
                  "parameter" : [
                    {
                      "valueString" : "Meta"
                    }
                  ]
                }
              ],
              "rule" : [
                {
                  "name" : "practitionerProfile",
                  "source" : [
                    {
                      "context" : "srcAuthor"
                    }
                  ],
                  "target" : [
                    {
                      "context" : "meta",
                      "contextType" : "variable",
                      "element" : "profile",
                      "transform" : "copy",
                      "parameter" : [
                        {
                          "valueString" : "https://interop.esante.gouv.fr/ig/fhir/annuaire/StructureDefinition/as-practitioner"
                        }
                      ]
                    }
                  ]
                }
              ]
            },
            {
              "name" : "practitionerRoleMeta",
              "source" : [
                {
                  "context" : "srcAuthor"
                }
              ],
              "target" : [
                {
                  "context" : "practitionerRole",
                  "contextType" : "variable",
                  "element" : "meta",
                  "variable" : "metaRole",
                  "transform" : "create",
                  "parameter" : [
                    {
                      "valueString" : "Meta"
                    }
                  ]
                }
              ],
              "rule" : [
                {
                  "name" : "practitionerRoleProfile",
                  "source" : [
                    {
                      "context" : "srcAuthor"
                    }
                  ],
                  "target" : [
                    {
                      "context" : "metaRole",
                      "contextType" : "variable",
                      "element" : "profile",
                      "transform" : "copy",
                      "parameter" : [
                        {
                          "valueString" : "https://interop.esante.gouv.fr/ig/fhir/annuaire/StructureDefinition/as-practitionerrole"
                        }
                      ]
                    }
                  ]
                }
              ]
            },
            {
              "name" : "practitionerRef",
              "source" : [
                {
                  "context" : "srcAuthor"
                }
              ],
              "target" : [
                {
                  "context" : "practitionerRole",
                  "contextType" : "variable",
                  "element" : "practitioner",
                  "variable" : "refPract",
                  "transform" : "create",
                  "parameter" : [
                    {
                      "valueString" : "Reference"
                    }
                  ]
                },
                {
                  "context" : "refPract",
                  "contextType" : "variable",
                  "element" : "reference",
                  "transform" : "evaluate",
                  "parameter" : [
                    {
                      "valueString" : "'urn:uuid:' + %practitioner.id"
                    }
                  ]
                }
              ]
            },
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
                      "name" : "II",
                      "variable" : ["id", "identifier"]
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
                      "variable" : "address",
                      "transform" : "create",
                      "parameter" : [
                        {
                          "valueString" : "Address"
                        }
                      ]
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
                      "variable" : "contactPoint",
                      "transform" : "create",
                      "parameter" : [
                        {
                          "valueString" : "ContactPoint"
                        }
                      ]
                    }
                  ],
                  "dependent" : [
                    {
                      "name" : "TELContactPoint",
                      "variable" : ["tlc", "contactPoint"]
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
                          "variable" : "humanName",
                          "transform" : "create",
                          "parameter" : [
                            {
                              "valueString" : "HumanName"
                            }
                          ]
                        }
                      ],
                      "dependent" : [
                        {
                          "name" : "ENHumanName",
                          "variable" : ["pName", "humanName"]
                        }
                      ]
                    }
                  ]
                },
                {
                  "name" : "roleCode",
                  "source" : [
                    {
                      "context" : "assignedAuthor",
                      "element" : "code",
                      "variable" : "roleCode"
                    }
                  ],
                  "target" : [
                    {
                      "context" : "practitionerRole",
                      "contextType" : "variable",
                      "element" : "code",
                      "variable" : "cc",
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
                      "variable" : ["roleCode", "cc"]
                    }
                  ]
                },
                {
                  "name" : "savoirFaire",
                  "source" : [
                    {
                      "context" : "assignedAuthor",
                      "element" : "code",
                      "variable" : "roleCode",
                      "condition" : "code.contains('/')"
                    }
                  ],
                  "target" : [
                    {
                      "context" : "practitioner",
                      "contextType" : "variable",
                      "element" : "qualification",
                      "variable" : "qualification"
                    }
                  ],
                  "rule" : [
                    {
                      "name" : "qualCode",
                      "source" : [
                        {
                          "context" : "roleCode"
                        }
                      ],
                      "target" : [
                        {
                          "context" : "qualification",
                          "contextType" : "variable",
                          "element" : "code",
                          "variable" : "qualCode",
                          "transform" : "create",
                          "parameter" : [
                            {
                              "valueString" : "CodeableConcept"
                            }
                          ]
                        }
                      ],
                      "rule" : [
                        {
                          "name" : "coding",
                          "source" : [
                            {
                              "context" : "roleCode",
                              "element" : "code",
                              "variable" : "fullCode"
                            }
                          ],
                          "target" : [
                            {
                              "context" : "qualCode",
                              "contextType" : "variable",
                              "element" : "coding",
                              "variable" : "coding",
                              "transform" : "create",
                              "parameter" : [
                                {
                                  "valueString" : "Coding"
                                }
                              ]
                            }
                          ],
                          "rule" : [
                            {
                              "name" : "savoirFaireCode",
                              "source" : [
                                {
                                  "context" : "fullCode"
                                }
                              ],
                              "target" : [
                                {
                                  "context" : "coding",
                                  "contextType" : "variable",
                                  "element" : "code",
                                  "transform" : "evaluate",
                                  "parameter" : [
                                    {
                                      "valueString" : "%fullCode.substring(%fullCode.indexOf('/') + 1)"
                                    }
                                  ]
                                }
                              ]
                            },
                            {
                              "name" : "systemSavoirFaire",
                              "source" : [
                                {
                                  "context" : "fullCode"
                                }
                              ],
                              "target" : [
                                {
                                  "context" : "coding",
                                  "contextType" : "variable",
                                  "element" : "system",
                                  "transform" : "copy",
                                  "parameter" : [
                                    {
                                      "valueString" : "https://mos.esante.gouv.fr/NOS/TRE_R38-SpecialiteOrdinale/FHIR/TRE-R38-SpecialiteOrdinale"
                                    }
                                  ]
                                }
                              ]
                            },
                            {
                              "name" : "display",
                              "source" : [
                                {
                                  "context" : "roleCode",
                                  "element" : "displayName",
                                  "variable" : "display"
                                }
                              ],
                              "target" : [
                                {
                                  "context" : "coding",
                                  "contextType" : "variable",
                                  "element" : "display",
                                  "transform" : "copy",
                                  "parameter" : [
                                    {
                                      "valueId" : "display"
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
                  "name" : "profession",
                  "source" : [
                    {
                      "context" : "assignedAuthor",
                      "element" : "code",
                      "variable" : "roleCode",
                      "condition" : "code.contains('/') and code.contains('_')"
                    }
                  ],
                  "target" : [
                    {
                      "context" : "practitioner",
                      "contextType" : "variable",
                      "element" : "qualification",
                      "variable" : "qualification"
                    }
                  ],
                  "rule" : [
                    {
                      "name" : "qualCode",
                      "source" : [
                        {
                          "context" : "roleCode"
                        }
                      ],
                      "target" : [
                        {
                          "context" : "qualification",
                          "contextType" : "variable",
                          "element" : "code",
                          "variable" : "qualCode",
                          "transform" : "create",
                          "parameter" : [
                            {
                              "valueString" : "CodeableConcept"
                            }
                          ]
                        }
                      ],
                      "rule" : [
                        {
                          "name" : "coding",
                          "source" : [
                            {
                              "context" : "roleCode",
                              "element" : "code",
                              "variable" : "fullCode"
                            }
                          ],
                          "target" : [
                            {
                              "context" : "qualCode",
                              "contextType" : "variable",
                              "element" : "coding",
                              "variable" : "coding",
                              "transform" : "create",
                              "parameter" : [
                                {
                                  "valueString" : "Coding"
                                }
                              ]
                            }
                          ],
                          "rule" : [
                            {
                              "name" : "professionCode",
                              "source" : [
                                {
                                  "context" : "fullCode"
                                }
                              ],
                              "target" : [
                                {
                                  "context" : "coding",
                                  "contextType" : "variable",
                                  "element" : "code",
                                  "transform" : "evaluate",
                                  "parameter" : [
                                    {
                                      "valueString" : "%fullCode.substring(%fullCode.indexOf('_') + 1).substring(0, %fullCode.substring(%fullCode.indexOf('_') + 1).indexOf('/'))"
                                    }
                                  ]
                                }
                              ]
                            },
                            {
                              "name" : "systemProfession",
                              "source" : [
                                {
                                  "context" : "fullCode"
                                }
                              ],
                              "target" : [
                                {
                                  "context" : "coding",
                                  "contextType" : "variable",
                                  "element" : "system",
                                  "transform" : "copy",
                                  "parameter" : [
                                    {
                                      "valueString" : "https://mos.esante.gouv.fr/NOS/TRE_G15-ProfessionSante/FHIR/TRE-G15-ProfessionSante"
                                    }
                                  ]
                                }
                              ]
                            },
                            {
                              "name" : "displayMedecin",
                              "source" : [
                                {
                                  "context" : "fullCode",
                                  "condition" : "%fullCode.substring(%fullCode.indexOf('_') + 1).substring(0, %fullCode.substring(%fullCode.indexOf('_') + 1).indexOf('/')) = '10'"
                                }
                              ],
                              "target" : [
                                {
                                  "context" : "coding",
                                  "contextType" : "variable",
                                  "element" : "display",
                                  "transform" : "copy",
                                  "parameter" : [
                                    {
                                      "valueString" : "Médecin"
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
                      "context" : "practitionerRole",
                      "contextType" : "variable",
                      "element" : "organization",
                      "variable" : "refOrg",
                      "transform" : "create",
                      "parameter" : [
                        {
                          "valueString" : "Reference"
                        }
                      ]
                    },
                    {
                      "context" : "refOrg",
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
          "name" : "informant",
          "source" : [
            {
              "context" : "src",
              "element" : "informant",
              "variable" : "srcInformant"
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
              "variable" : "relatedPerson",
              "transform" : "create",
              "parameter" : [
                {
                  "valueString" : "RelatedPerson"
                }
              ]
            },
            {
              "context" : "relatedPerson",
              "contextType" : "variable",
              "element" : "id",
              "variable" : "uuidRelated",
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
                  "valueId" : "uuidRelated"
                }
              ]
            }
          ],
          "rule" : [
            {
              "name" : "relatedEntity",
              "source" : [
                {
                  "context" : "srcInformant",
                  "element" : "relatedEntity",
                  "variable" : "relatedEntity"
                }
              ],
              "rule" : [
                {
                  "name" : "patientRef",
                  "source" : [
                    {
                      "context" : "relatedEntity"
                    }
                  ],
                  "target" : [
                    {
                      "context" : "relatedPerson",
                      "contextType" : "variable",
                      "element" : "patient",
                      "variable" : "patientRef",
                      "transform" : "create",
                      "parameter" : [
                        {
                          "valueString" : "Reference"
                        }
                      ]
                    },
                    {
                      "context" : "patientRef",
                      "contextType" : "variable",
                      "element" : "reference",
                      "transform" : "evaluate",
                      "parameter" : [
                        {
                          "valueString" : "'urn:uuid:' + %patientResource.id"
                        }
                      ]
                    }
                  ]
                },
                {
                  "name" : "relationship",
                  "source" : [
                    {
                      "context" : "relatedEntity",
                      "element" : "code",
                      "variable" : "relationCode"
                    }
                  ],
                  "target" : [
                    {
                      "context" : "relatedPerson",
                      "contextType" : "variable",
                      "element" : "relationship",
                      "variable" : "cc",
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
                      "variable" : ["relationCode", "cc"]
                    }
                  ]
                },
                {
                  "name" : "address",
                  "source" : [
                    {
                      "context" : "relatedEntity",
                      "element" : "addr",
                      "variable" : "addr"
                    }
                  ],
                  "target" : [
                    {
                      "context" : "relatedPerson",
                      "contextType" : "variable",
                      "element" : "address",
                      "variable" : "address",
                      "transform" : "create",
                      "parameter" : [
                        {
                          "valueString" : "Address"
                        }
                      ]
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
                  "name" : "telecom",
                  "source" : [
                    {
                      "context" : "relatedEntity",
                      "element" : "telecom",
                      "variable" : "tlc"
                    }
                  ],
                  "target" : [
                    {
                      "context" : "relatedPerson",
                      "contextType" : "variable",
                      "element" : "telecom",
                      "variable" : "contactPoint",
                      "transform" : "create",
                      "parameter" : [
                        {
                          "valueString" : "ContactPoint"
                        }
                      ]
                    }
                  ],
                  "dependent" : [
                    {
                      "name" : "TELContactPoint",
                      "variable" : ["tlc", "contactPoint"]
                    }
                  ]
                },
                {
                  "name" : "relatedPersonName",
                  "source" : [
                    {
                      "context" : "relatedEntity",
                      "element" : "relatedPerson",
                      "variable" : "relPerson"
                    }
                  ],
                  "rule" : [
                    {
                      "name" : "name",
                      "source" : [
                        {
                          "context" : "relPerson",
                          "element" : "name",
                          "variable" : "pName"
                        }
                      ],
                      "target" : [
                        {
                          "context" : "relatedPerson",
                          "contextType" : "variable",
                          "element" : "name",
                          "variable" : "humanName",
                          "transform" : "create",
                          "parameter" : [
                            {
                              "valueString" : "HumanName"
                            }
                          ]
                        }
                      ],
                      "dependent" : [
                        {
                          "name" : "ENHumanName",
                          "variable" : ["pName", "humanName"]
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
              "variable" : "code",
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
              "variable" : ["confCode", "code"]
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
                      "variable" : "dt",
                      "transform" : "create",
                      "parameter" : [
                        {
                          "valueString" : "dateTime"
                        }
                      ]
                    }
                  ],
                  "dependent" : [
                    {
                      "name" : "TSDateTime",
                      "variable" : ["time", "dt"]
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
                      "variable" : "dt",
                      "transform" : "create",
                      "parameter" : [
                        {
                          "valueString" : "dateTime"
                        }
                      ]
                    }
                  ],
                  "dependent" : [
                    {
                      "name" : "TSDateTime",
                      "variable" : ["time", "dt"]
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
                      "variable" : "cc",
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
                      "variable" : ["eventCode", "cc"]
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
                      "variable" : "period",
                      "transform" : "create",
                      "parameter" : [
                        {
                          "valueString" : "Period"
                        }
                      ]
                    }
                  ],
                  "dependent" : [
                    {
                      "name" : "IVLTSPeriod",
                      "variable" : ["effectivetime", "period"]
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
          "name" : "meta",
          "source" : [
            {
              "context" : "src"
            }
          ],
          "target" : [
            {
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "meta",
              "variable" : "meta",
              "transform" : "create",
              "parameter" : [
                {
                  "valueString" : "Meta"
                }
              ]
            }
          ],
          "rule" : [
            {
              "name" : "profile",
              "source" : [
                {
                  "context" : "src"
                }
              ],
              "target" : [
                {
                  "context" : "meta",
                  "contextType" : "variable",
                  "element" : "profile",
                  "transform" : "copy",
                  "parameter" : [
                    {
                      "valueString" : "https://interop.esante.gouv.fr/ig/fhir/annuaire/StructureDefinition/as-practitioner"
                    }
                  ]
                }
              ]
            }
          ]
        },
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
              "name" : "II",
              "variable" : ["srcId", "identifier"]
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
              "variable" : "address",
              "transform" : "create",
              "parameter" : [
                {
                  "valueString" : "Address"
                }
              ]
            }
          ],
          "dependent" : [
            {
              "name" : "ADAddress",
              "variable" : ["srcAddr", "address"]
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
              "variable" : "contactPoint",
              "transform" : "create",
              "parameter" : [
                {
                  "valueString" : "ContactPoint"
                }
              ]
            }
          ],
          "dependent" : [
            {
              "name" : "TELContactPoint",
              "variable" : ["srcTelecom", "contactPoint"]
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
                  "variable" : "humanName",
                  "transform" : "create",
                  "parameter" : [
                    {
                      "valueString" : "HumanName"
                    }
                  ]
                }
              ],
              "dependent" : [
                {
                  "name" : "ENHumanName",
                  "variable" : ["pName", "humanName"]
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
          "name" : "meta",
          "source" : [
            {
              "context" : "src"
            }
          ],
          "target" : [
            {
              "context" : "tgt",
              "contextType" : "variable",
              "element" : "meta",
              "variable" : "meta",
              "transform" : "create",
              "parameter" : [
                {
                  "valueString" : "Meta"
                }
              ]
            }
          ],
          "rule" : [
            {
              "name" : "profile",
              "source" : [
                {
                  "context" : "src"
                }
              ],
              "target" : [
                {
                  "context" : "meta",
                  "contextType" : "variable",
                  "element" : "profile",
                  "transform" : "copy",
                  "parameter" : [
                    {
                      "valueString" : "https://interop.esante.gouv.fr/ig/fhir/annuaire/StructureDefinition/as-organization"
                    }
                  ]
                }
              ]
            }
          ]
        },
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
              "name" : "II",
              "variable" : ["srcId", "identifier"]
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
              "variable" : "contactPoint",
              "transform" : "create",
              "parameter" : [
                {
                  "valueString" : "ContactPoint"
                }
              ]
            }
          ],
          "dependent" : [
            {
              "name" : "TELContactPoint",
              "variable" : ["srcTelecom", "contactPoint"]
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
              "variable" : "address",
              "transform" : "create",
              "parameter" : [
                {
                  "valueString" : "Address"
                }
              ]
            }
          ],
          "dependent" : [
            {
              "name" : "ADAddress",
              "variable" : ["srcAddr", "address"]
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
              "variable" : "address",
              "transform" : "create",
              "parameter" : [
                {
                  "valueString" : "Address"
                }
              ]
            }
          ],
          "dependent" : [
            {
              "name" : "ADAddress",
              "variable" : ["srcAddr", "address"]
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
              "variable" : "contactPoint",
              "transform" : "create",
              "parameter" : [
                {
                  "valueString" : "ContactPoint"
                }
              ]
            }
          ],
          "dependent" : [
            {
              "name" : "TELContactPoint",
              "variable" : ["srcTelecom", "contactPoint"]
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
                  "variable" : "humanName",
                  "transform" : "create",
                  "parameter" : [
                    {
                      "valueString" : "HumanName"
                    }
                  ]
                }
              ],
              "dependent" : [
                {
                  "name" : "ENHumanName",
                  "variable" : ["patientName", "humanName"]
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
                  "variable" : "date",
                  "transform" : "create",
                  "parameter" : [
                    {
                      "valueString" : "date"
                    }
                  ]
                }
              ],
              "dependent" : [
                {
                  "name" : "TSDate",
                  "variable" : ["birthTime", "date"]
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
                  "name" : "II",
                  "variable" : ["orgId", "identifier"]
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
                  "variable" : "contactPoint",
                  "transform" : "create",
                  "parameter" : [
                    {
                      "valueString" : "ContactPoint"
                    }
                  ]
                }
              ],
              "dependent" : [
                {
                  "name" : "TELContactPoint",
                  "variable" : ["orgTel", "contactPoint"]
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
                  "variable" : "address",
                  "transform" : "create",
                  "parameter" : [
                    {
                      "valueString" : "Address"
                    }
                  ]
                }
              ],
              "dependent" : [
                {
                  "name" : "ADAddress",
                  "variable" : ["orgAddr", "address"]
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
              "name" : "II",
              "variable" : ["Id", "identifier"]
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
                  "valueString" : "finished"
                }
              ]
            }
          ]
        },
        {
          "name" : "class",
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
              "element" : "class",
              "variable" : "coding",
              "transform" : "create",
              "parameter" : [
                {
                  "valueString" : "Coding"
                }
              ]
            }
          ],
          "rule" : [
            {
              "name" : "code",
              "source" : [
                {
                  "context" : "srcCode",
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
              "name" : "codeSystem",
              "source" : [
                {
                  "context" : "srcCode",
                  "element" : "codeSystem",
                  "variable" : "system"
                }
              ],
              "target" : [
                {
                  "context" : "coding",
                  "contextType" : "variable",
                  "element" : "system",
                  "transform" : "translate",
                  "parameter" : [
                    {
                      "valueId" : "system"
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
              "name" : "displayName",
              "source" : [
                {
                  "context" : "srcCode",
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
              "variable" : "cc",
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
              "variable" : ["srcCode", "cc"]
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
              "variable" : "period",
              "transform" : "create",
              "parameter" : [
                {
                  "valueString" : "Period"
                }
              ]
            }
          ],
          "dependent" : [
            {
              "name" : "IVLTSPeriod",
              "variable" : ["effTime", "period"]
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
                  "variable" : "cc",
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
                  "variable" : ["admRef", "cc"]
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
                  "variable" : "cc",
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
                  "variable" : ["discDispo", "cc"]
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
                  "variable" : "period",
                  "transform" : "create",
                  "parameter" : [
                    {
                      "valueString" : "Period"
                    }
                  ]
                }
              ],
              "dependent" : [
                {
                  "name" : "IVLTSPeriod",
                  "variable" : ["srcTime", "period"]
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
              "name" : "II",
              "variable" : ["srcIdentifier", "identifier"]
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
              "variable" : "cc",
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
              "variable" : ["srcCode", "cc"]
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
                  "variable" : "address",
                  "transform" : "create",
                  "parameter" : [
                    {
                      "valueString" : "Address"
                    }
                  ]
                }
              ],
              "dependent" : [
                {
                  "name" : "ADAddress",
                  "variable" : ["locAddr", "address"]
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
