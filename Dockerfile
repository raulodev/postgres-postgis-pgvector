FROM postgis/postgis:17-3.5

ARG PGVECTOR_VERSION=v0.8.2

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    build-essential \
    libpq-dev \
    wget \
    git \
    postgresql-server-dev-17 \
    # Clean up to reduce layer size
    && rm -rf /var/lib/apt/lists/* \
    && git clone --branch ${PGVECTOR_VERSION} https://github.com/pgvector/pgvector.git /tmp/pgvector \
    && cd /tmp/pgvector \
    && make \
    && make install \
    # Clean up unnecessary files
    && cd - \
    && apt-get purge -y --auto-remove build-essential postgresql-server-dev-17 libpq-dev wget git \
    && rm -rf /tmp/pgvector

COPY init.sql /docker-entrypoint-initdb.d/init.sql
