FROM alpine:3.18

RUN apk update && apk upgrade \
    && apk add --no-cache tini \
    && apk add --update mysql mysql-client \
    && apk add su-exec wget curl bash redis vim vim-doc vim-tutor \
    && apk add php82 php82-fpm php82-mysqli php82-cli php82-pdo php82-json php82-openssl php82-phar php82-curl php82-mbstring php82-xml php82-gd php82-opcache php82-zlib php82-redis

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp


RUN mkdir -p /run/php
RUN mkdir -p /var/www/html
RUN mkdir -p /var/www/uploads

COPY ./tools/init.sh /usr/local/bin/
COPY ./conf/www.conf /etc/php82/php-fpm.d/
COPY ./tools/inception.webp /var/www/uploads/

WORKDIR /var/www/html

RUN chmod +x /usr/local/bin/init.sh

ENTRYPOINT ["/sbin/tini", "--"]

EXPOSE 9000

CMD ["bash", "/usr/local/bin/init.sh"]
