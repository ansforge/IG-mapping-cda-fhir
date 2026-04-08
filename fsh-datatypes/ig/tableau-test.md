# test - POC - Mapping CDA to FHIR v0.1.0

* [**Table of Contents**](toc.md)
* **test**

## test

## Mapping entre les datatypes CDA et les datatypes FHIR

| | | |
| :--- | :--- | :--- |
| ConceptMap | CDA | FHIR |
| CdaIIToIdentifier | II.assigningAuthorityName | Identifier.assigner.display |
| CdaIIToIdentifier | II.displayable | Identifier.extension(displayable) |
| CdaIIToIdentifier | II.extension | Identifier.value |
| CdaIIToIdentifier | II.root | Identifier.system |
| CdaIIToIdentifier | II.root | Identifier.value |
| CdaToFhirAdministrativeGender | Female | Female |
| CdaToFhirAdministrativeGender | Male | Male |
| CdaToFhirAdministrativeGender | Undifferentiated | Other |
| CdaToFhirAdministrativeGender | Unknown | Unknown |
| ConceptMapOidSpecialiteOrdinale | urn:oid:1.2.250.1.213.1.1.4.5 | https://mos.esante.gouv.fr/NOS/TRE_R38-SpecialiteOrdinale/FHIR/TRE-R38-SpecialiteOrdinale |
| OID2URIConceptMapANS | 1.2.250.1.213.1.1.4.5 | https://mos.esante.gouv.fr/NOS/TRE_R38-SpecialiteOrdinale/FHIR/TRE-R38-SpecialiteOrdinale |

