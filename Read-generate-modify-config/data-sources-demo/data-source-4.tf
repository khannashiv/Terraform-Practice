# Use Case: Fetching the latest OS image using data source & using this ami we are going to create resource block.
# We are writing code such a way that ec2 instance can be deployed in any region without harcoding the ami / image id.
# for a specific region.
# Along with that code will always pull latest ami / image from the specific region.
# Refrence docs: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami#id-2

# Test-1: Region set as us-east-1

# provider "aws" {
#   region = "us-east-1"
# }

# Test-2: Region set as ap-south-1

provider "aws" {
  region = "ap-south-1"
}

data "aws_ami" "example" {
  most_recent = true
  owners = ["amazon"]
  filter {
    name   = "name"
    values = ["ubuntu-minimal/images/hvm-ssd/ubuntu-lunar-23.04-amd64-minimal-*"] # To pull latest ami/image, here * points to timestamp which gets updated as per the latest chages done by aws or by owner.
  }
}

resource "aws_instance" "web" {
  instance_type = "t2.micro"
  # Here we can use either id or image_id (as attribute) since we have tested both the attributes are working fine.   
  #ami = data.aws_ami.example.id # id
  ami = data.aws_ami.example.image_id
}