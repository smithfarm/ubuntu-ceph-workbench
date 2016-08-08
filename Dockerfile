FROM ubuntu:14.04
MAINTAINER Nathan Cutler <ncutler@suse.com>

RUN adduser --disabled-password --gecos '' smithfarm
RUN echo "smithfarm ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

COPY bashrc /home/smithfarm/.bashrc
RUN chown smithfarm:users /home/smithfarm/.bashrc

RUN mkdir /home/smithfarm/.ceph-workbench
RUN chmod 700 /home/smithfarm/.ceph-workbench
COPY openrc.sh /home/smithfarm/.ceph-workbench
RUN chmod 600 /home/smithfarm/.ceph-workbench/openrc.sh
RUN chown -R smithfarm:users /home/smithfarm/.ceph-workbench

RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get --yes upgrade
RUN DEBIAN_FRONTEND=noninteractive apt-get --yes install \
git \
vim

USER smithfarm
WORKDIR /home/smithfarm
RUN git clone --branch wip-openstack-new http://ceph-workbench.dachary.org/root/ceph-workbench.git
WORKDIR ceph-workbench
RUN [ "bash", "-c", "source bootstrap" ]
