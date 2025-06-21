# Project 1 – AWS VPC, EC2, and Networking with Terraform

This project provisions a basic AWS infrastructure using Terraform: VPC, public/private subnets, security groups, EC2 instances (web servers and a repo server), NAT gateway, Application Load Balancer, and networking resources.

## Structure

- **main.tf**: Core infrastructure (VPC, subnets, route tables, EC2, NAT, EIP)
- **alb.tf**: Application Load Balancer, target group, listener, and attachments
- **providers.tf**: AWS provider configuration
- **variables.tf**: Input variables for customization
- **security_group.tf**: Security groups and rules
- **outputs.tf**: Outputs for public IPs, ALB DNS, and target group info
- **user_data/**: User data scripts for web servers
- **README.md**: This documentation

> **Note:**  
> Terraform state files (`terraform.tfstate*`), `.terraform/`, and `.terraform.lock.hcl` should not be versioned (see `.gitignore`).

## Architecture Diagram

```mermaid
flowchart TB
  %% Subnet Layer
  subgraph AWS_VPC["AWS VPC"]
    direction TB

    subgraph Public_Subnets["Public Subnets"]
      pub1[Subnet 1]
      pub2[Subnet 2]
    end

    subgraph Private_Subnet["Private Subnet"]
      priv[Subnet]
    end

    igw[Internet Gateway]
    nat[NAT Gateway]
    eip[Elastic IP]
    rt_pub[Public Route Table]
    rt_priv[Private Route Table]
  end

  %% Compute Layer
  web1[EC2: Web Server 1]
  web2[EC2: Web Server 2]
  repo[EC2: Repo Server]

  %% Load Balancer Layer
  alb[Application Load Balancer]
  tg[Target Group]

  %% Connections (Networking)
  igw --> rt_pub
  rt_pub --> pub1 --> web1
  rt_pub --> pub2 --> web2

  eip --> nat
  nat --> rt_priv --> priv --> repo

  alb --> tg
  tg --> web1
  tg --> web2

  alb --> pub1
  alb --> pub2

  %% Style
  classDef blackbox fill:#000,color:orange,stroke:#000,font-weight:bold;
  class igw,nat,eip,rt_pub,rt_priv,pub1,pub2,priv,web1,web2,repo,alb,tg blackbox;
```

## Resources Created

- **VPC**: Custom CIDR
- **Subnets**: Public/private in different AZs
- **Internet Gateway**: For public subnet access
- **Route Tables**: Public/private, with associations
- **NAT Gateway**: For private subnet outbound internet
- **Elastic IP**: For NAT Gateway
- **Security Groups**: Public (HTTP/SSH), Private (SSH from private subnet)
- **EC2 Instances**: Two web servers (public), one repo server (private)
- **Application Load Balancer**: In public subnets, with HTTP listener and target group
- **Outputs**: Public IPs, ALB DNS, target group info

## Usage

1. **Initialize Terraform**
   ```sh
   terraform init
   ```
2. **Plan the deployment**
   ```sh
   terraform plan
   ```
3. **Apply the configuration**
   ```sh
   terraform apply
   ```

## Variables

See [`variables.tf`](variables.tf) for configurable options (VPC/subnet CIDRs, instance type, AMI, etc).

## Outputs

See [`outputs.tf`](outputs.tf) for details:
- Public IPs of web servers
- ALB DNS name and internal flag
- Target group protocol and stickiness

## Notes

- Ensure your AWS credentials are configured.
- The key pair `Jenkins-KVP` must exist in your AWS account.

---

## Outcomes

By completing this project, we will:

- Gain hands-on experience provisioning AWS infrastructure with Terraform.
- Understand VPC, subnets, security groups, and networking.
- Deploy/manage EC2 instances with user data scripts.
- Set up and test an Application Load Balancer.
- Practice managing Terraform state and version control.

---

## Images

- ![Terraform-project-1](./images/Terraform-project-1.png)
- ![Terraform-project-2](./images/Terraform-project-2.png)
- ![Terraform-project-3](./images/Terraform-project-3.png)
- ![Terraform-project-4](./images/Terraform-project-4.png)
- ![Terraform-project-5](./images/Terraform-project-5.png)
- ![Terraform-project-6](./images/Terraform-project-6.png)
- ![Terraform-project-7](./images/Terraform-project-7.png)
- ![Terraform-project-8](./images/Terraform-project-8.png)
- ![Terraform-project-9](./images/Terraform-project-9.png)
- ![Terraform-project-10](./images/Terraform-project-10.png)
- ![Terraform-project-11](./images/Terraform-project-11.png)
- ![Terraform-project-12](./images/Terraform-project-12.png)
- ![Terraform-project-13](./images/Terraform-project-13.png)
- ![Terraform-project-14](./images/Terraform-project-14.png)
- ![Terraform-project-15](./images/Terraform-project-15.png)
- ![Terraform-project-16](./images/Terraform-project-16.png)
- ![Terraform-project-17](./images/Terraform-project-17.png)
- ![Terraform-project-18](./images/Terraform-project-18.png)
- ![Terraform-project-19](./images/Terraform-project-19.png)
- ![Terraform-project-20](./images/Terraform-project-20.png)
- ![Terraform-project-21](./images/Terraform-project-21.png)
- ![Terraform-project-22](./images/Terraform-project-22.png)
- ![Terraform-project-23](./images/Terraform-project-23.png)

---

## Testing the ALB Behaviour

After deploying, verify the ALB is distributing traffic to your web servers.

**ALB Endpoint:**  
`Application-Load-Balancer-1413696647.us-east-1.elb.amazonaws.com`

**Basic Connectivity Test:**
```sh
curl --http1.0 --header "Connection: close" http://Application-Load-Balancer-1413696647.us-east-1.elb.amazonaws.com
```

**Load Balancing Test:**
```sh
for i in {1..10}; do
   curl -s --http1.0 -H "Connection: close" http://Application-Load-Balancer-1413696647.us-east-1.elb.amazonaws.com | grep "Instance ID"
done
```
You should see alternating "Instance ID" values, confirming ALB routing.