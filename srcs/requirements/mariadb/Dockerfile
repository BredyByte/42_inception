FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y && \
	apt-get install tini mariadb-server -y

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/init.sh /

RUN chmod +x /init.sh

ENTRYPOINT ["/usr/bin/tini", "--"]

EXPOSE 3306

CMD ["bash", "init.sh"]
