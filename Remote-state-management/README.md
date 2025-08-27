# Terraform Remote State Management

## Reference Docs

- [Terraform Backend](https://developer.hashicorp.com/terraform/language/backend)
- [Terraform Local Backend](https://developer.hashicorp.com/terraform/language/backend/local)
- [Terraform S3 Backend](https://developer.hashicorp.com/terraform/language/backend/s3)
- [Terraform Time Provider - Sleep Resource](https://registry.terraform.io/providers/hashicorp/time/0.9.1/docs/resources/sleep)
- [Terraform State List Command](https://docs.devnetexperttraining.com/static-docs/Terraform/docs/cli/commands/state/list.html)

- [Terraform Import Usage](https://developer.hashicorp.com/terraform/cli/import/usage)  
    Learn how to import existing infrastructure resources into your Terraform state, allowing you to manage them with Terraform going forward.

- [Terraform State Import Tutorial](https://developer.hashicorp.com/terraform/tutorials/state/state-import?utm_source=WEBSITE&utm_medium=WEB_IO&utm_offer=ARTICLE_PAGE&utm_content=DOCS)  
    Step-by-step guide on importing resources into Terraform, including practical examples and troubleshooting tips.

- [Remote State Data Source](https://developer.hashicorp.com/terraform/language/state/remote-state-data)  
    Documentation on accessing remote state data from other Terraform configurations, enabling data sharing between workspaces or projects.

---

## Sample Commands

### List Resources in State

```sh
terraform state list
```

### Show Resource Details

```sh
terraform state show aws_security_group.Dev-SG
```
- `aws_security_group` → resource type  
- `Dev-SG` → resource name  
- The combination is called the **resource address**.

```sh
terraform state show aws_vpc_security_group_ingress_rule.inbound_ssh
```
- `aws_vpc_security_group_ingress_rule` → resource type  
- `inbound_ssh` → resource name  
- The combination is called the **resource address**.

```sh
terraform state show aws_iam_user.lb[2]
terraform state show aws_iam_user.lb[0]
```

### Pull State File

```sh
terraform state pull
```

### Remove Resource from State

```sh
terraform state rm aws_vpc_security_group_ingress_rule.inbound_ssh
```
- Removes the resource from the state file, but **does not delete** the actual resource from the cloud.
- On the next `terraform plan` or `terraform apply`, Terraform will show that the resource will be created.
- To remove the resource from the configuration, delete or comment out the resource block in your configuration file (e.g., `main.tf`).

### Move Resource in State

```sh
terraform state mv aws_security_group.Dev-SG aws_security_group.Prod-SG
```
- Moves a resource from one address to another in the state file, but **does not change** the actual resource in the cloud.
- After running this command, update the resource name in your configuration file (e.g., change from `Dev-SG` to `Prod-SG` in `main.tf`).

#### Important Notes

1. If you **do not** update the resource name in your configuration, the next `terraform plan` or `terraform apply` will show the resource as deleted and a new one created.
2. If you **do** update the configuration, Terraform will show **no changes required**.

#### Changing Resource Type and Name

You can also change the resource type using `terraform state mv`:

```sh
terraform state mv aws_security_group.Dev-SG aws_vpc_security_group.Prod-SG
```

- Update both the resource type and name in your configuration file accordingly.

1. Change the resource type from `aws_security_group` to `aws_vpc_security_group` and the name from `Dev-SG` to `Prod-SG` in your configuration.
2. If you **do not** update both, Terraform will show the resource as deleted and a new one created.
3. If you **do** update both, Terraform will show **no changes required**.
