<p style="padding: 5px; border-radius: 5px; border: 2px solid maroon; background: #ffffe6; width: 65%">
<b>FHIR Mapping Language for CDA to FHIR transformation</b><br>
Proof of concept for CDA to FHIR transformation
</p>

{% if site.data.info.releaselabel == 'ci-build' %}
<div style="width: 65%">
    <blockquote class="stu-note">
    <p>Cet Implementation Guide n'est pas la version courante, il s'agit de la version en intégration continue soumise à des changements fréquents uniquement destinée à suivre les travaux en cours. La version courante sera accessible via l'URL canonique suite à la première release : http://interop.esante.gouv.fr/ig/fhir/[code - ig]</p>
    </blockquote>
</div>
{% endif %}


{% if site.data.info.releaselabel == 'public-comment' %}
<div style="width: 65%">
<blockquote class="stu-note">
<p>
  <b>Attention !</b>
  <br>
 Cet Implementation Guide est actuellement en concertation. La version courante est accessible à l'adresse : http://interop.esante.gouv.fr/ig/fhir/[code - ig]
</p>
</blockquote>
</div>
{% endif %}


<!--  A décommenter si CI-SIS
<div class="figure">
    <img src="ci-sis-logo.png" alt="CI-SIS" title="Logo du CI-SIS" style="width:100%;">
</div>
-->

### Introduction

Dans le cadre de l'Espace Européen des Données de Santé, l'ANS a entrepris des travaux pour anticiper la transition CDA vers FHIR dans le cadre des 5 cas d'usages priorisés par l'Europe : le compte rendu de biologie, la ePrescription et eDispensiation, le compte rendu d'hospitalisation, le résumé patient et le compte rendu d'imagerie.

Les travaux de l'ANS se distinguent en deux parties :

