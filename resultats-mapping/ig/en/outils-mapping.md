# Méthodes de mapping - Mapping CDA to FHIR (Preuve de concept) v0.1.0

## Méthodes de mapping

 
There is no translation page available for the current page, so it has been rendered in the default language 

**Note :** Les méthodes et outils de mapping présentés ci‑dessous sont fournis à titre informatif. Ils illustrent différentes approches identifiées sans pour autant avoir été toutes testées dans le cadre de ce guide d'implémentation.

La transformation de documents CDA vers des ressources FHIR peut s’appuyer sur différentes méthodes, outre l’approche basée sur le FHIR Mapping Language. Les exemples présentés ci-après donnent un aperçu de quelques solutions existantes et illustrent la diversité des approches disponibles pour ce type de transformation.

### Méthodes d’outils visuels de transformation

Cette catégorie regroupe les solutions permettant de définir des mappings CDA → FHIR au moyen d’interfaces graphiques. Celles-ci offrent une représentation visuelle des structures source et cible, ce qui facilite l’élaboration des règles de transformation par des utilisateurs non développeurs. Parmi les outils disponibles figure notamment TermX.

#### TermX

TermX est une solution open source développée par la société estonienne Kodality, dédiée à la modélisation, à la gestion des terminologies et à la transformation de données autour de FHIR. Elle intègre un éditeur visuel du FHIR Mapping Language (FML), conçu pour permettre à des analystes métier ou experts fonctionnels de définir graphiquement les règles de correspondance entre un modèle source et un modèle cible, tout en masquant la complexité syntaxique du langage FML.

#### Avantages des outils visuels de mapping

* Accessibilité pour des utilisateurs non développeurs
* Compréhension facilitée grâce à la représentation visuelle des transformations

#### Limites des outils visuels de mapping

* Expressivité variable selon l’outil
* Difficulté à exprimer des logiques complexes
* Dépendance à la suite logicielle
* Les solutions graphiques sont souvent contraintes à des exports propriétaires pour conserver les informations visuels (placement des éléments, rendus graphiques,…). Même lorsqu'un export vers un format standard est disponible, la réimportation à iso-fonctionnalité reste partielle. Par ailleurs, ces formats propriétaires sont généralement incompatibles avec les fonctionnalités collaboratives de GitHub (pull requests, revues de code, comparaison de versions), qui ne s'appliquent qu'aux fichiers texte. La collaboration simultanée via les branches reste donc limitée.

#### Ressources utiles

* TermX – Site officiel : https://termx.org/
* TermX: https://termx.kodality.dev/modeler/transformation-definitions
* TermX – GitHub : https://github.com/termx-health
* IBM App Connect – Documentation : https://www.ibm.com/docs

### Méthodes de transformation XML

Les méthodes de transformation XML exploitent directement la structure XML du document CDA pour exprimer des règles de sélection, de réorganisation et de recomposition des données. Dans le cadre d’un mapping CDA vers FHIR, elles sont particulièrement adaptées aux transformations centrées sur l’organisation du document, la navigation dans l’arbre XML et la production d’un résultat structuré, sans recours à une couche intermédiaire de modélisation. Selon le langage et l’outillage retenus, le résultat produit peut être un document XML ou, dans certains cas, une représentation JSON

#### EXtensible Stylesheet Language Transformations (XSLT)

XSLT est un langage standardisé par World Wide Web Consortium (W3C), conçu principalement pour transformer des documents XML en d’autres documents XML. La transformation est décrite sous la forme d’une feuille de style composée de règles, généralement fondées sur des motifs de correspondance et des expressions XPath. XSLT 3.0 introduit notamment des mécanismes de modularisation et de streaming, utiles pour le traitement de documents XML volumineux.

#### XML Query Language (XQuery)

