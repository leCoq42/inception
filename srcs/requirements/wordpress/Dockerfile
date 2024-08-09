FROM debian:oldstable-slim

RUN apt-get update && apt-get upgrade -y

RUN	apt-get install -y \
	curl \
	php \
	php7.4-fpm \
	php-mysql \
	mariadb-client \
	netcat-traditional

COPY conf/wp_conf.sh /tmp/wp_conf.sh

RUN chmod +x /tmp/wp_conf.sh

EXPOSE 9000

ENTRYPOINT ["/tmp/wp_conf.sh"]