FROM debian:oldstable

RUN apt update -y && apt upgrade -y \
    && apt install nginx openssl -y

RUN openssl req -batch -x509 -sha256 -nodes -newkey rsa:2048 -days 365 \
	-keyout /etc/ssl/private/private.key \
	-out /etc/ssl/certs/certificate.crt \
	-subj "/C=BR/ST=SP/L=Sao Paulo/O=42sp/CN=rleite-s.42.fr"

COPY ./conf/nginx.conf /etc/nginx/conf.d

# EXPOSE 443

# folder permission BS, chatGPT helped
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

# RUN sed -i "s/LOGIN/${LOGIN}/g" /etc/nginx/conf.d/https.conf

# Arguments to run nginx
# -g daemon off; tells nginx to run in the foreground
CMD ["nginx", "-g", "daemon off;"]
