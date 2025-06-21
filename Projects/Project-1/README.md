# Project 1 – AWS VPC, EC2, and Networking with Terraform

This project provisions a basic AWS infrastructure using Terraform. It creates a VPC, public and private subnets, security groups, EC2 instances (web servers and a repo server), NAT gateway, Application Load Balancer, and associated networking resources.

## Structure

- **main.tf**: Core infrastructure (VPC, subnets, route tables, EC2, NAT, EIP)
- **alb.tf**: Application Load Balancer, target group, listener, and target group attachments
- **providers.tf**: AWS provider configuration
- **variables.tf**: Input variables for customization
- **security_group.tf**: Security groups and rules for public/private subnets
- **outputs.tf**: Outputs for public IPs, ALB DNS, and target group info
- **user_data/**: User data scripts for web servers
  - `user_data_web_1.sh`: Installs Python, curl, jq; serves a custom HTML page with EC2 metadata (styled).
  - `user_data_web_2.sh`: Similar to web_1, with a different HTML page.
- **terraform.tfstate / terraform.tfstate.backup**: Terraform state files (should not be versioned)
- **.terraform/**: Terraform provider plugins (should not be versioned)
- **.terraform.lock.hcl**: Provider dependency lock file (should not be versioned)
- **README.md**: This documentation

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

- **VPC**: Custom VPC with CIDR block from `variables.tf`
- **Subnets**: Public and private subnets in different AZs
- **Internet Gateway**: For public subnet internet access
- **Route Tables**: Public and private, with associations
- **NAT Gateway**: For private subnet outbound internet
- **Elastic IP**: For NAT Gateway
- **Security Groups**:
  - Public: Allows HTTP (80) and SSH (22) from anywhere
  - Private: Allows SSH (22) from private subnet only
- **EC2 Instances**:
  - `web_server-1` and `web_server-2` in public subnets, each with custom user data
  - `Repo_server` in private subnet
- **Application Load Balancer**:
  - ALB in public subnets, with HTTP listener and target group
  - Both web servers registered as targets
- **Outputs**:
  - Public IPs of web servers
  - ALB DNS name and internal flag
  - Target group protocol and stickiness

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

## User Data Scripts

- **user_data_web_1.sh**: Installs Python, curl, jq; serves a styled HTML page with EC2 metadata.
- **user_data_web_2.sh**: Installs Python, curl, jq; serves a different HTML page with EC2 metadata.

## Variables

See [`variables.tf`](variables.tf) for configurable options like VPC/subnet CIDRs, instance type, and AMI.

## Outputs

See [`outputs.tf`](outputs.tf) for details on what is output after apply:
- Public IPs of both web servers
- ALB DNS name and internal flag
- Target group protocol and stickiness

## Notes

- Ensure your AWS credentials are configured.
- The key pair `Jenkins-KVP` must exist in your AWS account.
- State files and `.terraform/` are ignored via `.gitignore`.

---

## Outcomes of Hands-on

This section summarizes the key outcomes we will achieve by completing this project:

   - Gain practical experience provisioning AWS infrastructure using Terraform.
   - Understand how to design and implement a VPC with public and private subnets.
   - Learn to configure security groups, route tables, and networking components.
   - Deploy and manage EC2 instances with custom user data scripts.
   - Set up and test an Application Load Balancer with target groups.
   - Validate infrastructure by testing connectivity and load balancing behavior.
   - Develop skills in managing Terraform state and best practices for version control.

---

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

After deploying the infrastructure, we can verify the Application Load Balancer (ALB) is distributing traffic to your web servers as expected.

**ALB Endpoint:**  
`Application-Load-Balancer-1413696647.us-east-1.elb.amazonaws.com`

### Basic Connectivity Test

Use `curl` to check if the ALB is reachable and serving content:

```sh
curl --http1.0 --header "Connection: close" http://Application-Load-Balancer-1413696647.us-east-1.elb.amazonaws.com
```

### Load Balancing Test

To observe load balancing between the two web servers, run the following loop. This sends multiple requests and extracts the "Instance ID" from each response, showing which backend instance handled each request:

```sh
for i in {1..10}; do
   curl -s --http1.0 -H "Connection: close" http://Application-Load-Balancer-1413696647.us-east-1.elb.amazonaws.com | grep "Instance ID"
done
```

We should see alternating or distributed "Instance ID" values, confirming that the ALB is routing requests to both web servers.
