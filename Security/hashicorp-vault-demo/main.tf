provider "aws" {
  region = "us-east-1"  # Change if needed
}

variable "key_name" {
  default = "Jenkins-KVP"  # Must match your existing key in AWS
}

resource "aws_security_group" "vault_sg" {
  name        = "vault-sg"
  description = "Allow Vault traffic"

  ingress {
    from_port   = 8200
    to_port     = 8200
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Open to all (testing only)
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # SSH access
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "vault_server" {
  ami           = "ami-0360c520857e3138f"  # Ubuntu 20.04 in us-east-1
  instance_type = "t2.micro"
  key_name = var.key_name
  security_groups = [aws_security_group.vault_sg.name]

  user_data = file("vault-install.sh")  # Loads script from separate file

  tags = {
    Name = "VaultDevInstance"
  }
}

output "vault_public_ip" {
  description = "Public IP of the Vault server"
  value       = aws_instance.vault_server.public_ip
}
