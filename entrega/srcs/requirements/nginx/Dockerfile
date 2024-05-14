FROM debian:oldstable

RUN apt-get update -qy && apt-get upgrade -qy \
    && apt-get install nginx openssl -qy

RUN openssl req -batch -x509 \
    -sha256 -nodes -newkey rsa:4096 -days 365 \
    -out /etc/ssl/certs/nginx-selfsigned.crt \
    -keyout /etc/ssl/private/nginx-selfsigned.key \
    -subj "/O=42sp/OU=42 Sao Paulo/CN=42sp.org.br"

COPY ./conf/nginx.conf /etc/nginx/conf.d/

# EXPOSE 443

# folder permission BS, chatGPT helped
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

# RUN sed -i "s/LOGIN/${LOGIN}/g" /etc/nginx/conf.d/https.conf

# Arguments to run nginx
# -g daemon off; tells nginx to run in the foreground
CMD ["nginx", "-g", "daemon off;"]
