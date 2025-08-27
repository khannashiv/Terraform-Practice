resource "aws_security_group" "demo" {
  description = "This is virtual firewall which will whitelist eip."
}

resource "aws_vpc_security_group_ingress_rule" "whitelist-eip" {
  description       = "whitelist-eip"
  security_group_id = aws_security_group.demo.id
  ip_protocol       = "tcp"
  from_port         = 22
  to_port           = 22
  cidr_ipv4         = "${data.terraform_remote_state.eip.outputs.display_eip}/32"
  # cidr_ipv4 = "${data.terraform_remote_state.eip.resources[0].instances[0].attributes.public_ip}" --- > 
  # NOTE: We're trying to directly access Terraform state internals, which is not supported. 
  # terraform_remote_state only exposes outputs, not the full resources block.  
  tags = {
    Name = "Whitelist_EIP"
  }
}