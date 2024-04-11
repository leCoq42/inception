FROM	debian:stable-slim
 
RUN	apt-get update -y \
	&& apt-get upgrade -y \
	&& apt-get instal -y mariadb-server mariadb-client 

RUN	mkdir -p /var/run/mysqld \ 
	&& chown -R mysql:mysql /var/run/mysqld \
	&& chown -R mysql:mysql /etc/mysql/

EXPOSE	3306
