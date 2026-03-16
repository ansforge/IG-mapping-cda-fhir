
Instance: CM-CDA-II-To-Identifier
InstanceOf: ConceptMap
Title: "ConceptMap — CDA II → FHIR Identifier"
Usage: #definition

* url = "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/DataTypes/CdaIIToIdentifier"
* name = "CdaIIToIdentifier"
* status = #draft
* experimental = true
* description = "Correspondances des éléments CDA II → FHIR Identifier (root, extension, assigner)."


* group[0].source = "http://hl7.org/cda/stds/core/StructureDefinition/II"
* group[0].target = "http://hl7.org/fhir/StructureDefinition/Identifier"

/* Élément minimal obligatoire */
* group[0].element[0].code = "II.extension"
* group[0].element[0].target.code = "Identifier.value"
* group[0].element[0].target.relationship = #related-to
