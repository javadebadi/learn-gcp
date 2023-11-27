resource "google_secret_manager_secret" "single_secret" {
  secret_id = "${var.secret_id}"
  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_version" "single_secret_version" {
  secret      = google_secret_manager_secret.single_secret.id
  secret_data = "placeholder-value"
}