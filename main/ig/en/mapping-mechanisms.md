# Mécanisme du Mapping - POC - Mapping CDA to FHIR v0.1.0

## Mécanisme du Mapping

 
There is no translation page available for the current page, so it has been rendered in the default language 

Cette page explique les mécanismes de transformation d'un document CDA de type Patient Summary vers des ressources FHIR à l'aide du FHIR Mapping Language (FML).

### Vue d'ensemble du FHIR Mapping Language

Le FHIR Mapping Language (FML) est un langage déclaratif développé par HL7 pour transformer des données structurées d'un format à un autre. Il permet de définir des règles de transformation complexes de manière lisible et maintenable.

#### Caractéristiques principales

* **Déclaratif** : On décrit **ce que** l'on veut obtenir plutôt que **comment** le faire
* **Modulaire** : Possibilité d'importer et de réutiliser des mappings existants
* **Type-safe** : Vérification des types nécessaires pour permettre la transformation
* **Navigation XML/JSON** : Support natif pour parcourir des structures hiérarchiques

### Organisation des mappings en couches

#### Structure générale

Les mappings CDA vers FHIR sont organisés en couches afin de séparer les responsabilités et de faciliter la réutilisation des transformations. Chaque couche couvre un niveau précis du mapping et s’appuie sur les couches inférieure.

#### Description des couches de mapping

##### Mappings de conversion des types

Le fichier principal de cette couche est CdaToFHIRTypes.fml. Cette couche regroupe les mappings de conversion des types de données CDA v3 vers les types de données FHIR. Dans le contexte CDA, les datatypes représentent les structures élémentaires utilisées pour porter l’information dans le document : identifiants, noms, adresses, codes, dates, quantités, coordonnées de contact, etc. Avant de transformer un document CDA en ressources FHIR, il est donc nécessaire de convertir correctement ces types sources vers leurs équivalents FHIR. Elle constitue le socle commun de l’ensemble des autres mappings. Elle ne contient ni logique métier, ni logique nationale, ni navigation dans la structure du document CDA : son objectif est uniquement d’assurer la correspondance entre les types techniques manipulés dans les mappings.

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

##### Mappings CDA génériques

Le fichier principal de cette couche est `CdaToBundle.fml`.

Cette couche porte le mapping générique de la structure commune d’un document CDA vers un Bundle FHIR, en s’appuyant sur les transformations de types définies dans la couche inférieure (`CdaToFHIRTypes`).

Elle traite principalement les éléments transverses du document, en particulier l’en-tête CDA, ainsi qu’une structure de base du corps du document.

Les transformations couvertes dans cette couche incluent notamment :

* la création du `Bundle` ;
* la création de la `Composition` ;
* le mapping de `documentIdentity`, c’est-à-dire les identifiants permettant de reconnaître le document et sa version ;
* le mapping de `documentDescription`, notamment son type, son titre, sa date, sa langue ou encore ses métadonnées principales ;
* le mapping de `recordTarget`, qui correspond au patient concerné par le document ;
* le mapping de `custodian`, c’est-à-dire l’organisation responsable de la conservation et de la mise à disposition du document ;
* le mapping de `author`, qui peut correspondre au professionnel ou à l’acteur ayant produit le document ;
* le mapping de `legalAuthenticator`, c’est-à-dire la personne qui valide officiellement le document ;
* le mapping de `encounterContext`, notamment le contexte de soin, à travers les ressources `Encounter` et `Location` ;
* le mapping de `documentationOf`, qui permet de relier le document à l’acte, au séjour ou à l’événement clinique documenté ;
* le mapping de `emergencyContact`, qui correspond aux contacts d’urgence du patient ;
* le mapping de `trustedPerson`, qui correspond aux personnes de confiance ;
* le mapping de `guardian`, qui correspond aux représentants légaux ;
* le mapping de `relatedDocument`, par exemple un document remplacé, complété ou associé ;
* le mapping des acteurs et des structures impliqués dans le document, notamment `Practitioner`, `PractitionerRole` et `Organization` ;
* la gestion des identifiants techniques et des références internes au `Bundle` ;
* la reprise de la structure des sections du document dans `Composition.section`.

