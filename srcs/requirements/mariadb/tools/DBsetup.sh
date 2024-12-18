#!/bin/bash

set -e

service mariadb start

mariadb -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"

mariadb -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';"

mariadb -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';"

mariadb -e "FLUSH PRIVILEGES;"

unset $DB_USER $DB_PASS $WP_ADMIN $WP_ADMIN_PASSWORD $WP_USER $WP_USER_PASS $FTP_USER $FTP_PASSWORD

kill `cat /var/run/mysqld/mysqld.pid`

mariadbd