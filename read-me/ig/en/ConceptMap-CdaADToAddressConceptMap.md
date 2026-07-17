# ConceptMap — CDA AD vers FHIR Address - Mapping CDA to FHIR (Preuve de concept) v0.1.0

## ConceptMap: ConceptMap — CDA AD vers FHIR Address (Experimental) 

 
Correspondances documentaires des composants AD vers Address. 



## Resource Content

```json
{
  "resourceType" : "ConceptMap",
  "id" : "CdaADToAddressConceptMap",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/DataTypes/CdaAddressToFHIR",
  "version" : "0.1.0",
  "name" : "CdaAddressToFHIR",
  "title" : "ConceptMap — CDA AD vers FHIR Address",
  "status" : "draft",
  "experimental" : true,
  "date" : "2026-07-17T08:16:38+00:00",
  "publisher" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
  "contact" : [{
    "name" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
    "telecom" : [{
      "system" : "url",
      "value" : "https://esante.gouv.fr"
    }]
  }],
  "description" : "Correspondances documentaires des composants AD vers Address.",
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
      "display" : "AD.item.country",
      "target" : [{
        "code" : "Address.country",
        "display" : "Address.country",
        "equivalence" : "equivalent",
        "comment" : "Le composant country de l’adresse CDA alimente directement Address.country."
      }]
    },
    {
      "code" : "AD.item.state",
      "display" : "AD.item.state",
      "target" : [{
        "code" : "Address.state",
        "display" : "Address.state",
        "equivalence" : "equivalent",
        "comment" : "Le composant state de l’adresse CDA alimente directement Address.state."
      }]
    },
    {
      "code" : "AD.item.county",
      "display" : "AD.item.county",
      "target" : [{
        "code" : "Address.district",
        "display" : "Address.district",
        "equivalence" : "relatedto",
        "comment" : "Le composant county de CDA est rapproché de Address.district dans FHIR."
      }]
    },
    {
      "code" : "AD.item.city",
      "display" : "AD.item.city",
      "target" : [{
        "code" : "Address.city",
        "display" : "Address.city",
        "equivalence" : "equivalent",
        "comment" : "Le composant city de l’adresse CDA alimente directement Address.city."
      }]
    },
    {
      "code" : "AD.item.postalCode",
      "display" : "AD.item.postalCode",
      "target" : [{
        "code" : "Address.postalCode",
        "display" : "Address.postalCode",
        "equivalence" : "equivalent",
        "comment" : "Le code postal CDA alimente directement Address.postalCode."
      }]
    },
    {
      "code" : "AD.item.streetAddressLine",
      "display" : "AD.item.streetAddressLine",
      "target" : [{
        "code" : "Address.line",
        "display" : "Address.line",
        "equivalence" : "equivalent",
        "comment" : "Chaque streetAddressLine CDA alimente une ligne d’adresse FHIR."
      }]
    },
    {
      "code" : "AD.item.streetName",
      "display" : "AD.item.streetName",
      "target" : [{
        "code" : "Address.line.extension[iso21090-ADXP-streetName].valueString",
        "display" : "Address.line.extension[http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName].valueString",
        "equivalence" : "equivalent",
        "comment" : "Le nom de rue CDA alimente la valeur de l’extension officielle HL7 iso21090-ADXP-streetName portée par Address.line."
      }]
    },
    {
      "code" : "AD.item.houseNumber",
      "display" : "AD.item.houseNumber",
      "target" : [{
        "code" : "Address.line.extension[iso21090-ADXP-houseNumber].valueString",
        "display" : "Address.line.extension[http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber].valueString",
        "equivalence" : "equivalent",
        "comment" : "Le numéro de voie CDA alimente la valeur de l’extension officielle HL7 iso21090-ADXP-houseNumber portée par Address.line."
      }]
    },
    {
      "code" : "AD.useablePeriod",
      "display" : "AD.useablePeriod",
      "target" : [{
        "code" : "Address.period",
        "display" : "Address.period",
        "equivalence" : "relatedto",
        "comment" : "La période d’utilisation de l’adresse CDA alimente Address.period."
      }]
    }]
  }]
}

```
