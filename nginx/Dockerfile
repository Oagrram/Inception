FROM  debian:buster

ARG MY_HOST

RUN apt update && apt -y upgrade && apt install -y nginx  openssl vim && rm -rf /etc/nginx/sites-enabled/default

RUN openssl req -x509 -nodes -days 365 -subj "/C=CA/ST=QC/O=Company, Inc./CN=mydomain.com" -addext "subjectAltName=DNS:mydomain.com" -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt;

RUN sed -i 's/ssl_protocols TLSv1 TLSv1.1 TLSv1.2;/ssl_protocols TLSv1.2;/g'  /etc/nginx/nginx.conf && \
echo " server {\nlisten 80 default_server;\nlisten [::]:80 default_server;\nreturn 302 https://$MY_HOST/;\n}\nserver{\nlisten 443 ssl http2 default_server;\nlisten [::]:443 ssl http2 default_server;\nssl_certificate /etc/ssl/certs/nginx-selfsigned.crt;\nssl_certificate_key /etc/ssl/private/nginx-selfsigned.key;\nindex index.html index.htm index.nginx-debian.html;\nlocation / {\nroot /var/www/html;\n# return 404;\n}\nlocation = /404.html {\ninternal;\n}\n}"  > /etc/nginx/sites-enabled/default

ENTRYPOINT service nginx restart && bash

#docker build --build-arg MY_HOST=$(docker-machine ip char) -t nginx .
#docker run -it  -p 80:80  -p 443:443 https
#openssl s_client -connect www.fedingo.com:443 -tls1_2