* créer les spécifications françaises en FHIR qui reprend l'historique CDA tout en s'alignant avec les contraintes européennes (cf. https://github.com/ansforge/IG-document-core)
* tester le FHIR Mapping Language, outil permettant la transformation des documents CDA vers FHIR.

### Guide de démarrage rapide (Quick Start)

Ce guide vous permet de tester rapidement la transformation de documents CDA vers FHIR en utilisant matchbox et les exemples fournis.

#### Prérequis

* Docker installé sur votre machine
* Un client REST (ex: VS Code avec l'extension REST Client, IntelliJ IDEA, ou curl)
* Accès au repository IG-mapping-cda-fhir

#### Étape 1 : Télécharger l'image Docker matchbox

```bash
docker pull europe-west6-docker.pkg.dev/ahdis-ch/ahdis/matchbox:v4.0.12
```

#### Étape 2 : Lancer le conteneur Docker

**Important** : Adaptez le chemin selon votre installation locale. Le chemin doit pointer vers le dossier `input/with-all` de votre projet.

```bash
docker run -d --name matchbox -p 8080:8080 \
  -v /chemin/absolu/vers/IG-mapping-cda-fhir/input/with-all:/config \
  europe-west6-docker.pkg.dev/ahdis-ch/ahdis/matchbox:v4.0.12
```

Exemple concret :

```bash
docker run -d --name matchbox -p 8080:8080 \
  -v /Users/nicolasriss/Desktop/ANSFORGE_ans-ig/1-Mapping-CDA-to-FHIR/IG-mapping-cda-fhir/input/with-all:/config \
  europe-west6-docker.pkg.dev/ahdis-ch/ahdis/matchbox:v4.0.12
```

**Ou utilisez le script de démarrage automatique** :

```bash
./start-matchbox.sh
```


#### Étape 3 : Vérifier le démarrage

Pour suivre les logs de matchbox :

```bash
docker logs --follow matchbox
```

Attendez que matchbox ait terminé son démarrage. L'interface sera accessible sur : `http://localhost:8080/matchbox`

#### Étape 4 : Charger les ConceptMaps

Certains StructureMaps utilisent des ConceptMaps externes pour la traduction de codes terminologiques. Il faut les charger **avant** les StructureMaps.

```bash
# Charger le ConceptMap pour le genre (administrative-gender)
curl -X POST http://localhost:8080/matchbox/fhir/ConceptMap \
  -H "Content-Type: application/fhir+json" \
  --data-binary @input/resources/ConceptMap-cm-v3-administrative-gender.json
```

#### Étape 5 : Charger les StructureMaps et lancer les transformations

Les fichiers HTTP de test se trouvent dans le dossier `http-test/`. Utilisez le fichier `fr_cdatofhir_mde.http` avec votre client REST.

**Avec VS Code et l'extension REST Client** :

1. Ouvrez le fichier `http-test/fr_cdatofhir_mde.http`
2. Exécutez séquentiellement les requêtes HTTP dans l'ordre suivant :
   * **Requête 0** : Charger ConceptMap-cm-v3-administrative-gender.json
   * **Requête 1** : Charger CDAtoFHIRTypes.fml
   * **Requête 2** : Charger CdaToBundle.fml
   * **Requête 3** : Charger CDAFrToBundle.fml
   * **Requête 4** : Charger CDAFrMDEToBundle.fml
   * **Requête 5** : Transformer CSE-MDE_2023.01.xml (sortie JSON)
3. Cliquez sur "Send Request" au-dessus de chaque requête

**Avec curl** (exemple complet) :

```bash
# 1. Charger les ConceptMaps nécessaires
curl -X POST http://localhost:8080/matchbox/fhir/ConceptMap \
  -H "Content-Type: application/fhir+json" \
  --data-binary @input/resources/ConceptMap-cm-v3-administrative-gender.json

# 2. Charger les StructureMaps dans l'ordre
curl -X POST http://localhost:8080/matchbox/fhir/StructureMap \
  -H "Accept: application/fhir+xml;fhirVersion=4.0" \
  -H "Content-Type: text/fhir-mapping" \
  --data-binary @input/fml/CDAtoFHIRTypes.fml

curl -X POST http://localhost:8080/matchbox/fhir/StructureMap \
  -H "Accept: application/fhir+xml;fhirVersion=4.0" \
  -H "Content-Type: text/fhir-mapping" \
  --data-binary @input/fml/CdaToBundle.fml

curl -X POST http://localhost:8080/matchbox/fhir/StructureMap \
  -H "Accept: application/fhir+xml;fhirVersion=4.0" \
  -H "Content-Type: text/fhir-mapping" \
  --data-binary @input/fml/CDAFrToBundle.fml

curl -X POST http://localhost:8080/matchbox/fhir/StructureMap \
  -H "Accept: application/fhir+xml;fhirVersion=4.0" \
  -H "Content-Type: text/fhir-mapping" \
  --data-binary @input/fml/CDAFrMDEToBundle.fml

# 3. Transformer un document CDA
curl -X POST "http://localhost:8080/matchbox/fhir/StructureMap/\$transform?source=https://interop.esante.gouv.fr/ig/fhir/mappingcdafhir/StructureMap/CdaFrMDEToBundle" \
  -H "Accept: application/fhir+json;fhirVersion=4.0" \
  -H "Content-Type: application/fhir+xml;fhirVersion=4.0" \
  --data-binary @input/attachments/CSE-MDE_2023.01.xml
```

#### Exemple CDA disponible

Le dossier `input/attachments/` contient un exemple de document CDA français :

* **CSE-MDE_2023.01.xml** : Carnet de santé de l'enfant - Mesures (3 observations : Poids, Taille, Périmètre crânien)

#### Résultat attendu

Si la transformation réussit, vous obtiendrez un Bundle FHIR contenant les ressources converties depuis le document CDA.

**Note importante** : Il peut y avoir des erreurs dans les fichiers FML lors de la transformation. L'objectif de ce POC est de valider le processus de transformation. Les erreurs dans les mappings seront traitées ultérieurement.

### Résultats des transformations

Les transformations CDA-FHIR ont été exécutées avec les résultats suivants :

#### Transformation réussie

| Fichier source | StructureMap utilisé | Fichier résultat | Ressources FHIR | Observations | Statut |
|---------------|---------------------|------------------|----------------|-------------|--------|
| CSE-MDE_2023.01.xml | [CdaFrMDEToBundle](StructureMap-CdaFrMDEToBundle.html) | [Bundle-fe569e1f-32d4-4ba4-b5ad-88082bf5470a.json](Bundle-fe569e1f-32d4-4ba4-b5ad-88082bf5470a.html) | 11 | 3 | ✅ Succès complet |

**Détails de la transformation :**

**Document CSE-MDE (Carnet de Santé de l'Enfant - Mesures)** :

- **StructureMap utilisé** : `CdaFrMDEToBundle` - Mapping spécifique pour le contexte français
- **Imports** : Utilise `CdaToFHIRTypes`, `CdaToBundle` et `CdaFrToBundle`
- **Ressources générées** (11 au total) :
  * 1 Composition (métadonnées du document)
  * 1 Patient (avec identifiant INS-NIR, nom, genre, date de naissance)
  * 1 Encounter (contexte de la rencontre)
  * 1 Location (lieu de la consultation)
  * 2 Practitioner (praticiens impliqués)
  * 2 Organization (organisations de santé)
  * 3 Observations :
    - Poids (29463-7) = 3900 g
    - Taille (8302-2) = 52 cm
    - Périmètre crânien (8287-5) = 35 cm

### Architecture du mapping CdaFrMDEToBundle

Le mapping `CdaFrMDEToBundle.fml` est un mapping spécialisé pour les documents CSE-MDE français qui combine :

**Architecture du mapping :**
* **Imports** : Utilise les mappings de base (`CdaToFHIRTypes`, `CdaToBundle`, `CdaFrToBundle`)
* **Réutilisation** : Exploite les fonctions existantes pour Patient, Composition, Encounter, Location, etc.
* **Navigation personnalisée** : Implémente une navigation spécifique pour extraire les observations imbriquées dans les organizers
* **Traitement complet** : Gère toutes les ressources nécessaires pour un document CSE-MDE

**Résultats obtenus :**
* ✅ Génération du Bundle FHIR avec structure document complète
* ✅ Transformation du Patient avec identifiant INS-NIR, nom, genre, date de naissance
* ✅ Création de la Composition avec métadonnées et sections
* ✅ Génération automatique des ressources contextuelles (Encounter, Location, Practitioner, Organization)
* ✅ **Extraction des Observations** depuis `organizer > component > observation`
* ✅ Transformation des codes LOINC et valeurs quantitatives avec unités

**Exemple d'Observation générée :**

```json
{
  "resourceType": "Observation",
  "status": "final",
  "category": [{
    "coding": [{
      "system": "http://terminology.hl7.org/CodeSystem/observation-category",
      "code": "vital-signs"
    }]
  }],
  "code": {
    "coding": [{
      "system": "http://loinc.org",
      "code": "29463-7",
      "display": "Poids"
    }]
  },
  "subject": {
    "reference": "urn:uuid:..."
  },
  "effectiveDateTime": "2023-01-06",
  "valueQuantity": {
    "value": 3900,
    "unit": "g",
    "system": "http://unitsofmeasure.org",
    "code": "g"
  }
}
```

**Améliorations récentes apportées au mapping :**

* ✅ **Ajout de `Observation.category`** : Toutes les observations sont catégorisées comme `vital-signs` conformément au package ANS [ans.fhir.fr.mesures#3.1.0](https://interop.esante.gouv.fr/ig/fhir/mesures/3.1.0/)
* ✅ **Ajout de `Observation.effectiveDateTime`** : Extrait depuis `effectiveTime` de l'observation CDA (si présent et non `nullFlavor`)
* ✅ **Correction de `Observation.status`** : Mapping de CDA "completed" vers FHIR "final"
* ✅ **Ajout du système UCUM aux quantités** : Toutes les `valueQuantity` incluent `system: "http://unitsofmeasure.org"` et `code` en plus de `unit`
* ✅ **Conversion des codes LOINC** : Système correctement mappé vers `http://loinc.org`
* ✅ **Ajout de `Encounter.status`** : Défini à `finished` pour les rencontres terminées
* ✅ **Ajout de `Encounter.class`** : Extrait du code CDA de la rencontre
* ✅ **Correction de `Patient.birthDate`** : Format date simple conforme FHIR
* ✅ **Correction de `Composition.confidentiality`** : Code simple au lieu d'objet complexe
* ✅ **Correction de `attester.time`** : Format dateTime conforme FHIR
* ✅ **Ajout de `meta.profile`** : Profils ANS ajoutés selon le code LOINC (mesures-fr-observation-body-weight, mesures-fr-observation-bodyheight, mesures-observation-head-circumference)

**Limitations identifiées dans les données CDA source :**

Les exemples CDA fournis présentent certaines limitations qui génèrent des warnings FHIR (non bloquants) :

1. ⚠️ **Absence de timezone sur `Encounter.period`** : Les dates/heures de la rencontre dans le CDA n'incluent pas de timezone
   ```xml
   <!-- CDA source -->
   <effectiveTime>
     <low value="20250106111510"/>  <!-- Pas de timezone +0100 -->
     <high value="20250106113623"/> <!-- Pas de timezone +0100 -->
   </effectiveTime>
   ```
   **Impact** : Warning FHIR "If a date has a time, it must have a timezone"

   **Solution** : Ajouter le timezone dans le CDA source (ex: `20250106111510+0100`)

2. ⚠️ **Absence de `Observation.effectiveDateTime`** : Les observations CDA utilisent `nullFlavor="NASK"` (Not Asked)
   ```xml
   <!-- CDA source -->
   <observation>
     <code code="29463-7" displayName="Poids" codeSystem="2.16.840.1.113883.6.1"/>
     <effectiveTime nullFlavor="NASK"/>  <!-- Pas de date effective -->
     <value xsi:type="PQ" value="3900" unit="g"/>
   </observation>
   ```
   **Impact** : Warning FHIR "Best Practice Recommendation: In general, all observations should have an effective[x]"

   **Solution** : Fournir une date/heure effective dans le CDA source (ex: `<effectiveTime value="20230106"/>`)

**Note** : Ces limitations proviennent des données CDA d'exemple et non du mapping FML. Le mapping transforme fidèlement les données CDA disponibles.

### Arrêter et redémarrer

Pour arrêter le conteneur :

```bash
docker stop matchbox
```

Pour redémarrer :

```bash
docker start matchbox
```

Pour supprimer le conteneur (et repartir de zéro) :

```bash
docker rm -f matchbox
```

### Configuration avancée

Le fichier `input/with-all/application.yaml` configure matchbox avec :

* Les packages FHIR de base (R4 core, terminologies, extensions)
* Le package CDA (hl7.cda.uv.core)
* Le package ANS FHIR EDS

Pour modifier la configuration, éditez `application.yaml` puis supprimez et recréez le conteneur Docker.

### Auteurs et contributeurs

| Role  | Nom | Organisation | Contact |
| --- | --- | --- | --- |
| **Primary Editor** | Prenom Nom | Agence du Numérique en Santé | prenom.nom@address.email |

Merci à Oliver Egger (Ahdis, HL7 Suisse) qui a travaillé sur la première brique sur laquelle repose ces travaux et sur l'outil matchbox permettant d'effectuer la transformation.

https://github.com/hl7ch/cda-fhir-maps

### Dépendances

{% include dependency-table.xhtml %}

### Propriété intellectuelle

{% include ip-statements.xhtml %}
