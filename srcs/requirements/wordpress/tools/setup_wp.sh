mkdir -p /var/www/wordpress/ && cd /var/www/wordpress/


echo  "\e[1;34m------------------------------------------------------\e[0m"
echo  "\e[1;32m----------------DOWNLOAD WORDPRESS--------------------\e[0m"

wp core download --allow-root
sleep 20

echo  "\e[1;32m----------------CONFIG WORDPRESS----------------------\e[0m"

wp core config --path=${WP_PATH} --dbname=${WP_DATABASE_NAME} --dbuser=${DB_USER} --dbpass=${DB_PASSWORD} --dbhost=mariadb --allow-root

echo  "\e[1;32m----------------INSTALL WORDPRESS---------------------\e[0m"

wp core install --url=$WEBSITE_DOMAIN --title="Wordpress Lahi 7san L3wan" --admin_name=${DB_USER} --admin_password=${DB_PASSWORD} --admin_email=oagrram.1337@gmail.com --allow-root

echo  "\e[1;34m------------------------------------------------------\e[0m"

# Run fpm in Forground Mode

/usr/sbin/php-fpm8.1 -F
