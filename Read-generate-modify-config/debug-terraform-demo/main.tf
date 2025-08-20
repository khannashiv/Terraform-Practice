resource "local_file" "foo" {
  filename = "${path.module}/Demo.txt"
  content = "This a demo file."
}