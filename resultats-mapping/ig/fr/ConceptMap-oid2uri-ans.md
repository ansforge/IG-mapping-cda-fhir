# OID to URI Mapping for ANS terminologies - Mapping CDA to FHIR (Preuve de concept) v0.1.0

## ConceptMap: OID to URI Mapping for ANS terminologies 

 
Mapping from OID to URI for ANS terminologies 



## Resource Content

```json
{
  "resourceType" : "ConceptMap",
  "id" : "oid2uri-ans",
  "url" : "http://hl7.org/fhir/ConceptMap/special-oid2uri",
  "version" : "0.1.0",
  "name" : "OID2URIConceptMapANS",
  "title" : "OID to URI Mapping for ANS terminologies",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-10-31",
  "publisher" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
  "contact" : [{
    "name" : "Agence du Numérique en Santé (ANS) - 2-10 Rue d'Oradour-sur-Glane, 75015 Paris",
    "telecom" : [{
      "system" : "url",
      "value" : "https://esante.gouv.fr"
    }]
  }],
  "description" : "Mapping from OID to URI for ANS terminologies",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "FR",
      "display" : "France (la)"
    }]
  }],
  "group" : [{
    "source" : "urn:oid:",
    "target" : "uri",
    "targetVersion" : "4.0.1",
    "element" : [{
      "code" : "1.2.250.1.213.1.1.4.5",
      "target" : [{
        "code" : "https://mos.esante.gouv.fr/NOS/TRE_R38-SpecialiteOrdinale/FHIR/TRE-R38-SpecialiteOrdinale",
        "equivalence" : "equivalent"
      }]
    }]
  }]
}

```
