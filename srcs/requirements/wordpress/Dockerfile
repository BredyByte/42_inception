FROM alpine:3.19

RUN apk update && apk upgrade
RUN apk add --no-cache wget curl bash redis vim vim-doc vim-tutor
RUN apk add php php-fpm php-cli php-pdo php-json php-curl php-mbstring php-xml php-gd php-opcache php-zlib php-redis

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && chmod +x wp-cli.phar \
  && mv wp-cli.phar /usr/local/bin/wp


RUN mkdir -p /run/php
RUN mkdir -p /var/www/html

COPY ./tools/init_wordpress.sh /usr/local/bin/
COPY ./conf/www.conf /etc/php82/php-fpm.d/

RUN chmod +x /usr/local/bin/init_wordpress.sh

EXPOSE 9000

ENTRYPOINT ["/usr/local/bin/init_wordpress.sh"]

CMD ["/usr/sbin/php-fpm82", "-F"]
