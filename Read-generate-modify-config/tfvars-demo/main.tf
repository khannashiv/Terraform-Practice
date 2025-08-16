provider "aws" {
    region ="us-east-1"
}

resource "aws_instance" "demo-ec2" {
  
  instance_type = "t2.micro"
  ami = var.ami
  tags = {
    name = "Demo-VM"
  }
}