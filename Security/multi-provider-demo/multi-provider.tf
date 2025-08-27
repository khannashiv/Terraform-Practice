provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  region = "ap-south-1"
  alias = "mumbai"
}

provider "aws" {
  region = "ca-central-1"
  alias = "canada"
}

resource "aws_security_group" "Prod-SG" {
  name = "Prod-SG"
}

resource "aws_security_group" "Dev-SG" {
  name = "Dev-SG"
  provider = aws.mumbai
}

resource "aws_aws_security_group" "Stage-SG" {
  name = "Stage-SG"
  provider = aws.canada
}