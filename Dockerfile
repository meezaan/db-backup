FROM rclone/rclone:1.54

# Install mysqldump
RUN apk add --no-cache mysql-client

# Install Pqsql
RUN apk add postgresql

# COPY rclone file
COPY rclone.conf /config/rclone/rclone.conf

RUN mkdir -p /scripts/
COPY mysql.sh /scripts/mysql.sh
COPY pgsql.sh /scripts/pgsql.sh
COPY run.sh /scripts/run.sh

ENV USER ""
ENV PASSWORD ""
ENV HOST ""
ENV DBNAME ""
ENV DBTYPE ""
ENV RCLONEPATH ""

ENTRYPOINT ["sh", "/scripts/run.sh"]
