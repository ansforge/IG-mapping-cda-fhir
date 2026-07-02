# ConceptMap — CDA EN/PN vers FHIR HumanName - POC - Mapping CDA to FHIR v0.1.0

## ConceptMap: ConceptMap — CDA EN/PN vers FHIR HumanName (Expérimental) 

 
Correspondances documentaires des composants CDA EN et PN vers FHIR HumanName. 



## Resource Content

```json
{
  "resourceType" : "ConceptMap",
  "id" : "CdaENPNToHumanNameConceptMap",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/DataTypes/CdaNamesToFHIR",
  "version" : "0.1.0",
  "name" : "CdaNamesToFHIR",
  "title" : "ConceptMap — CDA EN/PN vers FHIR HumanName",
  "status" : "draft",
  "experimental" : true,
  "date" : "2026-07-02T14:54:00+00:00",
  "publisher" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
  "contact" : [{
    "name" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
    "telecom" : [{
      "system" : "url",
      "value" : "https://esante.gouv.fr"
    }]
  }],
  "description" : "Correspondances documentaires des composants CDA EN et PN vers FHIR HumanName.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "FR",
      "display" : "France (la)"
    }]
  }],
  "group" : [{
    "source" : "http://hl7.org/cda/stds/core/StructureDefinition/EN",
    "sourceVersion" : "2.0.0-sd",
    "target" : "http://hl7.org/fhir/StructureDefinition/HumanName",
    "targetVersion" : "4.0.1",
    "element" : [{
      "code" : "EN.family",
      "display" : "EN.family",
      "target" : [{
        "code" : "HumanName.family",
        "display" : "HumanName.family",
        "equivalence" : "equivalent",
        "comment" : "Le composant family du nom CDA EN alimente directement HumanName.family."
      }]
    },
    {
      "code" : "EN.given",
      "display" : "EN.given",
      "target" : [{
        "code" : "HumanName.given",
        "display" : "HumanName.given",
        "equivalence" : "equivalent",
        "comment" : "Le composant given du nom CDA EN alimente directement HumanName.given."
      }]
    },
    {
      "code" : "EN.prefix",
      "display" : "EN.prefix",
      "target" : [{
        "code" : "HumanName.prefix",
        "display" : "HumanName.prefix",
        "equivalence" : "equivalent",
        "comment" : "Le composant prefix du nom CDA EN alimente directement HumanName.prefix."
      }]
    },
    {
      "code" : "EN.suffix",
      "display" : "EN.suffix",
      "target" : [{
        "code" : "HumanName.suffix",
        "display" : "HumanName.suffix",
        "equivalence" : "equivalent",
        "comment" : "Le composant suffix du nom CDA EN alimente directement HumanName.suffix."
      }]
    },
    {
      "code" : "EN.xmlText",
      "display" : "EN.xmlText",
      "target" : [{
        "code" : "HumanName.text",
        "display" : "HumanName.text",
        "equivalence" : "relatedto",
        "comment" : "La forme textuelle du nom (EN.xmlText) alimente HumanName.text."
      }]
    },
    {
      "code" : "EN.validTime",
      "display" : "EN.validTime",
      "target" : [{
        "code" : "HumanName.period",
        "display" : "HumanName.period",
        "equivalence" : "relatedto",
        "comment" : "La période de validité du nom CDA EN alimente HumanName.period."
      }]
    }]
  },
  {
    "source" : "http://hl7.org/cda/stds/core/StructureDefinition/PN",
    "sourceVersion" : "2.0.0-sd",
    "target" : "http://hl7.org/fhir/StructureDefinition/HumanName",
    "targetVersion" : "4.0.1",
    "element" : [{
      "code" : "PN.family",
      "display" : "PN.family",
      "target" : [{
        "code" : "HumanName.family",
        "display" : "HumanName.family",
        "equivalence" : "equivalent",
        "comment" : "Par héritage du mapping EN -> HumanName, le composant family du nom CDA PN alimente HumanName.family."
      }]
    },
    {
      "code" : "PN.given",
      "display" : "PN.given",
      "target" : [{
        "code" : "HumanName.given",
        "display" : "HumanName.given",
        "equivalence" : "equivalent",
        "comment" : "Par héritage du mapping EN -> HumanName, le composant given du nom CDA PN alimente HumanName.given."
      }]
    },
    {
      "code" : "PN.prefix",
      "display" : "PN.prefix",
      "target" : [{
        "code" : "HumanName.prefix",
        "display" : "HumanName.prefix",
        "equivalence" : "equivalent",
        "comment" : "Par héritage du mapping EN -> HumanName, le composant prefix du nom CDA PN alimente HumanName.prefix."
      }]
    },
    {
      "code" : "PN.suffix",
      "display" : "PN.suffix",
      "target" : [{
        "code" : "HumanName.suffix",
        "display" : "HumanName.suffix",
        "equivalence" : "equivalent",
        "comment" : "Par héritage du mapping EN -> HumanName, le composant suffix du nom CDA PN alimente HumanName.suffix."
      }]
    },
    {
      "code" : "PN.xmlText",
      "display" : "PN.xmlText",
      "target" : [{
        "code" : "HumanName.text",
        "display" : "HumanName.text",
        "equivalence" : "relatedto",
        "comment" : "La forme textuelle du nom (PN.xmlText) alimente HumanName.text."
      }]
    },
    {
      "code" : "PN.validTime",
      "display" : "PN.validTime",
      "target" : [{
        "code" : "HumanName.period",
        "display" : "HumanName.period",
        "equivalence" : "equivalent",
        "comment" : "Par héritage du mapping EN -> HumanName, la période de validité du nom CDA PN alimente HumanName.period."
      }]
    }]
  }]
}

```
