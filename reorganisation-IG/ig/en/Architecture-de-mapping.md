# Architecture de mapping - POC - Mapping CDA to FHIR v0.1.0

## Architecture de mapping

 
There is no translation page available for the current page, so it has been rendered in the default language 

### Introduction

Le mapping CDA vers FHIR à l’aide du FHIR Mapping Language peut être organisé selon différentes méthodes. Dans le cadre de cette preuve de concept, le choix a été fait de retenir une structuration en quatre couches, en s’inspirant notamment des travaux d’Oliver Egger sur les mappings CDA vers FHIR. Cette structuration distingue les différents niveaux du mapping : conversion des types de données, socle générique CDA vers FHIR, prise en compte des spécifications françaises et européennes, puis mapping spécifique du document Patient Summary.

### Structure générale

Les mappings CDA vers FHIR sont organisés en couches afin de séparer les responsabilités et de faciliter la réutilisation des transformations. Chaque couche couvre un niveau précis du mapping et s’appuie sur les couches inférieure.

### Description des couches de mapping

#### Mappings de conversion des types

Le fichier principal de cette couche est CdaToFHIRTypes.fml. Cette couche regroupe les mappings de conversion des types de données CDA vers les types de données FHIR. Dans le contexte CDA, les datatypes représentent les structures élémentaires utilisées pour porter l’information dans le document : identifiants, noms, adresses, codes, dates, quantités, coordonnées de contact, etc. Avant de transformer un document CDA en ressources FHIR, il est donc nécessaire de convertir correctement ces types sources vers leurs équivalents FHIR. Elle constitue le socle commun de l’ensemble des autres mappings. Elle ne contient ni logique métier, ni logique nationale, ni navigation dans la structure du document CDA : son objectif est uniquement d’assurer la correspondance entre les types techniques manipulés dans les mappings.

| | |
| :--- | :--- |
| CDA | FHIR |
| AD.item.country | Address.country |
| AD.item.state | Address.state |
| AD.item.county | Address.district |
| AD.item.city | Address.city |
| AD.item.postalCode | Address.postalCode |
| AD.item.streetAddressLine | Address.line |
| AD.item.streetName | Address.line.extension[http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName].valueString |
| AD.item.houseNumber | Address.line.extension[http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber].valueString |
| AD.useablePeriod | Address.period |
| BL.value | boolean |
| CE.code | code |
| CE.originalText | CodeableConcept.text |
| CE.code | CodeableConcept.coding.code |
| CE.codeSystem | CodeableConcept.coding.system |
| CE.displayName | CodeableConcept.coding.display |
| CE.translation | CodeableConcept.coding (translation) |
| CS.code | code |
| CS.code | CodeableConcept.coding.code |
| CD.code | code |
| CD.originalText | CodeableConcept.text |
| CD.code | CodeableConcept.coding.code |
| CD.codeSystem | CodeableConcept.coding.system |
| CD.displayName | CodeableConcept.coding.display |
| CD.translation | CodeableConcept.coding (translation) |
| II.extension | Identifier.value |
| II.root | Identifier.system |
| II.root | Identifier.value |
| II.assigningAuthorityName | Identifier.assigner.display |
| II.displayable | Identifier.extension(displayable) |
| INT.value | integer |
| IVL_TS.low.value | Period.start |
| IVL_TS.high.value | Period.end |
| IVL_TS.low.value | dateTime |
| EN.family | HumanName.family |
| EN.given | HumanName.given |
| EN.prefix | HumanName.prefix |
| EN.suffix | HumanName.suffix |
| EN.xmlText | HumanName.text |
| EN.validTime | HumanName.period |
| PN.family | HumanName.family |
| PN.given | HumanName.given |
| PN.prefix | HumanName.prefix |
| PN.suffix | HumanName.suffix |
| PN.xmlText | HumanName.text |
| PN.validTime | HumanName.period |
| PQ.value | Quantity.value |
| PQ.unit | Quantity.code |
| PQ.unit | Quantity.unit |
| PQ.unit | Quantity.system |
| RTO_PQ_PQ.numerator | Ratio.numerator |
| RTO_PQ_PQ.denominator | Ratio.denominator |
| ST.xmlText | string |
| ED.xmlText | string |
| ON.xmlText | string |
| TEL.value | ContactPoint.value |
| TEL.value | ContactPoint.system |
| TEL.use | ContactPoint.use |
| TEL.useablePeriod | ContactPoint.period |
| TS.value | instant |
| TS.value | dateTime |
| TS.value | date |

#### Mappings CDA génériques

Le fichier principal de cette couche est `CdaToBundle.fml`.

Cette couche porte le mapping générique de la structure commune d’un document CDA vers un Bundle FHIR, en s’appuyant sur les transformations de types définies dans la couche inférieure (`CdaToFHIRTypes`).

Elle traite principalement les éléments transverses du document, en particulier l’en-tête CDA, ainsi qu’une structure de base du corps du document.

Les transformations couvertes dans cette couche incluent par exemple :

