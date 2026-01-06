*This project has been created as part of the 42 curriculum by mamahtal.*

# Inception

## Description
The goal of this project is to create a WordPress website using **Nginx**, **MariaDB**, and **WordPress**, each running inside its own Docker container.  
All services are deployed and orchestrated using **Docker** and **Docker Compose**.

This project aims to introduce containerization concepts and to understand how to configure, build, and manage a multi-service application using Docker.

## Instructions

### Requirements
- A virtual machine
- Docker
- Docker Compose
- Git

### Installation and Execution

1. Start your virtual machine.
2. Clone the project into `/home/<login>` inside the VM.
3. Run the following command:
```bash
make
```
This command will:
- Create a data directory in /home/<login> with folders for MariaDB and WordPress.
- Copy the hidden .env file from the VM to the root directory of the project.
- Build the Docker images and start all services using Docker Compose.

## Resources

- [Docker Documentation](https://docs.docker.com/) – Official Docker documentation for containerization concepts, images, and containers.
- [Docker Compose Documentation](https://docs.docker.com/compose/) – Official guide for orchestrating multi-container applications.
- [Nginx Documentation](https://nginx.org/en/docs/) – Official documentation for configuring and using the Nginx web server.
- [MariaDB Documentation](https://mariadb.com/kb/en/) – Official documentation for managing MariaDB databases.
- [WordPress Documentation](https://wordpress.org/support/) – Official WordPress guides and tutorials.

## Project Description

This project uses **Docker** to run all services (Nginx, MariaDB, WordPress) in separate containers. The Docker setup allows easy deployment and isolation of services without the overhead of full virtual machines. The project includes:

- Dockerfiles for each service
- A `docker-compose.yml` file to orchestrate the containers
- A `.env` file containing configuration variables
- A `data/` directory for persistent volumes

### Main Design Choices

- Each service has its **own Dockerfile and folder** for isolation and maintainability.
- All services are orchestrated with `docker-compose.yml` for easy startup and shutdown.
- Persistent data (databases, WordPress files) is stored in Docker volumes to survive container restarts.

### Comparisons

**Virtual Machines vs Docker:**  
- VMs include a full OS, are heavier, slower to start, and use more resources.  
- Docker containers share the host OS kernel, are lightweight, start almost instantly, and are easier to manage.

**Secrets vs Environment Variables:**  
- Environment variables (`.env`) are simple to use but less secure, visible in the environment.  
- Docker Secrets are more secure, encrypted, and better for sensitive information, but more complex to set up.

**Docker Network vs Host Network:**  
- Docker networks provide isolated, manageable networks for containers.  
- Host network uses the host machine’s network stack, which is faster but less isolated.

**Docker Volumes vs Bind Mounts:**  
- Volumes are managed by Docker, portable, and suitable for database storage.  
- Bind mounts map host directories directly, convenient for development but less portable.