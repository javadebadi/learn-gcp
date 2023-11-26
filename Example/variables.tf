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

variable "app_name" {
  type        = string
  description = "Name of the app"
  default     = "my-app"
}
