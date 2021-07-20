provider "google" {
  credentials = file("~/.config/gcloud/eng-venture-320213-terraform-admin.json")
  project = var.project_id
  region  = var.region
}