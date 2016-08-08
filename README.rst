=====================
ubuntu-ceph-workbench
=====================
------------------------------------------------------
A Dockerized testing environment for `ceph-workbench`_
------------------------------------------------------

.. _ceph-workbench: http://ceph-workbench.readthedocs.org/en/latest/

HOW TO USE THIS:

# push a wip branch to ``http://ceph-workbench.dachary.org/root/ceph-workbench.git``
# point "git clone" line in Dockerfile to your wip branch
# build docker image with ``docker build -t cw .``
# run with ``docker run -it cw /bin/bash``
# inside the container, you can do e.g. ``ceph-workbench ceph-qa-suite --help``
# start stopped container with ``docker start cw``
# attach to running container with ``docker attach cw``
