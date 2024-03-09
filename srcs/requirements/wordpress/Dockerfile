FROM debian:bullseye
EXPOSE 9000
RUN apt update && apt install -y curl && apt install -y php7.4-fpm && apt install -y php7.4-mysql && apt install -y mariadb-client
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && apt install wget
RUN chmod 777 wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
COPY ./tools/script.sh /tmp/script.sh
RUN chmod 777 /tmp/script.sh
ENTRYPOINT ["/tmp/script.sh"]
CMD ["php-fpm7.4", "-F"]
# CMD ["tail", "-f"]
