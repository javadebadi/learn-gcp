variable "project_id" {
  type        = string
  description = "ID of the Google Project"
}

variable "region" {
  type        = string
  description = "Default Region"
  default     = "us-central1"
}

variable "zone" {
  type        = string
  description = "Default Zone"
  default     = "us-central1-a"
}


variable "repository_url" {
  description = "URL of the public GitHub repository"
  default = "https://github.com/GoogleCloudPlatform/cloud-code-samples/"
}

variable "destination_path" {
  description = "Local path where the repository will be cloned"
  default     = "."
}

variable "api_services" {
    description = "List of api services that should be enabled for the project"
    type = list(string)
}