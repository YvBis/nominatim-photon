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