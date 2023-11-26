terraform {
  required_version = "~> 1.6.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5"
      }
  }
}

provider "google" {
  credentials = "./credentials.json"
  project     = var.project_id
  region      = var.region
  zone        = var.zone
}

provider "google-beta" {
  project     = var.project_id
  region      = var.region
  zone        = var.zone 
}