# Refrence Docs: 
    # https://developer.hashicorp.com/terraform/language/expressions/splat
    # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user
    # https://developer.hashicorp.com/terraform/language/values/outputs
    # https://developer.hashicorp.com/terraform/cli/commands/output
    # Some commands used in this handson are as follows:
      # terraform output user_arns
      # terraform output "user_names"

provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "lb" {
  name = "IAM-user-${count.index}"
  count = 3
}

output "user_arns" {
#  value = aws_iam_user.lb[0].arn   # Will display arn for user at 0th index
#  value = aws_iam_user.lb[1].arn   # Will display arn for user at 1st index
  value = aws_iam_user.lb[*].arn    # [*] -- > This is spalat function which will display arn of all the users created using terraform apply.
}

output "user_names" {
  value = aws_iam_user.lb[*].name
}