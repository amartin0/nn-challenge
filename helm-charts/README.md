# Helm Chart for Kubernetes Deployment

This Helm Chart is used to deploy the application to a Kubernetes cluster.

---

## Description

- On each pipeline execution, the following values are updated dynamically:  
  - **Application version**  
  - **Image tag** (composed of the application version and the image digest)  
  - **Registry folder** where the image will be pulled from (`dev`, `staging`, or `prod`)

- The chart deploys:  
  - A **Service** to expose the application  
  - A **Deployment** with a single replica by default (this is for testing purposes to minimize cluster resource usage)
  - The pod will be tagged with the digest for security and with the version to simplify management for administrators and developers.

Note: The replica count can be adjusted in values.yaml if needed for production.


