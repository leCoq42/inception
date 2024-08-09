#!/bin/sh

service mariadb start
sleep 5

mariadb -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DB}\`;"
mariadb -e "CREATE USER IF NOT EXISTS \`${MYSQL_USR}\`@'%' IDENTIFIED BY '${MYSQL_PWD}';"
mariadb -e "GRANT ALL PRIVILEGES ON ${MYSQL_DB}.* TO \`${MYSQL_USR}\`@'%';"
mariadb -e "FLUSH PRIVILEGES"

mysqladmin -u root -p$MYSQL_ROOT_PWD shutdown
mysqld_safe --port=3306 --bind-address=0.0.0.0 --datadir='/var/lib/mysql'