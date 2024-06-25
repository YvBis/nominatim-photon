# Nominatim-Photon

This is a stub for nominatim + photon duo. Photon updates itself together with Nominatim and from Nominatim.

### Usage
```shell 
cp .env.dist .env
docker compose -f "docker-compose.yml" up -d --build
```
- First, nominatim data should be imported
```shell
  docker logs nominatim --tail 50 -f
```
wait for process to finish.

- Second, stop the app
```shell
    docker compose -f "docker-compose.yml" down
```

- Remove the photon data and start app again
```shell
    rm -rf photon-data/*
    docker compose -f "docker-compose.yml" up -d
```

- Check the import process for Photon
```shell
    docker logs photon --tail 50 -f
```

Wait for the process to finish
```
[main] INFO  de.komoot.photon.App - ES cluster is now ready.
```

### Configuration
The composed app is configured via `.env` file. 
Main options are:

- `PBF_URL` you can search on [Geofabrik](https://download.geofabrik.de) for other countries data. Or use [Mirrors](https://wiki.openstreetmap.org/wiki/Planet.osm).
- `REPLICATION_URL` is url for updates
- `PHOTON_LANGUAGES_TO_IMPORT` to choose supported languages
- `APP_PORT` is the port for app to launch on. I.E. if your app port is `8095` then checkout `http://photon.localhost:8095/api?q=kiev` and http://nominatim.localhost:8095/search?q=kiev