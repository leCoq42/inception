FROM	debian:stable-slim

RUN	apt-get update -y  && apt-get upgrade -y && apt-get install -y nginx openssl 

RUN	mkdir -p /etc/nginx/ssl

RUN	openssl req -x509 -newkey rsa:2048 -nodes -days 365 \
	-out /etc/nginx/ssl/mhaan.crt \
	-keyout /etc/nginx/ssl/mhaan.key \
	-subj "/C=NL/L=Amsterdan/O=Codam/OU=mhaan/CN=mhaan/"

COPY	./conf/nginx.conf /etc/nginx/nginx.conf

RUN	mkdir -p /run/nginx

EXPOSE	443

CMD	["nginx", "-g", "daemon off;"]
