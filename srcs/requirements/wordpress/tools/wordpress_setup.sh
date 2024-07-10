#!/bin/sh


#while ! mariadb -h$MYSQL_HOST -u$WP_DATABASE_USR -p$WP_DATABASE_PWD $WP_DATABASE_NAME &>/dev/null; do
 #   sleep 3

# #DOMAIN
# export DOMAIN_NAME=mhaan.42.fr

# # MYSQL
# export MYSQL_HOST=mariadb
# export MYSQL_ROOT_PWD=12345

# # WORDPRESS
# export WP_DATABASE_NAME=db
# export WP_DATABASE_USR=mhaan
# export WP_DATABASE_PWD=12345

# export WP_TITLE=inception
# export WP_ADMIN_USR=mhaan
# export WP_ADMIN_PWD=12345
# export WP_ADMIN_EMAIL=mhaan@student.codam.nl

# export WP_USR=mhaan_usr
# export WP_PWD=12345
# export WP_EMAIL=mhaan+usr@student.codam.nl

if [ -f ./wp-config.php ]; then
	echo "wordpress already downloaded"
else
	wp core download --allow-root
	# sed -i "s/username_here/$WP_DATABASE_USR/g" wp-config-sample.php
	# sed -i "s/password_here/$WP_DATABASE_PWD/g" wp-config-sample.php
	# sed -i "s/localhost/$MYSQL_HOST/g" wp-config-sample.php
	# sed -i "s/database_name_here/$WP_DATABASE_NAME/g" wp-config-sample.php
	# cp wp-config-sample.php wp-config.php
	wp config create --dbname=$WP_DATABASE_NAME --dbuser=$WP_DATABASE_USR --dbpass=$WP_DATABASE_PWD --dbhost=$MYSQL_HOST --allow-root
	wp core install --url=$DOMAIN_NAME/wordpress --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --allow-root
	wp user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD --allow-root
	wp plugin update --all --allow-root
fi

exec "$@"
