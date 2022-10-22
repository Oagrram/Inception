FROM debian:buster

RUN apt-get -y update && apt-get install -y wget php php-cli php-fpm php-common php-json php-mysql \
php-zip php-gd php-mbstring php-curl php-xml php-pear php-bcmath

RUN wget https://www.adminer.org/latest.php

RUN mv latest.php index.php

CMD ["php", "-S", "0.0.0.0:8080"]