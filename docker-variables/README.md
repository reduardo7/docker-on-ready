# Docker image with variable

Version with custom `Dockerfile` / **Docker Image**.

## How to run

```bash
docker-compose build
docker-compose up
```

## How is it working

1. Run the [**health check**](docker/healthcheck.sh).
    1. If it **fails**, exits from script with exit _code 1_.
    2. If the **health check is ok**, the script will _continue_.
2. If it is the **first** _health check_ **OK** and if
   `DOCKER_ON_READY` environment variable exists, execute it.
