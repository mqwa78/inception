FROM	debian:buster

#install all the program
RUN sed -i 's|http://deb.debian.org/debian|http://archive.debian.org/debian|g' /etc/apt/sources.list && \
    apt-get -o Acquire::Check-Valid-Until=false update && \
    apt-get install -y nginx openssl && \
    rm -rf /var/lib/apt/lists/*

# nginx SSL
RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
       -out /etc/nginx/ssl/mamahtal.crt \
       -keyout /etc/nginx/ssl/mamahtal.key \
       -subj "/C=FR/ST=Paris/L=Paris/O=42 School/OU=mamahtal/CN=mamahtal/"

COPY ./conf/nginx.conf /etc/nginx/conf.d

# nginx config
RUN mkdir -p /run/nginx

#the only port allowed
EXPOSE	443

# Start nginx
CMD ["nginx", "-g", "daemon off;"]