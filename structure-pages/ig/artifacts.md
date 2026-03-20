# Artifacts Summary - POC - Mapping CDA to FHIR v0.1.0

* [**Table of Contents**](toc.md)
* **Artifacts Summary**

## Artifacts Summary

This page provides a list of the FHIR artifacts defined as part of this implementation guide.

### Terminology: Structure Maps 

These define transformations to convert between data structures used by systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [Mapping CSE-MDE vers FHIR Bundle - Contexte Français](StructureMap-CdaFrMDEToBundle.md) | Mapping CSE-MDE vers FHIR Bundle - Contexte Français |
| [Mapping de CDA vers FHIR Bundle (A partir des sources de Oliver Egger)](StructureMap-CdaToBundle.md) | Mapping de CDA vers FHIR Bundle (A partir des sources de Oliver Egger) |
| [Mapping de CDA vers les FHIR Types (A partir des sources de Oliver Egger)](StructureMap-CdaToFHIRTypes.md) | Mapping de CDA vers les FHIR Types (A partir des sources de Oliver Egger) |
| [Mapping de CDAFr vers FHIR Bundle (A partir des sources de Oliver Egger)](StructureMap-CdaFrToBundle.md) | Mapping de CDAFr vers FHIR Bundle (A partir des sources de Oliver Egger) |

### Terminology: Concept Maps 

These define transformations to convert between codes by systems conforming with this implementation guide.

| | |
| :--- | :--- |
| [CDA to FHIR Administrative Gender Mapping](ConceptMap-cm-v3-administrative-gender.md) | Mapping between CDA v3 Administrative Gender codes and FHIR Administrative Gender codes |
| [ConceptMap - OID to URL for TRE_R38-SpecialiteOrdinale](ConceptMap-cm-oid-specialite-ordinale.md) | Mapping from OID urn:oid:1.2.250.1.213.1.1.4.5 to URL https://mos.esante.gouv.fr/NOS/TRE_R38-SpecialiteOrdinale/FHIR/TRE-R38-SpecialiteOrdinale |
| [ConceptMap — CDA AD → FHIR Address](ConceptMap-CdaToAddressConceptMap.md) | Correspondances documentaires des composants AD vers Address. |
| [ConceptMap — CDA AssignedAuthor → FHIR Practitioner](ConceptMap-CdaToPractitionerConceptMap.md) | Correspondances entre AssignedAuthor CDA et Practitioner FHIR |
| [ConceptMap — CDA BL → FHIR boolean / negation](ConceptMap-CdaToBooleanConceptMap.md) | Correspondances BL.value → boolean ; BL.negationInd → boolean (modifierExtension). |
| [ConceptMap — CDA CE/CS/CD → FHIR code/CodeableConcept](ConceptMap-CdaToCodeConceptMap.md) | Correspondances documentaires code/codeSystem/displayName/originalText/translations → code/CodeableConcept. |
| [ConceptMap — CDA ClinicalDocument → FHIR Bundle](ConceptMap-CdaToBundleConceptMap.md) | Correspondances CDA ClinicalDocument → FHIR Bundle |
| [ConceptMap — CDA ClinicalDocument → FHIR Composition](ConceptMap-CdaToCompositionConceptMap.md) | Correspondances entre ClinicalDocument CDA et Composition FHIR |
| [ConceptMap — CDA CustodianOrganization → FHIR Organization](ConceptMap-CdaToOrganisationConceptMap.md) | Correspondances entre CustodianOrganization CDA et Organization FHIR |
| [ConceptMap — CDA EN/PN → FHIR HumanName](ConceptMap-CdaToHumanNameConceptMap.md) | Correspondances documentaires des composants EN/PN vers HumanName (family/given/prefix/suffix/period). |
| [ConceptMap — CDA EncompassingEncounter → FHIR Encounter](ConceptMap-CdaToEncounterConceptMap.md) | Correspondances entre EncompassingEncounter CDA et Encounter FHIR |
| [ConceptMap — CDA HealthCareFacility → FHIR Location](ConceptMap-CdaToLocationConceptMap.md) | Correspondances entre HealthCareFacility CDA et Location FHIR |
| [ConceptMap — CDA II → FHIR Identifier](ConceptMap-CdaToIdentifierConceptMap.md) | Correspondances des éléments CDA II → FHIR Identifier (root, extension, assigner). |
| [ConceptMap — CDA INT → FHIR integer](ConceptMap-CdaToIntegerConceptMap.md) | Correspondances documentaires INT.value → integer. |
| [ConceptMap — CDA IVL_TS → FHIR Period/dateTime](ConceptMap-CdaToPeriodConceptMap.md) | Correspondances CDA IVL_TS (low/high) vers Period.start/end ou dateTime. |
| [ConceptMap — CDA PQ → FHIR Quantity](ConceptMap-CdaToQuantityConceptMap.md) | Correspondances PQ.value / PQ.unit → Quantity (value, unit, system, code). |
| [ConceptMap — CDA PatientRole → FHIR Patient](ConceptMap-CdaToPatientConceptMap.md) | Correspondances CDA PatientRole → FHIR Patient |
| [ConceptMap — CDA RTO_PQ_PQ → FHIR Ratio](ConceptMap-CdaToRatioConceptMap.md) | Correspondances documentaires numerator/denominator CDA → numerator/denominator FHIR. |
| [ConceptMap — CDA ST/ED/ON → FHIR string](ConceptMap-CdaToStringConceptMap.md) | Correspondances CDA ST/ED/ON → FHIR string. |
| [ConceptMap — CDA TEL → FHIR ContactPoint](ConceptMap-CdaToContactPointConceptMap.md) | Correspondances documentaires TEL.value (tel:/fax:/mailto:/http:/https:) + use + useablePeriod → ContactPoint. |
| [ConceptMap — CDA TS → FHIR instant/dateTime/date](ConceptMap-CdaToDateTimeConceptMap.md) | Correspondances CDA TS.value → instant, dateTime ou date selon contexte. |
| [OID to URI Mapping for ANS terminologies](ConceptMap-oid2uri-ans.md) | Mapping from OID to URI for ANS terminologies |

### Other 

These are resources that are used within this implementation guide that do not fit into one of the other categories.

| |
| :--- |
| [Binary/CSE-MDE2023.01](Binary-CSE-MDE2023.01.md) |
| [fe569e1f-32d4-4ba4-b5ad-88082bf5470a](Bundle-fe569e1f-32d4-4ba4-b5ad-88082bf5470a.md) |

