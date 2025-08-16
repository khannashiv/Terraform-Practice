provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web" {
    instance_type   = "t2.micro"
    ami             = "ami-0de716d6197524dd9"
    count           = 3
    tags = {
        Name = "EC2-Server-${count.index}"
    }
}

# Method 1 : Of creating IAM users in a particular sequence.

resource "aws_iam_user" "lb" {
    name = "IAM-User-${count.index}"
    count = 3
}

variable "user_names" {
  type    = list
  default = ["Shiv", "Vish", "Divi", "Aastha"]
}

# Method 2 : Of creating IAM users with distinct values defined under list.

resource "aws_iam_user" "demo" {
  name = var.user_names[count.index]
  count = 2         # Count value should be always less than or equal to the number of elements defined under list.
  # Tested with count = 4, count = 3. Code works really well whereas  count = 5 is going to throw an error. 
}