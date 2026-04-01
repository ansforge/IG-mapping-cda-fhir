
<div class="stu-note" style="width: 65%">
    <p><strong>Note :</strong> Les méthodes et outils de mapping présentés ci‑dessous sont fournis à titre informatif. 
    Ils illustrent différentes approches identifiées sans pour autant avoir été toutes testés dans le cadre de ce guide d'implémentation.</p>
</div>


### **Approche basée sur le FHIR Mapping Language (FML)**
Le FHIR Mapping Language est un langage défini par HL7 pour décrire, sous forme de règles formelles, comment transformer une structure source (par exemple un document CDA en XML) en ressources FHIR.
Ce langage repose sur FHIRPath et prend en charge des transformations structurelles, conditionnelles ou complexes. Toutefois, il ne dispose pas d’une compréhension native de la structure CDA : cela signifie que les règles doivent décrire explicitement comment interpréter chaque élément XML du document source.
Les règles écrites en FML doivent être interprétées par un moteur capable d’exécuter des StructureMap. Parmi les moteurs d’exécution disponibles dans l’écosystème open source, on retrouve notamment HAPI FHIR et Matchbox.

##### **HAPI FHIR**
HAPI FHIR est un framework open source de référence pour la manipulation des ressources FHIR en Java. Il intègre un moteur capable d’interpréter et d’exécuter les cartes de transformation FML (StructureMap). Ce moteur fournit l’ensemble des fonctionnalités nécessaires pour appliquer les règles de conversion définies en FML : navigation dans les données, exécution de FHIRPath, création des ressources FHIR générées et validation de leur conformité aux profils utilisés.

###### **Matchbox**
Matchbox est une implémentation spécialisée basée sur HAPI FHIR qui enrichit ce moteur d’exécution avec un ensemble d’outils dédiés au développement, au test et à la validation des mappings FML. Il propose un environnement complet incluant l’exécution interactive des StructureMap, des mécanismes avancés de validation FHIR basés sur les Implementation Guides, ainsi que des fonctionnalités facilitant la mise au point des transformations.

### **Avantages**
* flexible
* Adapté aux règles métier complexes
* Intégration simple


##### **Limites**
* Complexité du langage.

###**Ressources utiles**
* FHIR Mapping Language (FML) : https://build.fhir.org/mapping-language.html
* HAPI FHIR – GitHub : https://github.com/hapifhir/hapi-fhir
* HAPI FHIR – Documentation : https://hapifhir.io/hapi-fhir/docs/
* Matchbox – GitHub : https://github.com/ahdis/matchbox
* Matchbox API Utils – Documentation : https://matchbox-api-utils.readthedocs.io
* Matchbox API Utils – GitHub : https://github.com/drmrgd/matchbox_api_utils




##**Méthodes d’outils visuels de transformation**
Cette catégorie regroupe les solutions permettant de définir des mappings CDA → FHIR à travers des interfaces graphiques. Elles offrent une représentation visuelle des structures sources et cibles, facilitant l’élaboration des règles de transformation par des utilisateurs non développeurs.

###**TermX**
TermX est une solution open source orientée modélisation et transformation autour de FHIR. Elle propose un éditeur visuel du FHIR Mapping Language (FML), permettant de construire graphiquement les règles de correspondance.

###**IBM App Connect**
IBM App Connect permet de concevoir visuellement des mappings entre structures hétérogènes et d’orchestrer leur transformation.

###**Avantages**
* Accessibilité pour des utilisateurs non développeurs
* Compréhension facilitée grâce à la représentation visuelle des transformations
* Adaptation naturelle aux environnements hospitaliers

###**Limites**
* Expressivité variable selon l’outil
* Difficulté à exprimer des logiques complexes
* Dépendance à la suite logicielle
* Faible compatibilité avec les pratiques collaboratives reposant sur Git/GitHub

###**Ressources utiles**
* TermX – Site officiel : https://termx.org/
https://termx.kodality.dev/modeler/transformation-definitions  #  un bon lien pour term x
* TermX – GitHub : https://github.com/termx-health
* IBM App Connect – Documentation : https://www.ibm.com/docs


##**Méthodes de transformation XML**
Les méthodes XML exploitent la structure du CDA pour produire du FHIR en XML.

###**XSLT**
XSLT restructure le CDA XML pour produire un FHIR XML.

###**XQuery**
XQuery permet d’interroger et recomposer un CDA en FHIR XML.

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

###**ATL**
ATL permet d’exprimer des règles entre métamodèles CDA et FHIR.

###**QVT**
QVT formalise des transformations déclaratives ou impératives.

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

###**Acceleo**
Génération FHIR via templates MTL.

###**Liquid**
Templates textuels dynamiques permettant de produire du FHIR.

###**Kodjin Data Mapper**
Transformation HL7v2 / CDA / formats propriétaires → FHIR.

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

###**Java**
Transformation via parse XML + SDK FHIR.

###**JavaScript**
XML → objets → JSON FHIR.

###**Python**
Manipulation XML + génération FHIR.

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
