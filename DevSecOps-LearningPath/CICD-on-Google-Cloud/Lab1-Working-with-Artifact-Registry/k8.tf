resource "google_container_cluster" "this" {
  name     = "container-dev-cluster"
  location = var.zone

  initial_node_count = 3

  depends_on = [ google_project_service.this ]

  deletion_protection = false
  node_config {
  }
}