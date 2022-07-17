#!/bin/bash

# Database credentials
user="$USER"
password="$PASSWORD"
host="$HOST" 
port="$PORT"
db_name="$DBNAME"

# Other options
backup_path="/root/backups/database"
date=$(date +"%d-%b-%Y")
backup_path_remote="$RCLONEPATH"
year=$(date +"%Y")
month=$(date +"%b")

# Set default file permissions
#umask 002

# Create clean directory
rm -rf $backup_path
mkdir -p $backup_path
cd $backup_path

# Dump database into SQL file
mysqldump --user=$user --password=$password --port=$port --host=$host --add-drop-table --no-tablespaces --skip-lock-tables --skip-add-locks $db_name > $db_name-$date.sql
tar -czvf $db_name-$date.sql.tar.gz $db_name-$date.sql
rm $db_name-$date.sql

# Copy to OneDrive
rclone -vv copy $backup_path/$db_name-$date.sql.tar.gz $backup_path_remote/$year/$month/
