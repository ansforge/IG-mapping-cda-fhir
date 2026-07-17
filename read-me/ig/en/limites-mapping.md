# Limites de mapping - Mapping CDA to FHIR (Preuve de concept) v0.1.0

## Limites de mapping

 
There is no translation page available for the current page, so it has been rendered in the default language 

Le mapping d’un document CDA vers des ressources FHIR ne repose pas uniquement sur une correspondance directe entre les éléments des deux standards. Il doit également prendre en compte d’autres éléments, tels que les différences entre les modèles CDA et FHIR et les exigences de conformité applicables aux ressources FHIR produites.

Les travaux menés sur le document Patient Summary ont permis d’identifier plusieurs limites et points de vigilance rencontrés au cours du mapping CDA vers FHIR. Ces difficultés ne sont pas nécessairement propres au langage FML : elles peuvent également concerner d’autres méthodes ou outils de transformation, car elles sont principalement liées aux écarts entre les modèles CDA et FHIR, à l’interprétation des données sources et aux exigences de conformité attendues en sortie.

Les principales limites rencontrées concernent :

* le dédoublonnage et la fusion conditionnelle des ressources FHIR ;
* l’accès aux éléments CDA non définis dans la StructureDefinition source ;
* le mapping des sections CDA locales ou non documentées ;
* la compatibilité des codes CDA avec les terminologies et les ValueSet attendus en FHIR.

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

### Conclusion

Le mapping de CDA vers FHIR nécessite de prendre en compte les différences entre les deux modèles, les contraintes des données sources et les exigences de conformité des ressources produites. Les recommandations présentées permettent de mieux encadrer ces difficultés et d’améliorer la qualité des ressources FHIR générées.

