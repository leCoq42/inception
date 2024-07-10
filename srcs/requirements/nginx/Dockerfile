FROM	debian:stable-slim

RUN	apt-get update -y  && apt-get upgrade -y

RUN apt-get install -y nginx openssl 

RUN	mkdir -p /etc/nginx/ssl

RUN	openssl req -x509 -nodes \
	-out /etc/nginx/ssl/inception.crt \
	-keyout /etc/nginx/ssl/inception.key \
	-subj "/C=NL/L=Amsterdan/O=Codam/OU=mhaan/CN=mhaan/"

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

RUN	mkdir -p /var/www/wordpress

RUN chown -R www-data:www-data /var/www/wordpress

EXPOSE	443

CMD	["nginx", "-g", "daemon off;"]
