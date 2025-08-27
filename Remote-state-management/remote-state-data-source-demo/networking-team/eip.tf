provider "aws" {
  region = "us-east-1"
}

resource "aws_eip" "static_ip" {
  domain = "vpc"
}

output "display_eip" {
  value = aws_eip.static_ip.public_ip
}