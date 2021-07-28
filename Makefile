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

argo-install:
	gcloud container clusters get-credentials mycluster-main
	kubectl create namespace argocd
	kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
	kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'

argo-forward:
	kubectl port-forward svc/argocd-server -n argocd 8080:443

argo-auth:
	kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
	echo "senha:" ${PASS}
	argocd login localhost:8080 --username admin --password ${PASS} --insecure

PASS=`kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d`	

argo-deploy:
	bash ./Kubernetes/argocd/deploy-charts.sh create

argo-deploy-delete:
	bash ./Kubernetes/argocd/deploy-charts.sh delete 