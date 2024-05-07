FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y \
    ca-certificates \
    wget \
    php \
    php-cli \
    php-mbstring \
    php-pdo \
    php-mysql \
    php-sqlite3 \
    php-pgsql \
    php-json \
    php-gd \
    php-bcmath \
    php-xml \
    php-zip \
    unzip \
    && rm -rf /var/lib/apt/lists/*



RUN mkdir /adminer && \
    wget -O /adminer/adminer.php https://www.adminer.org/latest.php

EXPOSE 8080

WORKDIR /adminer

CMD ["php", "-S", "0.0.0.0:8080", "adminer.php"]
