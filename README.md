
# Mapping CDA vers FHIR — Patient Summary

**Prévisualisation :** [consulter le guide d’implémentation](https://ansforge.github.io/IG-mapping-cda-fhir/main/ig/)

## Présentation

Ce guide d’implémentation présente une expérimentation visant à évaluer l’utilisation du FHIR Mapping Language (FML) pour transformer automatiquement un document CDA de type Patient Summary en un Bundle FHIR R4.

Les règles de transformation sont décrites en FML et exécutées avec Matchbox. Cette preuve de concept a été testée à partir d’un document CDA d’exemple fourni par l’ANS et n’a pas été validée sur des données issues de situations réelles.

Elle est mise librement à la disposition des implémenteurs comme base de travail pour faciliter la transition du CDA vers FHIR. Les mappings proposés doivent être revus, adaptés et validés avant toute utilisation dans un contexte opérationnel. Leur utilisation nécessite une maîtrise approfondie du FML ainsi qu’une vérification de leur exhaustivité, de leur conformité et du bon fonctionnement des ressources produites.

Le mapping est organisé en quatre couches dépendantes :

1. la conversion des types de données CDA vers FHIR ;
2. le mapping du socle générique CDA vers FHIR ;
3. l’adaptation aux spécifications françaises et européennes ;
4. le mapping des sections cliniques du Patient Summary.

Les principales règles FML sont disponibles dans le dossier :

```text
input/fml/
```

Les résultats ont été obtenus à partir d’un document CDA d’exemple. Ils illustrent la faisabilité technique de la transformation, mais ne garantissent pas le fonctionnement du mapping sur l’ensemble des CDA provenant du monde réel.

Le guide d’implémentation détaille notamment :

* Architecture du mapping ;
* Transformation via le FHIR Mapping Language ;
* Guide de démarrage de Matchbox ;
* Résultats obtenus ;
* Limites du mapping ;
* Artefacts produits ;
* Autres méthodes de mapping.

## Prérequis

Les outils suivants doivent être installés :

- Git ;
- Docker ou Docker Desktop ;
- Visual Studio Code avec l’extension **REST Client**, ou un autre client HTTP.

## Installation

Cloner le projet :

```bash
git clone https://github.com/ansforge/IG-mapping-cda-fhir.git
cd IG-mapping-cda-fhir
```

Démarrer Matchbox avec le script fourni :

```bash
chmod +x start-matchbox.sh
./start-matchbox.sh
```

Matchbox est ensuite accessible à l’adresse suivante :

```text
http://localhost:8080/matchbox
```

Pour suivre le démarrage du conteneur :

```bash
docker logs --follow matchbox
```

Il est nécessaire d’attendre la fin du démarrage de Matchbox avant de charger les mappings et de lancer une transformation.

La configuration locale de Matchbox se trouve dans :

```text
input/with-all/application.yaml
```

Après une modification de cette configuration, le conteneur doit être supprimé puis recréé :

```bash
docker rm -f matchbox
./start-matchbox.sh
```

## Utilisation

Les requêtes permettant de charger les ressources de mapping et d’exécuter les transformations sont disponibles dans :

```text
http-test/fr_cdatofhir_mde.http
```

Pour lancer une transformation avec Visual Studio Code :

1. installer l’extension **REST Client** ;
2. ouvrir le fichier `fr_cdatofhir_mde.http` ;
3. attendre la fin du démarrage de Matchbox ;
4. exécuter les requêtes dans l’ordre indiqué dans le fichier ;
5. charger les `ConceptMap` et les `StructureMap` ;
6. lancer la transformation avec l’opération `StructureMap/$transform`.

L’ordre de chargement doit être respecté, car les mappings de niveau supérieur dépendent des mappings chargés précédemment.

Les documents CDA utilisés pour les tests sont disponibles dans :

```text
input/attachments/
```

Après la modification d’une règle FML, la `StructureMap` correspondante ainsi que les mappings qui en dépendent doivent être chargés de nouveau dans Matchbox.
