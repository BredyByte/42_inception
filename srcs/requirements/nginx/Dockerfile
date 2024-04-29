FROM alpine:3.19

# Install nginx and any other dependencies
RUN apk update && apk add --no-cache nginx && apk add vim vim-doc vim-tutor

# Copy your nginx configuration file to the appropriate location
COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./conf/mime.types /etc/nginx/mime.types

# Expose ports
EXPOSE 443

# Start nginx when the container starts
CMD ["nginx", "-g", "daemon off;"]
