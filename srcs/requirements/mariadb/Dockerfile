FROM	debian:stable-slim
 
RUN	apt-get update -y && apt-get upgrade -y

RUN apt-get install -y mariadb-server

EXPOSE	3306

COPY	./tools/mdb_setup.sh /tmp/mdb_setup.sh

RUN	chmod +x /tmp/mdb_setup.sh

ENTRYPOINT ["sh", "/tmp/mdb_setup.sh"]
