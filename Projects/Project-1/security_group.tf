############# Security Group for Public Subnet #############################

resource "aws_security_group" "allow_http_ssh_traffic" {
  # Creates a security group for public subnet allowing HTTP and SSH inbound, all outbound
  name        = "allow_http_ssh"
  description = "Allow inbound traffic for ssh as well as http and all outbound traffic"
  vpc_id      = aws_vpc.vpc-1.id

  tags = {
    Name = "allow_ssh_http_traffic"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_http_ipv4" {
  # Allows inbound HTTP (port 80) from anywhere (0.0.0.0/0)
  security_group_id = aws_security_group.allow_http_ssh_traffic.id
  # cidr_ipv4         = aws_vpc.vpc-1.cidr_block
  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_ipv4" {
  # Allows inbound SSH (port 22) from anywhere (0.0.0.0/0)
  security_group_id = aws_security_group.allow_http_ssh_traffic.id
  # cidr_ipv4         = aws_vpc.vpc-1.cidr_block
  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  # Allows all outbound traffic from the security group
  security_group_id = aws_security_group.allow_http_ssh_traffic.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

########### Security group for Private Subnet #############################################

resource "aws_security_group" "allow_required_traffic_private-subnet" {
  # Creates a security group for private subnet allowing SSH inbound, all outbound
  name        = "allow_ssh"
  description = "Allow inbound traffic for ssh and all outbound traffic"
  vpc_id      = aws_vpc.vpc-1.id

  tags = {
    Name = "allow_ssh_traffic"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_ipv4_private_subnet" {
  # Allows inbound SSH (port 22) only from 10.0.2.0/24 (private subnet)
  security_group_id = aws_security_group.allow_required_traffic_private-subnet.id
  cidr_ipv4         = "10.0.2.0/24"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4_private-subnet" {
  # Allows all outbound traffic from the private subnet security group
  security_group_id = aws_security_group.allow_required_traffic_private-subnet.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}