FROM debian:bullseye
RUN apt-get update
RUN apt-get install -y nginx
RUN apt-get install -y openssl
RUN mkdir -p /etc/nginx/ssl/
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=MA/ST=BMF/L=Khouribga/O=42/OU=42/CN=abelfany.42.fr/UID=abelfany"
RUN mkdir -p /var/run/nginx
COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./tools/script.sh /tmp/script.sh
RUN chmod 777 /tmp/script.sh
CMD ["nginx"]