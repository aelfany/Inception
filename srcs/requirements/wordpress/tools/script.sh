#!/bin/bash

sed -i "s#listen = /run/php/php7.4-fpm.sock#listen = wordpress:9000#g" /etc/php/7.4/fpm/pool.d/www.conf

mkdir -p /var/www/html/
chown -R www-data:www-data /var/www/html/

# cd /var/www/html/wordpress
cd /var/www/html/
wp core download --allow-root  
wp config create --dbname=$DATABASE_NAME --dbuser=$DATABASE_USER --dbpass=$DATABASE_PASS --dbhost=$DATABASE_HOST --allow-root
wp core install --url=https://$DOMAIN_NAME --title="Inception" --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASS --admin_email=abdalltifalfani309@gmail.com --allow-root
wp user create jack jack@gmail.com --role=editor --user_pass=$WP_SUSER_PASS --allow-root
chmod -R 755 /var/www/html/ 
# touch wp-config.php
# creat the admin, this will also creat the wp-config.php
# cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

service php7.4-fpm start
service php7.4-fpm stop

exec "$@"
