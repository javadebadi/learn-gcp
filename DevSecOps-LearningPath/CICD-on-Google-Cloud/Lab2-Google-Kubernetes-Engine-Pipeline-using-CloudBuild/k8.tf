resource "google_container_cluster" "this" {
  name     = var.k8_cluster.name
  location = var.k8_cluster.zone

  initial_node_count = var.k8_cluster.num_nodes

  depends_on = [ google_project_service.this ]

  deletion_protection = false
  node_config {
  }
}