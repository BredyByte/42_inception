FROM alpine:3.19

# Install nginx and any other dependencies
RUN apk update
RUN apk add --no-cache nginx 
RUN apk add vim vim-doc vim-tutor openssl

RUN mkdir /etc/nginx/cerf
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
       -out /etc/nginx/cerf/server.crt \
       -keyout /etc/nginx/cerf/server.key \
       -subj "/C=ES/ST=Málaga/L=Málaga/O=42 School/OU=dbredykh/CN=helloWorld/"

# Copy your nginx configuration file to the appropriate location
COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./conf/mime.types /etc/nginx/mime.types

# Expose ports
EXPOSE 443

# Start nginx when the container starts
CMD ["nginx", "-g", "daemon off;"]
