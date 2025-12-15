#!/bin/bash
# Script pour démarrer matchbox avec la configuration IG-mapping-cda-fhir

set -e

# Couleurs pour les messages
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${GREEN}=== Démarrage de matchbox pour IG-mapping-cda-fhir ===${NC}"

# Obtenir le répertoire du script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Vérifier que Docker est en cours d'exécution
if ! docker info > /dev/null 2>&1; then
    echo -e "${RED}Erreur: Docker n'est pas en cours d'exécution.${NC}"
    echo "Veuillez démarrer Docker Desktop et réessayer."
    exit 1
fi

# Vérifier si un conteneur matchbox existe déjà
if docker ps -a | grep -q matchbox; then
    echo -e "${YELLOW}Un conteneur matchbox existe déjà.${NC}"
    read -p "Voulez-vous le supprimer et en créer un nouveau ? (y/N) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo "Suppression du conteneur existant..."
        docker rm -f matchbox
    else
        echo "Tentative de démarrage du conteneur existant..."
        docker start matchbox
        echo -e "${GREEN}Matchbox est démarré !${NC}"
        echo "Interface web : http://localhost:8080/matchbox"
        echo "API FHIR : http://localhost:8080/matchbox/fhir"
        exit 0
    fi
fi

# Vérifier que le dossier input/with-all existe
if [ ! -d "$SCRIPT_DIR/input/with-all" ]; then
    echo -e "${RED}Erreur: Le dossier input/with-all n'existe pas.${NC}"
    exit 1
fi

# Télécharger l'image Docker si nécessaire
echo "Vérification de l'image Docker matchbox v4.0.12..."
if ! docker images | grep -q "europe-west6-docker.pkg.dev/ahdis-ch/ahdis/matchbox.*v4.0.12"; then
    echo "Téléchargement de l'image matchbox:v4.0.12..."
    docker pull europe-west6-docker.pkg.dev/ahdis-ch/ahdis/matchbox:v4.0.12
fi

# Créer et démarrer le conteneur
echo "Création du conteneur matchbox v4.0.12..."
docker run -d --name matchbox \
    -p 8080:8080 \
    -v "$SCRIPT_DIR/input/with-all:/config" \
    europe-west6-docker.pkg.dev/ahdis-ch/ahdis/matchbox:v4.0.12

echo -e "${GREEN}Conteneur matchbox créé et démarré !${NC}"
echo ""
echo "Interface web : http://localhost:8080/matchbox"
echo "API FHIR : http://localhost:8080/matchbox/fhir"
echo ""
echo "Pour suivre les logs :"
echo "  docker logs --follow matchbox"
echo ""
echo "Pour arrêter :"
echo "  docker stop matchbox"
echo ""
echo "Pour supprimer :"
echo "  docker rm -f matchbox"
echo ""
echo -e "${YELLOW}Attendez quelques instants que matchbox termine son démarrage avant de lancer les transformations.${NC}"
