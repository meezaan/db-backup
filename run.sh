#!/bin/bash

echo "DATABASE TYPE IS $DBTYPE"

if [ $DBTYPE == 'mysql' ]
then
  sh /scripts/mysql.sh
elif [ $DBTYPE == 'pgsql' ]
then
  sh /scripts/pgsql.sh
else
  echo "No DBTYPE specified."
fi

