# Nationale-Nederlanden Challenge Solution

This repository contains the solution for the challenge proposed by **Nationale-Nederlanden**.

It is divided into **five folders**, each containing one of the components I created to fulfill the requirements of the challenge.  
Inside each folder, there is a README file explaining the purpose of its files.

I used **Azure components** (Kubernetes AKS and Container Registry ACR) instead of Amazon services because I do not have an AWS account.  
For the Kubernetes cluster deployment, the process would be essentially the same since both use a `ServiceAccount` and a config file.

However, for the registry, the pipeline would need to be adapted because I am using an Azure Pipeline task specifically for ACR.  

In the case of Amazon ECR, the connection to the registry would need to be scripted manually.

---

## Folder Structure

- **aks** → Scripts used to generate the necessary AKS objects for deployment.  
- **evidences** → Images showing the pipeline execution in order.  
- **helm-charts** → Helm charts used to deploy the application after it has been compiled and the image built.  
  In the pipeline, this is used from a repository on the `main` branch.  
- **javacode** → Source code of the Spring Boot application.  
  In the pipeline, this is used from a repository on the `dev` branch.  
- **pipelines** → YAML file defining the pipeline that compiles the code, builds the Docker image, and deploys the Spring Boot application to a Kubernetes cluster.  

---

## Technologies Used

- **Spring Boot (Java)**
- **Azure Kubernetes Service (AKS)**
- **Azure Container Registry (ACR)**
- **Helm**
- **Azure DevOps Pipelines**

---

## Notes

The project demonstrates how to build, package, and deploy a Spring Boot application into a Kubernetes environment using CI/CD automation.

