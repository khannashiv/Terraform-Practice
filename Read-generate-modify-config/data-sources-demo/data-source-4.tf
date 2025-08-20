# provider "aws" {
#   region = "us-east-1"
# }

provider "aws" {
  region = "ap-south-1"
}

data "aws_ami" "example" {
  most_recent = true
  owners = ["amazon"]
  filter {
    name   = "name"
    values = ["ubuntu-minimal/images/hvm-ssd/ubuntu-lunar-23.04-amd64-minimal-*"]
  }
}

resource "aws_instance" "web" {
  instance_type = "t2.micro"
  #ami = data.aws_ami.example.id # id
  ami = data.aws_ami.example.image_id
}