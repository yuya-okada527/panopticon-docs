run:
	docker-compose up -d --remove-orphans
	docker-compose exec panopticon-api sh ./bin/waiting-db-connection.sh
	docker-compose exec panopticon-api rails db:create
	docker-compose exec panopticon-api ridgepole -c config/database.yml -E development -f db/Schemafile --apply
down:
	docker-compose down
