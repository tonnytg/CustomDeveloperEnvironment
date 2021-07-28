module "gcs_buckets" {
  source     = "terraform-google-modules/cloud-storage/google"
  version    = "~> 1.7"
  project_id = var.project_id
  prefix     = var.project_id
  names      = ["tf-remote"]

  force_destroy = {
    "eng-venture-320213-eu-tf-remote" = false
  }

  set_admin_roles = false

  versioning = {
    "eng-venture-320213-eu-tf-remote" = true
  }
}