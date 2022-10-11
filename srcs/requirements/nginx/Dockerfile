FROM  debian:buster

ARG MY_HOST

RUN apt update && apt -y upgrade && apt install -y nginx  openssl sudo lsb-release apt-transport-https ca-certificates 

RUN openssl req -x509 -nodes -days 365 -subj "/C=MA/ST=MA/O=1337, Inc./CN=1337.com" -addext "subjectAltName=DNS:1337.com" -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt

RUN rm -rf /etc/nginx/sites-enabled/default

COPY default /etc/nginx/sites-enabled/

EXPOSE 443

RUN ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default


# RUN  rm -rf /etc/nginx/sites-enabled/default

#ENTRYPOINT service nginx restart && nginx -g 'daemon off;'
ENTRYPOINT ["nginx", "-g", "daemon off;"]


#docker build --build-arg MY_HOST=$(docker-machine ip char) -t nginx .
#docker run -it  -p 80:80  -p 443:443 https
#openssl s_client -connect www.fedingo.com:443 -tls1_2