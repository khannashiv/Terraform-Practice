provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "demo-bucket" {
  bucket = "my-terraform-learning-bucket"
}

resource "aws_instance" "demo-ec2" {
  instance_type = "t1.micro"
  ami = "ami-0360c520857e3138f"
  depends_on = [ aws_s3_bucket.demo-bucket ] # This means first s3 bucket is created & 
  # later ec2 instance is created due to depends_on flag.
  # NOTE: Destruction of resources will be done in reverse way where ec2 will be destroyed
  # first & later s3 bucket. 
}