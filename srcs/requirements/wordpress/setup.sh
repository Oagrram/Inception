mkdir -p /var/www/wordpress/ && cd /var/www/wordpress/
wp core download --allow-root
sleep 20
wp core config --path=/var/www/wordpress --dbname=${WP_DATABASE_NAME} --dbuser=${DB_USER} --dbpass=${DB_PASSWORD} --dbhost=mariadb --allow-root
wp core install --url=oagrram.42.fr --title="ZABOB LIL AKHBAR" --admin_name=${DB_USER} --admin_password=${DB_PASSWORD} --admin_email=otman@gmail.com --allow-root
/usr/sbin/php-fpm8.1 -F
