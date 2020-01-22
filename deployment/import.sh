#!/bin/bash

./stop.sh
docker volume rm skolboard-postgres-dbdata
DUMP_PATH=$(realpath ./dumps)
docker run -v skolboard-postgres-dbdata:/var/lib/postgresql/data:rw -v "$DUMP_PATH":/dumps:rw --name tmp --rm -d postgres:latest
docker exec -it tmp chown -R postgres /dumps
#docker exec -it tmp runuser postgres sh -c "psql -c 'CREATE DATABASE skoltech_board_db;'"
docker exec -it tmp runuser postgres psql -d skoltech_board_db -f /dumps/init.sql
