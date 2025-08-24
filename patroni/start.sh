#!/bin/bash
set -euo pipefail

chown postgres:postgres /data
if [ -d /incoming_restore ]; then
    chown -R postgres:postgres /incoming_restore
fi

exec su -c "PATH=$PATH /usr/local/bin/patroni /etc/patroni.yml" postgres
