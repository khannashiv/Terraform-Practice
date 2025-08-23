# Use_Case: Do direct mapping of user_name with user_arn.

provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "lb" {
  name = "AWS-IAM-User-${count.index}"
  count = 3
  path = "/"
}

output "user_names" {
  value = aws_iam_user.lb[*].name
}

output "user_arns" {
  value = aws_iam_user.lb[*].arn
}

output "combined_output" {
  value = zipmap(aws_iam_user.lb[*].name, aws_iam_user.lb[*].arn) # Use of zipmap function.
}