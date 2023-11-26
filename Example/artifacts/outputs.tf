output "address" {
    description = "Address of the docker artifacts registry repository"
    value = "${var.region}-docker.pkg.dev/${var.project_id}/${google_artifact_registry_repository.docker_artifact_registry.name}"
}

output "id" {
    description = "id of the docker artifacts registry repository"
    value = google_artifact_registry_repository.docker_artifact_registry.id
}