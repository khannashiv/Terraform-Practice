# Terraform Practice: Modules & Workspaces

This repository demonstrates the use of **Terraform modules** and **workspaces** for managing AWS infrastructure as code. It includes practical examples of how to structure reusable modules, reference remote and local modules, and leverage workspaces for environment separation (e.g., dev, staging, prod).

## Structure

- `modules/` - Contains reusable Terraform modules (e.g., S3 bucket, EC2 instance).
- `environments/` - Example configurations for different environments using workspaces.
- `main.tf` - Entry point for Terraform configuration.

## Getting Started

1. **Install Terraform**:  
   Download and install Terraform from [terraform.io](https://www.terraform.io/downloads.html).

2. **Initialize the project**:  
   ```sh
   terraform init
   ```

3. **Select or create a workspace**:  
   ```sh
   terraform workspace new dev
   terraform workspace select dev
   ```

4. **Apply the configuration**:  
   ```sh
   terraform apply
   ```

## Reference Docs

- https://registry.terraform.io/providers/hashicorp/aws/latest
- https://github.com/terraform-aws-modules
- https://registry.terraform.io/modules/terraform-aws-modules/s3-bucket/aws/latest
- https://registry.terraform.io/modules/terraform-aws-modules/ec2-instance/aws/latest
- https://developer.hashicorp.com/terraform/language/modules/sources
- https://developer.hashicorp.com/terraform/language/modules/sources#github
- https://developer.hashicorp.com/terraform/language/modules/sources#local-paths
- https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip.html
- https://developer.hashicorp.com/terraform/language/modules/develop/providers
- https://developer.hashicorp.com/terraform/cli/workspaces
- https://developer.hashicorp.com/terraform/language/state/workspaces

## Notes

- Use modules to avoid code duplication and promote best practices.
- Workspaces help manage multiple environments with the same configuration, reducing complexity and potential errors.

