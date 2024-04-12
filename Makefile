NAME		= inecption

DOCKER_COMPOSE = docker-compose -f srcs/docker-compose.yml

DOCKER		= docker

all:
	mkdir -p /home/mhaan/data/wordpress
	mkdir -p /home/mhaan/data/mysql
	${DOCKER_COMPOSE} up -d --build

hosts:
	sudo echo "127.0.0.1 mhaan.42.fr" >> /etc/hosts
	sudo echo "127.0.0.1 www.mhaan.42.fr" >> /etc/hosts

up:	
	${DOCKER_COMPOSE} up -d

down:
	${DOCKER_COMPOSE} down

re:
	${DOCKER_COMPOSE} up -d --build

clean:
	@docker stop $$(docker ps -qa);\
	docker rm $$(docker ps -qa);\
	docker rmi -f $$(docker images -qa);\
	docker volume rm $$(docker volume ls -q);\
	docker network rm $$(docker network ls -q);\

.PHONY: all re down clean
