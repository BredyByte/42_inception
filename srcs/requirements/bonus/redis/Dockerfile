FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install curl vim redis -y

COPY ./tools/script.sh /

RUN chmod +x /script.sh

EXPOSE 6379

CMD ["bash", "/script.sh"]
