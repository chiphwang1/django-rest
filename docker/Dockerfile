# syntax=docker/dockerfile:1
FROM ubuntu:18.04
COPY requirements.txt /
COPY setup.sh /
COPY ./wallet /wallet/
COPY ./django-rest   /django-rest/
RUN apt-get update && \
    apt-get install -y python3-dev python3-venv python-pip python3-pip systemd supervisor vim nginx alien libaio1 wget  && \
    wget https://download.oracle.com/otn_software/linux/instantclient/215000/oracle-instantclient-basic-21.5.0.0.0-1.x86_64.rpm && \
    alien -i oracle-instantclient-basic-21.5.0.0.0-1.x86_64.rpm && \
    mkdir -p /django-rest/env && \
    python3 -m venv /django-rest/env && \
    /django-rest/env/bin/pip install -r /requirements.txt && \
    /django-rest/env/bin/pip install uwsgi==2.0.18
ENTRYPOINT ["tail", "-f", "/dev/null"]
