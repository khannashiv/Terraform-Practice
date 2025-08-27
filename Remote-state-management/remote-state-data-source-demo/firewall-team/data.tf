data "terraform_remote_state" "eip" {
  backend = "s3"
  config = {
    key    = "eip/eip.tfstate"
    bucket = "backend-s3-demo-bucket-01"
    region = "us-east-1"
  }
}
