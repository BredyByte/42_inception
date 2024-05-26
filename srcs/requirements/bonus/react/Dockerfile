FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y \
	&& apt-get install tini curl git -y

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

COPY ./tools/script.sh /
COPY ./tools/.gitconfig ~/.gitconfig

RUN mkdir -p /app

RUN chmod +x /script.sh

ENTRYPOINT ["/usr/bin/tini", "--"]

CMD ["bash", "/script.sh"]
