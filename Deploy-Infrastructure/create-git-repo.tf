
terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

provider "github" {
  token = var.token
}

resource "github_repository" "example" {
  name        = "repository-via-terraform"
  description = "My awesome codebase"
  auto_init   = "true"
}

resource "github_branch" "development" {
  repository = github_repository.example.name
  branch     = "development"
}
