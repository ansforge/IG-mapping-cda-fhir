
Instance: CM-CDA-INT-To-Integer
InstanceOf: ConceptMap
Title: "ConceptMap — CDA INT → FHIR integer"
Usage: #definition

* url = "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/DataTypes/CdaINTToInteger"
* name = "CdaINTToInteger"
* status = #draft
* experimental = true
* description = "Correspondances documentaires INT.value → integer."

* group[0].source = "http://hl7.org/cda/stds/core/StructureDefinition/INT"
* group[0].target = "http://hl7.org/fhir/StructureDefinition/integer"

/* Élément minimal obligatoire pour éviter l'erreur de cardinalité */
* group[0].element[0].code = "INT.value"
* group[0].element[0].target.code = "integer"
* group[0].element[0].target.relationship = #related-to
