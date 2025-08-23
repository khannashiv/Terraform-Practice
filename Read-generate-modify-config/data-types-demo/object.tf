# Example 1 : Without default values.

variable "object-demo" {
  type = object({
    User_Name = string     # Key_1 = Data_type_1
    User_ID = number       # Key_2 = Data_type_2
  })

}

output "object-demo" {
  value = var.object-demo
}

# NOTE : On runnig (terrafomrm apply or plan) the example-1 on the cli, we have to define
# value explicitly over cli something like: {"User_Name"="Shiv", "User_ID"=123}

# Example 2 : With default values.

variable "server_config" {
  description = "Configuration for the server"
  type = object({
    instance_type = string
    disk_size     = number
    region        = string
  })
  default = {
    instance_type = "t2.micro"
    disk_size     = 20
    region        = "us-east-1"
  }
}

output "server_config" {
  value = var.server_config
}
