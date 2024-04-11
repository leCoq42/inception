FROM		debian:stable-slim

RUN		apt-get update && apt-get upgrade -y \
		&& apt-get install -y \
		curl \
		php \
		php-cgi \
		php-mysql \
		php-fpm \
		php-pdo \
		php-gd \
		php-cli \
		php-mbstring


RUN		curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
		&& chmod +x wp-cli.phar \
		&& mv wp-cli.phar /usr/local/bin/wp

RUN		mkdir -p /run/php

COPY		./conf/www.conf /var/www/html/

COPY		./tools/wordpress_setup.sh /usr/local/bin/

EXPOSE		9000

WORKDIR		/var/www/html/wordpress/

ENTRYPOINT	["sh", "/usr/local/bin/wordpress_setup.sh"]
