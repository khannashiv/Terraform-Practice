# CRAR : Cross resource attribute refrence

# PS : We need to associate or whitelist elastic ip under ingress rule of security group.

provider "aws" {
  region = "us-east-1"
  alias = "CRAR"
}
resource "aws_eip" "my-eip" {
    provider = aws.CRAR
    domain = "vpc"
}

resource "aws_security_group" "my-sg" {
    provider = aws.CRAR
    name = "my-sg"
    description = "This is a demo sg."
    tags = {
      name = "my-sg"
    }
}

resource "aws_vpc_security_group_ingress_rule" "my-ingress-rule" {
    provider = aws.CRAR
    security_group_id = aws_security_group.my-sg.id   ### CRAR
    ip_protocol= "tcp"                              
    cidr_ipv4  = "${aws_eip.my-eip.public_ip}/32"     ### CRAR
    from_port  = 90
    to_port    = 100
}