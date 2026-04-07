# 📚 EpicBook: Automated Multi-Tier AWS Deployment
A production-ready deployment of a Node.js library application on AWS, orchestrated with **Modular Terraform** and **Role-Based Ansible**.

## 🏗️ Architecture
This project implements a secure, scalable three-tier architecture:
- **Provider:** AWS (ca-central-1)
- **Provisioning:** Terraform (VPC, Public/Private Subnets, Security Groups, EC2, RDS MySQL)
- **Configuration:** Ansible (Nginx Reverse Proxy, Node.js Environment, PM2)
- **Database:** Amazon RDS (MySQL) for managed persistence.



## 🔄 The Automation Flow
The entire environment is "hydrated" via a single command:
1. **Infrastructure:** `terraform apply` provisions the network and compute resources.
2. **Orchestration:** `ansible-playbook -i inventory.ini site.yml` executes three modular roles:
    - **Common:** Baseline OS hardening.
    - **Nginx:** Reverse proxy configuration (Port 80 -> 8080).
    - **Epicbook:** Application deployment and RDS handshaking.

## 🛠️ Real-World Troubleshooting (The "Last Mile")
As a DevOps engineer, I navigated several production hurdles during this build:
- **Process Stability:** Aligned PM2 entry points (`server.js`) for persistent uptime.
- **Database Handshaking:** Automated raw SQL and CSV seeding directly into RDS instances.
- **Secret Hygiene:** Implemented robust `.gitignore` strategies to protect AWS and RDS credentials.

---
**Maintained by:** Emmanuel Adekiitan  
**Location:** Lagos, Nigeria 🇳🇬 | **Region:** ca-central-1 🇨🇦