XQuery est un langage de requête standardisé par le World Wide Web Consortium (W3C) pour interroger, extraire et recomposer des données XML. Fondé sur XPath, il permet d’exprimer une logique de transformation dans laquelle le document source est parcouru, certaines données sont sélectionnées et filtrées, puis un résultat cible est reconstruit sous la forme d’un fragment XML ou JSON. Dans le cadre d’un document CDA, cette approche permet de cibler précisément des sections, des entrées ou des valeurs, puis de les réorganiser selon la structure attendue en sortie. XQuery 3.1 prend également en charge JSON grâce à l’introduction des maps et des arrays dans son modèle de données.

#### Avantages

* Traitement direct du document CDA source : mise en œuvre de la transformation directement à partir de l’arbre XML du document, sans recours préalable à un modèle intermédiaire.
* Capacité fine de ciblage et de recomposition : sélection précise des sections, entrées, attributs et valeurs du document CDA au moyen des mécanismes de navigation XML et XPath.
* Adéquation aux transformations orientées structure documentaire : approche pertinente lorsque la logique de transformation porte principalement sur l’extraction, la réorganisation et la recomposition de fragments du document XML source.

#### Limites

* Lisibilité et maintenabilité réduites sur des mappings étendus : multiplication des feuilles de style, des règles et des requêtes lorsque le périmètre documentaire et les variantes de transformation augmentent.
* Nécessité de maîtriser les langages et mécanismes associés à XSLT et XQuery.

#### Ressources utiles

* XSLT – Introduction : https://www.educba.com/xslt-mapping/
* XSLT – Spécifications QT4CG : https://github.com/qt4cg/qtspecs
* XSLT – Saxon-HE : https://github.com/Saxonica/Saxon-HE
* XQuery – Tutoriel : https://www.w3schools.com/xml/xquery_intro.asp
* XQuery – Stylus Studio : https://www.stylusstudio.com/xquery-mapper.html

### Méthodes de transformation modèle vers modèle

Les approches de transformation modèle vers modèle ne manipulent pas directement un fichier XML comme une suite de nœuds ou de texte. Elles reposent sur une représentation abstraite et structurée des données, dans laquelle les artefacts source et cible sont décrits par des métamodèles. La transformation consiste alors à définir des règles indiquant comment les éléments d’un modèle conforme au métamodèle source doivent être convertis en éléments d’un modèle conforme au métamodèle cible. Ces approches s’inscrivent dans les démarches de Model-Driven Engineering (MDE) et sont souvent mises en œuvre dans des environnements comme Eclipse Modeling Framework (EMF), qui permettent de définir des métamodèles, de manipuler leurs instances et de générer du code ou d’autres artefacts associés.

#### Atlas Transformation Language (ATL)

ATL est un langage de transformation de modèles développé dans l’écosystème Eclipse. Il permet d’exprimer des règles décrivant comment des éléments d’un modèle source doivent être reconnus, transformés et projetés dans un modèle cible. ATL est présenté comme un langage principalement déclaratif, tout en proposant également des constructions impératives lorsque certaines transformations sont difficiles à exprimer uniquement sous forme de règles. Son fonctionnement repose donc sur l’application de règles de correspondance entre des instances conformes à un métamodèle source et à un métamodèle cible.

#### Query/View/Transformation (QVT)

QVT (Query/View/Transformation) est un ensemble de langages normalisés par l’Object Management Group (OMG), permettant de définir comment un modèle peut être transformé en un autre. Une transformation QVT s’appuie toujours sur des métamodèles, qui décrivent la structure des modèles manipulés (par exemple les métamodèles CDA ou FHIR, ou les métamodèles Ecore/UML dans Eclipse). On distingue trois langages QVT :

* QVT Relations : langage déclaratif permettant de décrire les correspondances entre éléments du modèle source et du modèle cible.
* QVT Operational Mappings (QVTo) : langage opérationnel permettant de programmer étape par étape la transformation.
* QVT Core : version minimale servant de fondation théorique. Dans Eclipse, ces langages sont implémentés via :
* Eclipse QVTo pour les transformations opérationnelles,
* Eclipse QVTd pour les transformations déclaratives. Ces outils prennent en entrée des modèles définis selon des métamodèles (souvent Ecore ou UML), qui servent de base à l’exécution des règles QVT.

