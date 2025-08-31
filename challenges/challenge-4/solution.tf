provider "aws" {
  region = "us-east-1"
}

data "aws_iam_users" "list_of_users" {}

data "aws_caller_identity" "current" {}

resource "aws_iam_user" "lb" {
  name = "admin-user-${data.aws_caller_identity.current.id}"
  path = "/system/"
}

output "list_of_users" {
  value = data.aws_iam_users.list_of_users.names
}

output "count_of_users" {
  value = length(data.aws_iam_users.list_of_users.names)
}
