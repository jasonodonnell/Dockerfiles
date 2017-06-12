#!/bin/bash

set -e -u

/usr/pgsql-${PGVERSION?}/bin/pg_ctl start -w \
    --pgdata=/var/lib/pgsql/${PGVERSION?}/data

exit 0
