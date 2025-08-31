provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "lb" {
  name = "User-1"

  provisioner "local-exec" {
    command = "echo-1 This is create time provisioner."
    on_failure = continue
    # Here in acutal there is no echo-1 binary which exists, due to which provisioner will fail.
    # Hence when we go with terraform apply it will going to through an error over a cli & mark resource as tainted.
    # By default on_failure flag is set to failure but in case we would like to avoid / by pass such error
    # we can set on_failure to continue to avoid any failure over cli as well as preventing resource 
    # from being tainted under state file.
  }
}