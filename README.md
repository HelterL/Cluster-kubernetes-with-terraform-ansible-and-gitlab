# Criação de um cluster kubernetes com gitlab terraform e ansible

## O que utilizei?

Docker
Ansible
Terraforma
Drone CI
AWS
Kubernetes

## Pré-requisitos 

* Conta na AWS
* Conta no gitlab
* Criação das seguintes variáveis de ambiente no gitlab
* AWS_ACCESS_KEY_ID
* AWS_SECRET_ACCESS_KEY
* PRIVATE_KEY

## Rodando a pipeline

Após a criação das variáveis de ambiente, basta fazer um commit para rodar a pipeline.

Primeiro será a criação do ambiente com terraform, após isso será a instalação e configuração do ambiente kubernetes com ansible

## Acesso ao cluster kubernetes

Para acessar o cluster vá nas instâncias criadas na AWS, procure a instância com a tag master
ela é o nosso nó control plane, os outros são workers

Basta acessar a máquina através da chave .pem como de costume e utilizar o comando sudo su para entrar no modo root

Exibindo nós criados

```bash
kubectl get nodes
```

Exibindo pods do namespace kube-system

```bash
kubectl get pods -n kube-system
```
