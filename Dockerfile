FROM python:3
ENV OS_CLOUD=""
RUN pip install --no-cache-dir python-openstackclient
VOLUME /etc/openstack
ENTRYPOINT [ "/bin/bash", "-c" ]
CMD [ "openstack" ]