Cette couche implémente donc le socle commun de transformation CDA → FHIR, indépendant des contraintes nationales et des règles métier spécifiques.

##### Spécifications européennes et françaises

Le fichier principal de cette couche est `CdaFrToBundle.fml`.

Cette couche reprend le mapping documentaire générique produit par `CdaToBundle.fml` afin d’y intégrer les spécifications européennes et françaises applicables au `Patient Summary`.

Les spécifications européennes concernent principalement les ressources documentaires structurantes, à savoir le `Bundle` et la `Composition`. L’objectif est de rapprocher la structure FHIR produite des exigences du profil européen `HL7 Europe Patient Summary (EPS)`, actuellement en cours de concertation .

Les spécifications françaises s’appliquent aux ressources génériques déjà produites à partir de l’en-tête CDA et référencées par le `Bundle` ou la `Composition`. Elles s’appuient principalement sur les guides d’implémentation français `FR Core` et `Annuaire Santé`, afin d’ajouter les profils, identifiants, terminologies et extensions requis dans le contexte français.

Cette couche complète donc le socle commun CDA vers FHIR sans redéfinir le mapping générique réalisé dans la couche précédente. Elle ne traite pas le corps du document CDA. Les sections cliniques seront prises en charge dans la couche de mappings spécifiques métier.

Cette couche constitue une étape d’enrichissement du socle commun CDA vers FHIR. Elle complète le mapping générique établi à l’étape 2 en y intégrant les spécifications françaises et européennes. Le mapping des sections cliniques sera, quant à lui, abordé lors de l’étape 4.

##### Mappings spécifiques métier : Patient Summary

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

#### Réutilisation entre les couches

Les couches de mapping sont construites de manière progressive. Chaque couche réutilise les mappings définis dans les couches inférieures à l’aide du mécanisme `imports`, puis ajoute les transformations correspondant à son propre niveau de spécialisation.

Cette organisation permet : *de mutualiser les transformations communes ; *d’éviter la duplication des règles ; *d’isoler les spécificités génériques, nationales et métier dans des couches distinctes.

### Implémentation des transformations CDA vers FHIR en FHIR Mapping Language

Dans la continuité de la structuration en couches présentée précédemment, cette section décrit les principaux mécanismes utilisés pour implémenter les transformations CDA vers FHIR dans les fichiers FML. Elle présente concrètement la manière dont les règles de mapping permettent de parcourir la structure CDA, d’organiser les groupes de transformation, de convertir les données et de produire les ressources FHIR cibles.

#### Navigation dans la structure CDA

En FML, les règles de mapping permettent de parcourir la structure hiérarchique XML du document CDA à différents niveaux, depuis les composants principaux jusqu’aux entrées cliniques les plus imbriquées. Ce parcours peut être direct, conditionné par un filtrage, ou réalisé de manière plus profonde selon l’organisation interne des sections et des observations :

```
// Parcours simple
src.component as component -> tgt.section as section

// Parcours imbriqué avec filtrage
src.component.structuredBody.component as comp then {
  comp.section where(code.code = '11450-4') as section
    -> bundle.entry as entry, entry.resource = create('Observation') as obs
}

// Parcours profond des observations imbriquées
section.entry as entry then {
  entry.organizer as organizer then {
    organizer.component as orgComp then {
      orgComp.observation as observation -> ProcessObservation(observation, bundle)
    }
  }
}

```

#### Organisation des groupes de mapping et orchestration des transformations

En FML, les transformations sont structurées en groupes de mapping. Chaque groupe prend en charge une partie précise du traitement, tandis qu’un groupe principal orchestre l’ensemble de la transformation en appelant des groupes plus spécialisés. Cette organisation permet de séparer les responsabilités et de rendre le mapping plus lisible et plus facile à maintenir :

