# k8sbox
A Dockerfile for creating container images with Postgres tools, as well as a Kubernetes `Deployment` for running it on a K8s cluster.

## Images
An updated image is hosted on [Docker Hub](https://hub.docker.com/r/rudester/k8sbox). Of course, feel free to fork the repo, mod the `Dockerfile` and host it :)

## Using the toolbox

It's quite simple. Clone this repo, run `kubectl apply -f postgres-toolbox.yaml` and you're good to go! The `Pod` will have the following tools installed:
- `postgresql-client`
- `redis-tools`
- `net-tools`
- `dnsutils`
- `telnet`
- `traceroute`
