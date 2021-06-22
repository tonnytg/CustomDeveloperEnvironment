### Terraform

Aqui será o provisionamento do Cluster GKE

- RemoteStatement

O RemoteState é somente usado para controle do Backend remoto, recomendado em caso de uso em times. Caso não utilize o backend remoto, será necessário comentar as 6 primeiras linhas do arquivo `provider.tf`