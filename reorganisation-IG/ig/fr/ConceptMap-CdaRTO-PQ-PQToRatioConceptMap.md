# ConceptMap — CDA RTO_PQ_PQ vers FHIR Ratio - POC - Mapping CDA to FHIR v0.1.0

## ConceptMap: ConceptMap — CDA RTO_PQ_PQ vers FHIR Ratio (Expérimental) 

 
Correspondances documentaires entre le datatype CDA RTO_PQ_PQ et le datatype FHIR Ratio. 



## Resource Content

```json
{
  "resourceType" : "ConceptMap",
  "id" : "CdaRTO-PQ-PQToRatioConceptMap",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/DataTypes/CdaRTOPQPQToFHIR",
  "version" : "0.1.0",
  "name" : "CdaRTOPQPQToFHIR",
  "title" : "ConceptMap — CDA RTO_PQ_PQ vers FHIR Ratio",
  "status" : "draft",
  "experimental" : true,
  "date" : "2026-07-07T12:36:21+00:00",
  "publisher" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
  "contact" : [{
    "name" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
    "telecom" : [{
      "system" : "url",
      "value" : "https://esante.gouv.fr"
    }]
  }],
  "description" : "Correspondances documentaires entre le datatype CDA RTO_PQ_PQ et le datatype FHIR Ratio.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "FR",
      "display" : "France (la)"
    }]
  }],
  "group" : [{
    "source" : "http://hl7.org/cda/stds/core/StructureDefinition/RTO_PQ_PQ",
    "target" : "http://hl7.org/fhir/StructureDefinition/Ratio",
    "targetVersion" : "4.0.1",
    "element" : [{
      "code" : "RTO_PQ_PQ.numerator",
      "display" : "RTO_PQ_PQ.numerator",
      "target" : [{
        "code" : "Ratio.numerator",
        "display" : "Ratio.numerator",
        "equivalence" : "relatedto",
        "comment" : "Le numérateur CDA est converti en Quantity via le mapping PQ -> Quantity, puis affecté à Ratio.numerator."
      }]
    },
    {
      "code" : "RTO_PQ_PQ.denominator",
      "display" : "RTO_PQ_PQ.denominator",
      "target" : [{
        "code" : "Ratio.denominator",
        "display" : "Ratio.denominator",
        "equivalence" : "relatedto",
        "comment" : "Le dénominateur CDA est converti en Quantity via le mapping PQ -> Quantity, puis affecté à Ratio.denominator."
      }]
    }]
  }]
}

```
