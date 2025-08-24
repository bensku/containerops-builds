#!/bin/bash
set -euo pipefail

# Put secrets to config files
shopt -s nullglob
for f in /etc/barman-sources/*.conf; do
    envsubst < $f > /etc/barman.d/$(basename $f)
done

chown barman:barman /var/lib/barman
chown barman:barman /var/barman_restored || true

touch /var/log/barman/barman.log
chown barman:barman /var/log/barman/barman.log

cleanup() {
    kill -TERM $tailpid $cronpid
    wait $tailpid $cronpid
}
trap cleanup SIGINT SIGTERM

tail -f /var/log/barman/barman.log & tailpid=$!
cron -f & cronpid=$!

wait -n
cleanup