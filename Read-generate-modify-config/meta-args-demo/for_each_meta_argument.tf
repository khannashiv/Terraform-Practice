# Example 1 : Implamenting for_each on set data type.

# provider "aws" {
#   region = "us-east-1"
# }

# variable "demo-set" {
#   type = set(string)
#   default = ["User-1", "User-2", "User-3", "User-4", "User-5"]
# }

# resource "aws_iam_user" "IAM_Users" {
#   for_each = var.demo-set
#   name = each.key
#   path = "/"
# }

# Example 2 : Implamenting for_each on map data type.

variable "demo-map" {
    type = map
    default = {

        Dev   = "ami-0360c520857e3138f" # Ubuntu OS
        Stage = "ami-0fd3ac4abb734302a" # RedHat OS
        Prod  = "ami-00ca32bbc84273381" # Amazon Linux
    }
  
}

resource "aws_instance" "dummy" {
  instance_type = "t1.micro"
  for_each = var.demo-map
  ami = each.value
  tags = {
    Name = each.key
  }
}