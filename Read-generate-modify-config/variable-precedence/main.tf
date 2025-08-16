provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "web" {
    instance_type = var.instance_type
    ami           = "ami-020cba7c55df1f615"
  
}