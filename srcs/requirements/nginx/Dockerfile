FROM debian:11

RUN apt-get update && apt-get upgrade && apt-get install -y nginx
RUN apt-get install vim -y
RUN apt-get install curl -y
RUN mkdir -p /etc/nginx/ssl
RUN apt-get install openssl -y
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=sgarigli.42.fr/UID=sgarigli"
RUN mkdir -p /var/run/nginx
COPY conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 443

RUN chmod 755 /var/www/html

RUN chown -R www-data:www-data /var/www/html

CMD ["nginx"]