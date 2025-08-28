# HCP CLI Driven Workflow Demo

This repository demonstrates how to use the HashiCorp Cloud Platform (HCP) CLI to manage Terraform workflows, with a focus on security best practices. It includes references and resources for working with HCP, AWS, and policy-as-code using Sentinel.

---

## Reference Documentation

- **[HCP CLI Documentation](https://developer.hashicorp.com/terraform/cloud-docs/cli)**  
  Official documentation for the HCP CLI, including installation, configuration, and usage instructions.

- **[HCP GitHub Repository](https://github.com/hashicorp/tfc-getting-started.git)**  
  Example projects and getting started guides for Terraform Cloud and HCP.

- **[HashiCorp Cloud Platform (HCP) Provider](https://registry.terraform.io/providers/hashicorp/hcp/latest/docs)**  
  Terraform provider documentation for managing HCP resources.

- **[AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)**  
  Terraform provider documentation for managing AWS resources.

- **[HCP Login](https://app.terraform.io/app/)**  
  Access the HCP/Terraform Cloud web UI for managing your workspaces and resources.

---

## Policy as Code (Sentinel) & Security References

- **[Browse Terraform Policies](https://registry.terraform.io/browse/policies?provider=aws)**  
  Explore available policy sets for AWS and other providers.

- **[CIS Policy Set for AWS Terraform](https://registry.terraform.io/policies/hashicorp/CIS-Policy-Set-for-AWS-Terraform/1.0.1)**  
  Predefined policy set based on CIS benchmarks for AWS, to enforce security best practices.

- **[Policy Library: EC2 Security Group Ingress Restriction](https://github.com/hashicorp/policy-library-CIS-Policy-Set-for-AWS-Terraform/blob/main/policies/ec2/ec2-security-group-ingress-traffic-restriction-port.sentinel)**  
  Example Sentinel policy to restrict EC2 security group ingress traffic.

  - **[Sentinel Documentation](https://developer.hashicorp.com/sentinel/docs)**

---

## Usage

1. **Clone this repository**  
   ```sh
   git clone https://github.com/your-org/hcp-cli-driven-wf-demo.git
   cd hcp-cli-driven-wf-demo
   ```

2. **Install the HCP CLI**  
   Follow the [official guide](https://developer.hashicorp.com/terraform/cloud-docs/cli/install).

3. **Configure your environment**  
   - Set up your HCP/Terraform Cloud credentials.
   - Configure AWS credentials if working with AWS resources.

4. **Run Terraform workflows**  
   Use the HCP CLI to initialize, plan, and apply your Terraform configurations.

---

## About

This demo is intended for practitioners looking to automate secure infrastructure provisioning using Terraform Cloud, HCP CLI, and policy-as-code.  
For more details, refer to the documentation links
