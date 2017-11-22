[![Docker Build Statu](https://img.shields.io/docker/build/42bv/openstack-client.svg)](https://hub.docker.com/r/42bv/openstack-client/builds/) ![Docker Stars](https://img.shields.io/docker/stars/42bv/openstack-client.svg) [![Docker Pulls](https://img.shields.io/docker/pulls/42bv/openstack-client.svg)](https://hub.docker.com/r/42bv/openstack-client/)


# Docker - OpenStack Client
[![Openstack Client](https://raw.githubusercontent.com/42BV/docker-openstack-client/master/logo.png)](https://github.com/openstack/python-openstackclient)

Run the OpenStack client (python-openstackclient) in a docker container.

## Build 

```
git clone https://github.com/42BV/docker-openstack-client.git
cd docker-openstack-client
```
```
docker build -t openstack-client:latest .
```

## Usage

### Credentials
Create a clouds.yaml file. You can find this information the the Horizon dashboard. You can add mutiple clouds to this file.
```
clouds:
  <name>:
    auth:
      auth_url: "<url>"
      username: "<username>"
      password: "<password>"
      user_domain_name: "Default"
      project_domain_name: "Default"
    region_name: "<region>"
    identity_api_version: 3
```

### Run the OpenStack client:

**IMPORTANT**: 
- Mount (`-v`) the directory containing `clouds.yaml` to `/etc/openstack`.
- Make sure you set (`-e`) the `OS_CLOUD` variable with the name of your cloud.
```
docker pull 42bv/openstack-client:latest
docker run -it --rm -v $PWD:/etc/openstack -e "OS_CLOUD=<name>" 42bv/openstack-client:latest
```

Once the container is started you are droped into the openstack console. To see if you are connected to your cloud run:

```
configuration show
```
