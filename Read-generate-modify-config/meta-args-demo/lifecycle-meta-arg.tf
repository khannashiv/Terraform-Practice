provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web" {
  instance_type = "t2.micro"
  ami = "ami-0360c520857e3138f"
  tags = {
    Name = "Web_Instance"
  }

  lifecycle {
    ignore_changes = [ tags ]
  }

}