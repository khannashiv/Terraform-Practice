provider "aws" {
  region = "us-east-1"
}

locals {
  workspace_instance_type = { # workspace_instance_type --> This name can be anything.
     dev = "t2.micro"
     prod = "t3.micro"
  }
}
resource "aws_instance" "web" {
instance_type = local.workspace_instance_type[terraform.workspace]
ami = "ami-0360c520857e3138f"
#   instance_type = [terraform.workspace]
}
