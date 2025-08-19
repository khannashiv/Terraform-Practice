# Method-1 (Working)

data "local_file" "foo" {
  filename = "${path.module}/README.md"
}

# Method-2 (Working)

# data "local_file" "my_file" {
#   filename = "./README.md"
# }
