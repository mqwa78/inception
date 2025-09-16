all:
	@docker compose -f ./scrs/docker-compose.yml up -d --build

down:
	@docker compose -f ./scrs/docker-compose.yml down

re:
	@docker compose -f scrs/docker-compose.yml up -d --build

clean:
	@docker compose -f scrs/docker-compose.yml down -v

fclean:
	@if [ -n "$$(docker ps -qa)" ]; then docker stop $$(docker ps -qa); fi
	@if [ -n "$$(docker ps -qa)" ]; then docker rm $$(docker ps -qa); fi
	@if [ -n "$$(docker images -qa)" ]; then docker rmi -f $$(docker images -qa); fi
	@if [ -n "$$(docker volume ls -q)" ]; then docker volume rm $$(docker volume ls -q); fi
	@if [ -n "$$(docker network ls -q | grep -vE 'bridge|host|none')" ]; then docker network rm $$(docker network ls -q | grep -vE 'bridge|host|none'); fi

prune:
	docker system prune -af --volumes

.PHONY: all re down clean fclean prune
