#!/bin/bash

wget http://wordpress.org/latest.tar.gz
tar xfz latest.tar.gz
mv wordpress/* .
rm -rf latest.tar.gz
rm -rf wordpress

sed -i "s/username_here/$MYSQL_USER/g" wp-config-sample.php
sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config-sample.php
sed -i "s/localhost/$MYSQL_HOSTNAME/g" wp-config-sample.php
sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config-sample.php

cp wp-config-sample.php wp-config.php

wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

chmod +x /usr/local/bin/wp

php82 /usr/local/bin/wp core install \
    --allow-root \
    --url=$DOMAIN_NAME \
    --title="HELLOGENTUZA" \
    --admin_user=$MYSQL_USER \
    --admin_password=$MYSQL_PASSWORD \
    --admin_email='$MYSQL_USER@gmail.com' \
    --skip-email \
    --path=/var/www/html \

php82 /usr/local/bin/wp user create \
    --allow-root \
    $WP_USER '$WP_USER@gmail.com' \
    --user_pass=$WP_PASSWORD \
    --path=/var/www/html \
    --url=$DOMAIN_NAME


php82 /usr/local/bin/wp core language install en_US
php82 /usr/local/bin/wp site switch-language en_US

media_id=$(php82 /usr/local/bin/wp media import /var/www/uploads/inception.webp --title="Dumb too(2) ;)" --porcelain)

php82 /usr/local/bin/wp post meta set 1 _thumbnail_id "$media_id"


/usr/sbin/php-fpm82 -F
