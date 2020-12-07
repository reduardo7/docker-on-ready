# Docker image

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
2. If it is the **first** _health check_ **OK**, run the
   [`init.sh`](docker/init.sh) script.
