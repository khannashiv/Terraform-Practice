# Example 2: Dynamic Block for Security Group Rules using iterator.

provider "aws" {
  region = "us-east-1"
}

variable "db_sg_port" {
  type    = list(number)
  default = [1443, 5432, 3369, 3306]
}

resource "aws_security_group" "db-sg" {
  name        = "db-security-group"
  description = "This is database security group."
  dynamic "ingress" {
    for_each = var.db_sg_port
    iterator = port
    content {
      to_port     = port.value   # Name-of-iterator.value
      from_port   = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}