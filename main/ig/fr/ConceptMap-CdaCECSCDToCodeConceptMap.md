# ConceptMap — CDA CE/CS/CD vers FHIR code et CodeableConcept - Mapping CDA to FHIR (Preuve de concept) v0.1.0

## ConceptMap: ConceptMap — CDA CE/CS/CD vers FHIR code et CodeableConcept (Expérimental) 

 
Correspondances documentaires entre les datatypes CDA CE, CS et CD et les types FHIR code et CodeableConcept. 



## Resource Content

```json
{
  "resourceType" : "ConceptMap",
  "id" : "CdaCECSCDToCodeConceptMap",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/DataTypes/CdaConceptCodesToFHIR",
  "version" : "0.1.0",
  "name" : "CdaConceptCodesToFHIR",
  "title" : "ConceptMap — CDA CE/CS/CD vers FHIR code et CodeableConcept",
  "status" : "draft",
  "experimental" : true,
  "date" : "2026-07-31T12:55:21+00:00",
  "publisher" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
  "contact" : [{
    "name" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
    "telecom" : [{
      "system" : "url",
      "value" : "https://esante.gouv.fr"
    }]
  }],
  "description" : "Correspondances documentaires entre les datatypes CDA CE, CS et CD et les types FHIR code et CodeableConcept.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "FR",
      "display" : "France (la)"
    }]
  }],
  "group" : [{
    "source" : "http://hl7.org/cda/stds/core/StructureDefinition/CE",
    "sourceVersion" : "2.0.0-sd",
    "target" : "http://hl7.org/fhir/StructureDefinition/code",
    "targetVersion" : "4.0.1",
    "element" : [{
      "code" : "CE.code",
      "display" : "CE.code",
      "target" : [{
        "code" : "code",
        "display" : "code",
        "equivalence" : "equivalent",
        "comment" : "Le code CDA alimente directement le datatype primitif FHIR code."
      }]
    }]
  },
  {
    "source" : "http://hl7.org/cda/stds/core/StructureDefinition/CE",
    "sourceVersion" : "2.0.0-sd",
    "target" : "http://hl7.org/fhir/StructureDefinition/CodeableConcept",
    "targetVersion" : "4.0.1",
    "element" : [{
      "code" : "CE.originalText",
      "display" : "CE.originalText",
      "target" : [{
        "code" : "CodeableConcept.text",
        "display" : "CodeableConcept.text",
        "equivalence" : "equivalent",
        "comment" : "Le texte original CDA alimente directement CodeableConcept.text."
      }]
    },
    {
      "code" : "CE.code",
      "display" : "CE.code",
      "target" : [{
        "code" : "CodeableConcept.coding.code",
        "display" : "CodeableConcept.coding.code",
        "equivalence" : "equivalent",
        "comment" : "Le code principal CDA CE alimente coding.code."
      }]
    },
    {
      "code" : "CE.codeSystem",
      "display" : "CE.codeSystem",
      "target" : [{
        "code" : "CodeableConcept.coding.system",
        "display" : "CodeableConcept.coding.system",
        "equivalence" : "relatedto",
        "comment" : "Le codeSystem CDA est transformé en URI de type urn:oid:[codeSystem] pour alimenter coding.system."
      }]
    },
    {
      "code" : "CE.displayName",
      "display" : "CE.displayName",
      "target" : [{
        "code" : "CodeableConcept.coding.display",
        "display" : "CodeableConcept.coding.display",
        "equivalence" : "equivalent",
        "comment" : "Le libellé CDA displayName alimente coding.display."
      }]
    },
    {
      "code" : "CE.translation",
      "display" : "CE.translation",
      "target" : [{
        "code" : "CodeableConcept.coding",
        "display" : "CodeableConcept.coding (translation)",
        "equivalence" : "relatedto",
        "comment" : "Chaque translation CDA crée un coding supplémentaire dans le CodeableConcept cible."
      }]
    }]
  },
  {
    "source" : "http://hl7.org/cda/stds/core/StructureDefinition/CS",
    "sourceVersion" : "2.0.0-sd",
    "target" : "http://hl7.org/fhir/StructureDefinition/code",
    "targetVersion" : "4.0.1",
    "element" : [{
      "code" : "CS.code",
      "display" : "CS.code",
      "target" : [{
        "code" : "code",
        "display" : "code",
        "equivalence" : "equivalent",
        "comment" : "Le code CDA CS alimente directement le datatype primitif FHIR code."
      }]
    }]
  },
  {
    "source" : "http://hl7.org/cda/stds/core/StructureDefinition/CS",
    "sourceVersion" : "2.0.0-sd",
    "target" : "http://hl7.org/fhir/StructureDefinition/CodeableConcept",
    "targetVersion" : "4.0.1",
    "element" : [{
      "code" : "CS.code",
      "display" : "CS.code",
      "target" : [{
        "code" : "CodeableConcept.coding.code",
        "display" : "CodeableConcept.coding.code",
        "equivalence" : "relatedto",
        "comment" : "Par héritage du mapping CE -> CodeableConcept, le code CS alimente coding.code."
      }]
    }]
  },
  {
    "source" : "http://hl7.org/cda/stds/core/StructureDefinition/CD",
    "sourceVersion" : "2.0.0-sd",
    "target" : "http://hl7.org/fhir/StructureDefinition/code",
    "targetVersion" : "4.0.1",
    "element" : [{
      "code" : "CD.code",
      "display" : "CD.code",
      "target" : [{
        "code" : "code",
        "display" : "code",
        "equivalence" : "relatedto",
        "comment" : "Le code CDA CD alimente le datatype primitif FHIR code, conformément au mapping hérité de CS -> code."
      }]
    }]
  },
  {
    "source" : "http://hl7.org/cda/stds/core/StructureDefinition/CD",
    "sourceVersion" : "2.0.0-sd",
    "target" : "http://hl7.org/fhir/StructureDefinition/CodeableConcept",
    "targetVersion" : "4.0.1",
    "element" : [{
      "code" : "CD.originalText",
      "display" : "CD.originalText",
      "target" : [{
        "code" : "CodeableConcept.text",
        "display" : "CodeableConcept.text",
        "equivalence" : "relatedto",
        "comment" : "Par héritage du mapping CE -> CodeableConcept, le texte original CDA peut alimenter CodeableConcept.text."
      }]
    },
    {
      "code" : "CD.code",
      "display" : "CD.code",
      "target" : [{
        "code" : "CodeableConcept.coding.code",
        "display" : "CodeableConcept.coding.code",
        "equivalence" : "relatedto",
        "comment" : "Le code principal CDA CD alimente coding.code."
      }]
    },
    {
      "code" : "CD.codeSystem",
      "display" : "CD.codeSystem",
      "target" : [{
        "code" : "CodeableConcept.coding.system",
        "display" : "CodeableConcept.coding.system",
        "equivalence" : "relatedto",
        "comment" : "Le codeSystem CDA est transformé en URI de type urn:oid:[codeSystem]."
      }]
    },
    {
      "code" : "CD.displayName",
      "display" : "CD.displayName",
      "target" : [{
        "code" : "CodeableConcept.coding.display",
        "display" : "CodeableConcept.coding.display",
        "equivalence" : "relatedto",
        "comment" : "Le libellé CDA displayName alimente coding.display."
      }]
    },
    {
      "code" : "CD.translation",
      "display" : "CD.translation",
      "target" : [{
        "code" : "CodeableConcept.coding",
        "display" : "CodeableConcept.coding (translation)",
        "equivalence" : "relatedto",
        "comment" : "Chaque translation CDA crée un coding supplémentaire dans le CodeableConcept cible."
      }]
    }]
  }]
}

```
