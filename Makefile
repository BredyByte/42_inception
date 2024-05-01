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

NGINX_C_NAME = mynginx
NGINX_I_NAME = nginx
NGINX_SRC = $(REQ_SRC)/nginx
NGINX_BUILD_IMAGE = $(DOCKER_BUILD) -t $(NGINX_I_NAME) $(NGINX_SRC)

BUILD_COMMAND = $(NGINX_BUILD_IMAGE)

.PHONY: all build up down fcrean 
.SILENT: all up build down fclean 

all: build up

build:
	echo "$(MATCHING_COLOR)$(U_LINE)Images: Building$(RESET)" && \
	$(BUILD_COMMAND) && \
	echo "\n$(TOXIC_GREEN)$(U_LINE)🧪 Images: Created 🧪$(RESET) \n"; \

up:
	echo "$(MATCHING_COLOR)$(U_LINE)Docker compose is running in deteched mode $(RESET)" && \
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) up -d

down:
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) down

fclean: down
	$(RM)i $(NGINX_I_NAME)
