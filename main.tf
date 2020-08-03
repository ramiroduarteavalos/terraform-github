provider "github" {
  version      = "2.9.2"
  token        = var.github_token
  organization = var.github_organization
}


resource "github_repository" "repo" {
  name        = var.github_repo
  description = var.github_repo_description
  auto_init = true
  private = true

}

## Creating branch develop
resource "github_branch" "branch" {
  repository = github_repository.repo.name
  branch     = "develop"
}

resource "github_team_repository" "team_repo1" {
  team_id    = 3269347
  repository = github_repository.repo.name
  permission = "push"
}

resource "github_team_repository" "team_repo2" {
  team_id    = 3158946
  repository = github_repository.repo.name
  permission = "push"
}

resource "github_team_repository" "team_repo3" {
  team_id    = 3155478
  repository = github_repository.repo.name
  permission = "pull"
}

## Webhook
resource "github_repository_webhook" "webhook1" {
  repository = github_repository.repo.name

  configuration {
    url          = "xxx"
    content_type = "application/json"
    secret       = "xxx"
    insecure_ssl = false

  }

  active = true

  events = [
  ]
}

resource "github_repository_webhook" "hook2" {
  repository = github_repository.repo.name

  configuration {
    url          = "xxx"
    content_type = "application/json"
    secret       = "xxx"
    insecure_ssl = false

  }

  active = true

  events = ["pull_request"]
}

resource "github_repository_webhook" "webhook3" {
  repository = github_repository.repo.name

  configuration {
    url          = "xxxxx"
    content_type = "application/json"
    secret       = "xxxx"
    insecure_ssl = false

  }

  active = true

  events = ["issue_comment"]
}

resource "github_repository_webhook" "webhook4" {
  repository = github_repository.repo.name

  configuration {
    url          = "xxx"
    content_type = "application/json"
    insecure_ssl = false

  }


  active = true

  events = ["pull_request"]
}


## Branch protection
resource "github_branch_protection" "protection1" {
  repository     = github_repository.repo.name
  branch         = "master"
  enforce_admins = false

  required_pull_request_reviews {
    dismiss_stale_reviews = true
    require_code_owner_reviews = true
    required_approving_review_count = "2"
    dismissal_users       = ["cicd"]
  }
}

resource "github_branch_protection" "protection2" {
  repository     = github_repository.repo.name
  branch         = "develop"
  enforce_admins = false

  required_status_checks {
    strict   = true
    contexts = ["${github_repository.repo.name}-pr"]
  }

  required_pull_request_reviews {
    dismiss_stale_reviews = true
    require_code_owner_reviews = true
    required_approving_review_count = "1"
    dismissal_users       = ["cicd"]
  }
}
