# toybox container image for daily investigation
- based on Ubuntu20.04

[![Docker Pull Counter](https://img.shields.io/docker/pulls/ozzozz/toybox-ubuntu-focal.svg)](https://hub.docker.com/r/ozzozz/toybox-ubuntu-focal/)

## usage

### Kubernetes
- to get BASH shell prompt in `toybox` Pod

```
$ kubectl run toybox -it --rm --image=harbor-repo.vmware.com/dockerhub-proxy-cache/ozzozz/toybox-ubuntu-focal --command -- bash --login
```

### Docker
- to get BASH shell prompt

```
$ docker run -it --rm -v $PWD:/work ozzozz/toybox-ubuntu-focal
```

## commands you can run

* mc [(Minio CLI)](https://docs.minio.io/docs/minio-client-quickstart-guide)
* stress
* wget
* curl
* git
* jq
* zip
  * unzip
* vim
* tmux
* tree
* pwgen
* direnv
