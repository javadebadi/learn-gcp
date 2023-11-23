resource "null_resource" "authenticate_docker" {
  depends_on = [ google_artifact_registry_repository.this ]
  provisioner "local-exec" {
    command = "gcloud auth configure-docker ${var.region}-docker.pkg.dev"
  }
}

resource "null_resource" "build_docker" {
  depends_on = [ null_resource.authenticate_docker ]
  provisioner "local-exec" {
    command = "cd ./cloud-code-samples/java/java-hello-world/ && docker build -t ${var.region}-docker.pkg.dev/${var.project_id}/container-dev-repo/java-hello-world:tag1 . && cd -"
  }
}

resource "null_resource" "push_docker_image" {
  depends_on = [ null_resource.build_docker ]
  provisioner "local-exec" {
    command = "cd ./cloud-code-samples/java/java-hello-world/ && docker push ${var.region}-docker.pkg.dev/${var.project_id}/container-dev-repo/java-hello-world:tag1 && cd -"
  }
}



