run:build
	@echo "Starting Server" && \
	docker-compose up

build:
	@echo "Building Application" && \
	docker-compose build

import:
	@echo "Starting Importing Data from csv" && \
	docker-compose run web rake i

test:
	@echo "Starting Tests" && \
	docker-compose run web rake test

bash:
	@echo "Starting Application Bash" && \
	docker-compose run web bash
