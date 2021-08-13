#!/bin/bash

kubectl -n postgres-operator create secret generic postgres-operator-etcd-root-password --from-literal=etcd-root-password=CHANGEME

kubectl -n etcd-argo create secret generic postgres-operator-etcd-root-password --from-literal=etcd-root-password=CHANGEME

helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update
helm install etcd bitnami/etcd

helm pull bitnami/etcd

# ok, I need to set the helm repo list url into argocd for the charts
# do I need nexus for this?

helm template etcd bitnami/etcd  -f env/tokyo-ckd/versions/6.3.3/values.yaml

helm install etcd bitnami/etcd -n etcd-argo -f values.yml