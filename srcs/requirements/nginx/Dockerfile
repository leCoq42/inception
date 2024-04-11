FROM	debian:stable-slim

RUN	apt-get update -y  && apt-get upgrade -y && apt-get install -y nginx openssl 

RUN	mkdir /etc/nginx/ssl

RUN	openssl req -x509 -newkey rsa -nodes -days 365 \
	-out /etc/nginx/ssl/mhaan.crt \
	-keyout /etc/nginx/ssl/mhaan.key \
	-subj "/C=NL/L=Amsterdan/O=Codam/OU=mhaan"

COPY	./conf/default /etc/nginx/conf.d

RUN	mkdir -p /run/nginx

EXPOSE	433

CMD	["nginx", "-g", "daemon off;"]
