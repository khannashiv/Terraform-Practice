# module "ec2-instance" {
#   source  = "terraform-aws-modules/ec2-instance/aws"
#   version = "6.1.0"
# }

module "s3-bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "5.5.0"
}