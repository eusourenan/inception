#!/bin/bash

if [ -f /var/www/html/wp-config-sample.php ]; then
	rm -rf /var/www/html/wp-config-sample.php
	rm -fr /var/www/html/index.html
	wp core install --allow-root \
		--path=/var/www/html \
		--title="42SP InceptionHELL" \
		--url=$SERVER_NAME \
		--admin_user=$ROOT_USER \
		--admin_password=$ROOT_PW \
		--admin_email=$ROOT_MAIL

	wp user create --allow-root	\
		--path=/var/www/html \
		"$WP_USER" "$WP_MAIL" \
		--user_pass=$WP_PW \
		--role='author'
fi

php-fpm7.4 -F



# #!/usr/bin/env bash

# # Enable the expansion of aliases in the shell script.
# shopt -s expand_aliases

# # This script sets up an alias for the 'wp' command with the '--allow-root' option.
# # The 'wp' command is a command-line interface for managing WordPress installations.
# # By adding the '--allow-root' option, it allows running the 'wp' command as the root user.
# # This alias can be used to conveniently run 'wp' commands with root privileges.
# alias wp='wp --allow-root'

# wp core download --locale="pt_BR"

# wp config create \
#   --dbname="$DATABASE" \
#   --dbuser="$ADMIN_NAME" \
#   --dbpass="$ADMIN_PASSWORD" \
#   --dbhost=mariadb \
#   --dbprefix="wp_"

# wp core install \
#   --url="$DOMAIN" \
#   --title="$TITLE" \
#   --admin_user="$ADMIN_NAME" \
#   --admin_password="$ADMIN_PASSWORD" \
#   --admin_email="$ADMIN_EMAIL" \
#   --skip-email

# wp user create "$USER_NAME" "$USER_EMAIL" \
#   --user_pass="$USER_PASS" \
#   --role=subscriber \
#   --porcelain

# # Activate the Twenty Twenty-Two theme.
# wp theme activate twentytwentytwo

# # Execute the command passed as arguments to the script.
# exec "$@"