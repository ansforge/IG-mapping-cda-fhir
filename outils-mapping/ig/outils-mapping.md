# Outils de Mapping - POC - Mapping CDA to FHIR v0.1.0

* [**Table of Contents**](toc.md)
* **Outils de Mapping**

## Outils de Mapping

**Note :** Les méthodes et outils de mapping présentés ci‑dessous sont fournis à titre informatif. Ils illustrent différentes approches possibles,mais n’ont pas été testés dans le cadre de ce guide d'implémentation.

#**Présentation générale des méthodes de mapping CDA vers FHIR** La transformation de documents CDA vers des ressources FHIR peut s’appuyer sur différents outils et mécanismes techniques. Les exemples présentés ci après illustrent quelques unes des solutions existantes ; ils ne couvrent pas l’ensemble des possibilités, mais permettent d’illustrer la diversité des approches disponibles.

##**Fhir mapping mapping langage et moteurs de transformation FHIR** Cette approche repose sur l’utilisation du FHIR Mapping Language (FML) et sur des moteurs de transformation capables d’interpréter des règles formelles pour convertir des structures XML comme le CDA en ressources FHIR. Elle s’appuie sur des outils spécialisés — tels que Matchbox et HAPI FHIR — afin de produire des transformations structurées, reproductibles et conformes au standard

###**FHIR Mapping Language (FML)** Le FHIR Mapping Language permet d’exprimer des règles de transformation entre une structure source (dont CDA) et des ressources FHIR, sous forme de fichiers StructureMap. Le langage repose sur FHIRPath et prend en charge des transformations structurelles, conditionnelles ou complexes. Il ne dispose toutefois pas d’une compréhension native de la structure CDA : les règles doivent décrire explicitement comment interpréter les éléments XML du document.

###**HAPI FHIR** HAPI FHIR est un framework open source de référence pour la manipulation des ressources FHIR en Java. Il fournit :

* un moteur complet pour créer, lire, modifier et valider des ressources FHIR,
* un serveur FHIR natif,
* des outils pour exécuter des mappings, notamment via l’interprétation de fichiers StructureMap,
* une intégration naturelle avec d’autres outils comme Matchbox. Dans le contexte CDA → FHIR, HAPI FHIR sert de moteur d’exécution des règles FML et apporte une couche technique robuste permettant d’assurer la conformité des ressources générées

###**Matchbox Mapping Tool** Matchbox est un outil open source intégrant un moteur FML. Il est construit sur la base du framework HAPI FHIR, ce qui lui permet de bénéficier de ses capacités de validation, de gestion des structures FHIR et d’un environnement d’exécution robuste. Matchbox permet :

* l’exécution de transformations basées sur StructureMap,
* la création et le test de mappings FML,
* la validation des données FHIR produites.

###**Avantages**

* Alignement natif avec les standards FHIR.
* Formalisation structurée des règles.
* Réutilisation et mutualisation des cartes de transformation.

###**Limites**

* Complexité du langage.
* Absence de compréhension native du CDA.

###**Ressources utiles**

* FHIR Mapping Language (FML) : https://build.fhir.org/mapping-language.html
* HAPI FHIR – GitHub : https://github.com/hapifhir/hapi-fhir
* HAPI FHIR – Documentation : https://hapifhir.io/hapi-fhir/docs/
* Matchbox – GitHub : https://github.com/ahdis/matchbox
* Matchbox API Utils – Documentation : https://matchbox-api-utils.readthedocs.io
* Matchbox API Utils – GitHub : https://github.com/drmrgd/matchbox_api_utils

##**Méthodes d’outils visuels de transformation** Cette catégorie regroupe les solutions permettant de définir des mappings CDA → FHIR à travers des interfaces graphiques. Elles offrent une représentation visuelle des structures sources et cibles, facilitant l’élaboration des règles de transformation par des utilisateurs non développeurs.

###**TermX** TermX est une solution open source orientée modélisation et transformation autour de FHIR. Elle propose un éditeur visuel du FHIR Mapping Language (FML), permettant de construire graphiquement les règles de correspondance.

###**IBM App Connect** IBM App Connect permet de concevoir visuellement des mappings entre structures hétérogènes et d’orchestrer leur transformation.

###**Avantages**

* Accessibilité pour des utilisateurs non développeurs
* Compréhension facilitée grâce à la représentation visuelle des transformations
* Adaptation naturelle aux environnements hospitaliers

