# Sensitive Information Handling in Terraform

This demo explores how to manage sensitive information in Terraform using the `sensitive` attribute for variables and outputs. You will learn how toggling the `sensitive` flag affects the visibility of values in Terraform plan and apply outputs.

## Reference Docs

- [local_sensitive_file Resource](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/sensitive_file)

- [local_file Resource](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file)

- [aws_db_instance Resource](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance)

- [Protect sensitive input variables](https://developer.hashicorp.com/terraform/tutorials/configuration-language/sensitive-variables)

## How to Use

1. **Define sensitive variables and outputs** in your Terraform configuration.
2. **Toggle the `sensitive` attribute** between `true` and `false` for variables and outputs.
3. **Run `terraform plan` and `terraform apply`** to observe how sensitive values are displayed or hidden in the output.
4. **Review the Terraform output** to understand the impact of the `sensitive` attribute.

> **NOTE:** In this entire handson we keep on testing the sensitivity of the variable and output by toggling the sensitive attribute between true and false along with observing the changes in the terraform plan output