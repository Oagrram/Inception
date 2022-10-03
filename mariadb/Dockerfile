FROM  debian:buster

RUN apt update && apt -y upgrade

# RUN sed -i 's+bind-address            = 127.0.0.1+bind-address= 0.0.0.0+g' /etc/mysql/mariadb.conf.d/50-server.cnf 

COPY Setup_Database.sh /etc/

ENTRYPOINT "/etc/Setup_Database.sh"

#ENTRYPOINT [ "mysqld_safe"]