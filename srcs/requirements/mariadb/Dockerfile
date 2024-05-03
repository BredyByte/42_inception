FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install vim mariadb-server -y

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/init_mariadb.sh /

RUN chmod +x /init_mariadb.sh

EXPOSE 3306

CMD ["/init_mariadb.sh"]
