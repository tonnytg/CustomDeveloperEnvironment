#https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_cluster
data "google_service_account" "myaccount" {
  account_id = var.account
}

resource "google_container_cluster" "primary" {
  name               = "mycluster-main"
  location           = "us-central1-a"
  initial_node_count = 1
  node_config {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    # https://cloud.google.com/kubernetes-engine/docs/how-to/iam
    service_account = data.google_service_account.myaccount.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
    labels = {
      foo = "bar"
    }
    tags = ["foo", "bar"]
  }
  timeouts {
    create = "30m"
    update = "40m"
  }
}

output "account_id" {
  value = data.google_service_account.myaccount.email
}