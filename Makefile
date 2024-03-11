all:
	mkdir -p /home/abelfany/data/wordpress && mkdir -p /home/abelfany/data/database && docker-compose -f srcs/docker-compose.yml up --build -d

clean:
	docker-compose -f srcs/docker-compose.yml down --rmi all --remove-orphans
fclean:
	docker-compose -f srcs/docker-compose.yml down -v --rmi all --remove-orphans
	sudo rm -rf /home/abelfany/data/wordpress/*
	sudo rm -rf /home/abelfany/data/database/*
	docker system prune 
down:
	docker-compose -f srcs/docker-compose.yml stop

re: clean all