```
// Groupe principal : point d'entrée de la transformation
group CdaToBundle(source cda : ClinicalDocument, target bundle : Bundle) {
  cda -> bundle.type = 'document';
  cda -> bundle.id = uuid();

  // Orchestration des sous-groupes principaux
  cda then ClinicalDocumentComposition(cda, bundle);
  cda.recordTarget as recordTarget then PatientRoleToPatient(recordTarget, bundle);
  cda.component as component then StructuredBodyToSections(component, bundle);
}

// Sous-groupe dédié à la transformation du patient
group PatientRoleToPatient(source recordTarget, target bundle : Bundle) {
  recordTarget.patientRole as patientRole
    -> bundle.entry as entry, entry.resource = create('Patient') as patient then {
      patientRole -> patient;
    };
}

// Sous-groupe dédié au traitement des sections du document
group StructuredBodyToSections(source component, target bundle : Bundle) {
  component.structuredBody.component as comp then {
    comp.section as section then SectionToResource(section, bundle);
  };
}

```

#### Conversion des types de données et des terminologies

La transformation CDA vers FHIR implique également l’adaptation des types de données du modèle source vers les structures attendues dans les ressources FHIR. Cette conversion concerne notamment les éléments codés, dont les attributs doivent être réorganisés pour alimenter les objets FHIR correspondants, comme `CodeableConcept` :

```
// Conversion d'un code CDA (CD) vers CodeableConcept
group CDCodeableConcept(source src : CD, target tgt : CodeableConcept) {
  src -> tgt.coding as coding then {
    src.code as code -> coding.code = code;
    src.codeSystem as system -> coding.system = translate(system, '#oid2uri', 'uri');
    src.displayName as display -> coding.display = display;
  };
}

```

La même logique s’applique aux autres types CDA, comme les noms, les identifiants ou les quantités. Elle concerne également les terminologies, lorsqu’un code CDA doit être converti vers une valeur conforme aux jeux de codes attendus dans FHIR. Dans ce cas, deux approches peuvent être mises en œuvre :

**Approche 1 : ConceptMap externe**

```
// Référence à un ConceptMap chargé dans matchbox
src.administrativeGenderCode as gender
  -> tgt.gender = translate(gender,
     'http://example.org/ConceptMap/gender',
     'code')

```

**Approche 2 : Groupe de mapping personnalisé**

```
group MapGender(source src : CS, target tgt : code)
  src where(value = 'M') -> tgt.value = 'male'
  src where(value = 'F') -> tgt.value = 'female'
  src where(value = 'UN') -> tgt.value = 'other'
  src where(value = 'UNK') -> tgt.value = 'unknown'

```

#### Création des ressources FHIR et gestion des références

Les règles FML permettent de créer les ressources FHIR à partir des données extraites du CDA et de les ajouter au `Bundle` cible. Cette création s’accompagne généralement de l’attribution d’un identifiant interne, qui servira ensuite à construire les références entre les ressources produites.

```
// Création du Patient dans le Bundle
src.recordTarget as recordTarget then {
  recordTarget.patientRole as patientRole then {
    patientRole -> bundle.entry as entry,
                   entry.resource = create('Patient') as patient,
                   patient.id = uuid() as pid then {
      patientRole -> patient, bundle, pid, composition then
        ClinicalDocumentPatientRole(cda, patientRole, patient, bundle)
    }
  }
}

```

Pour assurer la cohérence des liens internes au `Bundle`, l’implémentation s’appuie souvent sur des identifiants temporaires générés dynamiquement, comme des UUID. Ces identifiants permettent de relier entre elles les ressources créées au cours de la transformation.

```
// Génération d'UUID pour les références internes au Bundle
entry.resource = create('Patient') as patient,
patient.id = uuid() as pid

// Utilisation de l'UUID dans une référence
reference.reference = ('urn:uuid:' + pid)

```

Ces identifiants sont ensuite réutilisés pour construire explicitement les références FHIR, par exemple lorsqu’une `Composition` doit désigner le `Patient` correspondant.

```
// Référence au Patient depuis la Composition
patient -> composition.subject = create('Reference') as reference,
           reference.reference = ('urn:uuid:' + pid)

```

Lorsque le document CDA contient des identifiants métier exploitables, ceux-ci peuvent également être repris dans les ressources FHIR. Cela permet de conserver les identifiants source utiles à l’interopérabilité, en complément des identifiants techniques utilisés pour les références internes.

