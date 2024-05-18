FROM debian:bullseye

USER root

RUN apt update && apt install -y \
    mariadb-server \
    mariadb-client

COPY ./requirements/MariaDB/mentry.sh /usr/local/bin/

CMD mentry.sh