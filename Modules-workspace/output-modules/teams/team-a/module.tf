# Refrence docs for attaching eip with instance : https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip.html

module "ec2" {
  source = "../../modules/ec2-module"
}

resource "aws_eip" "my-eip" {
  domain = "vpc"
  instance = module.ec2.instance_id
}
