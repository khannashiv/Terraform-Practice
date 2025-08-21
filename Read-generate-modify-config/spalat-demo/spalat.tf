# Refrence Docs: https://developer.hashicorp.com/terraform/language/expressions/splat

provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "lb" {
  name = "IAM-user-${count.index}"
  count = 3
}

output "arns" {
  value = aws_iam_user.lb[*].arn        # [*] -- > This is spalat function.
}