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
  description = "Name of the Google Project"
}

variable "region" {
  type        = string
  description = "Default Region"
  default     = "northamerica-northeast2"
}

variable "zone" {
  type        = string
  description = "Default Zone"
  default     = "northamerica-northeast2-a"
}

variable "api_services" {
    description = "List of api services that should be enabled for the project"
    type = list(string)
}

variable "k8_cluster" {
  description = "K8 clusterinformation"
  type = map(any)
}

variable "app_name" {
  type        = string
  description = "Name of the app"
  default     = "my-app"
}

variable "app_git_repo_name" {
    type = string
    description = "Name of the github and google source repo of the app"
}

variable "env_git_repo_name" {
    type = string
    description = "Name of the github and google source repo of the env"
}