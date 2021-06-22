module "gcs_buckets" {
  source     = "terraform-google-modules/cloud-storage/google"
  version    = "~> 1.7"
  project_id = var.project_id
  names      = ["tf-backend-remote"]
  prefix     = "tf-backend-remote"
  force_destroy = {
    "tf-backend-remote" = true
  }

  set_admin_roles = false

  versioning = {
    "tf-backend-remote" = true
  }
}