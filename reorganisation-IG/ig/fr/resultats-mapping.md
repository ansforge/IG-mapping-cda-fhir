# Résultats de mapping - POC - Mapping CDA to FHIR v0.1.0

## Résultats de mapping

### introduction

L’exécution des règles de mapping avec Matchbox a permis de générer un Bundle FHIR documentaire à partir d’un document CDA de type Patient Summary. La transformation porte sur l’en-tête du document, les informations administratives et contextuelles ainsi que sur les données cliniques contenues dans ses différentes sections.

Cette page présente les résultats globaux de la transformation, les sections prises en compte, les principales ressources FHIR générées ainsi que les précautions nécessaires pour vérifier la conservation des informations du document source.

Les résultats présentés correspondent à une preuve de concept et ne permettent pas, à eux seuls, de garantir que l’ensemble des informations du CDA a été repris sans perte.

### Résultats de la transformation complète

À l’issue de la transformation complète, un `Bundle` FHIR de type `document` a été généré, contenant 97 ressources dans `Bundle.entry`, soit 98 ressources au total en incluant le `Bundle` lui-même.

Le mapping de l’en-tête a permis de reprendre les principales informations du document CDA, notamment ses métadonnées, l’identité du patient, les acteurs impliqués, les organisations associées et le contexte de prise en charge. Ces informations ont conduit à la création des ressources administratives et contextuelles correspondantes, telles que `Composition`, `Patient`, `Practitioner`, `PractitionerRole`, `Organization`, `RelatedPerson`, `Encounter` et `Location`, en tenant compte des spécifications européennes et françaises mobilisées dans la preuve de concept. Les éléments optionnels de l’en-tête n’ont donné lieu à la création de ressources que lorsqu’ils étaient présents dans le document source.

Le mapping du corps a pris en compte les sections relatives aux problèmes actifs, aux antécédents médicaux, à l’historique des actes, aux allergies et hypersensibilités, aux traitements, aux effets indésirables liés aux médicaments, aux vaccinations, au statut fonctionnel, aux constantes, au mode de vie, aux facteurs de risques professionnels, aux résultats d’examens, au plan de soins et aux antécédents familiaux.

Ces informations ont alimenté différentes ressources cliniques, notamment `Condition`, `Procedure`, `AllergyIntolerance`, `AdverseEvent`, `Medication`, `MedicationStatement`, `MedicationRequest`, `Immunization`, `ImmunizationRecommendation`, `Observation`, `DiagnosticReport`, `CarePlan`, `ServiceRequest`, `Encounter` et `FamilyMemberHistory`.

Les sections relatives aux dispositifs médicaux, aux points de vigilance, aux directives anticipées et aux documents joints sont actuellement conservées dans le contenu narratif de la `Composition`. Leur mapping vers des ressources FHIR structurées, telles que `Device`, `Flag`, `Consent` ou `DocumentReference`, pourra être complété ultérieurement.

Enfin, les ressources générées sont identifiées par des UUID et reliées entre elles au moyen de références internes au format `urn:uuid`.

### Validation métier des résultats

La génération du `Bundle` FHIR et sa validation technique ne permettent pas, à elles seules, de garantir que l’ensemble des informations du document CDA a été correctement repris.

Une validation par un expert métier est donc nécessaire afin de comparer le document CDA source avec le résultat FHIR obtenu et de vérifier notamment :

* la conservation du sens clinique des informations ;
* l’absence de perte ou de modification des données ;
* la bonne interprétation des codes, des valeurs et des contenus narratifs.

Cette validation permet d’identifier les éventuels écarts du mapping et de compléter ou d’ajuster les règles FML avant toute utilisation dans un contexte opérationnel.

### Conservation et traçabilité du document CDA source

Afin de faciliter la validation métier et de permettre un retour au document d’origine en cas de doute, il est recommandé de conserver le document CDA source. Trois approches peuvent être envisagées.

#### Encapsulation du document CDA

Cette approche consiste à encoder le document CDA au format XML en Base64, en amont ou en aval du mapping FML, puis à l’intégrer dans une ressource FHIR `Binary`.

```
{
  "resourceType": "Binary",
  "id": "cda-source",
  "contentType": "application/xml",
  "data": "Base64(CDA)"
}

```

#### Encapsulation du document CDA au format PDF

Cette approche consiste à convertir le document CDA en PDF à l’aide d’un traitement externe, par exemple en Python ou en Java. Elle permet de conserver une représentation lisible du document, sans préserver sa structure XML exploitable.

Le fichier PDF généré est ensuite encapsulé selon le même principe que le document XML : il est encodé en Base64 et intégré dans une ressource Binary.

```
{
  "resourceType": "Binary",
  "id": "cda-source-pdf",
  "contentType": "application/pdf",
  "data": "Base64(PDF)"
}

```

#### Référencement du document CDA conservé dans un système externe

Cette approche consiste à conserver le document CDA dans son système d’origine ou dans un espace documentaire externe, sans intégrer directement son contenu dans le Bundle.

Une ressource DocumentReference peut être utilisée pour renseigner l’adresse permettant d’accéder au document.

```
{
  "resourceType": "DocumentReference",
  "id": "cda-source-reference",
  "status": "current",
  "content": [
    {
      "attachment": {
        "contentType": "application/xml",
        "url": "https://exemple.fr/documents/cda-source.xml"
      }
    }
  ]
}

```

Cette solution évite de dupliquer le document source. Elle nécessite toutefois de garantir la pérennité du lien, la disponibilité du document ainsi que la gestion des droits d’accès.

