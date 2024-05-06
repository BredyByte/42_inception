FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install curl vim git -y

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

COPY ./tools/script.sh /
COPY ./tools/.gitconfig ~/.gitconfig

RUN mkdir -p /app

RUN chmod +x /script.sh

CMD ["bash", "/script.sh"]
