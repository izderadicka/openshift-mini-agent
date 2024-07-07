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

```
oc edit -n openshift-image-registry config
```

Temporary solution - not persistent
```yaml
spec:
    managementState: Managed
    storage:
      emptyDir: {}
```

Persistent solution

Install LVM Storage Operator (node must have free unused volumes)

Create PVC in openshift-image-registry namespace

```
oc create -f pvc.yaml
```

Edit - chage mentioned below

```
spec:
  managementState: Managed
  rolloutStrategy: Recreate
  storage:
    pvc:
      claim: lvm-image-registry-volume
```

## Expose internal image registry

https://docs.okd.io/4.15/registry/securing-exposing-registry.html

Just need to login to oc with token to make it work -  token is in web console, click user icon top right
See [this script](registry_setup.sh)


## Solve local DNS for OKD hosts
Using dnsmasq aside of systemd-resolved as per [this article](https://blog.thesparktree.com/local-development-with-wildcard-dns)

[This article](https://liquidat.wordpress.com/2017/03/03/howto-automated-dns-resolution-for-kvmlibvirt-guests-with-a-local-domain/) also might be interesting 

