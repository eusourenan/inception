
LOGIN=rleite-s
MARIA_DIR=/home/$(LOGIN)/data/mariadb
WORDPRESS_DIR=/home/$(LOGIN)/data/wordpress

DOCKER_COMPOSE_FILE=./srcs/docker-compose.yaml
DOCKER_COMPOSE_COMMAND=docker-compose -f $(DOCKER_COMPOSE_FILE)

all: config up

config:
	@if ! grep -q '$(LOGIN)' /etc/hosts; then \
		sudo echo '127.0.0.0	$(LOGIN).42.fr' >> /etc/hosts; \
	fi

	@if [ ! -d "$(WORDPRESS_DIR)" ]; then \
		sudo mkdir -p $(WORDPRESS_DIR); \
	fi
	@if [ ! -d "$(MARIA_DIR)" ]; then \
		sudo mkdir -p $(MARIA_DIR); \
	fi

up: build

	$(DOCKER_COMPOSE_COMMAND) up -d

build:
	$(DOCKER_COMPOSE_COMMAND) build

down:
	$(DOCKER_COMPOSE_COMMAND) down

ps:
	$(DOCKER_COMPOSE_COMMAND) ps

ls:
	docker volume ls

clean:
	$(DOCKER_COMPOSE_COMMAND) down --rmi all --volumes

fclean: clean
	docker system prune --force --all --volumes

.PHONY: all up config build down ls clean fclean