```
// Identifiant INS-NIR (France)
patientRole.id as id where(root = '1.2.250.1.213.1.4.8') then {
  id -> patient.identifier as identifier then {
    id.extension as v -> identifier.value = v
    id.root as r -> identifier.system = translate(r, '#oid2uri', 'uri')
  }
}

```

#### Filtrage, conditions et adaptation des règles de mapping

Les règles FML intègrent des mécanismes de filtrage permettant de restreindre la transformation à certains éléments du document CDA. Ce filtrage peut s’appuyer, par exemple, sur la valeur d’un code de section ou sur un identifiant précis, afin de n’appliquer le mapping qu’aux données pertinentes.

```
// Filtrage d'une section par son code LOINC
comp.section where(code.code = '11450-4') as section
  -> ProcessVitalSigns(section, bundle)

// Filtrage d'un identifiant par son OID
patientRole.id as id where(root = '1.2.250.1.213.1.4.8')
  -> patient.identifier as identifier then INSIdentifier(id, identifier)

```

L’implémentation peut également reposer sur des conditions imbriquées, afin de tenir compte de la structure effective du document CDA. Cette logique permet de vérifier la présence de certains éléments avant d’appliquer une transformation plus spécifique, et de rendre ainsi le mapping plus robuste face aux variations de structure.

```
src.component as component then {
  component.structuredBody as body then {
    body.component as comp where(comp.section.exists()) then {
      comp.section where(code.code = '11450-4') as section
        -> ProcessSection(section, bundle)
    }
  }
}

```

#### Conservation du document CDA source

Afin de garantir la traçabilité de la transformation, le document CDA original peut être conservé directement dans le `Bundle` FHIR généré.

Pour cela, le contenu XML du CDA est encodé en Base64 à l’aide d’un traitement externe (par exemple en Python ou en Java), puis intégré dans une ressource FHIR `Binary`. Cette ressource est conçue pour transporter des contenus bruts (comme un fichier XML) sans les modifier.

Ce traitement d’encodage n’est pas réalisé en FML, mais en amont ou en aval du mapping.

```
{
  "resourceType": "Binary",
  "id": "cda-source",
  "contentType": "application/xml",
  "data": "Base64(CDA)"
}

```

Une ressource Provenance est ensuite utilisée pour relier les ressources FHIR produites au document CDA source :

```
{
  "resourceType": "Provenance",
  "target": [
    { "reference": "urn:uuid:composition-id" },
    { "reference": "urn:uuid:patient-id" }
  ],
  "entity": [
    {
      "role": "source",
      "what": {
        "reference": "urn:uuid:cda-source"
      }
    }
  ]
}

```

Dans cette approche :

* la ressource `Binary` contient le CDA original encodé en Base64 ;
* La ressource `Provenance` établit le lien entre les ressources FHIR générées et leur source ;
* L’encodage Base64 est réalisé en dehors du mapping FML

### Patterns de mapping courants

#### Pattern 1 : Document CDA → Bundle FHIR

**Objectif** : Transformer un document CDA en Bundle de type document

```
group CdaToBundle(source cda : ClinicalDocument, target bundle : Bundle)
  cda -> bundle.type = 'document'
  cda -> bundle.id = uuid()
  cda -> bundle.entry as entry,
         entry.resource = create('Composition') as composition,
         composition.id = uuid() as cid then {
    cda then ClinicalDocumentComposition(cda, composition, bundle)
  }

```

### Pattern 2 : Réutilisation de fonctions importées

**Objectif** : Éviter la duplication en appelant des fonctions existantes

```
map "http://example.org/fml/CdaFrToBundle" = "CdaFrToBundle"

uses "http://example.org/fml/CdaToBundle" alias cdab as source
uses "http://example.org/fml/CdaToFHIRTypes" alias cdatyp as source

// Réutilisation de ClinicalDocumentComposition
cda then cdab.ClinicalDocumentComposition(cda, composition, bundle)

// Réutilisation de ENHumanName
patientRole.patient.name as name
  -> patient.name as pname then cdatyp.ENHumanName(name, pname)

```

