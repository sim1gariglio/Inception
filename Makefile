# Variables
DOCKER_COMPOSE_FILE = srcs/docker-compose.yml
ENV_FILE = srcs/.env

# Targets
.PHONY: all build down logs clean debug login admin

# Default target
all: build

# Build Docker images
build:
	@echo "Building Docker images..."
	mkdir -p ~/data/mariadb
	mkdir -p ~/data/wordpress
	docker compose -f $(DOCKER_COMPOSE_FILE) up --build

# Stop Docker Compose services
down:
	@echo "Stopping Docker Compose services..."
	docker compose -f $(DOCKER_COMPOSE_FILE) down

# Show logs for all services
logs:
	@echo "Showing logs for all services..."
	docker compose -f $(DOCKER_COMPOSE_FILE) logs -f

# Clean up Docker environment
clean:
	@echo "Cleaning up Docker environment..."
	docker compose -f $(DOCKER_COMPOSE_FILE) down -v --rmi all --remove-orphans
	docker system prune -f
	docker volume prune -f
	sudo rm -rf ~/data/mariadb ~/data/wordpress

# Open WordPress login page
login:
	@echo "Opening WordPress login page..."
	xdg-open https://sgarigli.42.fr/wp-login.php

# Open WordPress admin page
admin:
	@echo "Opening WordPress admin page..."
	xdg-open https://sgarigli.42.fr/wp-admin