# Additional modifications OKD

## Change global pull secret

```
oc set data secret/pull-secret -n openshift-config --from-file=.dockerconfigjson=/home/ivan/Downloads/pull-secret
oc get secret/pull-secret -n openshift-config -o json | jq -r '.data.[".dockerconfigjson"]'|base64 -d
```

## Enable all sources Operator Hub source

edit Administration / Cluster Settings / Configuration / OperatorHub

```yaml
spec:
  disableAllDefaultSources: false
```

## Enable buildin image registry

Temporary solution - not persistent
```yaml
spec:
    managementState: Managed
    storage:
      emptyDir: {}
```

