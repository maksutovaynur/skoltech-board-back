#!/usr/bin/env bash

docker exec -it skolboard-api python manage.py $*
sudo chown -R aynur ../board/migrations
