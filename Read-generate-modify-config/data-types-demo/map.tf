# Example-1 : Where we are passing the values of data types during the run time over a cli.

# variable "my-map-var-1" {
#   type = map
# }

# output "map-var-1" {
#   value = var.my-map-var-1
# }

# Example-2 : Where terraform is picking up default values defined under variable section on running 
# terraform plan / apply.

# variable "my-map-var-2" {
#   type    =   map
#   default = {
#     Team  = "Catalog"
#     Name  = "Alice"
#   }
# }

# output "map-var-2" {
#   value = var.my-map-var-2          # Printing the default value defined under map variable.
# }