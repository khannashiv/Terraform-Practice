resource "aws_iam_user" "lb" {
  name = "AWS_IAM_User_${count.index}"
  count = 2
}