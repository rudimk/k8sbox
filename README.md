# postgres-toolbox
A Dockerfile for creating container images with Postgres tools, as well as a Kubernetes `Deployment` for running it on a K8s cluster.

## Getting started

It's quite simple. Clone this repo, run `kubectl apply -f postgres-toolbox.yaml` and you're good to go! The `Pod` will have the following tools installed:
- `postgresql-client`
- `net-tools`
- `dnsutils`
- `telnet`
