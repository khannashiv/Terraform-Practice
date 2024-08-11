provider "aws" {
    region = "us-east-1"
    secret_key = "kpuK0flmVLPCkA9KoXqZ2FPV3lbvGLDen8C7gxqU"
    access_key = "AKIAQSUSBTMJGDWF3US3" 
}

resource "aws_instance" "my-ec2-vm" {
  ami           =  "ami-03972092c42e8c0ca"
  instance_type =  "t2.micro"
}
