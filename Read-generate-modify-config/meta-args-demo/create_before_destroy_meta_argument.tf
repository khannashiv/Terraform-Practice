# Meta-argument-1 : Create_before-destroy

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web" {
  instance_type = "t2.micro"
# ami = "ami-0360c520857e3138f"     # Ubuntu AMI : Initial
  ami = "ami-0fd3ac4abb734302a"     # Redhat AMI : New // Final
  tags = {
    Name = "Web_Instance"
  }

  lifecycle {
    create_before_destroy = true # Here as per the default behaviour of terraform it is going to
    # delete resource first & later it will add new resource if we update ami-id of the instance
    # But since we are using create_before_destroy meta-argument in that case instance will be
    # first and late rit will go ahead & destroy the resource.
  }

}