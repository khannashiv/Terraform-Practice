# Testing terraform refresh command by changing resource region & by introducing alias for same provider.

provider "aws" {
  region = "us-west-2" # Changing the region .
  alias  = "refresh"
}
resource "aws_instance" "my_ec2" {
  ami           = "ami-0c7af5fe939f2677f"
  instance_type = "t2.micro"
  provider      = aws.refresh # Calling the resource from new region for doing the testing of terraform refresh command .
}