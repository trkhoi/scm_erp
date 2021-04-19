.PHONY: init source
init: stop ## Run a mysql server inside of a Docker Compose environment
	docker-compose up -d scm_local
	@echo "Waiting for database connection..."
	@while ! docker exec $(DB_CONTAINER)  -h localhost -p 5432 > /dev/null; do \
    	sleep 1; \
	done

.PHONY: run
run:
	MIX_ENV=dev mix phx.server

.PHONY: migrate
migrate:
	MIX_ENV=dev mix ecto.migrate

.PHONY: seed
seed: migrate
	MIX_ENV=dev mix run priv/repo/seeds.exs

.PHONY: reset
reset:
	MIX_ENV=dev mix ecto.reset
.PHONY: stop
stop: ## Stop every service of in the Docker Compose environment
	docker-compose down
