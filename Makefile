all:
	@docker compose -f ./scrs/docker-compose.yml up -d --build

down:
	@docker compose -f ./scrs/docker-compose.yml down

re:
	@docker compose -f ./scrs/docker-compose.yml up -d --build

clean:
	@docker compose -f ./scrs/docker-compose.yml down -v

fclean:
	@docker ps -qa | grep . >/dev/null && docker stop $$(docker ps -qa) || true
	@docker ps -qa | grep . >/dev/null && docker rm $$(docker ps -qa) || true
	@docker images -qa | grep . >/dev/null && docker rmi -f $$(docker images -qa) || true
	@docker volume ls -q | grep . >/dev/null && docker volume rm $$(docker volume ls -q) || true
	@networks=$$(docker network ls --format "{{.ID}} {{.Name}}" | grep -vE 'bridge|host|none' | awk '{print $$1}'); \
	if [ -n "$$networks" ]; then docker network rm $$networks; fi

.PHONY: all re down clean fclean
