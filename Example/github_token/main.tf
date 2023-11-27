resource "google_secret_manager_secret" "github_pat" {
  secret_id = "${var.secret_id}"
  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_version" "github_pat_version" {
  secret      = google_secret_manager_secret.github_pat.id
  secret_data = "placeholder-value"
}