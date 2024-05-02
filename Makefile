NAME = Inception

TOXIC_GREEN = \033[1;38;5;118m
MATCHING_COLOR = \033[1;38;5;129m
RESET = \033[0m
U_LINE = \033[4m

SRCS = ./srcs
REQ_SRC = $(SRCS)/requirements

RM = docker rm
DOCKER_COMPOSE_FILE = $(SRCS)/docker-compose.yml

NGINX_I_NAME = nginx
WP_I_NAME = wordpress

NETWORK_NAME = webnet

NGINX_BUILD = docker build -t $(NGINX_I_NAME) $(REQ_SRC)/nginx
WP_BUILD = docker build -t $(WP_I_NAME) $(REQ_SRC)/wordpress

.PHONY: all build up down fcrean network re
.SILENT: all build up down fclean network re

all: up

build:
	echo "$(MATCHING_COLOR)$(U_LINE)Images: Building...$(RESET) \n"
	$(NGINX_BUILD) && $(WP_BUILD)
	echo "\n$(TOXIC_GREEN)$(U_LINE)🧪 Images: Created 🧪$(RESET) \n";

network:
	if ! docker network inspect $(NETWORK_NAME) >/dev/null 2>&1; then \
        docker network create -d bridge $(NETWORK_NAME); \
    fi

up: build network
	docker compose -f $(DOCKER_COMPOSE_FILE) up -d
	echo "$(MATCHING_COLOR)$(U_LINE)Docker compose is running in deteched mode $(RESET) \n"

down:
	docker compose -f $(DOCKER_COMPOSE_FILE) down

fclean: down
	-$(RM)i $(NGINX_I_NAME)
	-$(RM)i $(WP_I_NAME)

re: fclean all
