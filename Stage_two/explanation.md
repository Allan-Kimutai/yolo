# Stage Two: Ansible and Terraform Instrumentation

## Overview
In Stage Two, we combine Terraform for resource provisioning and Ansible for configuration and deployment. This stage mirrors the setup in Stage One but extends it to a cloud environment using AWS. The playbook includes Terraform execution to provision the infrastructure and Ansible roles to configure and deploy the application. The roles are as follows:

1. `provision-resources`
2. `test-connectivity`
3. `update-server`
4. `setup-docker`
5. `clone-repository`
6. `setup-mongo-db`
7. `setup-backend`
8. `setup-front-end`

## Roles and Their Functions

### 1. provision-resources
**Function:** Uses Terraform to provision AWS resources.

**Reasoning:** Before configuring the servers, we need to ensure the necessary infrastructure (EC2 instances, security groups) is available.

**Modules Used:**
- `terraform`: Runs Terraform commands to provision resources.

### 2. test-connectivity
**Function:** Ensures that the Ansible control node can communicate with the newly provisioned AWS instances.

**Reasoning:** After provisioning, we need to verify connectivity to the AWS instances.

**Modules Used:**
- `ping`: Tests the connectivity to the AWS instances.

### 3. update-server
**Function:** Updates the package lists on the AWS instances and upgrades installed packages.

**Reasoning:** Keeping the system updated is crucial for security and functionality. This step ensures that all subsequent installations use the latest versions.

**Modules Used:**
- `apt`: Updates package lists and upgrades packages on Debian-based systems.

### 4. setup-docker
**Function:** Installs Docker on the AWS instances.

**Reasoning:** Docker is required for containerization. This role sets up Docker, enabling the deployment of containerized applications.

**Modules Used:**
- `apt_key`: Adds Docker's official GPG key.
- `apt_repository`: Adds Docker's official APT repository.
- `apt`: Installs Docker packages.

### 5. clone-repository
**Function:** Clones the necessary code repositories from GitHub.

**Reasoning:** The application code needs to be available on the AWS instances for deployment. This role ensures that the latest code is pulled from the repository.

**Modules Used:**
- `git`: Clones the repository to the specified location.

### 6. setup-mongo-db
**Function:** Sets up and runs a MongoDB Docker container on the AWS instances.

**Reasoning:** The backend of the application relies on MongoDB for data storage. This role ensures MongoDB is available and running.

**Modules Used:**
- `docker_container`: Manages Docker containers, ensuring MongoDB is running.

### 7. setup-backend
**Function:** Sets up and runs the backend application in a Docker container on the AWS instances.

**Reasoning:** The backend needs to be running before the frontend to ensure API endpoints are available for the frontend to consume.

**Modules Used:**
- `docker_container`: Manages Docker containers, ensuring the backend application is running.

### 8. setup-front-end
**Function:** Sets up and runs the frontend application in a Docker container on the AWS instances.

**Reasoning:** The frontend is the user-facing part of the application and depends on the backend. This role ensures the frontend is running and can interact with the backend.

**Modules Used:**
- `docker_container`: Manages Docker containers, ensuring the frontend application is running.

## Conclusion
The order of execution ensures all dependencies are met and the infrastructure is correctly provisioned before configuration and deployment. Terraform provisions the infrastructure, followed by Ansible tasks to configure the servers and deploy the application, maintaining a clear and structured deployment process.
