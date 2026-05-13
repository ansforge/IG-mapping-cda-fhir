# ConceptMap — CDA II vers FHIR Identifier - POC - Mapping CDA to FHIR v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ConceptMap — CDA II vers FHIR Identifier**

## ConceptMap: ConceptMap — CDA II vers FHIR Identifier (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/DataTypes/CdaIIToIdentifier | *Version*:0.1.0 |
| Draft as of 2026-05-13 | *Computable Name*:CdaIIToIdentifier |

 
Correspondances entre les éléments du datatype CDA II et les éléments FHIR Identifier 



## Resource Content

```json
{
  "resourceType" : "ConceptMap",
  "id" : "CdaIIToIdentifierConceptMap",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/DataTypes/CdaIIToIdentifier",
  "version" : "0.1.0",
  "name" : "CdaIIToIdentifier",
  "title" : "ConceptMap — CDA II vers FHIR Identifier",
  "status" : "draft",
  "experimental" : true,
  "date" : "2026-05-13T07:14:42+00:00",
  "publisher" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
  "contact" : [{
    "name" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
    "telecom" : [{
      "system" : "url",
      "value" : "https://esante.gouv.fr"
    }]
  }],
  "description" : "Correspondances entre les éléments du datatype CDA II et les éléments FHIR Identifier",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "FR",
      "display" : "FRANCE"
    }]
  }],
  "group" : [{
    "source" : "http://hl7.org/cda/stds/core/StructureDefinition/II",
    "target" : "http://hl7.org/fhir/StructureDefinition/Identifier",
    "element" : [{
      "code" : "II.extension",
      "display" : "II.extension",
      "target" : [{
        "code" : "Identifier.value",
        "display" : "Identifier.value",
        "equivalence" : "equivalent",
        "comment" : "Lorsque II.extension est présent, il alimente directement Identifier.value."
      }]
    },
    {
      "code" : "II.root",
      "display" : "II.root",
      "target" : [{
        "code" : "Identifier.system",
        "display" : "Identifier.system",
        "equivalence" : "relatedto",
        "comment" : "Utilisé pour alimenter Identifier.system, généralement avec transformation vers un URI."
      },
      {
        "code" : "Identifier.value",
        "display" : "Identifier.value",
        "equivalence" : "relatedto",
        "comment" : "En l’absence de II.extension, Identifier.value peut être dérivé de II.root, par exemple sous la forme urn:uuid:[II.root] si II.root est un UUID, ou urn:oid:[II.root] si II.root est un OID."
      }]
    },
    {
      "code" : "II.assigningAuthorityName",
      "display" : "II.assigningAuthorityName",
      "target" : [{
        "code" : "Identifier.assigner.display",
        "display" : "Identifier.assigner.display",
        "equivalence" : "relatedto"
      }]
    },
    {
      "code" : "II.displayable",
      "display" : "II.displayable",
      "target" : [{
        "code" : "Identifier.extension",
        "display" : "Identifier.extension(displayable)",
        "equivalence" : "relatedto",
        "comment" : "Porté dans une extension FHIR spécifique."
      }]
    }]
  }]
}

```
