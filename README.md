# k8sbox
A Dockerfile for creating container images with Postgres tools, as well as a Kubernetes `Deployment` for running it on a K8s cluster.

## Images
An updated image is hosted on [Docker Hub](https://hub.docker.com/r/rudester/k8sbox), capable of running on `amd64` and `arm64` nodes. Of course, feel free to fork the repo, mod the `Dockerfile` and host it :)

## Using the toolbox

It's quite simple. Clone this repo, run `kubectl apply -f postgres-toolbox.yaml` and you're good to go! The `Pod` will have the following tools installed:
- `openssh-client`
- `postgresql-client`
- `redis-tools`
- `net-tools`
- `dnsutils`
- `telnet`
- `traceroute`

In addition, cloud-specific CLIs have also been installed within the image;
- `awscli`
- `azure-cli`
- `gcloud`
In most cases, these CLIs should be usable from the get-go depending on the permissions assigned to workloads by the underlying cluster.

Finally - since this image was created for debugging here at [Porter](https://porter.run), the `kubectl`, `helm` and `porter` CLIs are also installed, and can be used to interface with a specific Porter project \ cluster with the `PORTER_TOKEN`, `PORTER_PROJECT` and `PORTER_CLUSTER` environment variables.
