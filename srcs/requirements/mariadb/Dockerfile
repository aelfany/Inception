FROM debian:bullseye
EXPOSE 3306
RUN apt update && apt -y install mariadb-server
COPY ./tools/script.sh /tmp/script.sh
RUN chmod 777 /tmp/script.sh
ENTRYPOINT [ "/tmp/script.sh" ]