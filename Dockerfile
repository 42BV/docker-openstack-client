FROM python:latest
ENV OS_CLOUD=""
RUN pip install python-openstackclient
VOLUME /etc/openstack
ENTRYPOINT [ "/bin/bash", "-c" ]
CMD [ "openstack" ]