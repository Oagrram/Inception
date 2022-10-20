FROM  debian:buster

RUN apt update && apt -y upgrade


COPY Setup_Database.sh /usr/local/bin/

EXPOSE 3306

#CMD  "/etc/Setup_Database.sh"

ENTRYPOINT ["sh" , "/usr/local/bin/Setup_Database.sh"]