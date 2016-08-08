=====================
ubuntu-ceph-workbench
=====================
------------------------------------------------------
A Dockerized testing environment for `ceph-workbench`_
------------------------------------------------------

.. _ceph-workbench: http://ceph-workbench.readthedocs.org/en/latest/

HOW TO USE THIS:

1. push a wip branch to ``http://ceph-workbench.dachary.org/root/ceph-workbench.git``
1. point "git clone" line in Dockerfile to your wip branch
1. build docker image with ``docker build -t cw .``
1. run with ``docker run -it cw /bin/bash``
1. inside the container, you can do e.g. ``ceph-workbench ceph-qa-suite --help``
1. start stopped container with ``docker start cw``
1. attach to running container with ``docker attach cw``
