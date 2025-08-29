provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web-server" {
  ami = "ami-0360c520857e3138f"
  instance_type = "t2.micro"
  provisioner "local-exec" {
    command = "echo The server's private IP address ${self.private_ip} + along with public IP ${self.public_ip}"
  }
}