### Pattern 3 : Navigation personnalisée pour structures complexes

**Objectif** : Extraire des observations imbriquées dans des organizers

```
group ExtractObservations(source section, target bundle)
  section.entry as entry then {
    entry.organizer as organizer then {
      organizer.component as orgComp then {
        orgComp.observation as obs
          -> bundle.entry as entry,
             entry.resource = create('Observation') as observation then {
          obs.code as code -> observation.code = create('CodeableConcept') as cc
            then CDCodeableConcept(code, cc)
          obs.value as value where(value.is(PQ))
            -> observation.value = create('Quantity') as qty
            then PQQuantity(value, qty)
        }
      }
    }
  }

```

### Pattern 4 : Mapping conditionnel selon le type

**Objectif** : Appliquer des transformations différentes selon le type de valeur

```
// Valeur quantitative
obs.value as value where(value.is(PQ))
  -> observation.value = create('Quantity') as qty then PQQuantity(value, qty)

// Valeur codée
obs.value as value where(value.is(CD))
  -> observation.value = create('CodeableConcept') as cc
  then CDCodeableConcept(value, cc)

// Valeur texte
obs.value as value where(value.is(ST))
  -> observation.value = create('string') as str, str.value = value

```

### Limitations et contraintes

#### Dédoublonnage et fusion conditionnelle des ressources

Le CDA et FHIR reposent sur des logiques de représentation différentes. Le CDA est un modèle documentaire hiérarchique, dans lequel une même entité métier peut apparaître dans plusieurs blocs selon son rôle dans le document. À l’inverse, FHIR s’appuie sur des ressources référençables, destinées à représenter des entités distinctes et réutilisables au sein d’un Bundle. Lorsqu’une même entité est décrite dans plusieurs parties du document CDA, la transformation peut conduire à la génération de plusieurs ressources FHIR distinctes. Cette situation peut concerner des organisations, des professionnels de santé, des rôles professionnels, des lieux de prise en charge ou d’autres entités référencées à plusieurs endroits du document. Sur le plan technique, il est possible en FML de limiter la création de doublons en définissant des critères permettant de déterminer si plusieurs éléments CDA doivent être représentés par une seule et même ressource. Toutefois, la difficulté réside dans la définition de ces critères. Par exemple, le partage d’un même identifiant métier peut constituer un indice fort en faveur de l’identité des entités, sans pour autant garantir avec certitude qu’il s’agit bien de la même entité.

**Exemple illustrative**

**NB** : Le guide suivant illustre comment dédoublonner deux éléments CDA décrivant un même établissement afin d’alimenter une seule ressource FHIR Organization : https://nriss.github.io/test-2-to-1-object/main/ig/en/. Il constitue un exemple utile pour la mise en œuvre de règles FML de fusion multi-sources.

**Recommandation**

La décision de dédoublonnage doit s’appuyer sur plusieurs critères, et non sur un seul élément isolé. Elle peut notamment prendre en compte l’identifiant métier, le nom de l’entité, l’adresse et les coordonnées de contact. Cette analyse multicritère permet de limiter le risque de générer plusieurs ressources FHIR pour une même entité, tout en évitant de fusionner à tort des entités qui devraient rester distinctes.

#### Éléments CDA non définis dans la StructureDefinition

Une limite rencontrée lors du mapping concerne certains éléments présents dans le document CDA source, mais non définis dans la StructureDefinition utilisée par le moteur de transformation. Dans ce cas, même si l’information existe dans le XML CDA, elle n’est pas accessible aux règles FML, ce qui empêche son mapping vers les éléments FHIR attendus. Cette limite concerne notamment les éléments pharmaceutiques portés par le namespace pharm. Ces éléments décrivent des informations détaillées sur le médicament, comme la forme galénique avec pharm:formCode, l’équivalent générique ou la classe médicamenteuse avec pharm:asSpecializedKind, ainsi que les substances actives et leur dosage avec pharm:ingredient.

