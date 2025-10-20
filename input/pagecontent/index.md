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

### Lancer une transformation

1/ Charge matchbox image docker

docker pull europe-west6-docker.pkg.dev/ahdis-ch/ahdis/matchbox:v3.8.9

2/ Create the container with the docker image

docker run -d --name matchbox -p 8080:8080 -v /Users/nicolasriss/Desktop/cda-fhir-maps/fhir-transformation/with-cda:/config europe-west6-docker.pkg.dev/ahdis-ch/ahdis/matchbox:v3.8.9

The path should be adapted to your local folder containing the with-cda folder.

To access the docker logs, launch this command:

docker logs --follow matchbox

3/ Adapt application.yml

To add some new packages to matchbox, you just have to create a new folder equivalent to "with-cda", and add the packages you want indicating the url.

To change the package, you have to delete your docker container (using docker desktop for instance) and then go to step 2/

3/ Launch transformations

Then, you will have to launch the transformations in the tests folder :

The cda folder allows to test with the swiss maps and a first try with the french maps
the eds (entrepôt de données de santé) folder allows to test with https://github.com/ansforge/IG-FHIR-EDS-SOCLE-COMMUN


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
