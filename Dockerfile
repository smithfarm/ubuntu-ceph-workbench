FROM ubuntu:14.04
MAINTAINER Nathan Cutler <ncutler@suse.com>

RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get --yes upgrade
RUN DEBIAN_FRONTEND=noninteractive apt-get --yes install \
git \
qemu-utils \
python-dev \
libssl-dev \
python-pip \
python-virtualenv \
libev-dev \
python-libvirt \ 
libmysqlclient-dev \
libffi-dev \
libyaml-dev \
vim

RUN adduser --disabled-password --gecos '' smithfarm
RUN echo "smithfarm ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

COPY bashrc /home/smithfarm/.bashrc
RUN chown smithfarm:users /home/smithfarm/.bashrc

RUN mkdir /home/smithfarm/.ceph-workbench
RUN chown smithfarm:users /home/smithfarm/.ceph-workbench
RUN chmod 700 /home/smithfarm/.ceph-workbench

USER smithfarm
WORKDIR /home/smithfarm
COPY openrc.sh .ceph-workbench/
RUN chmod 600 .ceph-workbench/openrc.sh

RUN git clone --branch wip-openstack-new http://ceph-workbench.dachary.org/root/ceph-workbench.git
WORKDIR ceph-workbench
RUN [ "bash", "-c", "source bootstrap" ]

# build with "docker build -t cw ."
# run with "docker run -it cw /bin/bash"
