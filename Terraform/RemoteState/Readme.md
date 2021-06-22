### Bukcet for RemoteState

#### How to use

Create a `bucket.auto.tfvars`

with:
```
project_id = "example-proj-123456"
region     = "us-central1"
```


About remote state: <br/>
[Doc Backend in GCS Google Cloud Storage](https://www.terraform.io/docs/language/settings/backends/gcs.html)

Module Storage used to create bucket for remote state: <br/>
[Doc Module to create Bucket](https://registry.terraform.io/modules/terraform-google-modules/cloud-storage/google/latest)

Create Bucket without module: <br/>
[Doc of simple storage](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket)
