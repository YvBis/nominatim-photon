#!/bin/bash


# Download elasticsearch index
if [ ! -d "/photon/photon_data/elasticsearch" ]; then
    echo "Start photon with nominatim import"
    java -jar photon.jar -nominatim-import -host nominatim -port 5432 -database nominatim -user nominatim -password ${NOMINATIM_DB_PASSWORD} -languages ${PHOTON_LANGUAGES_TO_IMPORT}
    java -jar photon.jar -host nominatim -port 5432 -database nominatim -user nominatim -password ${NOMINATIM_DB_PASSWORD} -nominatim-update-init-for nominatim
fi

# Start photon if elastic index exists
if [ -d "/photon/photon_data/elasticsearch" ]; then
    echo "Start photon with update api enabled"
    echo "Use curl http://nominatim_host:nominatim_port/nominatim-update to trigger update"
    echo "Uce curl /nominatim-update/status to check status"
    java -jar photon.jar -enable-update-api -host nominatim -port 5432 -database nominatim -user nominatim -password ${NOMINATIM_DB_PASSWORD}
else
    echo "Could not start photon, the search index could not be found"
fi