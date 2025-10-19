# DB-App Helm Chart

Simple Helm chart for deploying an application with PostgreSQL database.

## Install
```bash
helm install my-release ./db-app
```

## Configure
Edit `values.yaml` to customize:
- App image and port
- Database credentials
- Storage size

## Components
- Application deployment
- PostgreSQL StatefulSet
- Services for both components