#### Avantages

* Formalisation explicite des règles de transformation: appui sur des métamodèles explicites, structuration cohérente du mapping, lisibilité accrue des correspondances.
* Contrôle de la conformité structurelle du modèle cible : production d’instances conformes au métamodèle cible, facilitation des vérifications de structure et de la validation.

#### Limites

* Nécessite des métamodèles CDA/FHIR et leur maintenance.
* Mise en œuvre exigeante (ingénierie dirigée par les modèles, Tooling Eclipse).
* Moins adapté lorsque la transformation dépend fortement du contexte: variations du profil FHIR cible, des terminologies, du type de document CDA ou des contraintes d’implémentation rendent l’approche modèle‑vers‑modèle plus complexe à exprimer et à maintenir, en raison de son ancrage dans des correspondances structurelles stables entre métamodèles.

#### Ressources utiles

* ATL – Documentation : https://eclipse.dev/atl/documentation/
* ATL – User Guide : https://help.eclipse.org/latest/topic/org.eclipse.m2m.atl.doc/guide/user/ATL%20User%20Guide.html
* ATL – GitHub : https://github.com/eclipse-atl/atl
* QVT – Spécification : https://www.omg.org/spec/QVT/1.3/About-QVT/
* QVT – Documentation : https://download.eclipse.org/qvtd/doc/0.14.0/qvtd.pdf

### Méthodes model to text

Cette catégorie regroupe des approches de génération textuelle fondées sur des templates. Leur mécanisme consiste à appliquer des templates à un modèle ou à des données source afin de produire automatiquement une sortie textuelle structurée ; selon l’outil retenu, cette sortie peut correspondre à du code, de la documentation, des fichiers de configuration ou, dans certains cas, à des ressources FHIR.

#### Acceleo

Acceleo est un générateur de texte basé sur des modèles. Il repose sur EMF (Eclipse Modeling Framework), un environnement de modélisation dans lequel les données ne sont pas manipulées directement comme du texte brut, mais comme des objets organisés selon une structure définie à l’avance. Cette structure est décrite par un métamodèle, souvent exprimé en Ecore, qui précise quelles classes existent, quels attributs elles portent et quelles relations elles entretiennent. À partir de ces modèles EMF, Acceleo parcourt les éléments décrits et leur applique des templates afin de produire automatiquement une sortie textuelle structurée. Le principe est donc le suivant : décrire d’abord la structure du domaine avec EMF, puis utiliser Acceleo pour transformer cette structure en texte.

#### Liquid

Liquid est un langage de templates généraliste qui sert à générer automatiquement un texte à partir de données. Son mécanisme repose sur l’insertion dynamique de variables, de conditions, de boucles et de filtres dans un gabarit textuel, afin de produire une sortie structurée. Dans l’écosystème FHIR, HL7 documente un usage spécifique de Liquid pour la construction de narratifs de ressources et pour la génération de ressources à partir de sources externes telles que HL7 v2 ou CDA.

#### Kodjin Data Mapper

Kodjin Data Mapper est un outil de transformation de données de santé vers FHIR. Il s’appuie sur des templates Liquid pour définir les règles de mapping, puis exécute ces règles afin de convertir des formats tels que HL7v2, C‑CDA ou des formats propriétaires en ressources FHIR. La documentation officielle le présente comme un service de conversion spécialisé dans l’industrialisation de ces mappings.

#### Avantages

* Intégration aisée dans des chaînes de traitement automatisées : exécution répétable des mécanismes de génération ou de transformation dans des workflows structurés.
* Souplesse d’adaptation des règles : évolution des mappings ou des sorties générées par simple ajustement des templates.
* Légèreté relative de mise en œuvre :insertion facilitée dans des processus existants grâce à la production directe d’une sortie textuelle structurée.

#### Limites

* Nécessité fréquente d’une préparation préalable du document CDA : adaptation ou normalisation de la structure source en vue de sa compatibilité avec les chemins et éléments attendus par les templates de transformation.
* Expressivité plus limitée face à des logiques métier complexes.

