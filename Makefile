ENV="dev"
OWNER="antoniothomacelli1@gmail.com"
PROJECT=`gcloud projects list | grep -v NAME | cut -d" " -f1`

test:
	@echo "env:\t\t" ${ENV}
	@echo "owner:\t\t" ${OWNER}
	@echo "project:\t" ${PROJECT}

bucket:
	cd Terraform/RemoteState && terraform init && \
	terraform apply --auto-approve

gke:
	cd Terraform/src/deployment && terraform init && \
	terraform apply --auto-approve

auth:
	gcloud container clusters get-credentials mycluster-main

deploy:
	kubectl apply -f Kubernetes/simple_pod.yml