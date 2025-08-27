# HashiCorp Vault Demo on AWS with Terraform

This project demonstrates how to deploy [HashiCorp Vault](https://www.vaultproject.io/) on AWS using Terraform, and how to manage secrets with Vault.

---

## 📚 Reference Documentation

- [HashiCorp Vault on AWS with Terraform (Official Guide)](https://learn.hashicorp.com/tutorials/vault/deploy-terraform?in=vault/aws-get-started)
- [Vault Provider: Data Source `generic_secret`](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/generic_secret)
- [Vault Provider: Resource `generic_secret`](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/generic_secret)
- [Vault Provider: Data Source `aws_access_credentials`](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/aws_access_credentials)
- [Install Vault on Ubuntu](https://learn.hashicorp.com/tutorials/vault/getting-started-install)
- [Install Vault on EC2 using Terraform](https://learn.hashicorp.com/tutorials/vault/deploy-terraform)

---

## 🚀 Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed
- [AWS CLI](https://aws.amazon.com/cli/) configured with appropriate credentials
- An AWS account with permissions to create EC2 instances and related resources

---

## 🛠️ Setup Instructions

1. **Clone the Repository**
   ```sh
   git clone <repo-url>
   cd Terraform-Practice/Security/hashicorp-vault-demo
   ```

2. **Deploy EC2 Instance**
   - Run Terraform to provision the EC2 instance:
     ```sh
     terraform init
     terraform apply -auto-approve
     ```
   - This uses `main.tf` to create the infrastructure.

3. **Install Vault on EC2**
   - Use the provided `vault-install.sh` script to install Vault on the EC2 instance.
   - SSH into the instance and run:
     ```sh
     chmod +x vault-install.sh
     ./vault-install.sh
     ```

4. **Access Vault UI**
   - Once Vault is installed, access the Vault UI using the EC2 instance's public IP.

5. **Manage Secrets with Vault**
   - Use `vault.tf` to create and manage secrets in Vault after the UI is accessible.

---

## 💡 Notes

- **Important:** Deploy the EC2 instance first using `main.tf` and `vault-install.sh`. Only after Vault is running and accessible should you use `vault.tf` to manage secrets.
- Ensure your security groups and firewall rules allow access to Vault's UI port (default: 8200).

---

## 🧩 Troubleshooting

- If you cannot access the Vault UI, check:
  - EC2 instance status and public IP
  - Security group rules for port 8200
  - Vault service status on the EC2 instance

---

## 📦 Project Structure

```
.
├── main.tf              # Terraform config for AWS resources
├── vault-install.sh     # Script to install Vault on EC2
├── vault.tf             # Terraform config for Vault secrets
└── README.md            # Project documentation
```

---
