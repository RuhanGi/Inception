FROM debian:bullseye

USER root

RUN apt update && apt install -y \
	wget \
	curl \
	sendmail \
	php-mysql \
	php-mysqli \
	mariadb-client \
	php \
	php-fpm && \
	mkdir -p /run/php

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

COPY ./requirements/WordPress/conf/www.conf /etc/php/7.4/fpm/pool.d/

COPY ./requirements/WordPress/tools/docker_entry.sh /usr/local/bin/
RUN	 chmod +x /usr/local/bin/docker_entry.sh

ENTRYPOINT ["docker_entry.sh"]
