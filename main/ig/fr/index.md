# Accueil - POC - Mapping CDA to FHIR v0.1.0

## Accueil

 **FHIR Mapping Language for CDA to FHIR transformation**
 Proof of concept for CDA to FHIR transformation 

> Cet Implementation Guide n'est pas la version courante, il s'agit de la version en intégration continue, soumise à des changements fréquents et uniquement destinée à suivre les travaux en cours. La version courante sera accessible via l'URL canonique suite à la première release : http://interop.esante.gouv.fr/ig/fhir/[code - ig]

### Introduction

Dans le cadre de l’Espace Européen des Données de Santé (EEDS), l’Union européenne souhaite harmoniser les formats d’échange de données de santé en favorisant l’adoption du standard FHIR.

L'Europe a identifié six cas d’usage prioritaires :

* Compte rendu de biologie ;
* ePrescription ;
* eDispensation ;
* Compte rendu d’hospitalisation ;
* Résumé patient ;
* Compte rendu d’imagerie.

L’ANS s’inscrit dans cette dynamique afin d’assurer une transition cohérente du CDA Fr vers FHIR, en garantissant la compatibilité avec le CI-SIS et les exigences européennes.

### Objectifs du guide

Ce guide a pour objectifs de :

* proposer une preuve de concept de mapping CDA → FHIR appliquée à un document de type Patient Summary, à l’aide du FHIR Mapping Language ;
* produire un Bundle FHIR conforme à la structure attendue en Europe ;
* intégrer les spécifications françaises ;
* permettre l’exécution du mapping via Matchbox ;
* fournir les artefacts FHIR nécessaires (StructureMap et ConceptMap) ;

Ce guide constitue un travail exploratoire, servant de base aux travaux de convergence FHIR futurs.

### Recensement des ressources internationales de mapping CDA – FHIR

Dans le cadre de la transition du CDA vers FHIR, il est essentiel de s’appuyer sur les travaux déjà publiés au niveau international. Le recensement des ressources existantes permet d’identifier les correspondances déjà documentées, d’éviter la duplication de travaux lorsqu’une correspondance est disponible, et de favoriser l’harmonisation avec les orientations européennes, notamment dans la perspective du futur EEDS.

Les ressources présentées ci‑après constituent des références informatives utiles pour éclairer la transformation du CDA vers FHIR et pour accompagner la construction d’un mapping cohérent, aligné avec l’écosystème HL7 et les exigences du CI-SIS.

#### HL7 – C-CDA on FHIR Mapping Guidance

Cette ressource, publiée par HL7 International, propose une analyse détaillée des correspondances entre les modèles C‑CDA (Consolidated Clinical Document Architecture) – un ensemble structuré de modèles de documents cliniques basé sur CDA R2 et utilisé dans le contexte américain – et les ressources FHIR.

**Périmètre et contenu :**

* présentation des correspondances conceptuelles entre sections, entrées et éléments C CDA et leurs équivalents dans FHIR ;
* principes méthodologiques généraux pour guider la conversion ;
* recommandations techniques applicables dans différents cas d’usage (biologie, prescriptions, imagerie, etc.) ;
* identification des écarts de granularité, de structure ou de sémantique entre les deux standards.

**Intérêt pour les travaux français :** Cette ressource constitue un appui solide pour :

* contextualiser les choix de mapping retenus dans le cadre du CI-SIS ;
* identifier les correspondances déjà reconnues internationalement ;
* garantir une cohérence globale avec l’approche HL7 ;
* faciliter l’évolution future vers les exigences européennes EEDS.

**Référence :**
 https://build.fhir.org/ig/HL7/ccda-on-fhir/mappingGuidance.html

#### HL7 FHIR

Le site officiel FHIR inclut, sur de nombreuses ressources et types de données, une section « Mappings » indiquant les équivalents potentiels dans d’autres standards, dont le CDA.

**Périmètre et contenu :**

* correspondances proposées entre une ressource FHIR R4 (ex. Observation, Encounter, Medication, Practitioner…) et les éléments CDA associés ;
* indications également disponibles pour certains datatypes tels que CodeableConcept, Identifier, HumanName, etc. ;
* visibilité sur les zones de correspondance directe ainsi que sur les écarts conceptuels.

**Intérêt pour les travaux français :** Ces mappings constituent un outil utile pour :

* analyser les équivalences conceptuelles proposées par HL7 ;
* valider ou enrichir les correspondances établies dans le cadre du CI-SIS ;
* harmoniser les travaux nationaux avec les modèles FHIR internationaux ;
* réduire les divergences d’interprétation lors de la construction du mapping CDA → FHIR.

