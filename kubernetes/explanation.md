# Explanation of Kubernetes Deployment

In this Kubernetes stage, we deploy the YOLO web application on a Kubernetes cluster. Below is an explanation of each Kubernetes manifest created and the reasoning behind the order of execution in the playbook.

## Order of Execution in the Playbook

1. **Namespace Creation**: We start by creating a Kubernetes Namespace named "yolo" to isolate the resources of our application from other applications running in the cluster. This helps in organizing and managing resources effectively.

2. **Persistent Volume and Persistent Volume Claim for MongoDB**: Next, we define PersistentVolume (PV) and PersistentVolumeClaim (PVC) resources for MongoDB to provide persistent storage. This ensures that MongoDB data persists even if the pod is restarted or rescheduled.

3. **StatefulSet for MongoDB**: We create a StatefulSet resource for MongoDB to manage the deployment and scaling of MongoDB pods. Using StatefulSet ensures stable and unique network identifiers for MongoDB pods, making it suitable for stateful applications like databases.

4. **Deployments for Backend and Frontend**: Then, we define Deployment resources for the backend and frontend applications. Deployments manage the lifecycle of application pods, ensuring that the desired number of replicas are running and handling updates and rollbacks gracefully.

5. **Services to Expose the Pods**: Finally, we create Service resources for the backend and frontend to expose the application pods internally within the cluster. Services enable communication between different parts of the application and allow external access if configured with appropriate types.

## Explanation of Kubernetes Manifests

- **backend-deployment.yaml**: Defines a Deployment resource for the backend application. It specifies the number of replicas, the container image to use, environment variables, and port configurations.

- **backend-service.yaml**: Defines a Service resource to expose the backend application internally within the cluster. It uses a LoadBalancer type service to provide external access if needed.

- **client-deployment.yaml**: Defines a Deployment resource for the client application, assuming it's a separate frontend client. Similar to the backend deployment, it specifies the container image, replicas, and other configurations.

- **client-service.yaml**: Defines a Service resource to expose the client application internally within the cluster. Again, it uses a LoadBalancer type service to provide external access.

- **mongo-pv.yaml** and **mongo-pvc.yaml**: Define PersistentVolume and PersistentVolumeClaim resources for MongoDB to ensure persistent storage.

- **mongo-statefulset.yaml**: Defines a StatefulSet resource for MongoDB to manage the deployment and scaling of MongoDB pods. It includes volumeClaimTemplates to ensure persistent storage for each MongoDB pod.

- **namespace.yaml**: Defines a Namespace resource named "yolo" to isolate the resources of our application.

## Accessing the Application

### Frontend Client
To access the frontend client, simply navigate to [http://104.155.79.2](http://104.155.79.2) in your web browser.