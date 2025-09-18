all: data up

up:
		@docker compose -f ./srcs/docker-compose.yml up -d --build

down:
		@docker compose -f ./srcs/docker-compose.yml down

clean:
		@docker compose -f ./srcs/docker-compose.yml down -v

fclean:
		@docker ps -qa | grep . >/dev/null && docker stop $$(docker ps -qa) || true
		@docker ps -qa | grep . >/dev/null && docker rm $$(docker ps -qa) || true
		@docker images -qa | grep . >/dev/null && docker rmi -f $$(docker images -qa) || true
		@docker volume ls -q | grep . >/dev/null && docker volume rm $$(docker volume ls -q) || true
		@networks=$$(docker network ls --format "{{.ID}} {{.Name}}" | grep -vE 'bridge|host|none' | awk '{print $$>
		if [ -n "$$networks" ]; then docker network rm $$networks; fi

data:
		sudo rm -rf ~/data
		mkdir -p ~/data/mysql ~/data/wordpress

re: clean data up

.PHONY: all re down clean fclean data
