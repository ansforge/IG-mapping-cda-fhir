# ConceptMap — CDA EN/PN vers FHIR HumanName - Mapping CDA to FHIR (Preuve de concept) v0.1.0

## ConceptMap: ConceptMap — CDA EN/PN vers FHIR HumanName (Expérimental) 

 
Correspondances documentaires des composants CDA EN et PN vers FHIR HumanName. 



## Resource Content

```json
{
  "resourceType" : "ConceptMap",
  "id" : "CdaENPNToHumanNameConceptMap",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/CdaENPNToHumanNameConceptMap",
  "version" : "0.1.0",
  "name" : "CdaNamesToFHIR",
  "title" : "ConceptMap — CDA EN/PN vers FHIR HumanName",
  "status" : "draft",
  "experimental" : true,
  "date" : "2026-07-22T13:34:22+00:00",
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
      "code" : "EN.item.family",
      "display" : "Family",
      "target" : [{
        "code" : "HumanName.family",
        "display" : "Family name (often called 'Surname')",
        "equivalence" : "equivalent",
        "comment" : "Le composant family du nom CDA EN alimente directement HumanName.family."
      }]
    },
    {
      "code" : "EN.item.given",
      "display" : "Given",
      "target" : [{
        "code" : "HumanName.given",
        "display" : "Given names (not always 'first'). Includes middle names",
        "equivalence" : "equivalent",
        "comment" : "Le composant given du nom CDA EN alimente directement HumanName.given."
      }]
    },
    {
      "code" : "EN.item.prefix",
      "display" : "Prefix",
      "target" : [{
        "code" : "HumanName.prefix",
        "display" : "Parts that come before the name",
        "equivalence" : "equivalent",
        "comment" : "Le composant prefix du nom CDA EN alimente directement HumanName.prefix."
      }]
    },
    {
      "code" : "EN.item.suffix",
      "display" : "Suffix",
      "target" : [{
        "code" : "HumanName.suffix",
        "display" : "Parts that come after the name",
        "equivalence" : "equivalent",
        "comment" : "Le composant suffix du nom CDA EN alimente directement HumanName.suffix."
      }]
    },
    {
      "code" : "EN.item.xmlText",
      "display" : "Allows for mixed text content",
      "target" : [{
        "code" : "HumanName.text",
        "display" : "Text representation of the full name",
        "equivalence" : "relatedto",
        "comment" : "La forme textuelle complète du nom CDA EN alimente HumanName.text."
      }]
    },
    {
      "code" : "EN.validTime",
      "display" : "Valid Time",
      "target" : [{
        "code" : "HumanName.period",
        "display" : "Time period when name was/is in use",
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
      "code" : "PN.item.family",
      "display" : "Family",
      "target" : [{
        "code" : "HumanName.family",
        "display" : "Family name (often called 'Surname')",
        "equivalence" : "equivalent",
        "comment" : "Par héritage du mapping EN vers HumanName, le composant family du nom CDA PN alimente HumanName.family."
      }]
    },
    {
      "code" : "PN.item.given",
      "display" : "Given",
      "target" : [{
        "code" : "HumanName.given",
        "display" : "Given names (not always 'first'). Includes middle names",
        "equivalence" : "equivalent",
        "comment" : "Par héritage du mapping EN vers HumanName, le composant given du nom CDA PN alimente HumanName.given."
      }]
    },
    {
      "code" : "PN.item.prefix",
      "display" : "Prefix",
      "target" : [{
        "code" : "HumanName.prefix",
        "display" : "Parts that come before the name",
        "equivalence" : "equivalent",
        "comment" : "Par héritage du mapping EN vers HumanName, le composant prefix du nom CDA PN alimente HumanName.prefix."
      }]
    },
    {
      "code" : "PN.item.suffix",
      "display" : "Suffix",
      "target" : [{
        "code" : "HumanName.suffix",
        "display" : "Parts that come after the name",
        "equivalence" : "equivalent",
        "comment" : "Par héritage du mapping EN vers HumanName, le composant suffix du nom CDA PN alimente HumanName.suffix."
      }]
    },
    {
      "code" : "PN.item.xmlText",
      "display" : "Allows for mixed text content",
      "target" : [{
        "code" : "HumanName.text",
        "display" : "Text representation of the full name",
        "equivalence" : "relatedto",
        "comment" : "La forme textuelle complète du nom CDA PN alimente HumanName.text."
      }]
    },
    {
      "code" : "PN.validTime",
      "display" : "Valid Time",
      "target" : [{
        "code" : "HumanName.period",
        "display" : "Time period when name was/is in use",
        "equivalence" : "equivalent",
        "comment" : "Par héritage du mapping EN vers HumanName, la période de validité du nom CDA PN alimente HumanName.period."
      }]
    }]
  }]
}

```
