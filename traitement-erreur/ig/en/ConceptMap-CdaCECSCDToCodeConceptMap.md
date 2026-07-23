# ConceptMap — CDA CE/CS/CD vers FHIR code et CodeableConcept - Mapping CDA to FHIR (Preuve de concept) v0.1.0

## ConceptMap: ConceptMap — CDA CE/CS/CD vers FHIR code et CodeableConcept (Experimental) 

 
Correspondances documentaires entre les datatypes CDA CE, CS et CD et les types FHIR code, CodeableConcept et Coding. 



## Resource Content

```json
{
  "resourceType" : "ConceptMap",
  "id" : "CdaCECSCDToCodeConceptMap",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/CdaCECSCDToCodeConceptMap",
  "version" : "0.1.0",
  "name" : "CdaConceptCodesToFHIR",
  "title" : "ConceptMap — CDA CE/CS/CD vers FHIR code et CodeableConcept",
  "status" : "draft",
  "experimental" : true,
  "date" : "2026-07-23T12:15:47+00:00",
  "publisher" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
  "contact" : [{
    "name" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
    "telecom" : [{
      "system" : "url",
      "value" : "https://esante.gouv.fr"
    }]
  }],
  "description" : "Correspondances documentaires entre les datatypes CDA CE, CS et CD et les types FHIR code, CodeableConcept et Coding.",
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
      "display" : "Code",
      "target" : [{
        "code" : "code",
        "display" : "Primitive Type code",
        "equivalence" : "equivalent",
        "comment" : "Le code CDA CE alimente directement le datatype primitif FHIR code."
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
      "display" : "Original Text",
      "target" : [{
        "code" : "CodeableConcept.text",
        "display" : "Plain text representation of the concept",
        "equivalence" : "equivalent",
        "comment" : "Le texte original CDA CE alimente directement CodeableConcept.text."
      }]
    },
    {
      "code" : "CE.translation",
      "display" : "Translation",
      "target" : [{
        "code" : "CodeableConcept.coding",
        "display" : "Code defined by a terminology system",
        "equivalence" : "relatedto",
        "comment" : "Chaque translation CDA CE crée un Coding supplémentaire dans CodeableConcept.coding."
      }]
    }]
  },
  {
    "source" : "http://hl7.org/cda/stds/core/StructureDefinition/CE",
    "sourceVersion" : "2.0.0-sd",
    "target" : "http://hl7.org/fhir/StructureDefinition/Coding",
    "targetVersion" : "4.0.1",
    "element" : [{
      "code" : "CE.code",
      "display" : "Code",
      "target" : [{
        "code" : "Coding.code",
        "display" : "Symbol in syntax defined by the system",
        "equivalence" : "equivalent",
        "comment" : "Le code principal CDA CE alimente Coding.code dans le CodeableConcept cible."
      }]
    },
    {
      "code" : "CE.codeSystem",
      "display" : "Code System",
      "target" : [{
        "code" : "Coding.system",
        "display" : "Identity of the terminology system",
        "equivalence" : "relatedto",
        "comment" : "Le codeSystem CDA CE est converti en URI, notamment sous la forme urn:oid:[codeSystem], pour alimenter Coding.system."
      }]
    },
    {
      "code" : "CE.displayName",
      "display" : "Display Name",
      "target" : [{
        "code" : "Coding.display",
        "display" : "Representation defined by the system",
        "equivalence" : "equivalent",
        "comment" : "Le libellé CDA CE displayName alimente Coding.display."
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
      "display" : "Code",
      "target" : [{
        "code" : "code",
        "display" : "Primitive Type code",
        "equivalence" : "equivalent",
        "comment" : "Le code CDA CS alimente directement le datatype primitif FHIR code."
      }]
    }]
  },
  {
    "source" : "http://hl7.org/cda/stds/core/StructureDefinition/CS",
    "sourceVersion" : "2.0.0-sd",
    "target" : "http://hl7.org/fhir/StructureDefinition/Coding",
    "targetVersion" : "4.0.1",
    "element" : [{
      "code" : "CS.code",
      "display" : "Code",
      "target" : [{
        "code" : "Coding.code",
        "display" : "Symbol in syntax defined by the system",
        "equivalence" : "relatedto",
        "comment" : "Le code CDA CS alimente Coding.code dans le CodeableConcept cible."
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
      "display" : "Code",
      "target" : [{
        "code" : "code",
        "display" : "Primitive Type code",
        "equivalence" : "relatedto",
        "comment" : "Le code CDA CD alimente le datatype primitif FHIR code."
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
      "display" : "Original Text",
      "target" : [{
        "code" : "CodeableConcept.text",
        "display" : "Plain text representation of the concept",
        "equivalence" : "relatedto",
        "comment" : "Le texte original CDA CD peut alimenter CodeableConcept.text."
      }]
    },
    {
      "code" : "CD.translation",
      "display" : "Translation",
      "target" : [{
        "code" : "CodeableConcept.coding",
        "display" : "Code defined by a terminology system",
        "equivalence" : "relatedto",
        "comment" : "Chaque translation CDA CD crée un Coding supplémentaire dans CodeableConcept.coding."
      }]
    }]
  },
  {
    "source" : "http://hl7.org/cda/stds/core/StructureDefinition/CD",
    "sourceVersion" : "2.0.0-sd",
    "target" : "http://hl7.org/fhir/StructureDefinition/Coding",
    "targetVersion" : "4.0.1",
    "element" : [{
      "code" : "CD.code",
      "display" : "Code",
      "target" : [{
        "code" : "Coding.code",
        "display" : "Symbol in syntax defined by the system",
        "equivalence" : "relatedto",
        "comment" : "Le code principal CDA CD alimente Coding.code dans le CodeableConcept cible."
      }]
    },
    {
      "code" : "CD.codeSystem",
      "display" : "Code System",
      "target" : [{
        "code" : "Coding.system",
        "display" : "Identity of the terminology system",
        "equivalence" : "relatedto",
        "comment" : "Le codeSystem CDA CD est converti en URI, notamment sous la forme urn:oid:[codeSystem], pour alimenter Coding.system."
      }]
    },
    {
      "code" : "CD.displayName",
      "display" : "Display Name",
      "target" : [{
        "code" : "Coding.display",
        "display" : "Representation defined by the system",
        "equivalence" : "relatedto",
        "comment" : "Le libellé CDA CD displayName alimente Coding.display."
      }]
    }]
  }]
}

```
