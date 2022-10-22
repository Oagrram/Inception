FROM  debian:buster

RUN apt update && apt -y upgrade && apt-get install vim curl openssl nginx -y 

COPY ./Resume/* /var/www/html/

RUN rm -rf /var/www/html/index.nginx-debian.html

RUN chmod 777 /var/www/html/*

EXPOSE 80

ENTRYPOINT ["nginx", "-g", "daemon off;"]



# docker build  . -t website
# docker run  --rm -p 8080:80 website
# docker image prune