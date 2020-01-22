#!/usr/bin/env bash

./stop.sh
docker stop tmp
export DUMP_PATH=$(realpath ./dumps)
VOLUME_NAME="skolboard-postgres-dbdata"
docker volume rm "$VOLUME_NAME"
echo "$VOLUME_NAME"
docker run -v "$VOLUME_NAME":/var/lib/postgresql/data:rw -v "$DUMP_PATH":/dumps:rw --name tmp --rm -d postgres:latest
docker exec -it tmp chown -R postgres /dumps
docker exec -it tmp runuser postgres sh -c "psql -c 'CREATE DATABASE skoltech_board_db;'"
docker exec -it tmp runuser postgres sh -c "psql -d skoltech_board_db -f /dumps/init.sql"
docker stop tmp
