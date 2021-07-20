#Link
# https://cloud.google.com/community/tutorials/managing-gcp-projects-with-terraform
# export TF_VAR_org_id=YOUR_ORG_ID
export GCP_PROJECT_ID="eng-venture-320213"
export TF_VAR_billing_account=018CF2-543AAD-EEEB39
export TF_ADMIN=terraform@${GCP_PROJECT_ID}.iam.gserviceaccount.com
export TF_CREDS=~/.config/gcloud/${GCP_PROJECT_ID}-terraform-admin.json


# Cria uma conta de Serviço
gcloud iam service-accounts create terraform \
  --display-name "Terraform admin account"

# Cria uma chave para a conta de serviço
gcloud iam service-accounts keys create ${TF_CREDS} \
  --iam-account terraform@${GCP_PROJECT_ID}.iam.gserviceaccount.com

# Define as permissões do serviço
gcloud projects add-iam-policy-binding ${GCP_PROJECT_ID} \
  --member serviceAccount:terraform@${GCP_PROJECT_ID}.iam.gserviceaccount.com \
  --role roles/owner
  #--role roles/viewer

#Service Enable
gcloud services enable cloudresourcemanager.googleapis.com
gcloud services enable cloudbilling.googleapis.com
gcloud services enable iam.googleapis.com
gcloud services enable compute.googleapis.com
gcloud services enable serviceusage.googleapis.com

gsutil mb -p ${GCP_PROJECT_ID} gs://${GCP_PROJECT_ID}

cat > backend.tf << EOF
terraform {
 backend "gcs" {
   bucket  = "${GCP_PROJECT_ID}"
   prefix  = "terraform/state"
 }
}
EOF

gsutil versioning set on gs://${GCP_PROJECT_ID}
echo "Now copy backend.tf for inside your project"