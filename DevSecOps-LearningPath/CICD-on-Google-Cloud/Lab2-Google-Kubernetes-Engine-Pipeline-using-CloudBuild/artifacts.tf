resource "google_artifact_registry_repository" "this" {
  location      = var.region
  repository_id = var.artifacts_registry_repository_name
  description   = "Docker repository for this app containers"
  format        = "DOCKER"
}