#!/bin/sh

ping_mariadb_container() {
	nc -zv mariadb 3306 > /dev/null
	return $?
}

start_time=$(date +%s)
end_time=$((start_time + 20))

while [ $(date +%s) -lt $end_time ]; do
	ping_mariadb_container
	if [ $? -eq 0 ]; then
		echo "MariaDB is up and running!"
		break
	else
		echo "Waiting for MariaDB to start.."
		sleep 1
	fi
done

if [ $(date +%s) -ge $end_time ]; then
	echo "MariaDB not responding.."
fi

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

cd /var/www/wordpress
chmod -R 755 /var/www/wordpress/
chmod -R www-data:www-data /var/www/wordpress

check_core_files() {
	wp core is-installed --allow-root > /dev/null
	return $?
}

if ! check_core_files; then
	echo "Starting Wordpress Installation!"
	find /var/www/wordpress/ -mindepth 1 -delete
	wp core download --allow-root
	wp core config --dbhost=mariadb:3306 --dbname="$MYSQL_DB" --dbuser="$MYSQL_USR" --dbpass="$MYSQL_PWD"  --allow-root
	wp core install --url="$DOMAIN_NAME" --title="$WP_TITLE" --admin_user="$WP_ADMIN_USR" --admin_password="$WP_ADMIN_PWD" --admin_email="$WP_ADMIN_EMAIL" --allow-root
	wp user create "$WP_USR" "$WP_EMAIL" --user_pass="$WP_PWD" --role="$WP_ROLE" --allow-root
else
	echo "WordPress files already exist."
fi

sed -i '36 s@/run/php/php7.4-fpm.sock@9000@' /etc/php/7.4/fpm/pool.d/www.conf
mkdir -p /run/php
/usr/sbin/php-fpm7.4 -F