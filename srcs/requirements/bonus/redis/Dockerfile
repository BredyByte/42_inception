FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y \
	&& apt-get install tini curl vim redis -y

COPY ./tools/script.sh /

RUN chmod +x /script.sh

ENTRYPOINT ["/usr/bin/tini", "--"]

EXPOSE 6379

CMD ["bash", "/script.sh"]
