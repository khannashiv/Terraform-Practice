provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "SG_Nginx" {
  description = "This SG will allow traffic both for SSH as well as HTTP."
  tags = {
    Name = "Nginx-SG"
  }

}

locals {
  nginx_ports = ["22", "80"]
}

resource "aws_vpc_security_group_ingress_rule" "Ing_Nginx" {

  description       = "Allow inbound traffic for Nginx-Web Server."
  security_group_id = aws_security_group.SG_Nginx.id
  ip_protocol       = "tcp"
  for_each          = toset(local.nginx_ports)
  from_port         = each.key
  to_port           = each.key
  cidr_ipv4         = "0.0.0.0/0"
  tags = {
    Name = "Nginx-SG-Ing"
  }
}

resource "aws_instance" "web-server" {
  ami                    = "ami-0360c520857e3138f"
  instance_type          = "t2.micro"
  key_name               = "Jenkins-KVP"
  vpc_security_group_ids = [aws_security_group.SG_Nginx.id]

  connection {
    host        = self.public_ip
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("D:/Application Setup/Sample Files/Jenkins-KVP.pem")
  }

  provisioner "remote-exec" {

    inline = [
      "sudo apt-get update",
      "sudo apt-get install nginx -y",
      "sudo systemctl start nginx",
      "sudo systemctl status nginx"
    ]
  }
}