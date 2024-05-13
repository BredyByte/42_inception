#!/bin/bash

mkdir -p /run/mysqld
chown -R mysql:mysql /var/lib/mysql /run/mysqld /tmp

touch init.sql

cat << EOF > init.sql
CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
FLUSH PRIVILEGES;
EOF

chmod 755 init.sql

mv init.sql /var/lib/mysql/init.sql

chown -R mysql:root /var/lib/mysql/init.sql

mariadbd --init-file /var/lib/mysql/init.sql