**Référence :**
 https://hl7.org/fhir/R4/

### Dépendances









### Propriété intellectuelle

Certaines ressources sémantiques de ce guide sont protégées par des droits de propriété intellectuelle couverte par les déclarations ci-dessous. L’utilisation de ces ressources est soumise à l’acceptation et au respect des conditions précisées dans la licence d’utilisation de chacune d’entre elle.

* ISO maintains the copyright on the country codes, and controls its use carefully. For further details see the ISO 3166 web page: [https://www.iso.org/iso-3166-country-codes.html](https://www.iso.org/iso-3166-country-codes.html)

* [ISO 3166-1 Codes for the representation of names of countries and their subdivisions — Part 1: Country code](http://terminology.hl7.org/6.2.0/CodeSystem-ISO3166Part1.html): [CDA2FHIRMAP](index.md), [CdaAddressToFHIR](ConceptMap-CdaADToAddressConceptMap.md)... Show 18 more, [CdaBLToFHIR](ConceptMap-CdaBLToBooleanConceptMap.md), [CdaConceptCodesToFHIR](ConceptMap-CdaCECSCDToCodeConceptMap.md), [CdaFrMDEToBundle](StructureMap-CdaFrMDEToBundle.md), [CdaFrToBundle](StructureMap-CdaFrToBundle.md), [CdaIIToIdentifier](ConceptMap-CdaIIToIdentifierConceptMap.md), [CdaINTToInteger](ConceptMap-CdaINTToIntegerConceptMap.md), [CdaIVL_TSToFHIR](ConceptMap-CdaIVL-TSToPeriodConceptMap.md), [CdaNamesToFHIR](ConceptMap-CdaENPNToHumanNameConceptMap.md), [CdaPQToFHIR](ConceptMap-CdaPQToQuantityConceptMap.md), [CdaRTOPQPQToFHIR](ConceptMap-CdaRTO-PQ-PQToRatioConceptMap.md), [CdaStringTypesToFHIR](ConceptMap-CdaSTEDONToStringConceptMap.md), [CdaTELToFHIR](ConceptMap-CdaTELToContactPointConceptMap.md), [CdaTSToFHIR](ConceptMap-CdaTSToDateTimeConceptMap.md), [CdaToBundle](StructureMap-CdaToBundle.md), [CdaToFHIRTypes](StructureMap-CdaToFHIRTypes.md), [CdaToFhirAdministrativeGender](ConceptMap-cm-v3-administrative-gender.md), [ConceptMapOidSpecialiteOrdinale](ConceptMap-cm-oid-specialite-ordinale.md) and [OID2URIConceptMapANS](ConceptMap-oid2uri-ans.md)


* The UCUM codes, UCUM table (regardless of format), and UCUM Specification are copyright 1999-2009, Regenstrief Institute, Inc. and the Unified Codes for Units of Measures (UCUM) Organization. All rights reserved. [https://ucum.org/trac/wiki/TermsOfUse](https://ucum.org/trac/wiki/TermsOfUse)

* [Unified Code for Units of Measure (UCUM)](http://terminology.hl7.org/6.2.0/CodeSystem-v3-ucum.html): [Bundle/fe569e1f-32d4-4ba4-b5ad-88082bf5470a](Bundle-fe569e1f-32d4-4ba4-b5ad-88082bf5470a.md)


* This material derives from the HL7 Terminology (THO). THO is copyright ©1989+ Health Level Seven International and is made available under the CC0 designation. For more licensing information see: [https://terminology.hl7.org/license.html](https://terminology.hl7.org/license.html)

* [Observation Category Codes](http://terminology.hl7.org/7.2.0/CodeSystem-observation-category.html): [Bundle/fe569e1f-32d4-4ba4-b5ad-88082bf5470a](Bundle-fe569e1f-32d4-4ba4-b5ad-88082bf5470a.md)
* [identifierType](http://terminology.hl7.org/7.2.0/CodeSystem-v2-0203.html): [Bundle/fe569e1f-32d4-4ba4-b5ad-88082bf5470a](Bundle-fe569e1f-32d4-4ba4-b5ad-88082bf5470a.md)
* [ActCode](http://terminology.hl7.org/7.2.0/CodeSystem-v3-ActCode.html): [Bundle/fe569e1f-32d4-4ba4-b5ad-88082bf5470a](Bundle-fe569e1f-32d4-4ba4-b5ad-88082bf5470a.md)


