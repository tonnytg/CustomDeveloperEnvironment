#!/bin/bash

# VARS
fdeploy="./Terraform/src/deployment"


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


echo "end"
}

CreateGKE () {
    [[ -f ${fdeploy}/terraform.tfvars ]] && echo || ConfTfVars
    pwd
    read
    cd ${fdeploy}
    read
    pwd
    read
    terraform init && terraform apply --auto-approve
}

CreateBackend () {
    cd ./Terraform/RemoteState/
    terraform init && terraform apply --auto-approve
    echo "Created Remote State - OK"
    read
}

read -p "Create Bucket for Remote Backend? (y/N)" op
[[ ${op} == "y" || ${op} == "Y" ]] && CreateBackend

read -p "Create GKE? (y/N)" op
[[ ${op} == "y" || ${op} == "Y" ]] && CreateGKE









