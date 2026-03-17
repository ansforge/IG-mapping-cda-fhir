# Technique de transformation CDA → FHIR : cda2fhir (SRDC)

## Source
Projet open source cda2fhir publié par SRDC (Turquie) – GitHub : https://github.com/srdc/cda2fhir

## Présentation
La librairie cda2fhir est un composant Java permettant la conversion automatique de documents HL7 CDA R2 / C CDA 2.1 vers des ressources FHIR DSTU2.
Elle implémente des règles issues du DAF FHIR Implementation Guide, ancien guide HL7/ONC ayant défini des profils FHIR et des modalités d’accès standardisé aux données cliniques essentielles. 
La librairie s’appuie sur plusieurs briques techniques :
- MDHT pour le parsing et la manipulation CDA 
- Transformers Java pour appliquer les règles de mapping CDA → FHIR
- HAPI FHIR pour produire les ressources et générer les narratifs 
- HL7 FHIR Validator pour valider le Bundle généré selon les profils DAF 
Les correspondances CDA → FHIR sont publiées dans une feuille Google Sheets fournie par le projet. 

## Principe de fonctionnement
La transformation repose sur un enchaînement logique en plusieurs étapes :
1. Chargement des modèles CDA via MDHT afin de lire correctement le document source.
2. Parsing du CDA pour obtenir un modèle objet Java (ClinicalDocument).
3. Transformation documentaire : conversion du CDA complet en Bundle FHIR comportant une Composition et l’ensemble des ressources nécessaires (Patient, Observation, Medication, etc.).
4. Transformation unitaire : possibilité d’appliquer des transformers sur des entrées spécifiques (ex. FamilyHistory → FamilyMemberHistory).
5. Génération FHIR (JSON/XML) grâce à HAPI.
6. Validation FHIR via le validateur HL7.

## Avantages
- Automatisation complète : conversion d’un document CDA complet sans développement manuel supplémentaire.
- Fonctionne sur des standards HL7 existants (MDHT, DAF), ce qui assure une cohérence dans la lecture et la structuration des données.
- Architecture modulaire permettant d’étendre ou d’ajuster les mappings.
- Validation intégrée avec le validateur HL7 pour garantir la conformité FHIR.
- Transparence des mappings grâce à la feuille de correspondance publique.

## Limites
- Basé sur FHIR DSTU2, une version obsolète et incompatible avec R4/R5.
- Dépendance à MDHT, technologie aujourd’hui archivée et non maintenue.
- Terminology servers DSTU2 rares, rendant certaines validations difficiles.
- Orienté C CDA / DAF, donc principalement adapté au contexte américain et peu pertinent pour les besoins nationaux.