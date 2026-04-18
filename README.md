# PostgreSQL 17 + PostGIS 3.5.2 + pgvector 0.8.2

[![GitHub](https://img.shields.io/badge/source-github-black?logo=github)](https://github.com/raulodev/postgres-postgis-pgvector)
[![Docker Image Size (tag)](https://img.shields.io/docker/image-size/raulodev/postgres-postgis-pgvector/latest)](https://hub.docker.com/r/raulodev/postgres-postgis-pgvector)
[![postgres-postgis-pgvector on Docker Hub](https://img.shields.io/docker/v/raulodev/postgres-postgis-pgvector?label=postgres-postgis-pgvector&logo=docker)](https://hub.docker.com/r/raulodev/postgres-postgis-pgvector)
[![Push to Docker Hub](https://github.com/raulodev/postgres-postgis-pgvector/actions/workflows/publish-docker-image.yml/badge.svg)](https://github.com/raulodev/postgres-postgis-pgvector/actions/workflows/publish-docker-image.yml)

Docker image based on `postgis/postgis:17-3.5` with the `pgvector` extension preinstalled.

## 🚀 Features

- PostgreSQL 17
- PostGIS 3.5.2 (geospatial support)
- pgvector 0.8.2 (vector similarity search for AI/ML use cases)
- Minimal and clean build (no build dependencies in final image)

## 📌 Included Extensions

- `postgis`
- `vector`

## ⚡ Quick Start

```bash
docker run -d \
  --name postgres-vector \
  -e POSTGRES_PASSWORD=postgres \
  -p 5432:5432 \
  raulodev/postgres-postgis-pgvector:v17-3.5-0.8.2
