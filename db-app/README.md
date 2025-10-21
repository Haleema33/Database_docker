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

## Production Deployment

### Security
- Store database credentials in AWS Secrets Manager or Kubernetes Secrets
- Use External Secrets Operator to sync secrets from AWS
- Never commit plain text passwords to Git

### Resource Management
- Resource limits prevent OOMKilled errors in production
- Adjust memory/CPU limits based on actual usage patterns
- Monitor resource consumption and scale accordingly

### Database
- PostgreSQL runs as StatefulSet for stable storage and network identity
- Persistent volumes ensure data survives pod restarts
- Consider backup strategies for production data

### Application Behavior
- Container waits for PostgreSQL availability before starting
- Runs database migrations automatically on startup
- Stays alive after migrations complete (matches Docker Compose behavior)

### Deployment Strategy
```bash
# Production deployment with custom values
helm install prod-release ./db-app -f production-values.yaml

# Upgrade existing deployment
helm upgrade prod-release ./db-app

# Check deployment status
kubectl get pods -l app=db-app
kubectl logs -l app=db-app
```