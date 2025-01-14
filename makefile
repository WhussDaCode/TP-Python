# Variables
IMAGE_NAME = health-calculator-service
CONTAINER_NAME = health-calculator-container
PORT = 5000

# Commandes
.PHONY: build run test stop clean

# Construire l'image Docker
build:
	docker build -t $(IMAGE_NAME) .

# Lancer le conteneur
run:
	docker run -d --name $(CONTAINER_NAME) -p $(PORT):5000 $(IMAGE_NAME)

# Exécuter les tests unitaires
test:
	python -m unittest discover -s . -p "*.py"

# Arrêter le conteneur
stop:
	docker stop $(CONTAINER_NAME) || true
	docker rm $(CONTAINER_NAME) || true

# Nettoyer les conteneurs et images inutilisés
clean: stop
	docker rmi $(IMAGE_NAME) || true
	docker system prune -f