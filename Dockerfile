FROM alpine:3.19

# Install mysqldump & pgsql
RUN apk add --no-cache mysql-client postgresql s3cmd

RUN mkdir -p /scripts/
COPY mysql.sh /scripts/mysql.sh
COPY pgsql.sh /scripts/pgsql.sh
COPY run.sh /scripts/run.sh

ENV USER ""
ENV PASSWORD ""
ENV HOST ""
ENV DBNAME ""
ENV DBTYPE ""
ENV S3_ACCESS_KEY ""
ENV S3_SECRET_KEY ""
ENV S3_HOST ""
ENV S3_BUCKET ""
ENV S3_REGION ""

ENTRYPOINT ["sh", "/scripts/run.sh"]
