FROM  debian:buster

RUN apt update && apt -y upgrade

COPY ./tools/setup_db.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/setup_db.sh

EXPOSE 3306

ENTRYPOINT ["sh" , "/usr/local/bin/setup_db.sh"]