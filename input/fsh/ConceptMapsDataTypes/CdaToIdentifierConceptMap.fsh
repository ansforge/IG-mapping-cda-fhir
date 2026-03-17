Instance: CdaToIdentifierConceptMap
InstanceOf: ConceptMap
Usage: #definition
Title: "ConceptMap — CDA II → FHIR Identifier"
Description: "Correspondances des éléments CDA II → FHIR Identifier (root, extension, assigner)."

* url = "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/DataTypes/CdaIIToIdentifier"
* name = "CdaIIToIdentifier"
* status = #draft
* experimental = true

* group[0].source = "http://hl7.org/cda/stds/core/StructureDefinition/II"
* group[0].target = "http://hl7.org/fhir/StructureDefinition/Identifier"

/* II.extension → Identifier.value */
* group[0].element[0].code = #II_extension
* group[0].element[0].target[0].code = #Identifier_value
* group[0].element[0].target[0].equivalence = #equivalent
