DIR = /Users/${USER}/data

NAME = inception

.SILENT:

all: $(NAME)

$(NAME):
	rm -rf ${DIR}
	mkdir ${DIR}
	mkdir ${DIR}/MariaDB
	mkdir ${DIR}/WordPress

	docker-compose -f ./srcs/docker-compose.yml up --build -d
	
	printf "\x1B[32m$(NAME) ready\x1B[0m\n";

clean:
	docker-compose -f ./srcs/docker-compose.yml down --rmi all -v --remove-orphans 2>/dev/null || true

fclean: clean
	rm -rf ${DIR}/*
	docker rmi -f $$(docker images -a -q) 2> /dev/null || true
	docker volume prune -f

re: fclean all

.PHONY: all clean fclean re
