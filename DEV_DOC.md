# Developer Documentation — Inception

This document explains how to set up, build, run, and manage the Inception project for development purposes.

---

## Environment Setup

### Prerequisites

Before starting, make sure the following are installed on your system:
- Docker
- Docker Compose
- Git
- A Linux virtual machine (recommended for 42 projects)

### Configuration Files

The project relies on a .env file at the root of the project to store configuration variables, such as:
- MariaDB database name, user, and password
- WordPress administrator username and password

Important: The .env file is not versioned and must be present in the project root.

### Secrets

- All sensitive information is stored in the .env file.
- No Docker Secrets are used in this project for simplicity.
- Keep the .env file private.

## Build and Launch the Project

From the root directory of the project, use the Makefile commands to build and launch the services.

#### Build and start everything:

⚠️ **Warning:**  
Running `make` will delete any existing data stored in `~/data`.

```bash
make
```
This command will:
- Create persistent data directories (~/data/mysql and ~/data/wordpress)
- Copy the .env file to the appropriate location
- Build Docker images for Nginx, WordPress, and MariaDB
- Launch all services using Docker Compose

#### Stop services

Stop running containers without deleting data:
```bash
make down
```
Stop services and remove volumes (persistent data):
```bash
make clean
```
Completely reset the project, including containers, images, volumes, and networks:
```bash
make fclean
```

## Managing Containers and Volumes

Check running containers:
```bash
docker ps
```
This shows all running containers, their status, and exposed ports.

Inspect container logs:
```bash
docker logs <container_name>
```
This allows you to see any errors or messages from a specific service.

Open a shell inside a running container:
```bash
docker exec -it <container_name> sh
```

Start the MariaDB client using the credentials from your .env file:
```bash
mysql -u $MYSQL_USER -p
```
It will ask for the password ($MYSQL_PASSWORD).

### MYSQL commands

Show databases:
```bash
SHOW DATABASES;
```

Use a database (e.g., WordPress):
```bash
USE wordpress;
```

Show tables:
```bash
SHOW TABLES;
```

To exit the MariaDB client:
```bash
EXIT;
```

### Volumes commands

List all volumes:
```bash
docker volume ls
```

Inspect a specific volume:
```bash
docker volume inspect <volume_name>
```

Remove unused volumes:
```bash
docker volume prune
```

## Project Data and Persistence

- MariaDB data: stored in ~/data/mysql
- WordPress files: stored in ~/data/wordpress

These directories are mounted as Docker volumes, which means:

- Data persists across container restarts
- Backups can be made by copying the directories
- Using make clean removes volumes (database and WordPress files)
- Using make fclean completely deletes all containers, images, volumes, and networks