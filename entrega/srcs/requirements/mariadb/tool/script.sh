#!/usr/bin/env bash

service mariadb start

mariadb -u root -e \
"CREATE DATABASE IF NOT EXISTS $DATABASE; \
CREATE USER '$ADMIN_NAME'@'%' IDENTIFIED BY '$ADMIN_PASSWORD'; \
GRANT ALL ON $DATABASE.* TO '$ADMIN_NAME'@'%'; \
FLUSH PRIVILEGES;"
