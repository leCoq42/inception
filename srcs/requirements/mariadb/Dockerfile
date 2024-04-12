FROM	debian:stable-slim
 
RUN	apt-get update -y \
	&& apt-get upgrade -y \
	&& apt-get install -y mariadb-server mariadb-client 

EXPOSE	3306

COPY	./tools/mariadb_setup.sh /tmp/setup.sh
#RUN	chmod 777 /tmp/setup.sh

#RUN	/tmp/setup.sh
ENTRYPOINT ["sh", "/tmp/setup.sh"]
