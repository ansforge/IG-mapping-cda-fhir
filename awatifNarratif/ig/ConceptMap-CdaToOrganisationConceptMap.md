# ConceptMap — CDA CustodianOrganization → FHIR Organization - POC - Mapping CDA to FHIR v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ConceptMap — CDA CustodianOrganization → FHIR Organization**

## ConceptMap: ConceptMap — CDA CustodianOrganization → FHIR Organization (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/ressourcesTransverses/Organization | *Version*:0.1.0 |
| Draft as of 2026-03-17 | *Computable Name*:CustodianOrganizationToOrganization |

 
Correspondances entre CustodianOrganization CDA et Organization FHIR 



## Resource Content

```json
{
  "resourceType" : "ConceptMap",
  "id" : "CdaToOrganisationConceptMap",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/ressourcesTransverses/Organization",
  "version" : "0.1.0",
  "name" : "CustodianOrganizationToOrganization",
  "title" : "ConceptMap — CDA CustodianOrganization → FHIR Organization",
  "status" : "draft",
  "experimental" : true,
  "date" : "2026-03-17T13:21:46+00:00",
  "publisher" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
  "contact" : [{
    "name" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
    "telecom" : [{
      "system" : "url",
      "value" : "https://esante.gouv.fr"
    }]
  }],
  "description" : "Correspondances entre CustodianOrganization CDA et Organization FHIR",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "FR",
      "display" : "FRANCE"
    }]
  }],
  "sourceUri" : "http://hl7.org/cda/stds/core/StructureDefinition/CustodianOrganization",
  "targetUri" : "http://hl7.org/fhir/StructureDefinition/Organization",
  "group" : [{
    "source" : "http://hl7.org/cda/stds/core/StructureDefinition/CustodianOrganization",
    "target" : "http://hl7.org/fhir/StructureDefinition/Organization",
    "element" : [{
      "code" : "ClinicalDocument_custodian_assignedCustodian_representedCustodianOrganization_id",
      "target" : [{
        "code" : "Organization_identifier",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "ClinicalDocument_custodian_assignedCustodian_representedCustodianOrganization_name",
      "target" : [{
        "code" : "Organization_name",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "ClinicalDocument_custodian_assignedCustodian_representedCustodianOrganization_addr",
      "target" : [{
        "code" : "Organization_address",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "ClinicalDocument_custodian_assignedCustodian_representedCustodianOrganization_telecom",
      "target" : [{
        "code" : "Organization_telecom",
        "equivalence" : "equivalent"
      }]
    }]
  }]
}

```
