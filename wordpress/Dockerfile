FROM  debian:buster

WORKDIR /var/www/wordpress/

RUN apt update && apt -y upgrade && apt install -y sudo wget curl lsb-release apt-transport-https ca-certificates \
&& wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg && echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/php.list \
&& apt update && apt upgrade -y && apt -y install php-fpm  && service php8.1-fpm start \
&& curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && php wp-cli.phar --info && chmod +x wp-cli.phar && sudo mv wp-cli.phar /usr/local/bin/wp \
&& apt install -y php-mysql && service php8.1-fpm restart


RUN sed -i 's+/run/php/php7.3-fpm.sock+0.0.0.0:9000+g' /etc/php/7.3/fpm/pool.d/www.conf

RUN wp core download --allow-root

#ENTRYPOINT [ "/bin/bash", "-l", "-c" ]