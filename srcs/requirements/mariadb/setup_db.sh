
# install mariadb-server

apt install -y mariadb-server

# config mariadb

sed -i 's+bind-address            = 127.0.0.1+bind-address= 0.0.0.0+g' /etc/mysql/mariadb.conf.d/50-server.cnf 


# setup database

if [ ! -d /var/lib/mysql/${WP_DATABASE_NAME} ]; then

	service mysql start

	echo  "\e[1;34m-------------------------------------------------------\e[0m"
	echo  "\e[1;32m----------------MARIADB CREATE USER--------------------\e[0m"
	echo "CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}'" | mysql -u root
	echo "GRANT ALL PRIVILEGES ON * . * TO '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}'" | mysql -u root
	echo "FLUSH PRIVILEGES" | mysql -u root

	echo  "\e[1;32m----------------MARIADB CREATE DATABASE----------------\e[0m"
	echo "CREATE DATABASE ${WP_DATABASE_NAME};" | mysql -u root
	echo "FLUSH PRIVILEGES" | mysql -u root

	echo  "\e[1;32m----------------MARIADB UPDATE ROOT PASSWORD-----------\e[0m"
	echo "ALTER USER 'root'@localhost IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';" | mysql -u root
	echo  "\e[1;34m-------------------------------------------------------\e[0m"

fi

kill `cat /var/run/mysqld/mysqld.pid`

mysqld_safe
