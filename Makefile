run:
	@echo "Starting Server" && \
	docker-compose up

import:
	@echo "Starting Importing Data from csv" && \
	docker-compose run web rake i

test:
	@echo "Starting Tests" && \
	docker-compose run web rake test

bash:
		@echo "Starting Application Bash" && \
		docker-compose run web bash
