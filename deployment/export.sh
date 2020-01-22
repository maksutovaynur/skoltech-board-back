#!/usr/bin/env bash

docker exec -it skolboard-postgres sh -c "chown -R postgres /dumps/ && runuser postgres sh -c 'pg_dump -d skoltech_board_db -f /dumps/init.sql'"