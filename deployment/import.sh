#!/bin/bash

./stop.sh
docker volume rm skolboard-postgres-dbdata
docker run -v skolboard-postgres-dbdata:/var/lib/postgresql/data:rw -v ./dumps/:/dumps:rw --name tmp --rm -d postgres:latest
docker exec -it tmp sh -c "chown -R postgres /dumps && runuser postgres psql -c 'CREATE DATABASE skoltech_board_db;'"
docker exec -it tmp runuser postgres psql -d skoltech_board_db -f /dumps/init.sql
