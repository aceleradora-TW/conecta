build:
	@echo "Building Application"
	docker-compose build

run:build
	@echo "Starting Server"
	docker-compose up web db

bash:
	@echo "Starting Application Bash"
	docker-compose run web bash

stop:
	docker-compose stop

ps:
	docker-compose ps

js-install:
	npm install

test:
	@echo "Starting Tests"
	docker-compose up web_test

js-test:
	npm test

db-start:
	docker-compose up -d db

db-console:db-start
	@echo "Starting psql console..."
	@docker-compose exec db psql -d test_db -U test

db-reset:db-start
	@echo "Cleaning up database..."
	@docker-compose run web rake db:reset
	@echo "Selecting count of institutions:"
	@docker-compose exec -T db psql -d test_db -U test -c 'SELECT count(id) from institutions;'

db-migrate:db-start
	@echo "Migrating database structure"
	@docker-compose run web rake db:migrate
	@echo "Created the following entities in test_db database:"
	@docker-compose exec -T db psql -d test_db -U test -c '\d'

db-seed:db-migrate
	@echo "Importing Data from CSV"
	@docker-compose run web rake db:seed
	@docker-compose run web rake db:seed_test_users
	@echo "Selecting count of inserted institutions:"
	@docker-compose exec -T db psql -d test_db -U test -c 'SELECT count(id) from institutions;'
