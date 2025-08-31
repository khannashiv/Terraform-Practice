
variable "instance_config" {
  type = map
  default = {
    instance1 = { instance_type = "t2.micro", ami = "ami-0360c520857e3138f" }
    instance2 = { instance_type = "t2.small", ami = "ami-0360c520857e3138f" }
    instance3 = { instance_type = "t2.medium", ami = "ami-0360c520857e3138f" }
  }
}

resource "aws_instance" "example" {
  for_each = var.instance_config
  ami           = each.value.ami
  instance_type = each.value.instance_type

}