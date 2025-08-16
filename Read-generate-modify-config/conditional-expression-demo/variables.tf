variable "region" {
   default = "us-east-1"
}

variable "env" {
  default = "development"
  description = "Defining the environment type."
}


variable "environment" {
    type = list
    default = ["Dev", "UAT", "QA", "Prod"]
}

variable "demo" {
    type = map
    default = {
        env_1 = "Dev"
        env_2 = "UAT"
        env_3 = "QA"
        env_4 = "Prod"
    }
}