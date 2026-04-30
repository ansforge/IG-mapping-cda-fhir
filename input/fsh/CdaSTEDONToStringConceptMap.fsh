Instance: CdaSTEDONToStringConceptMap
InstanceOf: ConceptMap
Usage: #definition
Title: "ConceptMap — CDA ST/ED/ON vers FHIR string"
Description: "Correspondances documentaires entre les datatypes CDA ST, ED et ON et le datatype FHIR string."

* url = "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/DataTypes/CdaStringTypesToFHIR"
* name = "CdaStringTypesToFHIR"
* status = #draft
* experimental = true


// Group 0 — ST -> string
* group[0].source = "http://hl7.org/cda/stds/core/StructureDefinition/ST"
* group[0].target = "http://hl7.org/fhir/StructureDefinition/string"

/* ST.xmlText -> string */
* group[0].element[0].code = #ST.xmlText
* group[0].element[0].display = "ST.xmlText"
* group[0].element[0].target[0].code = #string
* group[0].element[0].target[0].display = "string"
* group[0].element[0].target[0].equivalence = #equivalent
* group[0].element[0].target[0].comment = "Le texte CDA ST (xmlText) alimente directement un string FHIR."

// Group 1 — ED -> string
* group[1].source = "http://hl7.org/cda/stds/core/StructureDefinition/ED"
* group[1].target = "http://hl7.org/fhir/StructureDefinition/string"

/* ED.xmlText -> string */
* group[1].element[0].code = #ED.xmlText
* group[1].element[0].display = "ED.xmlText"
* group[1].element[0].target[0].code = #string
* group[1].element[0].target[0].display = "string"
* group[1].element[0].target[0].equivalence = #relatedto
* group[1].element[0].target[0].comment = "Le contenu textuel CDA ED (xmlText) peut être converti en string FHIR selon le contexte (texte, base64, etc.)."



// Group 2 — ON -> string
* group[2].source = "http://hl7.org/cda/stds/core/StructureDefinition/ON"
* group[2].target = "http://hl7.org/fhir/StructureDefinition/string"

/* ON.xmlText -> string */
* group[2].element[0].code = #ON.xmlText
* group[2].element[0].display = "ON.xmlText"
* group[2].element[0].target[0].code = #string
* group[2].element[0].target[0].display = "string"
* group[2].element[0].target[0].equivalence = #equivalent
* group[2].element[0].target[0].comment = "Le texte CDA ON (xmlText) alimente directement un string FHIR."
