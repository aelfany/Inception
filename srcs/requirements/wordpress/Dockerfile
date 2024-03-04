FROM debian:stable
RUN apt update && apt install -y curl && apt install -y php8.2-fpm && apt install -y php8.2-mysqli
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && apt install wget
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod 777 wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
CMD ["bash"]