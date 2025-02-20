FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

ARG GROUP_ID
ARG MYSQL_ROOT_PASSWORD
ARG MYSQL_DATABASE
ARG MYSQL_USER
ARG MYSQL_PASSWORD
ARG MYSQL_CHARSET
ARG MYSQL_COLLATION

ENV MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD
ENV MYSQL_DATABASE=$MYSQL_DATABASE
ENV MYSQL_USER=$MYSQL_USER
ENV MYSQL_PASSWORD=$MYSQL_PASSWORD
ENV MYSQL_CHARSET=$MYSQL_CHARSET
ENV MYSQL_COLLATION=MYSQL_COLLATION

RUN apt-get update && apt-get install -y \
    mysql-server && \
    apt-get clean && rm -rf /var/lib/apt/lists/*
    

RUN mkdir -p /docker-entrypoint-initdb.d/ && \
    touch /docker-entrypoint-initdb.d/init.sh && \
    chmod +x /docker-entrypoint-initdb.d/init.sh

RUN echo '#!/bin/bash\n\
set -e\n\
service mysql start\n\
until mysql -u root -e "SELECT 1" &> /dev/null; do\n\
  sleep 1\n\
done\n\
if mysql -u root -e "USE $MYSQL_DATABASE"; then\n\
  tail -f /dev/null\n\
fi\n\
mysql -u root<<-EOSQL\n\
    UPDATE mysql.user SET Host="localhost" WHERE User="root" AND Host="%";\n\
    DELETE FROM mysql.user WHERE User="";\n\
    DELETE FROM mysql.user WHERE User="root" AND Host NOT IN ("localhost", "127.0.0.1", "::1");\n\
    DROP DATABASE IF EXISTS test;\n\
    DELETE FROM mysql.db WHERE Db="test" OR Db="test\\_%";\n\
    CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE CHARACTER SET $MYSQL_CHARSET COLLATE $MYSQL_COLLATION;\n\
    -- Create a user and grant privileges\n\
    CREATE USER "$MYSQL_USER"@"%" IDENTIFIED BY "$MYSQL_PASSWORD";\n\
    GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO "$MYSQL_USER"@"%";\n\
    FLUSH PRIVILEGES;\n\
EOSQL\n\
service mysql restart\n\
tail -f /dev/null\n\
' > /docker-entrypoint-initdb.d/init.sh

RUN groupadd -g ${GROUP_ID} docker && \
    usermod -aG docker mysql && \
    chown mysql:mysql /var/lib/mysql/ && \
    usermod -d /var/lib/mysql/ mysql

RUN sed -i 's|# pid-file\s*=.*|pid-file=/var/run/mysqld/mysqld.pid|' /etc/mysql/mysql.conf.d/mysqld.cnf && \
    sed -i 's|# socket\s*=.*|socket=/var/run/mysqld/mysqld.sock|' /etc/mysql/mysql.conf.d/mysqld.cnf && \
    sed -i 's|# datadir\s*=.*|datadir=/var/lib/mysql|' /etc/mysql/mysql.conf.d/mysqld.cnf && \
    sed -i 's|# port\s*=.*|port=3306|' /etc/mysql/mysql.conf.d/mysqld.cnf && \
    sed -i 's|bind-address\s*=.*|bind-address=0.0.0.0|' /etc/mysql/mysql.conf.d/mysqld.cnf

WORKDIR /var/lib/mysql

EXPOSE 3306

ENTRYPOINT ["/docker-entrypoint-initdb.d/init.sh"]