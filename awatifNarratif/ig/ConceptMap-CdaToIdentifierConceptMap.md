# ConceptMap — CDA II → FHIR Identifier - POC - Mapping CDA to FHIR v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ConceptMap — CDA II → FHIR Identifier**

## ConceptMap: ConceptMap — CDA II → FHIR Identifier (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/DataTypes/CdaIIToIdentifier | *Version*:0.1.0 |
| Draft as of 2026-03-17 | *Computable Name*:CdaIIToIdentifier |

 
Correspondances des éléments CDA II → FHIR Identifier (root, extension, assigner). 



## Resource Content

```json
{
  "resourceType" : "ConceptMap",
  "id" : "CdaToIdentifierConceptMap",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/DataTypes/CdaIIToIdentifier",
  "version" : "0.1.0",
  "name" : "CdaIIToIdentifier",
  "title" : "ConceptMap — CDA II → FHIR Identifier",
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
  "description" : "Correspondances des éléments CDA II → FHIR Identifier (root, extension, assigner).",
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
      "code" : "II_extension",
      "target" : [{
        "code" : "Identifier_value",
        "equivalence" : "equivalent"
      }]
    }]
  }]
}

```
