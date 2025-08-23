# Example 1 : Explicit Dependency using depends_on flag.

# provider "aws" {
#   region = "us-east-1"
# }

# resource "aws_s3_bucket" "demo-bucket" {
#   bucket = "my-terraform-learning-bucket-001"
# }

# resource "aws_instance" "demo-ec2" {
#   instance_type = "t1.micro"
#   ami = "ami-0360c520857e3138f"
#   depends_on = [ aws_s3_bucket.demo-bucket ] # This means first s3 bucket is created & 
#   # later ec2 instance is created due to depends_on flag.
#   # NOTE: Destruction of resources will be done in reverse way where ec2 will be destroyed
#   # first & later s3 bucket. (This is explicit dependency.)
# }

# Output looks something like shown below.

    # Case 1 : Creating resources.

            # On running terraform apply -auto-approve, this will show output something like shown below.

                    # # Plan: 2 to add, 0 to change, 0 to destroy.
                    # aws_s3_bucket.demo-bucket: Creating...
                    # aws_s3_bucket.demo-bucket: Creation complete after 5s [id=my-terraform-learning-bucket-001]
                    # aws_instance.demo-ec2: Creating...
                    # aws_instance.demo-ec2: Still creating... [00m10s elapsed]
                    # aws_instance.demo-ec2: Creation complete after 16s [id=i-06eda4297dc8cde86]

    # Case 2 : Destroying resourcse.

            # # On running terraform destroy -auto-approve, this will show output something like shown below.

                # Plan: 0 to add, 0 to change, 2 to destroy.
                # aws_instance.demo-ec2: Destroying... [id=i-06eda4297dc8cde86]
                # aws_instance.demo-ec2: Still destroying... [id=i-06eda4297dc8cde86, 00m10s elapsed]
                # aws_instance.demo-ec2: Still destroying... [id=i-06eda4297dc8cde86, 00m20s elapsed]
                # aws_instance.demo-ec2: Still destroying... [id=i-06eda4297dc8cde86, 00m30s elapsed]
                # aws_instance.demo-ec2: Destruction complete after 32s
                # aws_s3_bucket.demo-bucket: Destroying... [id=my-terraform-learning-bucket-001]
                # aws_s3_bucket.demo-bucket: Destruction complete after 1s
                # Destroy complete! Resources: 2 destroyed.

# Example 2 : Implicit Dependency using in-built or available arguments.

resource "aws_security_group" "prod-sg" {
  name = "Prod-SG"
}

resource "aws_instance" "prod" {

    instance_type = "t1.micro"
    ami = "ami-0360c520857e3138f"
    vpc_security_group_ids = [ aws_security_group.prod-sg.id ] # Implicit Dependency
}
