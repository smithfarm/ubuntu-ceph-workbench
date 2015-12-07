FROM ubuntu:14.04
MAINTAINER Nathan Cutler <presnypreklad@gmail.com>

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get --yes upgrade
RUN DEBIAN_FRONTEND=noninteractive apt-get --yes install git qemu-utils \
python-dev libssl-dev python-pip python-virtualenv libev-dev python-libvirt \ 
libmysqlclient-dev libffi-dev libyaml-dev
RUN useradd smithfarm -m -s /bin/bash
COPY sudoers /etc/sudoers
RUN chown root.root /etc/sudoers
RUN chmod 440 /etc/sudoers
RUN sudo --login -u smithfarm git clone http://ceph-workbench.dachary.org/dachary/ceph-workbench.git
