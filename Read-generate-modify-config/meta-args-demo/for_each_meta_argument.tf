provider "aws" {
  region = "us-east-1"
}

variable "demo-set" {
  type = set(string)
  default = ["User-1", "User-2", "User-3", "User-4", "User-5"]
}