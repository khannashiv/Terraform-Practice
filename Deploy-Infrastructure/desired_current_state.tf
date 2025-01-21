provider "aws" {
   region = "us-east-1"
}

resource "aws_instance" "my_ec2" {
  ami = "ami-0c7af5fe939f2677f"
  instance_type = "t2.micro"
}