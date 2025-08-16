provider "aws" {
  region = "us-east-1"
}

resource "aws_eip" "demo_eip" {
  domain = "vpc"
}

output "elastic_public_ip" {

# value = aws_eip.demo_eip.public_ip                      # M1 : Presenting output of public IP which is one of the attribute of EIP. 
value = "https://${aws_eip.demo_eip.public_ip}:8080"    # M2 : Presenting output in the form of URL.
# value = aws_eip.demo_eip                                  # M3 : To display all the attributes associated with a resource.

}

