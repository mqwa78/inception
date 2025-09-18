FROM debian:bookworm

RUN apt-get update && \
	apt-get install -y nginx openssl && \
	rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
	-out /etc/nginx/ssl/mamahtal.crt \
	-keyout /etc/nginx/ssl/mamahtal.key \
	-subj "/C=FR/ST=Paris/L=Paris/O=42 School/OU=mamahtal/CN=mamahtal/"

COPY ./conf/nginx.conf /etc/nginx/conf.d

CMD ["nginx", "-g", "daemon off;"]

EXPOSE  443
