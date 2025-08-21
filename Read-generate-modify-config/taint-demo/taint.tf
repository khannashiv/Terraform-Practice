# Refrence Docs: https://developer.hashicorp.com/terraform/cli/commands/taint
# Example 1: terraform apply -replace="aws_instance.example[0]"
# Example 2: terraform apply -replace="aws_instance.web" -auto-approve

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web" {
    ami = "ami-020cba7c55df1f615"
    instance_type = "t2.micro"
  
}