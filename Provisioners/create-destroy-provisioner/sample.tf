provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "lb" {
  name = "IAM-User-1"

  provisioner "local-exec" {
    # command = "This is create time provisioner." 
    # To create tainted resource remove echo and we can see under terraform tfstate resource 
    # will be marked as tainted.
    # Once we add echo back followed by we go with terraform apply it will automatically go ahead &
    # delete tainted resource 
    command = "echo This is create time provisioner."
  }

  provisioner "local-exec" {
    when = destroy
    command = "echo This is destroy time provisioner."
  }
}