# Method-1 (Working)

data "local_file" "foo" {
  filename = "${path.module}/README.md"         # ${path.module} : This will redirect to current working directory or current folder.
}                                               # Rather than defining the absolute path of README.md

output "display_local_file_content" {
  value = data.local_file.foo.content
}

# Method-2 (Working)

# data "local_file" "my_file" {
#   filename = "./README.md"
# }

# output "display_local_file_content" {
#   value = data.local_file.my_file.content
# }
