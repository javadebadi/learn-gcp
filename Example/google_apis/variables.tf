variable "api_services" {
    description = "List of api services that should be enabled for the project"
    type = list(string)
}

variable "project_id" {
  type        = string
  description = "ID of the Google Project"
}
