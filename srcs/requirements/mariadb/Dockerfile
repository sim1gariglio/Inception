FROM debian:11

RUN apt-get update && apt-get upgrade && apt-get install -y vim mariadb-server 

EXPOSE 3306

COPY conf/50-server.conf /etc/mysql/mariadb.conf.d/501-server.cnf

COPY /tools/DBsetup.sh /

RUN chmod +x /DBsetup.sh

CMD ["/DBsetup.sh"]