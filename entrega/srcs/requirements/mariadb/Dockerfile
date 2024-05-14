FROM debian:oldstable

ARG ADMIN_NAME
ARG ADMIN_PASSWORD
ARG DATABASE

RUN apt-get update -qy && apt-get upgrade -qy \
    && apt-get install mariadb-server -qy

COPY conf/my.cnf /etc/mysql/my.cnf

COPY tool/script.sh /tmp/script.sh

RUN chmod 777 /tmp/script.sh && bash /tmp/script.sh

CMD ["mysqld_safe"]