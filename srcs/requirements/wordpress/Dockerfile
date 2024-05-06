FROM alpine:3.19

RUN apk update && apk upgrade
RUN apk add --update mysql mysql-client
RUN apk add su-exec wget curl bash redis vim vim-doc vim-tutor php php-fpm php-mysqli php-cli php-pdo php-json php-openssl php-phar php-curl php-mbstring php-xml php-gd php-opcache php-zlib php-redis

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && chmod +x wp-cli.phar \
  && mv wp-cli.phar /usr/local/bin/wp


RUN mkdir -p /run/php
RUN mkdir -p /var/www/html
RUN mkdir -p /var/www/uploads

COPY ./tools/init_wordpress.sh /usr/local/bin/
COPY ./conf/www.conf /etc/php82/php-fpm.d/
COPY ./tools/inception.webp /var/www/uploads/

WORKDIR /var/www/html

RUN chmod +x /usr/local/bin/init_wordpress.sh

EXPOSE 9000

CMD ["/usr/local/bin/init_wordpress.sh"]
