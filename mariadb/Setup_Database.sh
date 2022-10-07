# INSTALL MARIADB SERVER

apt install -y mariadb-server

# CONFIG MARIADB BIND ADRESS

sed -i 's+bind-address            = 127.0.0.1+bind-address= 0.0.0.0+g' /etc/mysql/mariadb.conf.d/50-server.cnf 

# RESTART MYSQL SERVICE

service mysql start

# CREATE ADMIN USER 

echo "CREATE USER 'oagrram'@'%' IDENTIFIED BY 'oagrram';" | mysql -u root

echo "GRANT ALL PRIVILEGES ON *.* TO 'oagrram'@'%' WITH GRANT OPTION;" | mysql -u root

# CREATE WORDPRESS DATABASES

echo "CREATE DATABASE wordpress_db;" | mysql -u root

# CREATE WORDPRESS DATABASE USER

echo "GRANT ALL ON wordpress_db.* TO 'otman'@'%' IDENTIFIED BY 'otman' WITH GRANT OPTION;" | mysql -u root

echo "FLUSH PRIVILEGES;" | mysql -u root

# RUN SERVICE IN FORGROUND MODE

./usr/bin/mysqld_safe