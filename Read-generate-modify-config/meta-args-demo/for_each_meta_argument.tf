# Example 1 : Implamenting for_each on set data type.
# Refrence Docs : https://developer.hashicorp.com/terraform/language/meta-arguments/for_each

provider "aws" {
  region = "us-east-1"
}

variable "demo-set" {
  type = set(string)
  default = ["User-1", "User-2", "User-3", "User-4", "User-5"]
}

resource "aws_iam_user" "IAM_Users" {
  for_each = var.demo-set
  name = each.key # Here one can also specify each.value but overall output will remain same.
  path = "/"
}

# Example 2 : Implamenting for_each on map data type.

variable "demo-map" {
    type = map
    default = {

        Dev   = "ami-0360c520857e3138f" # Ubuntu AMI
        Stage = "ami-0fd3ac4abb734302a" # RedHat AMI
        Prod  = "ami-00ca32bbc84273381" # Amazon Linux AMI
    }
  
}

resource "aws_instance" "dummy" {
  instance_type = "t2.micro"
  for_each = var.demo-map
  ami = each.value
  tags = {
    Name = each.key
  }
}