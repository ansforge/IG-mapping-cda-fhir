# ConceptMap — CDA PQ vers FHIR Quantity - Mapping CDA to FHIR (Preuve de concept) v0.1.0

## ConceptMap: ConceptMap — CDA PQ vers FHIR Quantity (Experimental) 

 
Correspondances documentaires entre le datatype CDA PQ et le datatype FHIR Quantity. 



## Resource Content

```json
{
  "resourceType" : "ConceptMap",
  "id" : "CdaPQToQuantityConceptMap",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/CdaPQToQuantityConceptMap",
  "version" : "0.1.0",
  "name" : "CdaPQToFHIR",
  "title" : "ConceptMap — CDA PQ vers FHIR Quantity",
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
      "display" : "Maginitude Value",
      "target" : [{
        "code" : "Quantity.value",
        "display" : "Numerical value (with implicit precision)",
        "equivalence" : "equivalent",
        "comment" : "PQ.value alimente directement Quantity.value."
      }]
    },
    {
      "code" : "PQ.unit",
      "display" : "Unit of Measure",
      "target" : [{
        "code" : "Quantity.code",
        "display" : "Coded form of the unit",
        "equivalence" : "equivalent",
        "comment" : "Lorsque PQ.unit contient un code UCUM, il alimente Quantity.code."
      },
      {
        "code" : "Quantity.unit",
        "display" : "Unit representation",
        "equivalence" : "relatedto",
        "comment" : "PQ.unit peut être réutilisé comme représentation lisible de l’unité dans Quantity.unit selon la stratégie d’affichage retenue."
      },
      {
        "code" : "Quantity.system",
        "display" : "System that defines coded unit form",
        "equivalence" : "relatedto",
        "comment" : "Lorsque PQ.unit utilise UCUM, Quantity.system est fixé à http://unitsofmeasure.org."
      }]
    }]
  }]
}

```
