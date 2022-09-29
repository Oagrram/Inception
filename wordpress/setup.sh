mkdir /var/www/wordpress/ && cd /var/www/wordpress/
wp core download --allow-root
wp core config --path=/var/www/wordpress --dbname=wordpress_db --dbuser=otman --dbpass=otman --dbhost=mariadb --allow-root
wp core install --url=oagrram.42.fr --title="ZABOB LIL AKHBAR" --admin_name=otman --admin_password=otman --admin_email=otman@gmail.com --allow-root
/usr/sbin/php-fpm8.1 -F
