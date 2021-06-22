terraform {
  backend "gcs" {
    bucket = "tf-backend-remote-eu-tf-backend-remote"
    prefix = "terraform/state"
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}