# OID to URI Mapping for ANS terminologies - POC - Mapping CDA to FHIR v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **OID to URI Mapping for ANS terminologies**

## ConceptMap: OID to URI Mapping for ANS terminologies 

| | |
| :--- | :--- |
| *Official URL*:http://hl7.org/fhir/ConceptMap/special-oid2uri | *Version*:0.1.0 |
| Active as of 2025-10-31 | *Computable Name*:OID2URIConceptMapANS |

 
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
      "display" : "FRANCE"
    }]
  }],
  "group" : [{
    "source" : "urn:oid:",
    "target" : "uri",
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
