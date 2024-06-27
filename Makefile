import-nominatim:
	make stop
	docker-compose -f docker-compose.yml up -d nominatim
	docker logs nominatim --tail 50 -f
import-photon:
	make stop
	docker-compose -f docker-compose.yml up -d
	docker logs photon --tail 50 -f
start:
	docker-compose -f docker-compose.yml up -d
stop:
	docker-compose -f docker-compose.yml down