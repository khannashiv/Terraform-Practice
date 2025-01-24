# This is for testing provider block with diffrent version costraints .

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.0"
    }
  }
}

# Configure the AWS Provider . 

provider "aws" {
  region = "us-east-1"
}

# Terraform init -upgrade