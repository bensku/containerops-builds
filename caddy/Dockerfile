ARG CADDY_VERSION

FROM caddy:${CADDY_VERSION}-builder-alpine AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/rfc2136@e50b9f25dd68882c76758446195aca0507be3c05 \
    --with github.com/pberkel/caddy-storage-redis@fed0b75ad30062850329262657d189604fd9c024

FROM caddy:${CADDY_VERSION}-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy