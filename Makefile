NAME = inecption

WP_DATA = /home/data/wordpress
DB_DATA = /home/data/mariadb

DOCKER_COMPOSE = docker-compose -f srcs/docker-compose.yml

DOCKER = docker

all: up


up:	build
	@mkdir -p $(WP_DATA)
	@mkdir -p $(DB_DATA)
	${DOCKER_COMPOSE} up -d

down:
	${DOCKER_COMPOSE} down

start:
	$(DOCKER_COMPOSE) start

stop:
	$(DOCKER_COMPOSE) stop

build:
	$(DOCKER_COMPOSE) build

clean:
	@docker stop $$(docker ps -qa) || true
	@docker rm $$(docker ps -qa) || true
	@docker rmi -f $$(docker images -qa) || true
	@docker volume rm $$(docker volume ls -q) || true
	@docker network rm $$(docker network ls -q) || true
	@rm -rf $(WP_DATA) || true
	@rm -rf $(DB_DATA) || true

re: clean up

prune: clean
	@docker system prune -a --volumes -f


.PHONY: all up down start stop build clean re prune
