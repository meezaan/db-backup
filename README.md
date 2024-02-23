## Database Backups to S3
This utility can back up your MySQL and PGSQL databases to an s3 bucket of your choice at an object storage provider of your choice. 

# Build the Container
The docker container is available to use from `ghcr.io/meezaan/db-backup:latest` or you can use the Dockerfile to build it yourself.

## Deploy on Kubernetes

The file `secret.yml` is provided as a sample to create a scret that you can use to provide env vars to a Kubernetes cron. The `cron.yml` file shows an example of this.

## Run on the cli with docker

```
docker run -e DBTYPE=pgsql \ ## or mysql
    -e USER=user \
    -e PASSWORD=password \
    -e DBNAME=dbname \
    -e HOST=localhost \
    -e PORT=5432 \ ## or 3306 or whatever port you use
    -e S3_ACCESS_KEY="" \
    -e S3_SECRET_KEY_KEY="" \
    -e S3_HOST="" \
    -e S3_BUCKET="" \
    -e S3_REGION="" \
    ghcr.io/meezaan/db-backup:latest
```

