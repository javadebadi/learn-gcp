resource "google_artifact_registry_repository" "this" {
  location      = var.region
  repository_id = "container-dev-repo"
  description   = "Docker repository for Container Dev Workshop"
  format        = "DOCKER"
}