```
<manufacturedMaterial classCode="MMAT" determinerCode="KIND">
  <code code="63107752"
        displayName="PARACETAMOL VIATRIS 500 mg, comprimé"
        codeSystem="1.2.250.1.213.2.3.1"
        codeSystemName="CIS"/>

  <pharm:formCode code="10219000"
                  displayName="Comprimé"
                  codeSystem="0.4.0.127.0.16.1.1.2.1"
                  codeSystemName="StandardTermsEDQM"/>

  <pharm:asSpecializedKind classCode="GRIC">
    <pharm:generalizedMedicineClass classCode="MMAT">
      <pharm:code code="N02BE01"
                  displayName="paracetamol"
                  codeSystem="2.16.840.1.113883.6.73"
                  codeSystemName="ATC"/>
    </pharm:generalizedMedicineClass>
  </pharm:asSpecializedKind>

  <pharm:ingredient classCode="ACTI">
    <pharm:quantity>
      <numerator xsi:type="PQ" value="500" unit="mg"/>
      <denominator xsi:type="PQ" value="1"/>
    </pharm:quantity>
  </pharm:ingredient>
</manufacturedMaterial>

```

**Recommandation**

Il est recommandé d’enrichir la StructureDefinition CDA utilisée comme source afin d’y déclarer explicitement les éléments concernés, leur namespace et leur structure. Cet enrichissement permet de rendre ces éléments accessibles aux règles FML et de les mapper vers les éléments FHIR attendus, par exemple Medication.form, Medication.ingredient ou Medication.ingredient.strength.

#### Sections CDA locales ou non documentées

Le mapping des sections du corps du document CDA requiert une vigilance particulière. Dans le FML, la reconnaissance d’une section, principalement à partir de son code ou de son templateId, permet de l’orienter vers un groupe de règles spécifique. Ce mécanisme assure le mapping des sections incluses dans le périmètre du Patient Summary et la génération des ressources FHIR correspondantes. En revanche, pour les sections locales ou non documentées, l’absence de spécification explicite empêche de déterminer la ressource FHIR cible ainsi que le niveau de structuration attendu. Leur mapping structuré ne peut donc pas être garanti à ce stade.

**Recommandation**

Il est recommandé de documenter explicitement les sections locales ou non documentées par les implémenteurs, avant leur intégration au mapping. Cette documentation devrait préciser le rôle de la section, son contenu attendu, les codes ou templateId associés, la ressource FHIR cible envisagée et le niveau de structuration souhaité. Ces sections pourront également faire l’objet de travaux complémentaires ultérieurs, intégrant notamment une réflexion sur l’apport de l’intelligence artificielle générative pour analyser et interpréter les sections non documentées.

#### Compatibilité des codes CDA avec les codes attendus en FHIR

Une limite rencontrée lors du mapping concerne la compatibilité entre les codes présents dans le CDA source et les codes attendus par les éléments FHIR cibles. Un code ne peut pas toujours être repris tel quel : il doit être compatible avec l’élément FHIR à alimenter, le système de codes attendu et le ValueSet imposé par le profil cible. Un cas simple est celui du sexe administratif. Dans le CDA, cette information peut être portée par administrativeGenderCode, avec des codes comme M pour masculin ou F pour féminin. En FHIR, l’élément Patient.gender n’attend pas directement ces codes CDA, mais des valeurs telles que male ou female. Il est donc nécessaire de définir une correspondance explicite entre les codes CDA et les codes FHIR attendus, par exemple M vers male et F vers female. Ce type de mapping reste maîtrisable, car le nombre de codes est limité et les correspondances sont clairement identifiables. La difficulté apparaît lorsque les codes à mapper sont plus nombreux, plus spécialisés, ou lorsqu’ils ne disposent pas d’une correspondance stricte dans la terminologie attendue par FHIR. Par exemple, un code CDA peut porter une information clinique compréhensible, mais ne pas appartenir au ValueSet requis par l’élément FHIR cible. Dans ce cas, la reprise directe du code peut produire une ressource non conforme.

**Recommandations**

