Prometheus Metrics + Alerts
Overview

This task implements monitoring and alerting for the MyESI API Gateway. It collects metrics from FastAPI and Redis, exposes them via Prometheus, and sends alerts using Alertmanager for specific conditions such as high error rates or rate limit violations.

Features Implemented

API Performance Metrics: Request counts, request latency, status codes.

Redis Metrics: Redis usage and health.

Error Monitoring: Tracks HTTP 500 errors and failed requests.

Alerts: Configured in Prometheus + Alertmanager to notify on:

Excessive HTTP 500 errors

Rate-limit hits

Prometheus Metrics Endpoint: /metrics exposed by FastAPI.

Centralized Dashboard: View all metrics in Grafana.

Technology Stack
Tool	Purpose
Prometheus	Collects service metrics from FastAPI and Redis.
Alertmanager	Sends alerts when thresholds are exceeded.
FastAPI instrumentation	Exposes metrics like response time and status codes.
Redis Exporter	Provides metrics about Redis performance and usage.
Docker Compose	Orchestrates FastAPI, Redis, Prometheus, Alertmanager, and Redis Exporter.
Architecture
FastAPI (API Gateway)
    │
    ├─ exposes /metrics → Prometheus scrapes it
    │
Redis
    ├─ monitored via Redis Exporter → Prometheus scrapes metrics
    │
Prometheus
    ├─ collects metrics from FastAPI and Redis
    ├─ evaluates alert rules
    └─ sends alerts to Alertmanager

Alertmanager
    └─ receives alerts from Prometheus and can notify via configured channels (e.g., email, Slack)

Docker Compose Setup

Start all services:

docker-compose up -d


Services and Ports:

Service	Port
FastAPI App	8000
Redis	6379
Redis Exporter	9121
Prometheus	9090
Alertmanager	9093

Prometheus Configuration Files:

monitoring/prometheus.yml → scrape targets

monitoring/alert_rules.yml → alert definitions

Alertmanager Configuration File:

monitoring/alertmanager.yml → alert routing and notification channels

How to Test

Access FastAPI:

curl http://localhost:8000/


Check Prometheus metrics:

http://localhost:9090/targets
http://localhost:9090/graph


Check Alertmanager:

http://localhost:9093


Trigger alerts by generating multiple errors or exceeding rate limits to see them in Alertmanager.
