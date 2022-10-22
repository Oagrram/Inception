FROM debian:buster

RUN apt-get -y update && apt-get install -y curl

RUN curl -L https://github.com/google/cadvisor/releases/download/v0.37.5/cadvisor \
-o /usr/bin/cadvisor --silent

RUN chmod +x /usr/bin/cadvisor

CMD [ "/usr/bin/cadvisor", "-logtostderr", "--port=7000" ]