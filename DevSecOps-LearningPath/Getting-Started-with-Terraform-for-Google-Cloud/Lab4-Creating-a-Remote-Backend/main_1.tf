provider "google" {
  project     = "qwiklabs-gcp-03-38b5eabdbae4"
  region      = "us-central-1"
}
resource "google_storage_bucket" "test-bucket-for-state" {
  name        = "qwiklabs-gcp-03-38b5eabdbae4"
  location    = "US"
  uniform_bucket_level_access = true
}
terraform {
  backend "local" {
    path = "terraform/state/terraform.tfstate"
  }
}