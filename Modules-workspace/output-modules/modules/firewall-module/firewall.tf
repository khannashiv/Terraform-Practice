
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 6.0.0"
      configuration_aliases = [ aws.prod ]
    }
  }
}

resource "aws_security_group" "Prod-SG" {
    name = "Prod-SG"
    provider = aws.prod
}

resource "aws_security_group" "Dev-SG" {
  name = "Dev-SG"
}