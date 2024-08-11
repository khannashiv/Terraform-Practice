terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

provider "github" {

    token = "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"
  
}

resource "github_repository" "Terraform-repository" {
  name        = "example"
  description = "My awesome codebase"
  visibility = "public"
}