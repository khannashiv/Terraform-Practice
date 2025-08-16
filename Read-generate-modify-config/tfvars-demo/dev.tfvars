# If we are changing the name of tfvars file from terraform.tfvars something else say prod.tfvars / dev.tfvars
# / uat.tfvars in that case while running commands such as : terraform apply / plan we have to explicitly
# define the file name using -var-file i.e.  terraform plan -var-file=dev.tfvars or terraform apply -var-file=dev.tfvars

ami = "ami-020cba7c55df1f615"