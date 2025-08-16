provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "my-sg" {
  name = "my-sg-1"
  description = "This is demo security group."
  tags={
    name="my-sg-1"
  }
}

resource "aws_vpc_security_group_ingress_rule" "ssh-rule" {
    security_group_id = aws_security_group.my-sg.id
    cidr_ipv4   = var.vpn_ip
    ip_protocol = "tcp"
    from_port   = 22
    to_port     = 22
}

resource "aws_vpc_security_group_ingress_rule" "app-rule" {
    security_group_id = aws_security_group.my-sg.id
    cidr_ipv4   = var.vpn_ip
    ip_protocol = "tcp"
    from_port   = var.app_port
    to_port     = var.app_port
}

resource "aws_vpc_security_group_ingress_rule" "web-rule" {
    security_group_id = aws_security_group.my-sg.id
    cidr_ipv4   = var.vpn_ip
    ip_protocol = "tcp"
    from_port   = 80
    to_port     = 80
}