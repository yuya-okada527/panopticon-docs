run:
	docker-compose up -d --remove-orphans
	docker-compose exec panopticon-api sh ./bin/waiting-db-connection.sh
	docker-compose exec panopticon-api rails db:create
	docker-compose exec panopticon-api ridgepole -c config/database.yml -E development -f db/Schemafile --apply
	docker-compose exec panopticon-api ridgepole -c config/database.yml -E test -f db/Schemafile --apply
	docker-compose exec panopticon-api rails db:seed
migrate:
	docker-compose exec panopticon-api rails db:create
	docker-compose exec panopticon-api ridgepole -c config/database.yml -E development -f db/Schemafile --apply
	docker-compose exec panopticon-api ridgepole -c config/database.yml -E test -f db/Schemafile --apply
seed:
	docker-compose exec panopticon-api rails db:seed
down:
	docker-compose down
build:
	docker-compose build
update:
	docker-compose run panopticon-api bundle
	docker-compose build
console:
	docker-compose exec panopticon-api rails console
rspec:
	docker-compose exec panopticon-api bundle exec rspec
