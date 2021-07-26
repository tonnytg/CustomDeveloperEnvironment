# [WIP] - CustomDeveloperEnvironment


Esse projeto está dividido em etapas

- [x] Terraform
- [x] Cluster K8S com GKE
- [ ] Argo CD Enviroment
- [ ] Flux v2 Enviroment
- [ ] Jenkins with Argo CD
- [ ] Jenkins with Flux


### Build

Create your Backend
`make bucket`

Create your GKE Cluster
`make gke`

Login
`make auth` 

Deploy
`make deploy`