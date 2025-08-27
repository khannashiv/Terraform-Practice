terraform {
  backend "s3" {
    bucket = "backend-s3-demo-bucket-01"
    key = "eip/eip.tfstate"
    region = "us-east-1"
    use_lockfile = true
  }
}