* la création du `Bundle` FHIR à partir du `ClinicalDocument` CDA ;
* le mapping de `recordTarget` CDA vers la ressource `Patient` ;
* le mapping de `custodian` CDA vers la ressource `Organization` ;
* le mapping de `author` CDA vers les ressources `Practitioner`, `PractitionerRole` ou `Organization` ;
* le mapping de `legalAuthenticator` CDA vers `Composition.attester` ;
* le mapping de `encounterContext` CDA vers les ressources `Encounter` et `Location` ;
* le mapping de `documentationOf` CDA vers `Composition.event` ;
* le mapping des acteurs et des structures impliqués dans le document CDA vers les ressources `Practitioner`, `PractitionerRole` et `Organization` ;
* la gestion des identifiants techniques et des références internes au `Bundle` ;
* la reprise de la structure des sections CDA dans `Composition.section`.*

Cette couche implémente donc le socle commun de transformation CDA → FHIR, indépendant des contraintes nationales et des règles métier spécifiques.

#### Spécifications européennes et françaises

Le fichier principal de cette couche est `CdaFrToBundle.fml`.

Cette couche reprend le mapping documentaire générique produit par `CdaToBundle.fml` afin d’y intégrer les spécifications européennes et françaises applicables au `Patient Summary`.

Les spécifications européennes concernent principalement les ressources documentaires structurantes, à savoir le `Bundle` et la `Composition`. L’objectif est de rapprocher la structure FHIR produite des exigences du profil européen `HL7 Europe Patient Summary (EPS)`, actuellement en cours de concertation .

Les spécifications françaises s’appliquent aux ressources génériques déjà produites à partir de l’en-tête CDA et référencées par le `Bundle` ou la `Composition`. Elles s’appuient principalement sur les guides d’implémentation français `FR Core` et `Annuaire Santé`, afin d’ajouter les profils, identifiants, terminologies et extensions requis dans le contexte français.

Cette couche complète donc le socle commun CDA vers FHIR sans redéfinir le mapping générique réalisé dans la couche précédente. Elle ne traite pas le corps du document CDA. Les sections cliniques seront prises en charge dans la couche de mappings spécifiques métier.

Cette couche constitue une étape d’enrichissement du socle commun CDA vers FHIR. Elle complète le mapping générique établi à l’étape 2 en y intégrant les spécifications françaises et européennes. Le mapping des sections cliniques sera, quant à lui, abordé lors de l’étape 4.

#### Mappings spécifiques métier : Patient Summary

Le fichier principal de cette couche est `CdaPatientSummaryToBundle.fml`.

Cette couche correspond au mapping spécifique métier du `Patient Summary`. Elle réutilise le socle documentaire générique déjà enrichi par les spécifications françaises et européennes, notamment pour l’en-tête CDA, puis ajoute les règles nécessaires au mapping du contenu clinique porté par le corps du document.

Pour le corps CDA, cette couche s’appuie sur la structure documentaire initialisée dans les couches précédentes, en particulier la reprise des sections dans `Composition.section`. Elle complète ce premier niveau descriptif par le mapping des contenus cliniques présents dans les sections du `Patient Summary`.

Le mapping réalisé à ce niveau concerne notamment :

* l’identification des sections propres au `Patient Summary`, comme les problèmes de santé, les allergies et intolérances, les traitements, les antécédents familiaux, les vaccinations, les actes, les effets indésirables, les signes vitaux, le mode de vie, les risques professionnels et les résultats ;
* l’accès aux `entry` présentes dans ces sections ;
* le mapping des éléments cliniques contenus dans ces `entry` ;
* l’extraction des données cliniques portées par ces éléments ;
* le mapping de ces données vers les ressources FHIR métier adaptées, par exemple `Condition`, `AllergyIntolerance`, `MedicationStatement`, `Procedure`, `Immunization` ou `Observation` ;
* le rattachement des ressources métier aux sections correspondantes de la `Composition`, afin de conserver l’organisation documentaire du `Patient Summary` ;

Cette couche complète ainsi le mapping du corps du document CDA en ajoutant les règles nécessaires à la représentation FHIR des données cliniques propres au `Patient Summary`.

> Remarque : Pour les couches — mappings CDA génériques, spécifications françaises et mappings spécifiques métier — les correspondances détaillées CDA et FHIR sont à consulter dans le guide d’implémentation Document Core : `https://ansforge.github.io/interop-IG-document-core/main/ig/`. Ce guide présente de manière structurée les correspondances entre modèle logique, CDA et FHIR

### Réutilisation entre les couches

Les couches de mapping sont construites de manière progressive. Chaque couche réutilise les mappings définis dans les couches inférieures à l’aide du mécanisme `imports`, puis ajoute les transformations correspondant à son propre niveau de spécialisation.

Cette organisation permet : *de mutualiser les transformations communes ; *d’éviter la duplication des règles ; *d’isoler les spécificités génériques, nationales et métier dans des couches distinctes.

### Synthèse

La structuration du mapping en couches permet de générer un socle générique CDA vers FHIR, puis de l’enrichir progressivement en fonction des spécifications françaises et européennes. Cette organisation favorise la réutilisation des règles communes, la maintenabilité du mapping et son adaptation aux évolutions futures des profils et des contraintes d’implémentation.

### Ressources complémentaires

* [CDA to FHIR Maps (HL7 Suisse)](https://github.com/hl7ch/cda-fhir-maps)

