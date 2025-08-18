provider "aws" {
    region = "us-east-1"
}

# Creating an iam user

resource "aws_iam_user" "demo-user-1" {
  name   = "demo-user-1"
}

# Policy points to S3 list permissions.

resource "aws_iam_policy" "demo-policy-1" {
  name = "demo-policy-1"
  policy = file("./sample-s3.json") # Here we are using file fuction to call policy.json i.e. sample-s3.json
}

# Ataching policy to the above iam user

resource "aws_iam_policy_attachment" "atatch-demo-policy-1" {
    name = "demo-policy-attach"
    policy_arn = aws_iam_policy.demo-policy-1.arn
    users = [aws_iam_user.demo-user-1.name]
}