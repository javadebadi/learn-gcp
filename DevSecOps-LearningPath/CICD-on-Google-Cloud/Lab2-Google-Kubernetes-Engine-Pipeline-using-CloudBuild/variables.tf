variable "project_id" {
  type        = string
  description = "ID of the Google Project"
}

variable "project_name" {
  type        = string
  description = "Name of the Google Project"
}

variable "project_number" {
  type        = number
  description = "number of the the Google Project"
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

variable "api_services" {
    description = "List of api services that should be enabled for the project"
    type = list(string)
}

variable "artifacts_registry_repository_name" {
  description = "Name of the docker artifact registry repository"
  type = string
}

variable "k8_cluster" {
  description = "K8 clusterinformation"
  type = map(any)
}

variable "git_config" {
  type = object({
    username = string
    email = string
  })
  description = "configuration of the git global user in OS"
}

# variable "repository_url" {
#   description = "URL of the public GitHub repository"
#   default = "https://github.com/GoogleCloudPlatform/cloud-code-samples/"
# }

# variable "destination_path" {
#   description = "Local path where the repository will be cloned"
#   default     = "."
# }
