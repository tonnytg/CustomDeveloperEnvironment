# [WIP] - CustomDeveloperEnvironment


Esse projeto está dividido em etapas

- [x] Terraform
- [x] Cluster K8S com GKE
- [x] Argo CD Enviroment
- [x] Jenkins with Argo CD
- [ ] Flux v2 Enviroment
- [ ] Use Popeye for Lint
- [ ] Jenkins with Flux
- [ ] Check Healthy of Cluster with Popeye


### Build

Create your Backend

`make bucket`

Create your GKE Cluster

`make gke`

Login

`make auth` 

Deploy

`make deploy`

Argo Install

`argo-install`

Argo Forward for login

`argo-forward`

Argo Login for CLI

`argo-auth`

Argo Deploy Helms

`argo-deploy`