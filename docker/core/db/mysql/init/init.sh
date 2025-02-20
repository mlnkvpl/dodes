#!/bin/bash
set -e

service mysql start

echo "Waiting for MySQL to be ready..."
until mysql -u root -e "SELECT 1" &> /dev/null; do
  sleep 1
done

mysql -u root<<-EOSQL
    DELETE FROM mysql.user WHERE User='';

    DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');

    DROP DATABASE IF EXISTS test;
    DELETE FROM mysql.db WHERE Db='test' OR Db='test\_%';

    CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE CHARACTER SET $MYSQL_CHARSET COLLATE $MYSQL_COLLATION;


    -- Create a user and grant privileges
    CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
    GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';
    FLUSH PRIVILEGES;
EOSQL

