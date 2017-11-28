[![Docker Build Statu](https://img.shields.io/docker/build/42bv/openstack-client.svg)](https://hub.docker.com/r/42bv/openstack-client/builds/) ![Docker Stars](https://img.shields.io/docker/stars/42bv/openstack-client.svg) [![Docker Pulls](https://img.shields.io/docker/pulls/42bv/openstack-client.svg)](https://hub.docker.com/r/42bv/openstack-client/)

# Docker - OpenStack Client
[![Openstack Client](https://raw.githubusercontent.com/42BV/docker-openstack-client/master/logo.png)](https://www.openstack.org)

Run the OpenStack clients in a Docker container.


## Supported tags and Dockerfile links

- latest ([Dockerfile](https://github.com/42BV/docker-openstack-client/blob/master/Dockerfile))

## Projects included

### [python-openstackclient](https://github.com/openstack/python-openstackclient)
> OpenStack Client is a command-line client for OpenStack that brings the command set for Compute, Identity, Image, Object Store and Block Storage APIs together in a single shell with a uniform command structure.

### [python-heatclient](https://github.com/openstack/python-heatclient)
> This is a client library for Heat built on the Heat orchestration API. It provides a Python API (the heatclient module) and a command-line tool (heat).

---

## Build 

```
git clone https://github.com/42BV/docker-openstack-client.git
cd docker-openstack-client
```
```
docker build -t openstack-client:<tag> .
```

## Pull

```
docker pull 42bv/openstack-client:latest
```

## Usage

### Credentials
Create a clouds.yaml file. You can find this information the the Horizon dashboard. You can add mutiple clouds to this file.
```
clouds:
  <cloud>:
    auth:
      auth_url: "<url>"
      username: "<username>"
      password: "<password>"
      user_domain_name: "Default"
      project_domain_name: "Default"
      project_name: "<project>" # optional
    region_name: "<region>"
    identity_api_version: 3
```

### Important
- Make sure you set (`-e`) the `OS_CLOUD` variable with the name of your cloud.
- Mount (`-v`) the directory containing `clouds.yaml` to `/etc/openstack`.

### Run in Interactive Mode:
```
docker run -it --rm -v $PWD:/etc/openstack -e "OS_CLOUD=<cloud>" --name openstack-client 42bv/openstack-client:latest
```

### Run in Detached Mode:
```
docker run -id --rm -v $PWD:/etc/openstack -e "OS_CLOUD=<cloud>" --name openstack-client 42bv/openstack-client:latest
docker exec openstack-client openstack <subcommand>
```

To see if you are connected to your cloud run:

```
configuration show
```

---

### Heat Orchestration Templates

Using templates to launch a stack:
- Run openstack-client in "Detached Mode" as described above.
- When referencing Heat Orchestration Templates, note that the workdir inside the container is `/etc/openstack`.

```
docker exec openstack-client openstack stack create -t /etc/openstack/<template.yaml> <stack_name>
```