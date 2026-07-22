# ConceptMap — CDA TEL vers FHIR ContactPoint - Mapping CDA to FHIR (Preuve de concept) v0.1.0

## ConceptMap: ConceptMap — CDA TEL vers FHIR ContactPoint (Experimental) 

 
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
  "date" : "2026-07-22T12:56:04+00:00",
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
      "display" : "France (la)"
    }]
  }],
  "group" : [{
    "source" : "http://hl7.org/cda/stds/core/StructureDefinition/TEL",
    "sourceVersion" : "2.0.0-sd",
    "target" : "http://hl7.org/fhir/StructureDefinition/ContactPoint",
    "targetVersion" : "4.0.1",
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
