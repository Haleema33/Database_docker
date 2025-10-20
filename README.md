# Database_docker

Lightweight Docker setup that runs a database alongside an "app" container which is responsible for running Alembic migrations automatically against the database.

Overview
--------
This repository contains a Docker-based setup with two containers:
- `db` — the database container (for example PostgreSQL). Configure the exact image and credentials as needed in your docker-compose file or environment.
- `app` — an application container that contains Alembic and is responsible for running database migrations. On startup this container runs Alembic migrations (e.g. `alembic upgrade head`) so the database schema is kept up-to-date automatically.

Docker Hub image
---------------
The application image is available on Docker Hub:

https://hub.docker.com/r/haleema22/dockes_files01-app

Pull the image:
```bash
docker pull haleema22/dockes_files01-app
```

Usage
-----
The simplest way to run the stack is via docker-compose. Example `docker-compose.yml` (adjust environment variables, image tags and volumes to match your project):


Start services:
```bash
docker-compose up -d
```

This will start the `db` container and the `app` container. The `app` container is expected to run Alembic migrations automatically on start (for example by running `alembic upgrade head` in its entrypoint).

Manual migration commands
-------------------------
If you need to run migrations manually:

- Using docker-compose:
  ```bash
  docker-compose run --rm app alembic upgrade head
  ```

- Using the Docker Hub image:
  ```bash
  docker run --rm --network host -e DATABASE_URL="postgresql+psycopg2://example:example@localhost:5432/example_db" haleema22/dockes_files01-app alembic upgrade head
  ```
  (Adjust network and DATABASE_URL to match your environment.)

Notes & best practices
----------------------
- Ensure the `app` container waits for the database to be ready before running migrations. In some setups you may need a small wait/retry logic or use a "wait-for" utility to avoid migration failures on cold starts.
- For production, pin image tags, enable proper backups for the database volume, and secure network access.

Troubleshooting
---------------
- If migrations fail on container start:
  - Check container logs: `docker-compose logs app`
  - Verify connection string (DATABASE_URL) and DB credentials.
  - Ensure the DB image has finished initialization before Alembic connects — add a retry/wait mechanism if necessary.

