#!/bin/bash

MASTER_IP=10.124.69.3
ARGO_NODEPORT=30080

# pull harbor helmchart into local
# helm pull argo-cd/argo-cd --version=3.35.4
# # extract compressed file
# tar -xvf argo-cd-3.35.4.tgz
# # install harbor helmchart in namespace argocd
# helm install argocd argo-cd -n argocd --set server.service.type=NodePort --create-namespace
# # wating for argocd installed successfully
# kubectl rollout status deploy/argocd-server --timeout=300s -n argocd

# setup argocd
ARGO_URL="$MASTER_IP:$ARGO_NODEPORT"
ARGO_USER="admin"
GIT_REPO="git@github.com:hoangviet148/k8s-microservices.git"
GIT_PATH="argocd-bootstrap"
GIT_BRANCH="master"
argocd login $ARGO_URL --username $ARGO_USER --password 'vinbdi@2022@#' --insecure
argocd repo add $GIT_REPO --ssh-private-key-path ~/.ssh/id_ecdsa --insecure-skip-server-verification
argocd app create argo-bootstrap-ex-hoangnv46 \
--project bookapp \
--repo $GIT_REPO \
--path $GIT_PATH \
--revision $GIT_BRANCH \
--revision-history-limit 0 \
--dest-namespace argocd \
--dest-server https://kubernetes.default.svc \
--sync-option PruneLast=true \
--sync-policy automated \
--upsert
