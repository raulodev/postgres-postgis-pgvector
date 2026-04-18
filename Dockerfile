FROM postgis/postgis:17-3.5-alpine AS builder

ARG PGVECTOR_VERSION=v0.7.4

RUN apk add --no-cache \
    git \
    build-base \
    postgresql17-dev

ENV PATH="/usr/lib/postgresql17/bin:$PATH"

RUN git clone --branch ${PGVECTOR_VERSION} --depth 1 https://github.com/pgvector/pgvector.git /pgvector \
    && cd /pgvector \
    && make NO_LTO=1 \
    && make install

# ---------- Stage 2 ----------
FROM postgis/postgis:17-3.5-alpine

COPY --from=builder /usr/local/lib/postgresql/vector.so /usr/lib/postgresql17/
COPY --from=builder /usr/local/share/postgresql/extension/vector* /usr/share/postgresql17/extension/

COPY init.sql /docker-entrypoint-initdb.d/init.sql
