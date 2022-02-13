build:
	docker-compose build
up:
	docker-compose up -d --build
down:
	docker-compose down
rmi:
	docker rmi rtmp_server_broadcast
shell:
	docker exec -it rtmp /bin/bash 
ffmpeg:
	docker exec -it rtmp_server_ffmpeg_1 /bin/bash