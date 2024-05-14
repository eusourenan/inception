LOGIN=rleite-s

all: create_dirs host up
	
host:	
	sudo grep -q $(LOGIN) /etc/hosts || sudo sed -i "3i127.0.0.1\t$(LOGIN).42.fr" /etc/hosts

create_dirs:
	sudo mkdir -p /home/$(LOGIN)/data/mariadb /home/$(LOGIN)/data/wordpress
ps:
	docker ps

up: build
	docker-compose up -d

build:
	docker-compose build

down:
	docker-compose down --rmi all --volumes

prune: down
	docker system prune -fa

re: prune up