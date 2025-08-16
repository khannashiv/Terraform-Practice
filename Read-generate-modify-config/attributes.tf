# Reading attributes from terrafrom state file & matching those attributes by going to aws UI. Such as:
# instance_id, public_ip, private_ip, dns, id etc.

# provider "aws" {
#   region = "us-east-1"
# }

# resource "aws_instance" "web" {
#     ami = "ami-020cba7c55df1f615"
#     instance_type = "t2.micro"
# }

# resource "aws_eip" "static_ip" {
#     domain = "vpc"    
# }