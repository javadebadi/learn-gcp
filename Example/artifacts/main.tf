// module to create artifact registry to use to store docker container images for a gcp project
resource "google_artifact_registry_repository" "docker_artifact_registry" {
  location      = var.region
  project = var.project_id
  repository_id = var.artifacts_registry_repository_name
  description   = "Docker repository for the app containers"
  format        = "DOCKER"
}