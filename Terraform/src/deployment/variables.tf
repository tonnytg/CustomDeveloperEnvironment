variable "project_id" {
  description = "Project this can be change"
  type        = string
}

variable "region" {
  default     = "default"
  type        = string
  description = "Region of project"
}

variable "main_account" {
  default     = "username"
  type        = string
  description = "username@domain.com of project"
}
