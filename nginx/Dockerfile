FROM  debian:buster

WORKDIR /etc/nginx/

RUN apt update && apt -y upgrade && apt install -y nginx  openssl vim && 
ENTRYPOINT service nginx restart && bash

# docker run -itd -p 8080:80 nginx