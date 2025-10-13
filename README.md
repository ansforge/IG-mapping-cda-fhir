# fhir-transformation

This repository works like a proof of concept for transforming data from FHIR or to FHIR to another data format.
The tools used are FHIR Mapping Language to describe the transformations and [matchbox (AHDIS)](https://github.com/ahdis/matchbox) as a tool to apply the transformations.

# Getting started

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

* The cda folder allows to test with the swiss maps and a first try with the french maps
* the eds (entrepôt de données de santé) folder allows to test with https://github.com/ansforge/IG-FHIR-EDS-SOCLE-COMMUN
