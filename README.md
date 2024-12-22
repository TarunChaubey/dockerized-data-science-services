# dockerized-data-science-services

# Docker Compose Setup for Backend Services (MongoDB, PostgreSQL, Redis, OpenSearch)

This repository provides a Docker Compose configuration to easily set up a suite of essential backend services: **MongoDB**, **PostgreSQL**, **Redis**, and **OpenSearch** (with OpenSearch Dashboards for visualization). The setup allows for a scalable, persistent, and isolated environment for testing or development.

## Table of Contents
- [Overview](#overview)
- [Services Overview](#services-overview)
  - [MongoDB](#mongodb)
  - [PostgreSQL](#postgresql)
  - [Redis](#redis)
  - [OpenSearch](#opensearch)
  - [OpenSearch Dashboards](#opensearch-dashboards)
- [Setup Instructions](#setup-instructions)
  - [Prerequisites](#prerequisites)
  - [Clone the Repository](#clone-the-repository)
  - [Modify the `init.sh`](#modify-the-initsh)
  - [Running the Docker Containers](#running-the-docker-containers)
  - [Accessing the Services](#accessing-the-services)
  - [Verify the Services](#verify-the-services)
- [Testing Service Connections](#testing-service-connections)
  - [OpenSearch](#opensearch)
  - [MongoDB](#mongodb-connection)
  - [Redis](#redis-connection)
  - [PostgreSQL](#postgresql-connection)
- [Troubleshooting](#troubleshooting)
- [Contributing](#contributing)

## Overview

This repository provides a pre-configured **Docker Compose** environment to set up multiple backend services commonly used in modern applications:
- **MongoDB** (NoSQL database)
- **PostgreSQL** (Relational database)
- **Redis** (In-memory data store)
- **OpenSearch** (Search and analytics platform)
- **OpenSearch Dashboards** (Visual interface for OpenSearch)

These services are all connected on a single isolated Docker network to ensure seamless communication between them. Additionally, persistent storage is set up for each service, so data is retained even if the containers are restarted.

## Services Overview

### MongoDB
- **Image**: `mongo:latest`
- **Ports**: Exposed on port `27017`
- **Persistent Storage**: Mounted to `C:/Users/Tarun/Documents/DockerImageFiles/Mongodb` for data persistence.

### PostgreSQL
- **Image**: `postgres:latest`
- **Ports**: Exposed on port `5432`
- **Environment Variables**:
  - `POSTGRES_DB`: `mydatabase`
  - `POSTGRES_USER`: `postgre`
  - `POSTGRES_PASSWORD`: `postgre`
- **Persistent Storage**: Mounted to `C:/Users/Tarun/Documents/DockerImageFiles/Postgre` for data persistence.

### Redis
- **Image**: `redis:latest`
- **Ports**: Exposed on port `6379`
- **Persistent Storage**: Mounted to `C:/Users/Tarun/Documents/DockerImageFiles/Redis` for data persistence.

### OpenSearch
- **Image**: `opensearchproject/opensearch:latest`
- **Nodes**: Two nodes for scalability
- **Ports**: Exposed on ports `9200` and `9600`
- **Cluster Configuration**: Two nodes (`opensearch-node1`, `opensearch-node2`) in the same cluster.
- **Persistent Storage**: Each node has its data directory (`opensearch-data1` and `opensearch-data2`) for persistence.

### OpenSearch Dashboards
- **Image**: `opensearchproject/opensearch-dashboards:latest`
- **Port**: Exposed on port `5601` for web access.
- **Authentication**: Default username is `admin` with password `YourPassword1234!`.

## Setup Instructions

### Prerequisites
Before proceeding, ensure you have the following installed:
- **Docker**: [Install Docker](https://docs.docker.com/get-docker/)
- **Docker Compose**: [Install Docker Compose](https://docs.docker.com/compose/install/)
- **Linux, macOS, or WSL for Windows**: If you are using Windows, ensure that **WSL** (Windows Subsystem for Linux) is set up properly.

### Clone the Repository
Clone this repository to your local machine:
```bash
git clone <repository_url>
cd <repository_name>
