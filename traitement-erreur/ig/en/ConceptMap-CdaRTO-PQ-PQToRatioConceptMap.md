# ConceptMap — CDA RTO_PQ_PQ vers FHIR Ratio - Mapping CDA to FHIR (Preuve de concept) v0.1.0

## ConceptMap: ConceptMap — CDA RTO_PQ_PQ vers FHIR Ratio (Experimental) 

 
Correspondances documentaires entre le datatype CDA RTO_PQ_PQ et le datatype FHIR Ratio. 



## Resource Content

```json
{
  "resourceType" : "ConceptMap",
  "id" : "CdaRTO-PQ-PQToRatioConceptMap",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/CdaRTO-PQ-PQToRatioConceptMap",
  "version" : "0.1.0",
  "name" : "CdaRTOPQPQToFHIR",
  "title" : "ConceptMap — CDA RTO_PQ_PQ vers FHIR Ratio",
  "status" : "draft",
  "experimental" : true,
  "date" : "2026-07-23T08:59:18+00:00",
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
    "source" : "http://hl7.org/cda/stds/core/StructureDefinition/RTO-PQ-PQ",
    "sourceVersion" : "2.0.0-sd",
    "target" : "http://hl7.org/fhir/StructureDefinition/Ratio",
    "targetVersion" : "4.0.1",
    "element" : [{
      "code" : "RTO_PQ_PQ.numerator",
      "display" : "Numerator",
      "target" : [{
        "code" : "Ratio.numerator",
        "display" : "Numerator value",
        "equivalence" : "relatedto",
        "comment" : "Le numérateur CDA est converti en Quantity à l’aide du mapping PQ vers Quantity, puis affecté à Ratio.numerator."
      }]
    },
    {
      "code" : "RTO_PQ_PQ.denominator",
      "display" : "Denominator",
      "target" : [{
        "code" : "Ratio.denominator",
        "display" : "Denominator value",
        "equivalence" : "relatedto",
        "comment" : "Le dénominateur CDA est converti en Quantity à l’aide du mapping PQ vers Quantity, puis affecté à Ratio.denominator."
      }]
    }]
  }]
}

```
