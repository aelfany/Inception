#!/bin/bash
# service mariadb start
sed -i "s/127.0.0.1/0.0.0.0/g" /etc/mysql/mariadb.conf.d/50-server.cnf

mysqld_safe &
sleep 2
mariadb -u root << MY_SCRIPT
CREATE DATABASE IF NOT EXISTS $DATABASE_NAME;
CREATE USER '$DATABASE_USER'@'%' IDENTIFIED BY '$DATABASE_PASS';
GRANT ALL PRIVILEGES ON $DATABASE_NAME.* TO '$DATABASE_USER'@'%';
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
shutdown 
MY_SCRIPT
mariadbd