output "secret_id" {
    value = google_secret_manager_secret_version.single_secret.id
}