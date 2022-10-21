NAME = Inception

all: clean reload

linux:
	@ echo "127.0.0.1 oagrram.42.fr" >> /etc/hosts && mkdir -p /home/oagrram/data/wordpress /home/oagrram/data/mariadb
	
stop:
	@ docker-compose -f srcs/docker-compose.yml down

clean: stop
	@ docker system prune -f

prune: clean
	@ rm -rf /home/oagrram/data/wordpress/* && rm -rf /home/oagrram/data/mariadb/* 

reload:
	@ docker-compose -f srcs/docker-compose.yml up --build

.PHONY: linux stop clean prune reload all
