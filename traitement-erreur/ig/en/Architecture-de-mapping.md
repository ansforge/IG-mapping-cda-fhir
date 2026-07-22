# Architecture de mapping - Mapping CDA to FHIR (Preuve de concept) v0.1.0

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
| Country | Country (e.g. can be ISO 3166 2 or 3 letter code) |
| State | Sub-unit of country (abbreviations ok) |
| County | District name (aka county) |
| City | Name of city, town etc. |
| Postal Code | Postal code for area |
| Street Address Line | Street name, number, direction & P.O. Box etc. |
| Useable Period | Time period when address was/is in use |
| Street Name | Value of extension |
| House Number | Value of extension |
| BL.value | Primitive Type boolean |
| Code | Primitive Type code |
| Original Text | Plain text representation of the concept |
| Translation | Code defined by a terminology system |
| Code | Symbol in syntax defined by the system |
| Code System | Identity of the terminology system |
| Display Name | Representation defined by the system |
| Code | Primitive Type code |
| Code | Symbol in syntax defined by the system |
| Code | Primitive Type code |
| Original Text | Plain text representation of the concept |
| Translation | Code defined by a terminology system |
| Code | Symbol in syntax defined by the system |
| Code System | Identity of the terminology system |
| Display Name | Representation defined by the system |
| Extension | The value that is unique |
| Root | The namespace for the identifier value |
| Root | The value that is unique |
| Assigning Authority Name | Organization that issued id (may be just text) |
| Displayable | Additional content defined by implementations |
| Assigning Authority Name | Text alternative for the resource |
| INT.value | Primitive Type integer |
| Low Boundary | Starting time with inclusive boundary |
| High Boundary | End time with inclusive boundary, if not ongoing |
| IVXB_TS.value | Primitive Type dateTime |
| Family | Family name (often called 'Surname') |
| Given | Given names (not always 'first'). Includes middle names |
| Prefix | Parts that come before the name |
| Suffix | Parts that come after the name |
| Allows for mixed text content | Text representation of the full name |
| Valid Time | Time period when name was/is in use |
| Family | Family name (often called 'Surname') |
| Given | Given names (not always 'first'). Includes middle names |
| Prefix | Parts that come before the name |
| Suffix | Parts that come after the name |
| Allows for mixed text content | Text representation of the full name |
| Valid Time | Time period when name was/is in use |
| Maginitude Value | Numerical value (with implicit precision) |
| Unit of Measure | Coded form of the unit |
| Unit of Measure | Unit representation |
| Unit of Measure | System that defines coded unit form |
| Numerator | Numerator value |
| Denominator | Denominator value |
| Allows for mixed text content | Primitive Type string |
| Allows for mixed text content. If @representation='B64', this SHALL be a base64binary string. | Primitive Type string |
| Allows for mixed text content | Primitive Type string |
| TEL.value | The actual contact point details |
| TEL.value | phone | fax | email | pager | url | sms | other |
| Use Code | home | work | temp | old | mobile - purpose of this contact point |
| Useable Period | Time period when the contact point was/is in use |
| TS.value | Primitive Type instant |
| TS.value | Primitive Type dateTime |
| TS.value | Primitive Type date |

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

