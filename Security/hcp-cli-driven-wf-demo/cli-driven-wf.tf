terraform { 
  cloud { 
    
    organization = "example-organization-1" 

    workspaces { 
      name = "CLI-Driven-Workflow" 
    } 
  } 
}

resource "aws_instance" "web" {
  ami           = "ami-0360c520857e3138f"
  instance_type = "t2.micro"
}

resource "time_sleep" "sleep_func" {
  create_duration = "30s"
}

output "ec2_public_IP" {
  value = aws_instance.web.public_ip
}