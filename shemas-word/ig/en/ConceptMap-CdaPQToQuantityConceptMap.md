# ConceptMap — CDA PQ vers FHIR Quantity - POC - Mapping CDA to FHIR v0.1.0

## ConceptMap: ConceptMap — CDA PQ vers FHIR Quantity (Experimental) 

 
Correspondances documentaires entre le datatype CDA PQ et le datatype FHIR Quantity. 



## Resource Content

```json
{
  "resourceType" : "ConceptMap",
  "id" : "CdaPQToQuantityConceptMap",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/DataTypes/CdaPQToFHIR",
  "version" : "0.1.0",
  "name" : "CdaPQToFHIR",
  "title" : "ConceptMap — CDA PQ vers FHIR Quantity",
  "status" : "draft",
  "experimental" : true,
  "date" : "2026-06-18T08:25:21+00:00",
  "publisher" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
  "contact" : [{
    "name" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
    "telecom" : [{
      "system" : "url",
      "value" : "https://esante.gouv.fr"
    }]
  }],
  "description" : "Correspondances documentaires entre le datatype CDA PQ et le datatype FHIR Quantity.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "FR",
      "display" : "France (la)"
    }]
  }],
  "group" : [{
    "source" : "http://hl7.org/cda/stds/core/StructureDefinition/PQ",
    "sourceVersion" : "2.0.0-sd",
    "target" : "http://hl7.org/fhir/StructureDefinition/Quantity",
    "targetVersion" : "4.0.1",
    "element" : [{
      "code" : "PQ.value",
      "display" : "PQ.value",
      "target" : [{
        "code" : "Quantity.value",
        "display" : "Quantity.value",
        "equivalence" : "equivalent",
        "comment" : "PQ.value alimente directement Quantity.value."
      }]
    },
    {
      "code" : "PQ.unit",
      "display" : "PQ.unit",
      "target" : [{
        "code" : "Quantity.code",
        "display" : "Quantity.code",
        "equivalence" : "equivalent",
        "comment" : "PQ.unit (UCUM) alimente Quantity.code."
      },
      {
        "code" : "Quantity.unit",
        "display" : "Quantity.unit",
        "equivalence" : "relatedto",
        "comment" : "PQ.unit peut être réutilisé comme libellé d’unité dans Quantity.unit selon la stratégie d’affichage."
      },
      {
        "code" : "Quantity.system",
        "display" : "Quantity.system",
        "equivalence" : "relatedto",
        "comment" : "Si PQ.unit est UCUM, Quantity.system est fixé à http://unitsofmeasure.org."
      }]
    }]
  }]
}

```
