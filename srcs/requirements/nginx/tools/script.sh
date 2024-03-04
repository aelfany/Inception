#!/bin/bash

ufw allow 'Nginx HTTP'
cd /etc/nginx/sites-available/ && touch wordpress
echo "
server {
    listen 80;
    server_name your_domain.com;

    root /var/www/html/wordpress;
    index index.php index.html index.htm;

    location / {
        try_files $uri $uri/ /index.php?$args;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/run/php/php7.4-fpm.sock;
    }

    location ~ /\.ht {
        deny all;
    }
}
" >> wordpress
ln -s /etc/nginx/sites-available/wordpress /etc/nginx/sites-enabled/