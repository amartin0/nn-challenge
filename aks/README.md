# Kubernetes Deployment Scripts

This directory contains the scripts and configuration files used to prepare the Kubernetes environment for deploying the Spring Boot application across the three environments: **dev**, **staging**, and **prod**.

---

## Files Description

### `creacion_configs.bash`
Generates the Kubernetes **config files** required to use the **ServiceAccounts** that deploy the application images to the Kubernetes cluster.

### `namespaces.bash`
Creates the **namespaces**, **ServiceAccounts**, **Roles**, and **RoleBindings** necessary to deploy the Spring Boot application in the three environments: **dev**, **staging**, and **prod**.

### `secrettoken.yaml`
Defines the **tokens** associated with the ServiceAccounts created by the `creacion_configs.bash` script.  
These tokens are used within the Kubernetes config files for authentication and image deployment.

---

## Usage

Run the scripts in the following order to prepare the cluster:

```bash
./namespaces.bash
kubectl apply -f secrettoken.yaml
./creacion_configs.bash

## Result
All required namespaces and ServiceAccounts will be created.
Each environment will have the necessary permissions for deploying images.
Kubernetes config files will be generated and ready for use in CI/CD pipelines.
