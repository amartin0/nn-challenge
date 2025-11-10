# Pipeline Upgrade Demonstration

This folder contains images demonstrating the upgrade of the application from **version 1.0.1** to **version 1.0.2** using the pipeline requested in the challenge.

---

## 📸 Pipeline Steps Overview

| Step | Images | Description |
|------|--------|-------------|
| 1    | ![01](01_status_helm_before_deploy_1.0.2_version.png) ![02](02_version_image_running_before_upgrade_1_0_2.png) ![03](03_registry_before_upgrade_app_1_0_2.png) | **Current state** of the application before the upgrade. |
| 2    | ![04](04_pipeline_execution.png) ![05](05_end_execution_stage_Dev.png) | **Triggering compilation and deployment** in the **dev** environment. |
| 3    | ![06](06_waiting_for_manual_approval_staging_1.png) ![07](07_waiting_for_manual_approval_staging_2.png) ![08](08_end_execution_staging.png) | **Approval and deployment** in the **staging** environment. |
| 4    | ![09](09_waiting_for_manual_approval_prod_1.png) ![10](10_waiting_for_manual_approval_prod_2.png) ![11](11_end_execution_stage_Prod.png) | **Approval and deployment** in the **prod** environment. |
| 5    | ![12](12_helms_after_upgrade_1.0.2.png) ![13](13_version_image_after_upgrade.png) ![14](14_registry_after_upgrade_1_0_2.png) ![15](15_service_running.png) ![16](16_web_service_running.png) | **Verification** that version 1.0.2 has been successfully deployed and is running correctly. |

---

These images illustrate the complete **CI/CD workflow**, including:

- Automatic compilation and deployment steps  
- Manual approvals for staging and production environments  
- Verification of successful version upgrade

> ⚠️ Note: The image numbers correspond to the files in this folder.
