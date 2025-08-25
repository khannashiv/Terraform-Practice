provider "aws" {
  region = "us-east-1"
}

module "ec2" {
  source = "../../modules/ec2-module"
}

resource "aws_eip" "my-eip" {
  domain = "vpc"
  instance = module.ec2.instance_id
}
