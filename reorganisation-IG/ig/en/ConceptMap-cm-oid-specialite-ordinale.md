# ConceptMap - OID to URL for TRE_R38-SpecialiteOrdinale - Mapping CDA to FHIR (Preuve de concept) v0.1.0

## ConceptMap: ConceptMap - OID to URL for TRE_R38-SpecialiteOrdinale 

 
Mapping from OID urn:oid:1.2.250.1.213.1.1.4.5 to URL https://mos.esante.gouv.fr/NOS/TRE_R38-SpecialiteOrdinale/FHIR/TRE-R38-SpecialiteOrdinale 



## Resource Content

```json
{
  "resourceType" : "ConceptMap",
  "id" : "cm-oid-specialite-ordinale",
  "url" : "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/cm-oid-specialite-ordinale",
  "version" : "0.1.0",
  "name" : "ConceptMapOidSpecialiteOrdinale",
  "title" : "ConceptMap - OID to URL for TRE_R38-SpecialiteOrdinale",
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
  "description" : "Mapping from OID urn:oid:1.2.250.1.213.1.1.4.5 to URL https://mos.esante.gouv.fr/NOS/TRE_R38-SpecialiteOrdinale/FHIR/TRE-R38-SpecialiteOrdinale",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "FR",
      "display" : "France (la)"
    }]
  }],
  "sourceUri" : "urn:oid:1.2.250.1.213.1.1.4.5",
  "targetUri" : "https://mos.esante.gouv.fr/NOS/TRE_R38-SpecialiteOrdinale/FHIR/TRE-R38-SpecialiteOrdinale",
  "group" : [{
    "source" : "urn:oid:1.2.250.1.213.1.1.4.5",
    "target" : "https://mos.esante.gouv.fr/NOS/TRE_R38-SpecialiteOrdinale/FHIR/TRE-R38-SpecialiteOrdinale",
    "targetVersion" : "1.5.0",
    "element" : [{
      "code" : "urn:oid:1.2.250.1.213.1.1.4.5",
      "target" : [{
        "code" : "https://mos.esante.gouv.fr/NOS/TRE_R38-SpecialiteOrdinale/FHIR/TRE-R38-SpecialiteOrdinale",
        "equivalence" : "equivalent"
      }]
    }]
  }]
}

```
