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
| [ConceptMap — CDA AD vers FHIR Address](ConceptMap-CdaADToAddressConceptMap.md) | Correspondances documentaires des composants AD vers Address. |
| [ConceptMap — CDA BL vers FHIR boolean](ConceptMap-CdaBLToBooleanConceptMap.md) | Correspondance documentaire entre le datatype CDA BL et le datatype FHIR boolean. |
| [ConceptMap — CDA CE/CS/CD vers FHIR code et CodeableConcept](ConceptMap-CdaCECSCDToCodeConceptMap.md) | Correspondances documentaires entre les datatypes CDA CE, CS et CD et les types FHIR code et CodeableConcept. |
| [ConceptMap — CDA EN/PN vers FHIR HumanName](ConceptMap-CdaENPNToHumanNameConceptMap.md) | Correspondances documentaires des composants CDA EN et PN vers FHIR HumanName. |
| [ConceptMap — CDA II vers FHIR Identifier](ConceptMap-CdaIIToIdentifierConceptMap.md) | Correspondances entre les éléments du datatype CDA II et les éléments FHIR Identifier |
| [ConceptMap — CDA INT vers FHIR integer](ConceptMap-CdaINTToIntegerConceptMap.md) | Correspondances documentaires entre le datatype CDA INT et le datatype FHIR integer. |
| [ConceptMap — CDA TEL vers FHIR ContactPoint](ConceptMap-CdaTELToContactPointConceptMap.md) | Correspondances documentaires entre le datatype CDA TEL et les éléments FHIR ContactPoint. |
| [ConceptMap — CDA TS vers FHIR instant, dateTime et date](ConceptMap-CdaTSToDateTimeConceptMap.md) | Correspondances documentaires entre le datatype CDA TS et les types FHIR instant, dateTime et date. |
| [OID to URI Mapping for ANS terminologies](ConceptMap-oid2uri-ans.md) | Mapping from OID to URI for ANS terminologies |

### Other 

These are resources that are used within this implementation guide that do not fit into one of the other categories.

| |
| :--- |
| [Binary/CSE-MDE2023.01](Binary-CSE-MDE2023.01.md) |
| [fe569e1f-32d4-4ba4-b5ad-88082bf5470a](Bundle-fe569e1f-32d4-4ba4-b5ad-88082bf5470a.md) |

