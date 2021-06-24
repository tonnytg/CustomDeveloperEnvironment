#!/bin/bash

# VARS
fdeploy="./Terraform/src/deployment"
fbackend="./Terraform/RemoteState/"

# Func
ConfTfVars () {
    read -p "project_id = " project_id
    read -p "region = " region
    read -p "account = " account

    echo -e """
project_id = \"${project_id}\"
region     = \"${region}\"
account    = \"${account}\"
""" > ${fdeploy}/terraform.tfvars
ls ${fdeploy}/terraform.tfvars
}

CreateGKE () {
    [[ -f ${fdeploy}/terraform.tfvars ]] && echo || ConfTfVars
    cd ${fdeploy}
    terraform init && terraform apply --auto-approve && cd -
}

CreateBackend () {
    cd ${fbackend}
    terraform init && terraform apply --auto-approve && cd -
    echo "Created Remote State - OK"
}

read -p "Create Bucket for Remote Backend? (y/N)" op
[[ ${op} == "y" || ${op} == "Y" ]] && CreateBackend

read -p "Create GKE? (y/N)" op
[[ ${op} == "y" || ${op} == "Y" ]] && CreateGKE

