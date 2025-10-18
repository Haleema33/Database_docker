#!/bin/bash
# wait for PostgreSQL to be ready
until pg_isready -h db -U myuser; do
  echo "Waiting for database..."
  sleep 2
done

# run Alembic migrations
alembic upgrade head

# keep container alive
tail -f /dev/null
