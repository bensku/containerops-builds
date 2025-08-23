FROM ubuntu:24.04

ARG POSTGRES_VERSION

RUN apt-get -qq update && \
    apt-get install -qq -y postgresql-common gettext-base && \
    YES=1 /usr/share/postgresql-common/pgdg/apt.postgresql.org.sh && \
    apt-get install -qq -y barman postgresql-client-${POSTGRES_VERSION} && \
    rm -rf /var/lib/apt/lists/*

COPY start.sh /opt

ENTRYPOINT [ "/opt/start.sh" ]