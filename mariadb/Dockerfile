FROM  debian:buster

RUN apt update && apt -y upgrade && apt install -y mariadb-server && service mysql start

RUN sed -i 's+bind-address            = 127.0.0.1+bind-address= 0.0.0.0+g' /etc/mysql/mariadb.conf.d/50-server.cnf


# RUN mysql -u root -p && CREATE DATABASE wordpress_db; && GRANT ALL ON wordpress_db.* TO 'otman'@'%' IDENTIFIED BY 'otman' WITH GRANT OPTION;FLUSH PRIVILEGES; && exit;


CMD  bash

#ENTRYPOINT [ "mysqld_safe"]