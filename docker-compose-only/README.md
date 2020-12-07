# Docker-Compose only

Version without `Dockerfile` / **Docker Image**, using official/existing image.

You only need `docker-compose.yml` and `sh` scripts.

## How to run

```bash
docker-compose up
```

## How is it working

1. Run the [**health check**](docker/healthcheck.sh).
  a. If it **fails**, exits from script with exit _code 1_.
  b. If the **health check is ok**, the script will _continue_.
2. If it is the **first** _health check_ **OK**, run the
   [`init.sh`](docker/init.sh) script.
