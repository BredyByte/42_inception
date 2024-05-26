FROM alpine:3.18

RUN apk update && apk upgrade && \
    apk add --no-cache tini nginx openssl bash

RUN mkdir /etc/nginx/cerf

COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./tools/init.sh /init.sh

RUN chmod +x /init.sh

ENTRYPOINT ["/sbin/tini", "--"]

EXPOSE 443

CMD ["bash", "init.sh"]
