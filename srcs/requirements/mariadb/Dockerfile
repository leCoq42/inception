FROM debian:bullseye-slim

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y mariadb-server

COPY conf/mdb_setup.sh /tmp/mdb_setup.sh

RUN chmod +x /tmp/mdb_setup.sh

EXPOSE 3306

ENTRYPOINT ["/tmp/mdb_setup.sh"]
