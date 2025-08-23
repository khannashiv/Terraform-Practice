# Set : Un-ordered collection of items.Further set data type will remove duplicates as well.

# Test un-ordered collection behavior of set data-type by changing order / index value of elements say:
# placing last element in the start of list and vice-versa. Then go with terraform plan >> followed by 
# terraform apply. We will see order does not matter in this case.

variable "set-1" {
  type = set(string)
  default = ["Alice", "Bob", "John", "Alice"]
}

output "set-1" {
  value = var.set-1
}