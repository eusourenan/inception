FROM debian:oldstable

WORKDIR /var/www/wordpress

RUN apt update && apt upgrade -y && \
	apt install -y \
	php7.4 \
	php-fpm \
	php-mysql \
	mariadb-client \
	wordpress \
	wget && \
	rm -rf /var/lib/apt/lists/*

RUN wget -O /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x /usr/local/bin/wp && \
	wp core download --allow-root --path=/var/www/wordpress

RUN mkdir /run/php

RUN chown -R www-data:www-data /var/www/wordpress && \
	chmod 755 /var/www/wordpress

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY conf/wp-config.php /var/www/wordpress/wp-config.php

# FROM debian:oldstable

# ARG DATABASE
# ARG TITLE
# ARG ADMIN_NAME
# ARG ADMIN_PASSWORD
# ARG ADMIN_EMAIL
# ARG USER_NAME
# ARG USER_PASSWORD
# ARG USER_EMAIL

# RUN apt-get update -qy && apt-get upgrade -qy \
#     && apt-get install php7.4 php-fpm wget php-mysql mariadb-client -qy

# RUN sed -i "/^listen\s=.*/c\listen = 0.0.0.0:9000" \
#         /etc/php/[0-9]*.[0-9]*/fpm/pool.d/www.conf \
#     &&  mkdir -p /run/php \
#     &&  ln -s $(find /usr/sbin -name 'php-fpm*') /usr/bin/php-fpm

# RUN wget "https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar" \
#     &&  chmod +x wp-cli.phar \
#     &&  mv wp-cli.phar /usr/local/bin/wp

# COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

# RUN mkdir -p /run/php

# # copy config and script
# COPY ./conf/wp-config.php                  /var/www/html/wp-config.php

# # WORKDIR /var/www/html

# #RUN wget https://wordpress.org/latest.tar.gz && tar -xzvf latest.tar.gz \
#     # && rm latest.tar.gz \
#     # && mv ./wordpress/wp-config-sample.php ./wordpress/wp-config.php \
#     # && sed -i "s/localhost/${LOGIN}/g" ./wordpress/wp-config.php \
#     # && sed -i "s/database_name_here/${DATABASE}/g" ./wordpress/wp-config.php \
#     # && sed -i "s/username_here/${USER_NAME}/g" ./wordpress/wp-config.php \
#     # && sed -i "s/password_here/${USER_PASSWORD}/g" ./wordpress/wp-config.php

# # change permission and install wordpress files
# RUN chmod 777 /usr/local/bin/wp \
# 	&& wp core download --allow-root --path=/var/www/html

COPY tool/script.sh /tmp/wp_setup.sh

RUN chmod 777 /tmp/wp_setup.sh

# CMD ["/usr/local/bin/wp_setup"]

ENTRYPOINT ["/tmp/wp_setup.sh"]

# CMD ["php-fpm", "-F"]