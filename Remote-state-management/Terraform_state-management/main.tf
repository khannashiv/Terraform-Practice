provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket       = "backend-s3-demo-bucket-01" # NOTE : Bucket should exists on AWS with unique name.
    key          = "Dev/Dev.tfstate"           # This file will be created inside S3 (under Dev folder) bucket not locally.
    region       = "us-east-1"
    use_lockfile = true                        # For managing locking mechanism.
  }
}

resource "aws_iam_user" "lb" {
  name  = "AWS-IAM-${count.index}"
  count = 3
}

resource "aws_security_group" "Dev-SG" {
  name = "Dev_SG"
}

resource "aws_vpc_security_group_ingress_rule" "inbound_https" {

  description       = "Allow https traffic."
  security_group_id = aws_security_group.Dev-SG.id
  ip_protocol       = "tcp"
  to_port           = 443
  from_port         = 443
  cidr_ipv4         = "10.0.0.0/16"

}

resource "aws_vpc_security_group_ingress_rule" "inbound_ssh" {

  description       = "Allow SSH traffic."
  security_group_id = aws_security_group.Dev-SG.id
  ip_protocol       = "tcp"
  to_port           = 22
  from_port         = 22
  cidr_ipv4         = "10.0.0.0/16"

}