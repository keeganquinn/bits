#!/bin/bash

set -ex

DEST=/var/backups/pg

mkdir -p "${DEST}"
rm -f "${DEST}"/*

pg_dumpall -g | gzip > "${DEST}/globals.sql.gz"

BACKUP_QUERY="select datname from pg_database where not datistemplate and datallowconn order by datname;"

for DATABASE in $(psql -At -c "$BACKUP_QUERY" postgres); do
    pg_dump -Fc "$DATABASE" -f "${DEST}/${DATABASE}.pgc"
done
