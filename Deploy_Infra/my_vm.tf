provider "aws" {
    region = "us-east-1"
    secret_key = "####"
    access_key = "####" 
}

resource "aws_instance" "my-ec2-vm" {
  ami           =  "ami-03972092c42e8c0ca"
  instance_type =  "t2.micro"
}
