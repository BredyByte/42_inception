#!/bin/bash

openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
       -out /etc/nginx/cerf/server.crt \
       -keyout /etc/nginx/cerf/server.key \
       -subj "/C=ES/ST=Málaga/L=Málaga/O=42 School/OU=dbredykh/CN=helloWorld/"

nginx -g "daemon off;"
