FROM alpine:3.19

RUN apk update
RUN apk add --no-cache nginx
RUN apk add vim vim-doc vim-tutor openssl bash

RUN mkdir /etc/nginx/cerf
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
       -out /etc/nginx/cerf/server.crt \
       -keyout /etc/nginx/cerf/server.key \
       -subj "/C=ES/ST=Málaga/L=Málaga/O=42 School/OU=dbredykh/CN=helloWorld/"

COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./conf/mime.types /etc/nginx/mime.types

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