#### Ressources utiles

* Acceleo – User Guide : https://wiki.eclipse.org/Acceleo/User_Guide
* FHIR Liquid Profile : https://confluence.hl7.org/spaces/FHIR/pages/66938964/FHIR+Liquid+Profile
* FHIR Data Mapping Engine : https://github.com/zeus3009/fhir-data-mapping-engine
* Microsoft – Multi-source to FHIR : https://devblogs.microsoft.com/ise/converting-multiple-sources-to-fhir-using-liquid/
* Liquid – Moteur : https://github.com/Shopify/liquid
* Kodjin Data Mapper : https://kodjin.com/mapper/
* Kodjin – Documentation : https://docs.kodjin.com/data-mapper/

### Méthodes manuelles (Java, JavaScript, Python)

Cette catégorie regroupe les approches dans lesquelles la transformation CDA → FHIR est codée directement dans un langage de programmation généraliste. Elle repose sur le parsing du document XML source, l’écriture explicite des règles de transformation dans le code, puis la construction des ressources FHIR à l’aide de bibliothèques adaptées. Cette logique peut être mise en œuvre en Java, notamment avec HAPI FHIR ; en JavaScript, par transformation du XML en objets puis génération d’un FHIR JSON, avec l’appui éventuel d’un client tel que SMART on FHIR JavaScript Client ; et en Python, par manipulation XML et construction des ressources via des modèles ou clients FHIR tels que fhirclient.

#### Avantages

* Très flexible.
* Adapté aux règles métier complexes.
* Intégration simple.

#### Limites

* Pas de formalisme standard.
* Divergence fonctionnelle possible.
* Maintenance lourde.
* Dépendance aux compétences.

#### Ressources utiles

* HAPI FHIR (Java) : https://github.com/hapifhir/hapi-fhir
* HAPI FHIR – Documentation : https://hapifhir.io/
* Client FHIR Python : https://github.com/smart-on-fhir/client-py ccda-fhir-converter
* Client FHIR Python – Documentation : https://docs.smarthealthit.org/client-py/
* Client FHIR JavaScript : https://github.com/smart-on-fhir/client-js
* Client FHIR JavaScript – Documentation : http://docs.smarthealthit.org/client-js/
* fhir.js : https://github.com/FHIR/fhir.js

### Les grands modèles de langage (LLM)

Les grands modèles de langage (LLM) peuvent être mobilisés pour produire des ressources ou des bundles FHIR à partir de documents CDA (XML), de textes cliniques ou de données structurées, au moyen de prompts et de stratégies de guidage.

#### Principe

* Écrire un prompt qui précise la tâche attendue (cible FHIR, profils/contraintes, format de sortie).
* Ajouter des exemples (few‑shot) et/ou des extraits de schémas FHIR pour orienter la génération.
* Itérer (demander des corrections, reformuler) jusqu’à obtenir un résultat exploitable.

#### Avantages

* Démarrage rapide d’un mapping vers FHIR à partir de données sources
* Guidage par le prompt : prompts structurés, exemples (few‑shot) et fragments de schémas FHIR peuvent améliorer la qualité des sorties.
* Boucles de correction : l’itération et les retours de type « feedback » aident à converger vers une structure FHIR mieux formée.

#### Limites

* Hallucinations : attributs inexistants, appariements inadaptés, problèmes de granularité) ; une relecture experte est nécessaire.
* Non‑déterminisme : à consigne identique, un même modèle peut générer des réponses différentes d’une exécution à l’autre, ce qui rend plus difficile la traçabilité et la stabilité des conversions vers FHIR.
* Modèle “boîte noire” : le fonctionnement interne n’est pas explicable ; on ne peut pas comprendre comment le modèle produit ses réponses.
* Sensibilité au prompt : de faibles variations de consignes peuvent modifier la sortie, ce qui réduit la reproductibilité sans stratégie de prompting rigoureuse.
* Validation indispensable : contrôle systématique vis‑à‑vis des profils/IG avant toute utilisation opérationnelle.

