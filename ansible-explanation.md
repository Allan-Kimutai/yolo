# Stage One: Ansible Instrumentation

## Overview
In Stage One, we use Ansible to provision and configure a Vagrant-based environment. The playbook is designed to ensure that all necessary components are set up in a specific order to avoid dependencies issues and ensure smooth deployment. The roles included in the playbook are as follows:

1. `test-connectivity`
2. `update-server`
3. `setup-docker`
4. `clone-repository`
5. `setup-mongo-db`
6. `setup-backend`
7. `setup-front-end`

## Roles and Their Functions

### 1. test-connectivity
**Function:** Ensures that the Ansible control node can communicate with the target nodes.

**Reasoning:** This is the initial step to verify that the target nodes are reachable before proceeding with any configuration tasks.

**Modules Used:**
- `ping`: Tests the connectivity to the target nodes.

### 2. update-server
**Function:** Updates the package lists on the target nodes and upgrades installed packages.

**Reasoning:** Keeping the system updated is crucial for security and functionality. This step ensures that all subsequent installations use the latest versions.

**Modules Used:**
- `apt`: Updates package lists and upgrades packages on Debian-based systems.

### 3. setup-docker
**Function:** Installs Docker on the target nodes.

**Reasoning:** Docker is required for containerization. This role sets up Docker, enabling the deployment of containerized applications.

**Modules Used:**
- `apt_key`: Adds Docker's official GPG key.
- `apt_repository`: Adds Docker's official APT repository.
- `apt`: Installs Docker packages.

### 4. clone-repository
**Function:** Clones the necessary code repositories from GitHub.

**Reasoning:** The application code needs to be available on the target nodes for deployment. This role ensures that the latest code is pulled from the repository.

**Modules Used:**
- `git`: Clones the repository to the specified location.

### 5. setup-mongo-db
**Function:** Sets up and runs a MongoDB Docker container.

**Reasoning:** The backend of the application relies on MongoDB for data storage. This role ensures MongoDB is available and running.

**Modules Used:**
- `docker_container`: Manages Docker containers, ensuring MongoDB is running.

### 6. setup-backend
**Function:** Sets up and runs the backend application in a Docker container.

**Reasoning:** The backend needs to be running before the frontend to ensure API endpoints are available for the frontend to consume.

**Modules Used:**
- `docker_container`: Manages Docker containers, ensuring the backend application is running.

### 7. setup-front-end
**Function:** Sets up and runs the frontend application in a Docker container.

**Reasoning:** The frontend is the user-facing part of the application and depends on the backend. This role ensures the frontend is running and can interact with the backend.

**Modules Used:**
- `docker_container`: Manages Docker containers, ensuring the frontend application is running.

## Conclusion
The order of execution is critical in ensuring all dependencies are met before each component is set up. Starting with connectivity checks and system updates ensures a stable base. Docker is then installed, followed by the cloning of necessary repositories. MongoDB is set up first as the database, followed by the backend, and finally the frontend, ensuring all components can interact seamlessly.
