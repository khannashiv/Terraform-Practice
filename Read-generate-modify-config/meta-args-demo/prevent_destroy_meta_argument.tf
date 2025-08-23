# Meta-argument-3 : prevent-destroy

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web" {
  instance_type = "t2.micro"
  ami = "ami-0fd3ac4abb734302a"     # Redhat AMI : New
  tags = {
    Name = "Web_Instance_RedHat"
  }

  lifecycle {
    prevent_destroy = true # Here as per the default behaviour whenever we go ahead & use 
    # terraform destroy it is going to destroy infrastructure but as aoon as we go head & use
    # prevent destroy meta-arg it will prevent destruction operation.
  }

}