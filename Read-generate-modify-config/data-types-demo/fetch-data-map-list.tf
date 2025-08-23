# provider "aws"{
#     region = "us-east-1"
# }

# variable "list_1" {
#     type = list
#     default = ["t2.micro", "t2.small", "t2.medium", "m5.xlarge"]
# }

# variable "map_1" {
#   type    = map
#   default = {
#     # Defining Key & value pair.
#     us-east-1  = "t2.micro"
#     us-west-1  = "t2.small"
#     us-north-3 = "t2.medium"
#     us-south-3 = "m5.xlarge"
#   }
# }

# resource "aws_instance" "web" {
#   ami = "ami-0de716d6197524dd9"
#   #instance_type = var.list_1[3]            # To fetch values from the given list and here we are fetching value from 3rd index.
#   #instance_type = var.list_1[0]            # Fetching the value from list at index 0.
#   #instance_type = var.map_1["us-south-3"]  # Fetching the value from map by defining key inside square brackets.
#   instance_type = var.map_1["us-west-1"]    # Fetching the value from map by defining key inside square brackets.
# }