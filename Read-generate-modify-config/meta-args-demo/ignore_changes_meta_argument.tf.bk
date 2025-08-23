# Meta-argument-1 : Ignore_Changes

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web" {
  instance_type = "t2.micro"
  ami = "ami-0360c520857e3138f"
  tags = {
    Name = "Web_Instance"
  }

  lifecycle {
    ignore_changes = [ tags ] # Here default behavior of the terraform has been customnized such that 
    # now anyone who is trying to add tags to this insatnce from UI will able to add tags whereas default
    # behaviour of terraform would have deleted the tags i.e. if any modifications made to aws resource from aws UI.
  }

}