# ConceptMap — CDA TEL vers FHIR ContactPoint - POC - Mapping CDA to FHIR v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ConceptMap — CDA TEL vers FHIR ContactPoint**

## ConceptMap: ConceptMap — CDA TEL vers FHIR ContactPoint (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/DataTypes/CdaTELToFHIR | *Version*:0.1.0 |
| Draft as of 2026-04-22 | *Computable Name*:CdaTELToFHIR |

 
Correspondances documentaires entre le datatype CDA TEL et les éléments FHIR ContactPoint. 



## Resource Content

```json
{
  "resourceType" : "ConceptMap",
  "id" : "CdaTELToContactPointConceptMap",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/DataTypes/CdaTELToFHIR",
  "version" : "0.1.0",
  "name" : "CdaTELToFHIR",
  "title" : "ConceptMap — CDA TEL vers FHIR ContactPoint",
  "status" : "draft",
  "experimental" : true,
  "date" : "2026-04-22T13:26:00+00:00",
  "publisher" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
  "contact" : [{
    "name" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
    "telecom" : [{
      "system" : "url",
      "value" : "https://esante.gouv.fr"
    }]
  }],
  "description" : "Correspondances documentaires entre le datatype CDA TEL et les éléments FHIR ContactPoint.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "FR",
      "display" : "FRANCE"
    }]
  }],
  "group" : [{
    "source" : "http://hl7.org/cda/stds/core/StructureDefinition/TEL",
    "target" : "http://hl7.org/fhir/StructureDefinition/ContactPoint",
    "element" : [{
      "code" : "TEL.value",
      "display" : "TEL.value",
      "target" : [{
        "code" : "ContactPoint.value",
        "display" : "ContactPoint.value",
        "equivalence" : "relatedto",
        "comment" : "La valeur TEL alimente ContactPoint.value après suppression du préfixe technique tel:, fax:, mailto:, http: ou https:."
      },
      {
        "code" : "ContactPoint.system",
        "display" : "ContactPoint.system",
        "equivalence" : "relatedto",
        "comment" : "Le système cible est déterminé à partir du préfixe de TEL.value : tel -> phone, fax -> fax, mailto -> email, http/https -> url."
      }]
    },
    {
      "code" : "TEL.use",
      "display" : "TEL.use",
      "target" : [{
        "code" : "ContactPoint.use",
        "display" : "ContactPoint.use",
        "equivalence" : "relatedto",
        "comment" : "Les usages CDA sont convertis vers les usages FHIR : H -> home ; WP, DIR ou PUB -> work ; BAD -> old ; TMP -> temp ; MC -> mobile."
      }]
    },
    {
      "code" : "TEL.useablePeriod",
      "display" : "TEL.useablePeriod",
      "target" : [{
        "code" : "ContactPoint.period",
        "display" : "ContactPoint.period",
        "equivalence" : "equivalent",
        "comment" : "La période d’utilisation du point de contact CDA alimente directement ContactPoint.period."
      }]
    }]
  }]
}

```
