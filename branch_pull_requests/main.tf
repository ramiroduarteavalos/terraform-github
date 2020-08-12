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

resource "github_branch_protection" "protection2" {
  repository     = var.github_repo
  branch         = var.github_branch
  enforce_admins = false

  required_status_checks {
    strict   = true
    contexts = ["${var.github_repo}-pr"]
  }

  required_pull_request_reviews {
    dismiss_stale_reviews = true
    require_code_owner_reviews = true
    required_approving_review_count = "1"
    dismissal_users       = ["cicd"]
  }
  depends_on = [
    github_branch.branch,
  ]  
}

