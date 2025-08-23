#!/bin/bash
set -euo pipefail

# Put secrets to config files
for f in /etc/barman-sources/*.conf; do
    envsubst < $f > /etc/barman.d/$(basename $f)
done

# Sleep forever, but handle signals to exit cleanly
# Why barman is run with podman exec is because container-ops
# overlay networking is (too) closely coupled to container deployments
pid=
trap '[[ $pid ]] && kill $pid; exit' SIGINT
trap '[[ $pid ]] && kill $pid; exit' SIGTERM
sleep infinity & pid=$!
wait
pid=