**Refrence Docs**

- [HashiCorp Vault on AWS with Terraform](https://learn.hashicorp.com/tutorials/vault/deploy-terraform?in=vault/aws-get-started)
- https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/generic_secret
- https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/generic_secret
- https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/aws_access_credentials

NOTE : Please make sure deploy the EC2 instance first using main.tf and vault-install.sh file. After that you can use vault.tf file to create secrets in vault.