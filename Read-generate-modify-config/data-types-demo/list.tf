# List : is ordered collection of items. 

# Test this behavior by changing order / index value of elements say: placing last element
# in the start of list and vice-versa. Then go with terraform plan >> followed by terraform
# apply.

variable "list-1" {
  type = list(string)
  default = ["Raj", "Alice", "John", "Bob"]
}

output "list-1" {
  value = var.list-1
}