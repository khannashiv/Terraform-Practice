# Change 2: Instead of hardcoding provider block we are going to use required provider block so that we can add
# additional constraints w.r.t. provider block such that we can add or set version to the given provider (Say
# the code, I have written works pretty well with specific version of provider plugin say v6.6 now whenever some-one
# else would like to use my code only that specific verison of terraform provider plugin should be installed during 
# terraform init to avoid any failure like this we are fixing the constraints) & avoiding hardcoding of region 
# as parameter as well.

# provider "aws" {
#   region = var.region
# }

terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = ">=6.0.0"
    }
  }
}

resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.instance_type
}

# Change 1 : Using variables instead of static values for region, ami, instance_type.

# variable "region" {}
variable "ami" {}
variable "instance_type" {}