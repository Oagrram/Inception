FROM  debian:buster

RUN apt update && apt -y upgrade && apt install -y  mariadb-client sudo wget curl lsb-release

RUN  wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg && echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/php.list \
&& apt update && apt upgrade -y && apt -y install php-fpm  && service php8.1-fpm start \
&& curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && php wp-cli.phar --info && chmod +x wp-cli.phar && sudo mv wp-cli.phar /usr/local/bin/wp

RUN apt install -y php-mysql && service php8.1-fpm start

RUN sed -i 's+/run/php/php8.1-fpm.sock+0.0.0.0:9000+g' /etc/php/8.1/fpm/pool.d/www.conf

COPY setup_wp.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/setup_wp.sh

EXPOSE 9000

ENTRYPOINT "/usr/local/bin/setup_wp.sh"