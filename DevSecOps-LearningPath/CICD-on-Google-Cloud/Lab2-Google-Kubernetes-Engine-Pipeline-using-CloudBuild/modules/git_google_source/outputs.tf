output "repo_name" {
  description = "Name of the google source git repo"
  value = var.repo_name
}

output "repo_url" {
    description = "Information about repo url"
    value = google_sourcerepo_repository.repo.url
}