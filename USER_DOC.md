# User Documentation — Inception

This document explains how to use and manage the Inception project as an end user or administrator.

---

## Overview of the Services

This project provides a complete WordPress website deployed using Docker.  
The stack includes the following services:

- **Nginx**  
  Acts as a web server and reverse proxy.  
  It serves the WordPress website securely using HTTPS (TLS).

- **WordPress**  
  The content management system (CMS) that allows users to create and manage website content.

- **MariaDB**  
  The database server used by WordPress to store all data (users, posts, settings).

Each service runs in its own Docker container and communicates through a Docker network.

---

## Starting and Stopping the Project

### Start the project

⚠️ **Warning:**  
Running `make` will delete any existing data stored in `~/data`.

From the root directory of the project, run:

```bash
make
```
This command will:
- Remove any existing ~/data directory
- Create the ~/data/mysql and ~/data/wordpress directories
- Copy the .env file into the project configuration
- Build the Docker images
- Start all services using Docker Compose

### Stop the project

To stop the running containers **without deleting data**:
```bash
make down
```

To stop the project and remove Docker volumes (database and WordPress files):
```bash
make clean
```

To completely remove all Docker containers, images, volumes, and networks (full reset):
```bash
make fclean
```
This command should only be used for troubleshooting or a full cleanup.

## Accessing the Website

### WordPress Website

Open a web browser and go to:
https://mamahtal.42.fr

A browser warning may appear because a self-signed SSL certificate is used.

### WordPress Administration Panel

To access the WordPress administration interface, go to:
https://mamahtal.42.fr/wp-admin

Log in using the administrator credentials defined in the `.env` file.

## Credentials Management

All credentials used by the project are stored in the `.env` file located at the root of the project.

This file contains:
- MariaDB database name
- Database user and password
- WordPress administrator username and password

Example environment variables:
- `MYSQL_DATABASE`
- `MYSQL_USER`
- `MYSQL_PASSWORD`
- `WP_ADMIN_USER`
- `WP_ADMIN_PASSWORD`

⚠️ The `.env` file is not versioned and must be kept private.

To modify credentials:
1. Stop the project
2. Edit the `.env` file
3. Restart the project using `make`

## Checking Services Status

To ensure that all services are running correctly, follow these steps:

### 1. Check running containers

Use the command:

```bash
docker ps
```
You should see the following containers running:
- nginx
- wordpress
- mariadb
Each container should have a STATUS of Up.

```bash
docker compose ps
```
This command shows the status of all services managed by Docker Compose, including ports and current state.

To see detailed logs for a service, run:
```bash
docker logs <container_name>
```
This allows you to check for errors or warnings and confirm that the service is operating correctly.