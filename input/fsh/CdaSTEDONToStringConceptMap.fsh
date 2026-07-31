Instance: CdaSTEDONToStringConceptMap
InstanceOf: ConceptMap
Usage: #definition
Title: "ConceptMap — CDA ST/ED/ON vers FHIR string"
Description: "Correspondances documentaires entre les datatypes CDA ST, ED et ON et le datatype FHIR string."

* url = "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/CdaSTEDONToStringConceptMap"
* name = "CdaStringTypesToFHIR"
* status = #draft
* experimental = true

// Groupe 0 : CDA ST vers FHIR string

* group[0].source = "http://hl7.org/cda/stds/core/StructureDefinition/ST"
* group[0].target = "http://hl7.org/fhir/StructureDefinition/string"

// ST.xmlText vers string

* group[0].element[0].code = #ST.xmlText
* group[0].element[0].display = "Allows for mixed text content"
* group[0].element[0].target[0].code = #string
* group[0].element[0].target[0].display = "Primitive Type string"
* group[0].element[0].target[0].equivalence = #equivalent
* group[0].element[0].target[0].comment = "Le contenu textuel du datatype CDA ST alimente directement le datatype primitif FHIR string."

// Groupe 1 : CDA ED vers FHIR string

* group[1].source = "http://hl7.org/cda/stds/core/StructureDefinition/ED"
* group[1].target = "http://hl7.org/fhir/StructureDefinition/string"

// ED.xmlText vers string

* group[1].element[0].code = #ED.xmlText
* group[1].element[0].display = "Allows for mixed text content. If @representation='B64', this SHALL be a base64binary string."
* group[1].element[0].target[0].code = #string
* group[1].element[0].target[0].display = "Primitive Type string"
* group[1].element[0].target[0].equivalence = #relatedto
* group[1].element[0].target[0].comment = "Le contenu textuel du datatype CDA ED peut être converti vers un string FHIR lorsque sa représentation est textuelle. Une représentation B64 nécessite une conversion adaptée au contenu encodé."

// Groupe 2 : CDA ON vers FHIR string

* group[2].source = "http://hl7.org/cda/stds/core/StructureDefinition/ON"
* group[2].target = "http://hl7.org/fhir/StructureDefinition/string"

// ON.item.xmlText vers string

* group[2].element[0].code = #ON.item.xmlText
* group[2].element[0].display = "Allows for mixed text content"
* group[2].element[0].target[0].code = #string
* group[2].element[0].target[0].display = "Primitive Type string"
* group[2].element[0].target[0].equivalence = #equivalent
* group[2].element[0].target[0].comment = "Le contenu textuel du nom d’organisation CDA ON alimente directement le datatype primitif FHIR string."
