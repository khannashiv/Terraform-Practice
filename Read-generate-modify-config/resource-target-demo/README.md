# Resource Targeting Demo
    
**Refrence docs related to provider settings & resource targeting.**

- https://developer.hashicorp.com/terraform/language/terraform

## Sample Commands Used in This Demo


Below are explanations for each command:

- `terraform plan -target "aws_instance.web"`  
    Generates an execution plan that only targets the `aws_instance.web` resource, showing what changes Terraform will make to this specific resource.

- `terraform plan -target="aws_iam_user.lb"`  
    Creates a plan that only includes actions for the `aws_iam_user.lb` resource.

- `terraform plan -target="local_file.demo"`  
    Previews changes that will be made only to the `local_file.demo` resource.

- `terraform apply -target="aws_iam_user.lb" -auto-approve`  
    Applies changes only to the `aws_iam_user.lb` resource without prompting for confirmation.

- `terraform apply -target="aws_instance.web" -auto-approve`  
    Applies changes only to the `aws_instance.web` resource and skips interactive approval.

- `terraform destroy -target="aws_iam_user.lb" -auto-approve`  
    Destroys only the `aws_iam_user.lb` resource, automatically approving the action without prompting for confirmation.

- `terraform destroy -target="aws_instance.web" -auto-approve`  
    Removes only the `aws_instance.web` resource from your infrastructure, skipping the interactive approval step.
