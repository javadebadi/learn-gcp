output "k8_cluster_self_link" {
    description = "Self_link of the create K8 cluster"
    value = google_container_cluster.this.self_link
}