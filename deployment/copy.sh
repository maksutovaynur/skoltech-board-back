#!/usr/bin/env bash

docker run -v skolboard-postgres-dbdata:/a/ -v dump:/b/ --rm ubuntu sh -c "cp -r /a/* /b/"
