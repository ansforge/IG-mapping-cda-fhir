
Instance: CdaToAddressConceptMap
InstanceOf: ConceptMap
Usage: #definition
Title: "ConceptMap — CDA AD → FHIR Address"
Description: "Correspondances documentaires des composants AD vers Address."

* url = "https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/ConceptMap/DataTypes/CdaAddressToFHIR"
* name = "CdaAddressToFHIR"
* status = #draft
* experimental = true

* group[0].source = "http://hl7.org/cda/stds/core/StructureDefinition/AD"
* group[0].target = "http://hl7.org/fhir/StructureDefinition/Address"

/* AD.part → Address.line */
* group[0].element[0].code = #AD_part
* group[0].element[0].target[0].code = #Address_line
* group[0].element[0].target[0].equivalence = #equivalent


//voir  si je pourrai ajouter plus de détail dans chaque datatype
