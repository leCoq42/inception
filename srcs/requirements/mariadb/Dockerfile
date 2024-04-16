FROM	debian:stable-slim
 
RUN	apt-get update -y \
	&& apt-get upgrade -y \
	&& apt-get install -y mariadb-server

RUN	mkdir -p /run/mysqld

COPY	conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY	./tools/mariadb_setup.sh /tmp/setup.sh
#RUN	chmod 777 /tmp/setup.sh

EXPOSE	3306
#RUN	/tmp/setup.sh
ENTRYPOINT ["sh", "/tmp/setup.sh"]
