variable "region" {
  default = "us-east-1"
}

variable "tags" {
  type = list
  default = ["firstec2","secondec2"]
}

variable "ami" {
  type = map
  default = {
    "us-east-1"  = "ami-020cba7c55df1f615"
    "us-west-2"  = "ami-014e30c8a36252ae5"
    "ap-south-1" = "ami-0e1d06225679bc1c5"
  }
}