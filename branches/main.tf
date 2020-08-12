provider "github" {
  version      = "2.9.2"
  token        = var.github_token
  organization = var.github_organization
}

## Creating branch develop
resource "github_branch" "branch" {
  repository = var.github_repo
  branch     = var.github_branch
}

