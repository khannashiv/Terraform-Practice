# Method-1

data "local_file" "foo" {
  filename = "${path.module}/README.md"
}

# Method-2

data "local_file" "my_file" {
  filename = "./README.md"
}
