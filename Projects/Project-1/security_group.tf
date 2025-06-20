resource "aws_security_group" "allow_http_ssh_traffic" {
  name        = "allow_http_ssh"
  description = "Allow inbound traffic for ssh as well as http and all outbound traffic"
  vpc_id      = aws_vpc.vpc-1.id

  tags = {
    Name = "allow_ssh_http_traffic"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_http_ipv4" {
  security_group_id = aws_security_group.allow_http_ssh_traffic.id
  cidr_ipv4         = aws_vpc.vpc-1.cidr_block
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_ipv4" {
  security_group_id = aws_security_group.allow_http_ssh_traffic.id
  cidr_ipv4         = aws_vpc.vpc-1.cidr_block
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.allow_http_ssh_traffic.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

