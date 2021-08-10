#!/bin/bash

kubectl -n postgres-operator create secret generic postgres-operator-etcd-root-password --from-literal=etcd-root-password=CHANGEME

helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update

helm repo pull 