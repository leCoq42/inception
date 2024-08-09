FROM debian:oldstable-slim

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install -y nginx openssl 

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes \
	-out /etc/nginx/ssl/inception.crt \
	-keyout /etc/nginx/ssl/inception.key \
	-subj "/C=NL/ST=NH/L=Amsterdam/O=42/OU=Codam/CN=mhaan.42.fr/UID=mhaan"

COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN mkdir -p /var/www/wordpress

RUN chown -R www-data:www-data /var/www/wordpress

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]