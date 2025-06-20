resource "aws_vpc" "vpc-1" {
  cidr_block=var.vpc_cidr
  tags = {
    Name = "My-VPC"
  }
}

resource "aws_subnet" "Private-subnet" {
  vpc_id = aws_vpc.vpc-1.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  tags={
    Name="Private-Subnet"
  }
}

resource "aws_subnet" "Public-subnet" {
  vpc_id            =       aws_vpc.vpc-1.id
  cidr_block        =       "10.0.2.0/24"
  availability_zone =       "us-east-1b"
  map_public_ip_on_launch = true
  tags={
    Name="Public-Subnet"
  }
}

resource "aws_internet_gateway" "My-igw" {
  vpc_id = aws_vpc.vpc-1.id
  tags = {
    Name="My-igw"
  }
}

resource "aws_route_table" "My-RT" {
  vpc_id = aws_vpc.vpc-1.id
  route{
    gateway_id = aws_internet_gateway.My-igw.id
    cidr_block = "0.0.0.0/0"
  }
  tags={
    Name="My-RT"
  }
}

resource "aws_route_table_association" "RT-Subnet-Association" {
  subnet_id      = aws_subnet.Public-subnet.id
  route_table_id = aws_route_table.My-RT.id
}

resource "aws_instance" "web_server-1" {
  ami           = "ami-020cba7c55df1f615"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.Public-subnet.id
  vpc_security_group_ids = [aws_vpc_security_group_ingress_rule.allow_ssh_ipv4.security_group_id, aws_vpc_security_group_ingress_rule.allow_http_ipv4.security_group_id]
  user_data_base64 = base64encode(file("./user_data.sh"))
  key_name   = "Jenkins-KVP"
  tags = {
    Name = "web-server-1"
  }
}