data "s3" "fetch-eip" {
  bucket = "backend-s3-demo-bucket-01"
}

resource "aws_security_group" "demo" {
  description = "This is virtual firewall which will whitelist eip."
}

resource "aws_vpc_security_group_ingress_rule" "whitelist-eip" {
    description = "whitelist-eip"
    security_group_id = aws_security_group.demo.id
    ip_protocol = "tcp"
    from_port = 22
    to_port = 22
    cidr_ipv4 = "${data.s3.fetch-eip}/32"

}