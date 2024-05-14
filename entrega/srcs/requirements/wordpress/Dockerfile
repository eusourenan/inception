FROM debian:oldstable

ARG DATABASE
ARG TITLE
ARG ADMIN_NAME
ARG ADMIN_PASSWORD
ARG ADMIN_EMAIL
ARG USER_NAME
ARG USER_PASSWORD
ARG USER_EMAIL

RUN apt-get update -qy && apt-get upgrade -qy \
    && apt-get install php7.4 php-fpm wget php-mysql mariadb-client -qy

RUN sed -i "/^listen\s=.*/c\listen = 0.0.0.0:9000" \
        /etc/php/[0-9]*.[0-9]*/fpm/pool.d/www.conf \
    &&  mkdir -p /run/php \
    &&  ln -s $(find /usr/sbin -name 'php-fpm*') /usr/bin/php-fpm

RUN wget "https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar" \
    &&  chmod +x wp-cli.phar \
    &&  mv wp-cli.phar /usr/local/bin/wp

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN mkdir -p /run/php

# copy config and script
COPY ./conf/wp-config.php                  /var/www/html/wp-config.php

WORKDIR /var/www/html

#RUN wget https://wordpress.org/latest.tar.gz && tar -xzvf latest.tar.gz \
    # && rm latest.tar.gz \
    # && mv ./wordpress/wp-config-sample.php ./wordpress/wp-config.php \
    # && sed -i "s/localhost/${LOGIN}/g" ./wordpress/wp-config.php \
    # && sed -i "s/database_name_here/${DATABASE}/g" ./wordpress/wp-config.php \
    # && sed -i "s/username_here/${USER_NAME}/g" ./wordpress/wp-config.php \
    # && sed -i "s/password_here/${USER_PASSWORD}/g" ./wordpress/wp-config.php

# change permission and install wordpress files
RUN chmod 777 /usr/local/bin/wp \
	&& wp core download --allow-root --path=/var/www/html

COPY tool/script.sh /usr/local/bin/wp_setup

RUN chmod 777 /usr/local/bin/wp_setup

CMD ["/usr/local/bin/wp_setup"]

# CMD ["php-fpm", "-F"]