#! /usr/bin/env bash

if ! oc whoami -t &> /dev/null; then
    echo "Please login to OpenShift before running this script"
    exit 1
fi

export REGISTRY_TOKEN=$(oc whoami -t)
export REGISTRY_HOST=$(oc get route default-route -n openshift-image-registry --template='{{ .spec.host }}')
podman login -u kubeadmin -p $(oc whoami -t) $REGISTRY_HOST

podman search --creds nobody:$REGISTRY_TOKEN $REGISTRY_HOST/