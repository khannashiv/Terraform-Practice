# Refrence Docs: https://developer.hashicorp.com/terraform/language/expressions/splat

provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "lb" {
  name = "IAM-user-${count.index}"
  count = 3
}

output "arns" {
#  value = aws_iam_user.lb[0].arn   # Will display arn for user at 0th index
#  value = aws_iam_user.lb[1].arn   # Will display arn for user at 1st index
  value = aws_iam_user.lb[*].arn    # [*] -- > This is spalat function which will display arn of all the users created using terraform apply.
}