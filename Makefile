NAME = Inception

TOXIC_GREEN = \033[1;38;5;118m
MATCHING_COLOR = \033[1;38;5;129m
RESET = \033[0m
U_LINE = \033[4m

SRCS = ./srcs
REQ_SRC = $(SRCS)/requirements

DOCKER_COMPOSE = docker compose
DOCKER_BUILD = docker build
RM = docker rm
DOCKER_COMPOSE_FILE = $(SRCS)/docker-compose.yml

NGINX_I_NAME = nginx
WP_I_NAME = wordpress

NETWORK_NAME = webnet


.PHONY: all up down fcrean network
.SILENT: all up down fclean network

all: up

network:
	if ! docker network inspect $(NETWORK_NAME) >/dev/null 2>&1; then \
        docker network create -d bridge $(NETWORK_NAME); \
    fi

up: network
	echo "$(MATCHING_COLOR)$(U_LINE)Images: Building$(RESET)"
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) up -d
	echo "$(MATCHING_COLOR)$(U_LINE)Docker compose is running in deteched mode $(RESET)"

down:
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) down

fclean: down
	$(RM)i $(NGINX_I_NAME)
	$(RM)i $(WP_I_NAME)
