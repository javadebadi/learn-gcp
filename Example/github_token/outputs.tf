output "secret_id" {
    value = google_secret_manager_secret_version.github_pat_version.id
}