FROM ubuntu:24.04

ARG POSTGRES_VERSION
ARG PATRONI_VERSION
ENV POSTGRES_EXTENSIONS postgresql-${POSTGRES_VERSION}-pgvector

RUN apt-get -qq update && \
    apt-get install -qq -y python3-venv python3-pip pipx postgresql-common curl && \
    YES=1 /usr/share/postgresql-common/pgdg/apt.postgresql.org.sh && \
    apt-get install -qq -y postgresql-${POSTGRES_VERSION} ${POSTGRES_EXTENSIONS} && \
    rm -rf /var/lib/apt/lists/*
RUN PIPX_HOME=/opt/pipx PIPX_BIN_DIR=/usr/local/bin pipx install patroni[etcd3,psycopg3]==${PATRONI_VERSION}

ENV PATH=${PATH}:/usr/lib/postgresql/${POSTGRES_VERSION}/bin
COPY start.sh /opt

CMD [ "/opt/start.sh" ]