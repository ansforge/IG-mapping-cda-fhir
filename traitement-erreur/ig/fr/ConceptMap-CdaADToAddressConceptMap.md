# ConceptMap — CDA AD vers FHIR Address - Mapping CDA to FHIR (Preuve de concept) v0.1.0

## ConceptMap: ConceptMap — CDA AD vers FHIR Address (Expérimental) 

 
Correspondances documentaires des composants du type CDA AD vers le type FHIR Address et les extensions associées. 



## Resource Content

```json
{
  "resourceType" : "ConceptMap",
  "id" : "CdaADToAddressConceptMap",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/CdaADToAddressConceptMap",
  "version" : "0.1.0",
  "name" : "CdaAddressToFHIR",
  "title" : "ConceptMap — CDA AD vers FHIR Address",
  "status" : "draft",
  "experimental" : true,
  "date" : "2026-07-22T12:41:23+00:00",
  "publisher" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
  "contact" : [{
    "name" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
    "telecom" : [{
      "system" : "url",
      "value" : "https://esante.gouv.fr"
    }]
  }],
  "description" : "Correspondances documentaires des composants du type CDA AD vers le type FHIR Address et les extensions associées.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "FR",
      "display" : "France (la)"
    }]
  }],
  "group" : [{
    "source" : "http://hl7.org/cda/stds/core/StructureDefinition/AD",
    "sourceVersion" : "2.0.0-sd",
    "target" : "http://hl7.org/fhir/StructureDefinition/Address",
    "targetVersion" : "4.0.1",
    "element" : [{
      "code" : "AD.item.country",
      "display" : "Country",
      "target" : [{
        "code" : "Address.country",
        "display" : "Country (e.g. can be ISO 3166 2 or 3 letter code)",
        "equivalence" : "equivalent",
        "comment" : "Le composant country de l’adresse CDA alimente directement Address.country."
      }]
    },
    {
      "code" : "AD.item.state",
      "display" : "State",
      "target" : [{
        "code" : "Address.state",
        "display" : "Sub-unit of country (abbreviations ok)",
        "equivalence" : "equivalent",
        "comment" : "Le composant state de l’adresse CDA alimente directement Address.state."
      }]
    },
    {
      "code" : "AD.item.county",
      "display" : "County",
      "target" : [{
        "code" : "Address.district",
        "display" : "District name (aka county)",
        "equivalence" : "relatedto",
        "comment" : "Le composant county de l’adresse CDA est rapproché de Address.district dans FHIR."
      }]
    },
    {
      "code" : "AD.item.city",
      "display" : "City",
      "target" : [{
        "code" : "Address.city",
        "display" : "Name of city, town etc.",
        "equivalence" : "equivalent",
        "comment" : "Le composant city de l’adresse CDA alimente directement Address.city."
      }]
    },
    {
      "code" : "AD.item.postalCode",
      "display" : "Postal Code",
      "target" : [{
        "code" : "Address.postalCode",
        "display" : "Postal code for area",
        "equivalence" : "equivalent",
        "comment" : "Le code postal de l’adresse CDA alimente directement Address.postalCode."
      }]
    },
    {
      "code" : "AD.item.streetAddressLine",
      "display" : "Street Address Line",
      "target" : [{
        "code" : "Address.line",
        "display" : "Street name, number, direction & P.O. Box etc.",
        "equivalence" : "equivalent",
        "comment" : "Chaque composant streetAddressLine de l’adresse CDA alimente une occurrence de Address.line."
      }]
    },
    {
      "code" : "AD.useablePeriod",
      "display" : "Useable Period",
      "target" : [{
        "code" : "Address.period",
        "display" : "Time period when address was/is in use",
        "equivalence" : "relatedto",
        "comment" : "La période d’utilisation de l’adresse CDA alimente Address.period."
      }]
    }]
  },
  {
    "source" : "http://hl7.org/cda/stds/core/StructureDefinition/AD",
    "sourceVersion" : "2.0.0-sd",
    "target" : "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName",
    "targetVersion" : "5.3.0",
    "element" : [{
      "code" : "AD.item.streetName",
      "display" : "Street Name",
      "target" : [{
        "code" : "Extension.value[x]",
        "display" : "Value of extension",
        "equivalence" : "equivalent",
        "comment" : "Le nom de la voie CDA alimente la valeur de l’extension iso21090-ADXP-streetName portée par Address.line."
      }]
    }]
  },
  {
    "source" : "http://hl7.org/cda/stds/core/StructureDefinition/AD",
    "sourceVersion" : "2.0.0-sd",
    "target" : "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber",
    "targetVersion" : "5.3.0",
    "element" : [{
      "code" : "AD.item.houseNumber",
      "display" : "House Number",
      "target" : [{
        "code" : "Extension.value[x]",
        "display" : "Value of extension",
        "equivalence" : "equivalent",
        "comment" : "Le numéro de voie CDA alimente la valeur de l’extension iso21090-ADXP-houseNumber portée par Address.line."
      }]
    }]
  }]
}

```
