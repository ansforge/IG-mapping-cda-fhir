# fhir-transformation

Ce repo est une preuve de concept sur la transformation de données depuis / vers le standard FHIR.

# Getting started

1/ Charger l'image docker

docker pull europe-west6-docker.pkg.dev/ahdis-ch/ahdis/matchbox:v3.8.9

2/ Lancer docker

docker run -d --name matchbox -p 8080:8080 -v /Users/nicolasriss/Desktop/cda-fhir-maps/fhir-transformation/with-cda:/config europe-west6-docker.pkg.dev/ahdis-ch/ahdis/matchbox:v3.8.9

Le path doit être adapté à votre cas d'usage.

Pour accéder aux logs de matchbox, lancer la commande :

docker logs --follow matchbox

3/ Adapter application.yml

Pour rajouter des packages au chargement de matchbox, créer un nouveau dossier équivalent à "with-cda" et remplir les classpath nécessaires.
Attention : l'ajout de packages en utilisant classpath ne fonctionne pas car le classpath n'est pas intégré dans image docker.