###**Limites**

* Expressivité variable selon l’outil
* Difficulté à exprimer des logiques complexes
* Dépendance à la suite logicielle

###**Ressources utiles**

* TermX – Site officiel : https://termx.org/
* TermX – GitHub : https://github.com/termx-health
* IBM App Connect – Documentation : https://www.ibm.com/docs

##**Méthodes de transformation XML** Les méthodes XML exploitent la structure du CDA pour produire du FHIR en XML.

###**XSLT** XSLT restructure le CDA XML pour produire un FHIR XML.

###**XQuery** XQuery permet d’interroger et recomposer un CDA en FHIR XML.

###**Avantages**

* Adaptation naturelle au CDA XML
* Standards matures
* Transformations déterministes

###**Limites**

* Rédaction manuelle
* Peu adapté aux logiques complexes
* Pas de génération FHIR JSON

###**Ressources utiles**

* XSLT – Introduction : https://www.educba.com/xslt-mapping/
* XSLT – Spécifications QT4CG : https://github.com/qt4cg/qtspecs
* XSLT – Saxon-HE : https://github.com/Saxonica/Saxon-HE
* XQuery – Tutoriel : https://www.w3schools.com/xml/xquery_intro.asp
* XQuery – Stylus Studio : https://www.stylusstudio.com/xquery-mapper.html

##**Méthodes de transformation modèle vers modèle**

###**ATL** ATL permet d’exprimer des règles entre métamodèles CDA et FHIR.

###**QVT** QVT formalise des transformations déclaratives ou impératives.

###**Avantages**

* Transformation rigoureuse
* Production d’un modèle conforme
* Adapté aux environnements EMF/UML

###**Limites**

* Nécessité de métamodèles CDA/FHIR
* Mise en œuvre exigeante
* Peu adapté aux logiques dynamiques

###**Ressources utiles**

* ATL – Documentation : https://eclipse.dev/atl/documentation/
* ATL – User Guide : https://help.eclipse.org/latest/topic/org.eclipse.m2m.atl.doc/guide/user/ATL%20User%20Guide.html
* ATL – GitHub : https://github.com/eclipse-atl/atl
* QVT – Spécification : https://www.omg.org/spec/QVT/1.3/About-QVT/
* QVT – Documentation : https://download.eclipse.org/qvtd/doc/0.14.0/qvtd.pdf

##**Méthodes model to text**

###**Acceleo** Génération FHIR via templates MTL.

###**Liquid** Templates textuels dynamiques permettant de produire du FHIR.

###**Kodjin Data Mapper** Transformation HL7v2 / CDA / formats propriétaires → FHIR.

###**Avantages**

* Adapté aux pipelines automatisés
* Flexible
* Intégration simple

###**Limites**

* Prétraitement CDA nécessaire
* Sensible aux variations XML
* Moins adapté aux logiques conditionnelles

###**Ressources utiles**

* Acceleo – User Guide : https://wiki.eclipse.org/Acceleo/User_Guide
* FHIR Liquid Profile : https://confluence.hl7.org/spaces/FHIR/pages/66938964/FHIR+Liquid+Profile
* FHIR Data Mapping Engine : https://github.com/zeus3009/fhir-data-mapping-engine
* Microsoft – Multi-source to FHIR : https://devblogs.microsoft.com/ise/converting-multiple-sources-to-fhir-using-liquid/
* Liquid – Moteur : https://github.com/Shopify/liquid
* Kodjin Data Mapper : https://kodjin.com/mapper/
* Kodjin – Documentation : https://docs.kodjin.com/data-mapper/

##**Méthodes manuelles (Java, JavaScript, Python)**

###**Java** Transformation via parse XML + SDK FHIR.

###**JavaScript** XML → objets → JSON FHIR.

###**Python** Manipulation XML + génération FHIR.

###**Avantages**

* Très flexible
* Adapté aux règles métier complexes
* Intégration simple

###**Limites**

* Pas de formalisme standard
* Divergence fonctionnelle possible
* Maintenance lourde
* Dépendance aux compétences

###**Ressources utiles**

* HAPI FHIR (Java) : https://github.com/hapifhir/hapi-fhir
* Client FHIR Python : https://github.com/smart-on-fhir/client-py
* fhir.js (JavaScript) : https://github.com/FHIR/fhir.js

