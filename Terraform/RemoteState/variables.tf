variable "project_id" {
  type        = string
  description = "Project to storage terraform state"
  default     = "your-project"
}

variable "region" {
  type        = string
  description = "Region of project"
  default     = "your-region"
}