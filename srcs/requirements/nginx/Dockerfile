FROM debian:stable
RUN apt update && apt install -y nginx 
RUN  apt install -y  openssl && openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj="/CN=abelfany/O=abelfany.1337.ma/C=MA/L=KHOURIBGA"
COPY ./conf/wordpress /etc/nginx/sites-available
RUN chmod 777 /etc/nginx/sites-available/wordpress
CMD ["nginx", "-g", "daemon off;"]