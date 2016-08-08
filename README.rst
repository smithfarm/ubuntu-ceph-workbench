=====================
ubuntu-ceph-workbench
=====================
------------------------------------------------------
A Dockerized testing environment for `ceph-workbench`_
------------------------------------------------------

.. _ceph-workbench: http://ceph-workbench.readthedocs.org/en/latest/

HOW TO USE THIS:

1. push a wip branch to ``http://ceph-workbench.dachary.org/root/ceph-workbench.git``
2. point "git clone" line in Dockerfile to your wip branch
3. build docker image with ``docker build -t cw .``
4. run with ``docker run -it cw /bin/bash``
5. inside the container, you can do e.g. ``ceph-workbench ceph-qa-suite --help``
6. start stopped container with ``docker start cw``
7. attach to running container with ``docker attach cw``
