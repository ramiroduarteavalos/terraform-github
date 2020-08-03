output "repository" {
  description = "Example repository"
  value       = "${github_repository.repo.name}"
}