Il est recommandé de documenter les règles de correspondance terminologique en précisant, pour chaque cas, le code source CDA, son système de codes, l’élément FHIR cible, le code attendu ou conservé, ainsi que le ValueSet associé lorsqu’il existe. Les situations doivent être distinguées selon leur nature : correspondance directe, conservation du codage source, absence d’équivalence stricte ou incompatibilité avec un ValueSet requis. Lorsqu’aucun code cible strictement compatible n’est disponible, le cas doit être documenté comme une limite du mapping. Le choix retenu doit être justifié, notamment lorsqu’une correspondance plus générale ou approximative est utilisée.

### Bonnes pratiques

#### Structurer une architecture de mapping modulaire

L’organisation du mapping CDA vers FHIR en couches permet de séparer les différents niveaux de transformation et de rendre l’architecture plus évolutive. Une première couche peut être consacrée aux types de données, une deuxième au squelette générique du document, puis des couches complémentaires peuvent porter sur les spécificités européennes, nationales et les cas métier. Cette structuration rend les règles FML plus lisibles, plus faciles à tester et plus simples à maintenir. Elle facilite également l’intégration progressive des évolutions des profils français et européens, en permettant d’adapter uniquement les couches concernées sans remettre en cause l’ensemble du mapping.

#### Définir une stratégie d’identification et de gestion des références

La définition d’une stratégie d’identification permet de générer des ressources FHIR avec des identifiants cohérents et des références internes fiables. Dans un Bundle, les ressources comme Composition, Patient, Organization, Practitioner ou Encounter doivent pouvoir être reliées correctement afin de préserver les liens issus du document CDA source. Cette stratégie contribue à limiter les références cassées, les doublons inutiles et les incohérences entre ressources.

#### Configurer et utiliser correctement l’environnement de validation

La validation des ressources FHIR produites repose sur un environnement configuré avec les profils, les extensions, les ValueSet et les systèmes de codes nécessaires. Elle permet de vérifier que le résultat du mapping respecte les contraintes structurelles et terminologiques attendues par les profils cibles. Cette étape aide à distinguer les erreurs liées aux règles de mapping, les erreurs liées aux contraintes des profils et les problèmes liés à la configuration de l’environnement de validation. Elle permet également d’identifier les écarts à corriger avant toute réutilisation ou généralisation du mapping.

#### Tester les groupes de mapping de manière progressive

Le test progressif des groupes de mapping permet de vérifier chaque niveau de transformation avant l’exécution complète du mapping. Cette approche facilite l’identification de l’origine des erreurs et limite le risque qu’un problème soit masqué par l’exécution globale de la transformation. Elle permet également de sécuriser progressivement chaque partie du processus avant de tester la génération complète du Bundle FHIR.

#### Documenter les choix de mapping, les hypothèses et les cas non couverts

La documentation des choix de mapping permet de rendre explicites les décisions prises pendant la transformation. Elle peut préciser les correspondances retenues, les hypothèses appliquées, les cas particuliers ainsi que les éléments non pris en charge. Cette traçabilité facilite la compréhension du comportement du mapping, la justification des choix effectués et la reprise du travail par d’autres personnes. Elle contribue également à éviter les interprétations implicites et à préparer les évolutions futures.

### Ressources complémentaires

* [FHIR Mapping Language Specification](https://www.hl7.org/fhir/mapping-language.html)
* [FHIR StructureMap Resource](https://www.hl7.org/fhir/structuremap.html)
* [Matchbox Documentation](https://github.com/ahdis/matchbox)
* [CDA to FHIR Maps (HL7 Suisse)](https://github.com/hl7ch/cda-fhir-maps)
* [Notes techniques de développement](claude.md)

### Conclusion

Le FHIR Mapping Language offre un mécanisme puissant et déclaratif pour transformer des documents CDA en ressources FHIR. La clé du succès réside dans :

* Une architecture modulaire en couches
* La réutilisation intelligente des mappings existants
* Une navigation ciblée pour les structures spécifiques
* La gestion appropriée des limitations du parser XML

Cette approche permet de créer des mappings maintenables, testables et évolutifs pour supporter la transition CDA vers FHIR dans le contexte de l'Espace Européen des Données de Santé.

