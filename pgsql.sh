#!/bin/bash

# Database credentials
user="$USER"
password="$PASSWORD"
export PGPASSWORD="$password"
host="$HOST" 
port="$PORT"
db_name="$DBNAME"
s3_access_key="$S3_ACCESS_KEY"
s3_secret_key="$S3_SECRET_KEY"
s3_host="$S3_HOST"
s3_bucket="$S3_BUCKET"
s3_region="$S3_REGION"

# Other options
backup_path="/root/backups/database"
date=$(date +"%d-%b-%Y")
backup_path_remote="s3://$s3_bucket/"

# Create clean directory
rm -rf $backup_path
mkdir -p $backup_path
cd $backup_path

# Dump database into BAK file
pg_dump -h $host -p $port -U $user $db_name > $db_name-$date.sql
cat $db_name-$date.sql
tar -czvf $db_name-$date.sql.tar.gz $db_name-$date.sql
rm $db_name-$date.sql

s3cmd -v --acl-private --region=$s3_region --access_key=$s3_access_key --secret_key=$s3_secret_key --host=$s3_host --host-bucket=$s3_bucket.$s3_region put $backup_path/$db_name-$date.sql.tar.gz $backup_path_remote/$db_name/