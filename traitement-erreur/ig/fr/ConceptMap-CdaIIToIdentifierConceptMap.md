# ConceptMap — CDA II vers FHIR Identifier - Mapping CDA to FHIR (Preuve de concept) v0.1.0

## ConceptMap: ConceptMap — CDA II vers FHIR Identifier (Expérimental) 

 
Correspondances entre les éléments du datatype CDA II et les éléments FHIR Identifier et Reference. 



## Resource Content

```json
{
  "resourceType" : "ConceptMap",
  "id" : "CdaIIToIdentifierConceptMap",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/CdaIIToIdentifierConceptMap",
  "version" : "0.1.0",
  "name" : "CdaIIToIdentifier",
  "title" : "ConceptMap — CDA II vers FHIR Identifier",
  "status" : "draft",
  "experimental" : true,
  "date" : "2026-07-23T12:46:45+00:00",
  "publisher" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
  "contact" : [{
    "name" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
    "telecom" : [{
      "system" : "url",
      "value" : "https://esante.gouv.fr"
    }]
  }],
  "description" : "Correspondances entre les éléments du datatype CDA II et les éléments FHIR Identifier et Reference.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "FR",
      "display" : "France (la)"
    }]
  }],
  "group" : [{
    "source" : "http://hl7.org/cda/stds/core/StructureDefinition/II",
    "sourceVersion" : "2.0.0-sd",
    "target" : "http://hl7.org/fhir/StructureDefinition/Identifier",
    "targetVersion" : "4.0.1",
    "element" : [{
      "code" : "II.extension",
      "display" : "Extension",
      "target" : [{
        "code" : "Identifier.value",
        "display" : "The value that is unique",
        "equivalence" : "equivalent",
        "comment" : "Lorsque II.extension est présent, il alimente directement Identifier.value."
      }]
    },
    {
      "code" : "II.root",
      "display" : "Root",
      "target" : [{
        "code" : "Identifier.system",
        "display" : "The namespace for the identifier value",
        "equivalence" : "relatedto",
        "comment" : "II.root alimente Identifier.system après transformation en URI, par exemple sous la forme urn:oid:[II.root] ou urn:uuid:[II.root]."
      },
      {
        "code" : "Identifier.value",
        "display" : "The value that is unique",
        "equivalence" : "relatedto",
        "comment" : "En l’absence de II.extension, Identifier.value peut être dérivé de II.root, notamment lorsqu’il porte directement l’identifiant."
      }]
    },
    {
      "code" : "II.assigningAuthorityName",
      "display" : "Assigning Authority Name",
      "target" : [{
        "code" : "Identifier.assigner",
        "display" : "Organization that issued id (may be just text)",
        "equivalence" : "relatedto",
        "comment" : "II.assigningAuthorityName permet de renseigner l’organisme ayant attribué l’identifiant dans Identifier.assigner."
      }]
    },
    {
      "code" : "II.displayable",
      "display" : "Displayable",
      "target" : [{
        "code" : "Identifier.extension",
        "display" : "Additional content defined by implementations",
        "equivalence" : "relatedto",
        "comment" : "La valeur II.displayable peut être conservée dans une extension FHIR spécifique portée par Identifier."
      }]
    }]
  },
  {
    "source" : "http://hl7.org/cda/stds/core/StructureDefinition/II",
    "sourceVersion" : "2.0.0-sd",
    "target" : "http://hl7.org/fhir/StructureDefinition/Reference",
    "targetVersion" : "4.0.1",
    "element" : [{
      "code" : "II.assigningAuthorityName",
      "display" : "Assigning Authority Name",
      "target" : [{
        "code" : "Reference.display",
        "display" : "Text alternative for the resource",
        "equivalence" : "relatedto",
        "comment" : "Le nom de l’autorité d’attribution CDA alimente Reference.display dans la référence Identifier.assigner."
      }]
    }]
  }]
}

```
