FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install curl vim -y

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

COPY ./tools/script.sh /

RUN chmod +x /script.sh

CMD ["bash", "/script.sh"]
