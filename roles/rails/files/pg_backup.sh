#!/bin/bash

set -ex

pg_dumpall -g | gzip > "globals".sql.gz

BACKUP_QUERY="select datname from pg_database where not datistemplate and datallowconn order by datname;"

for DATABASE in $(psql -At -c "$BACKUP_QUERY" postgres); do
    pg_dump -Fc "$DATABASE" -f "$DATABASE".pgc
done
