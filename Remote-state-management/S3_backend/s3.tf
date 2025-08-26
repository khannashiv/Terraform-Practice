terraform {
  backend "s3" {
    bucket       = "backend-s3-demo-bucket-01" # NOTE : Bucket should exists on AWS with unique name.
    key          = "Pre-prod.tfstate"          # This file will be created inside S3 (at the root of S3) bucket not locally.
    region       = "us-east-1"
    use_lockfile = true                        # For managing locking mechanism.
  }
}