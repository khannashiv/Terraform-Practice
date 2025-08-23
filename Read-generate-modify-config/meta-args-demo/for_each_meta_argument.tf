provider "aws" {
  region = "us-east-1"
}

variable "demo-set" {
  type = set(string)
  default = ["User-1", "User-2", "User-3", "User-4", "User-5"]
}

resource "aws_iam_user" "IAM_Users" {
  for_each = var.demo-set
  name = each.key
  path = "/"
}