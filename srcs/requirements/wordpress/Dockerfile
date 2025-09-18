FROM debian:bookworm

RUN apt-get update && \
	apt-get -y install wget curl php php-cgi php-mysql php-fpm php-pdo php-gd php-cli php-mbstring && \
	rm -rf /var/lib/apt/lists/*

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp

WORKDIR /usr/src/

RUN wget http://wordpress.org/latest.tar.gz && \
	tar -xzvf latest.tar.gz && \
	rm -rf /usr/src/latest.tar.gz

COPY ./scripts/docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

COPY ./conf/www.conf /etc/php/8.2/fpm/pool.d/

WORKDIR /var/www/html/

#Launch PHP FPM in foreground and ignore deamonize from conf file (-F)
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["/usr/sbin/php-fpm8.2", "-F"]

EXPOSE 9000
