provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "demo-bucket" {
  bucket = "my-terraform-learning-bucket"
}

resource "aws_instance" "demo-ec2" {
  instance_type = "t1.micro"
  ami = "ami-0360c520857e3138f"
  depends_on = [ aws_s3_bucket.demo-bucket ] # This means
}