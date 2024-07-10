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


COPY		./conf/www.conf /var/www/html/www.conf
COPY		./tools/wordpress_setup.sh /tmp/wordpress_setup.sh
RUN			chmod +x /tmp/wordpress_setup.sh

RUN		mkdir -p /run/php

RUN		curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
		&& chmod +x wp-cli.phar \
		&& mv wp-cli.phar /usr/local/bin/wp

EXPOSE		9000

WORKDIR		/var/www/html/wordpress

ENTRYPOINT	["sh", "/tmp/wordpress_setup.sh"]
#RUN	["/tmp/wordpress_setup.sh"]