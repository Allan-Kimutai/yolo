# YOLO Web Application

## Description

This is a simple web application for managing products. Users can add, view, update, and delete products through a user-friendly interface.

## Requirements

Make sure that you have the following installed:

- Node.js
- npm
- MongoDB and start the mongodb service with `sudo service mongod start`

## Setup Instructions

1. **Clone the repository:**

```bash
git clone git@github.com:Allan-Kimutai/yolo.git
```

2. **Navigate to the client folder:**

```bash
cd client
```

3. **Install dependencies:**

```bash
npm install
```

4. **Start the client app:**

```bash
npm start
```

5. **Open a new terminal and navigate to the backend folder:**

```bash
cd ../backend
```

6. **Install backend dependencies:**

```bash
npm install
```

7. **Start the backend server:**

```bash
npm start
```

8. **Access the application at [http://localhost:3000](http://localhost:3000) in your web browser.**

## Kubernetes Deployment

### Step 1: Enable Kubernetes Engine API

- Enable the Kubernetes Engine API:
- [Enable Kubernetes Engine API](https://console.developers.google.com/apis/library/container.googleapis.com)

### Step 2: Create GKE Cluster

- Create the GKE Cluster:
```bash
gcloud container clusters create yolo-cluster --num-nodes=3 --zone europe-west1-b
```

- Get Cluster Credentials:
```bash
gcloud container clusters get-credentials yolo-cluster --zone europe-west1-b
```

### Step 3: Prepare Your Docker Images

- Build and Push Docker Images:
- Navigate to the backend directory and build the Docker image:
```bash
docker build -t gcr.io/dev05-yolo-425107/backend:latest .
docker push gcr.io/dev05-yolo-425107/backend:latest
```

- Navigate to the client directory and build the Docker image:
```bash
docker build -t gcr.io/dev05-yolo-425107/client:latest .
docker push gcr.io/dev05-yolo-425107/client:latest
```

### Step 4: Create Kubernetes Manifests

- Create Namespace:
- Create a namespace.yaml file and apply the namespace:
```yaml
apiVersion: v1
kind: Namespace
metadata:
name: yolo
```
```bash
kubectl apply -f namespace.yaml
```

- Create Persistent Volume and Persistent Volume Claim for MongoDB:
- Create mongo-pv.yaml and mongo-pvc.yaml for Persistent Volume and Claim, respectively.
- Apply the PV and PVC:
```bash
kubectl apply -f mongo-pv.yaml -n yolo
kubectl apply -f mongo-pvc.yaml -n yolo
```

- Create StatefulSet for MongoDB:
- Create mongo-statefulset.yaml for StatefulSet and apply it:
```yaml
apiVersion: apps/v1
kind: StatefulSet
...
```
```bash
kubectl apply -f mongo-statefulset.yaml -n yolo
```

- Create Deployments for Backend and Frontend:
- Create backend-deployment.yaml and frontend-deployment.yaml for Deployments and apply them.
- Example backend-deployment.yaml:
```yaml
apiVersion: apps/v1
kind: Deployment
...
```
```bash
kubectl apply -f backend-deployment.yaml -n yolo
```

- Create Services to Expose the Pods:
- Create backend-service.yaml and frontend-service.yaml for Services and apply them.
- Example backend-service.yaml:
```yaml
apiVersion: v1
kind: Service
...
```
```bash
kubectl apply -f backend-service.yaml -n yolo
```

### Step 5: Verify the Deployment

- Check the Status of the Pods:
```bash
kubectl get pods -n yolo
```

- Get the External IPs:
```bash
kubectl get svc -n yolo
```
## Accessing the Application
- Access the application externally via the IP address [35.195.61.146](http://35.195.61.146).

## Features

- Add new products with name, description, and price
- View a list of all products
- Update existing products
- Delete products

## Usage

1. **Add a product:** Fill out the form with the product details and click "Add Product".
2. **View products:** See the list of products displayed on the homepage.
3. **Update a product:** Click on the "Edit" button next to a product and make changes in the form.
4. **Delete a product:** Click on the "Delete" button next to a product to remove it from the list.

*Note: The price field only accepts numeric input.*

## Folder Structure

- `client/`: Contains the frontend code.
- `backend/`: Contains the backend code.
- `Stage_One/`: Contains Ansible playbooks and roles for local environment setup.
- `Stage_Two/`: Contains Terraform and Ansible configurations for cloud environment setup.
- `kubernetes/`: Contains Kubernetes configuration files (manifests).
- `backend-deployment.yaml`: Defines the Deployment resource for the backend application.
- `backend-service.yaml`: Defines the Service resource to expose the backend application.
- `client-deployment.yaml`: Defines the Deployment resource for the frontend application.
- `client-service.yaml`: Defines the Service resource to expose the frontend application.
- `mongo-pvc.yaml`: Defines the PersistentVolumeClaim resource for MongoDB.
- `mongo-pv.yaml`: Defines the PersistentVolume resource for MongoDB.
- `mongo-statefulset.yaml`: Defines the StatefulSet resource for MongoDB.
- `namespace.yaml`: Defines the Namespace resource for the project.

## Contributing

Contributions are welcome! Please fork the repository and submit a pull request.

## License

This project is licensed under the MIT License.