up:               ## Construye y arranca en segundo plano
	docker compose up --build -d

bash:             ## Entra al contenedor
	docker compose exec mt bash

down:             ## Apaga y limpia
	docker compose down
