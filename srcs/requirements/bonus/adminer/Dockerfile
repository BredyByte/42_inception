FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y \
    && apt-get install tini ca-certificates wget php php-cli php-mbstring php-pdo php-mysql php-sqlite3 php-pgsql php-json php-gd php-bcmath php-xml php-zip unzip -y \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir /adminer && \
    wget -O /adminer/adminer.php https://www.adminer.org/latest.php

EXPOSE 8080

ENTRYPOINT ["/usr/bin/tini", "--"]

WORKDIR /adminer

CMD ["php", "-S", "0.0.0.0:8080", "adminer.php"]
