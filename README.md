# [WIP] - CustomDeveloperEnvironment


Esse projeto está dividido em etapas

- [x] Terraform
- [x] Cluster K8S com GKE
- [ ] Argo CD Enviroment
- [ ] Flux v2 Enviroment
- [ ] Use Popeye for Lint
- [ ] Jenkins with Argo CD
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