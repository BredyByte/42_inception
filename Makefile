NAME = Inception

TOXIC_GREEN = \033[1;38;5;118m
MATCHING_COLOR = \033[1;38;5;129m
RESET = \033[0m
U_LINE = \033[4m

SRCS = ./srcs
REQ_SRC = $(SRCS)/requirements

RM = docker rm
DOCKER_COMPOSE_FILE = $(SRCS)/docker-compose.yml

NGINX_I_NAME = srcs-nginx
WP_I_NAME = srcs-wordpress
MD_I_NAME = srcs-mariadb

NETWORK_NAME = webnet

.PHONY: all build up down fcrean network re
.SILENT: all build up down fclean network re

all: up

network:
	if ! docker network inspect $(NETWORK_NAME) >/dev/null 2>&1; then \
        docker network create -d bridge $(NETWORK_NAME); \
    fi

up: network
	docker compose -f $(DOCKER_COMPOSE_FILE) up -d
	echo "$(MATCHING_COLOR)$(U_LINE)Docker compose is running in deteched mode $(RESET) \n"

down:
	docker compose -f $(DOCKER_COMPOSE_FILE) down

fclean: down
	-$(RM)i $(NGINX_I_NAME)
	-$(RM)i $(WP_I_NAME)
	-$(RM)i $(MD_I_NAME)

re: fclean all
