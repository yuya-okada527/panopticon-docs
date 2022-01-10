run:
	make seed
	yarn start --project=local
seed:
	docker-compose -f ../api/docker-compose.yml exec panopticon-api rails db:seed
open:
	yarn open
