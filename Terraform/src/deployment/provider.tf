terraform {
  backend "gcs" {
    bucket = "eng-venture-320213"
    prefix = "terraform/state"
    credentials = "~/.config/gcloud/eng-venture-320213-terraform-admin.json"
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
  credentials = file("~/.config/gcloud/eng-venture-320213-terraform-admin.json")
}