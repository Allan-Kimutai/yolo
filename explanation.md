# Docker Setup and Deployment Documentation
## 1. Choice of Base Images:
### Backend Container:
Base Image: node:16-alpine
Reasoning: The node:16-alpine image was selected for its lightweight nature, which is ideal for running Node.js applications. The Alpine variant reduces image size, resulting in faster build times and smaller final image sizes. Additionally, Node.js 14 ensures compatibility with the backend's runtime environment and required packages.
        
### Client Container:
Base Image: node:16-alpine
Reasoning: For the frontend container, we chose the node:16-alpine image to leverage the latest features and dependencies for building modern React applications. Node.js 16 provides compatibility with the latest tools and libraries, while the Alpine variant ensures a lightweight image, optimizing resource usage and deployment efficiency.

## 2. Dockerfile Directives:
### Backend Container:
Directives Used: FROM, WORKDIR, COPY, RUN, EXPOSE, CMD
Explanation: These directives configure the backend container environment, set the working directory, copy application files, install dependencies, expose the required port, and define the command to start the backend server.

Specify the base image for the build stage.<br />
 ```FROM node:14-alpine```

Set the working directory inside the container for subsequent instructions.<br />
 ```WORKDIR /app/backend```

Copy the package.json and package-lock.json files from the host to the container's working directory<br />
 ```COPY package*.json ./```

Install dependencies defined in the package.json file using npm.<br />
 ```RUN npm install```

Expose port 5000 to allow external communication with the backend application.<br />
 ```EXPOSE 5000```

Define the command to start the backend server using npm start.<br />
 ```CMD ["npm", "start"]```

### Client Container:
Directives Used: FROM, WORKDIR, COPY, RUN, EXPOSE, CMD
Explanation: These directives are used to configure the frontend container environment, set the working directory, copy application files, install dependencies, build the React app, expose the required port, and define the command to serve the built application.

Pull the official Node.js 16 Alpine image for building the frontend.<br />
 ```FROM node:16-alpine as build```

Set the working directory inside the container for subsequent instructions.<br />
 ```WORKDIR /app/client```

Copy the package.json and package-lock.json files from the host to the container's working directory.<br />
 ```COPY package*.json ./```

Install dependencies defined in the package.json file using npm.<br />
 ```RUN npm install```
 
Copy the rest of the application code.<br />
 ```COPY . .```

Build the React app<br />
 ```RUN npm run build```

Use a lightweight Node.js image for the production stage<br />
 ```FROM node:16-alpine```

Set the working directory inside the container<br />
 ```WORKDIR /app/client```

Copy the build output from the build stage and the package*.json file.<br />
 ```COPY --from=build /app/client/build ./build```<br />
 ```COPY --from=build /app/client/package.json /app/client/package-lock.json ./```

Install the serve package globally to serve the static build files. The -g flag installs the package globally, making it available as a command-line tool<br />
```RUN npm install -g serve```

Install dependencies defined in the package.json file using npm.<br />
 ```EXPOSE 3000```

Install dependencies defined in the package.json file using npm.<br />
 ```CMD ["serve","-s","build"]```

## 3. Docker-compose Networking:
### Ports Exposed:
Frontend: Port 3000<br />
Backend: Port 5000

### Bridge Network Implementation: 
In the docker-compose.yml file, I defined a custom bridge network named "yolo-network" under the networks section. This network is configured with the bridge driver, which is the default driver for Docker Compose networks. By specifying this network for our services (frontend, backend, and mongo), they are all connected within the same network, allowing seamless communication

## 4. Docker-compose Volume Definition and Usage:
In the docker-compose.yml file, I defined three named volumes (backend-data, client-data, and mongo-data) using the local driver, indicating storage on the Docker host's local filesystem. Although not currently mounted, they serve as placeholders for potential future data persistence needs, ensuring scalability and preparedness for future requirements.

## 5. Git Workflow:
Commit Messages: Used descriptive commit messages following the conventional format.

## 6. Successful Running of Applications and Debugging Measures:
Running the Applications: Successfully launched the containers using ```docker-compose up``` and verified functionality by adding a product.
Debugging Measures: Monitored container logs, inspected network configurations, and reviewed Dockerfile instructions to resolve any issues encountered during setup.

## 7. Docker Image Tag Naming Standards:
Tagging Convention: Followed semantic versioning for Docker image tags (version.major.minor). Additionally, included relevant metadata such as commit hash or build number for identification.

## 8. Screenshot of Deployed Image on DockerHub:
The below is the deployed images on DockerHub
![client/Screenshots/Screenshot from 2024-05-04 01-34-22.png](<client/Screenshots/Screenshot from 2024-05-04 01-34-22.png>)

![client/Screenshots/Screenshot from 2024-05-04 02-39-44.png](<client/Screenshots/Screenshot from 2024-05-04 02-39-44.png>)

![client/Screenshots/Screenshot from 2024-05-04 02-45-23.png](<client/Screenshots/Screenshot from 2024-05-04 02-45-23.png>)

The below is the list of related Docker images for this project on the local system showing the tags & size of the images
![client/Screenshots/Screenshot from 2024-05-04 01-41-49.png](<client/Screenshots/Screenshot from 2024-05-04 01-41-49.png>)