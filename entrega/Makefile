
LOGIN=rleite-s
MARIA_DIR=/home/$(LOGIN)/data/mariadb
WORDPRESS_DIR=/home/$(LOGIN)/data/wordpress

DOCKER_COMPOSE_FILE=./srcs/docker-compose.yaml
DOCKER_COMPOSE_COMMAND=docker-compose -f $(DOCKER_COMPOSE_FILE)

all: config up

# sudo echo '127.0.0.1	$(LOGIN).42.fr' >> /etc/hosts;
config:
	@echo oi
	@if ! grep -q '$(LOGIN)' /etc/hosts; then \
		echo "127.0.0.1 $(LOGIN).42.fr" | sudo tee -a /etc/hosts > /dev/null; \
	fi

	@if [ ! -d "$(WORDPRESS_DIR)" ]; then \
		sudo mkdir -p $(WORDPRESS_DIR); \
	fi
	@if [ ! -d "$(MARIA_DIR)" ]; then \
		sudo mkdir -p $(MARIA_DIR); \
	fi

up: build

	$(DOCKER_COMPOSE_COMMAND) up # -d

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
	sudo rm -rf $(WORDPRESS_DIR) $(MARIA_DIR)

re: fclean all

.PHONY: all up config build down ls clean fclean
