FROM  debian:buster

ARG MY_HOST

RUN apt update && apt -y upgrade && apt-get install vim curl openssl nginx -y 

RUN openssl req -x509 -nodes -days 365 -subj "/C=MA/ST=MA/O=1337, Inc./CN=1337.com" -addext "subjectAltName=DNS:1337.com" -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt

RUN rm -rf /etc/nginx/sites-enabled/default

COPY default /etc/nginx/sites-available/

EXPOSE 443

RUN ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

ENTRYPOINT ["nginx", "-g", "daemon off;"]