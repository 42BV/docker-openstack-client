FROM python:latest
ENV OS_CLOUD=""
RUN pip install python-openstackclient python-heatclient python-neutronclient
VOLUME /etc/openstack
WORKDIR /etc/openstack
ENTRYPOINT [ "/bin/bash", "-c" ]
CMD [ "openstack" ]
