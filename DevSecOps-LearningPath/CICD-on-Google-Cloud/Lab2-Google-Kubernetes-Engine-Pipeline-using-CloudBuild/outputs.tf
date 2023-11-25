output "app_google_source_repo_url" {
  description = "URL of the app git repository in google source"
  value = module.app_google_source_repo.repo_url
}

output "env_google_source_repo_url" {
  description = "URL of the env git repository in google source"
  value = module.env_google_source_repo.repo_url
}