variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "Private-subnet" {
  type    = string
  default = "10.0.1.0/24"
}

variable "Public-subnet" {
  type    = string
  default = "10.0.2.0/24"
}

variable "Public-subnet-2" {
  type    = string
  default = "10.0.3.0/24"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "ami" {
  type    = string
  default = "ami-020cba7c55df1f615"
}