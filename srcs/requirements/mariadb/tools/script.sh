#!/bin/bash
# service mariadb start
mysqld_safe &
sleep 10
mariadb -u root << MY_SCRIPT
CREATE DATABASE IF NOT EXISTS wordpressdb;
CREATE USER 'abelfany'@'%' IDENTIFIED BY '733142';
GRANT ALL PRIVILEGES ON wordpressdb.* TO 'abelfany'@'%';
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '733142';
shutdown 
MY_SCRIPT
mysqld -u root