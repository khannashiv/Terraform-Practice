provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  region = "ap-south-1"
  alias = "mumbai"
}

module "firewall" {
  source = "../../modules/firewall-module"
  providers = {
    aws.prod = aws.mumbai     # aws.prod -- > We can give any name after aws. Here we have given prod since
    # we want Prod SG resource should be created in mumbai region.
  }
}