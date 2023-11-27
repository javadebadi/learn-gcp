# Module to include all GCP apis and services that should be enabled
resource "google_project_service" "this" {
  for_each = toset(var.api_services)
  project  = var.project_id
  service = each.value
}