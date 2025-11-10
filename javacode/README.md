# Java Application

This folder contains the Java application that will be deployed.  
It is a simple **Hello World** application that displays the **version** and **digest** of the image that has been deployed.

---

## Versioning

- The version specified in the `pom.xml` file is used by the pipeline to **compile** and **build a new Docker image** with the updated application version.

---

## Pipeline Integration

- The pipeline uses the **`dev` branch** of this code to build and deploy the application.

