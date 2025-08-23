# Commands used and docs followed related to graph are as follows
    # terraform graph
    # terraform graph -type=plan
    # https://developer.hashicorp.com/terraform/cli/commands/graph
    # https://graphviz.org/download/ # Install graphwiz natively on windows OS and others as well.
    # Some of the online editors for graphwiz are as follows.
        # https://edotor.net/
        # https://dreampuf.github.io/GraphvizOnline
        # https://www.devtoolsdaily.com/graphviz
    
provider "aws" {
  region = "us-east-1"
}

resource "aws_eip" "public-ip" {
    domain = "vpc"
}
resource "aws_security_group" "web-sg" {
  name = "web-sg"
  description = "This is web firewall."
}

resource "aws_vpc_security_group_ingress_rule" "web" {
  description       = "White-listing EIP"
  security_group_id = aws_security_group.web-sg.id
  ip_protocol = "tcp"
  from_port = 443
  to_port = 443
  cidr_ipv4 = "${aws_eip.public-ip.public_ip}/32"
}

resource "aws_instance" "web" {
  ami="ami-020cba7c55df1f615"
  instance_type = "t2.micro"
}