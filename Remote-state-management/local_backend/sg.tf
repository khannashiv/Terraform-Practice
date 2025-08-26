provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "Prod_SG" {
  name = "Prod_SG"
}