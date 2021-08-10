#!/bin/bash

kubectl -n postgres-operator create secret generic postgres-operator-etcd-root-password --from-literal=etcd-root-password=CHANGEME