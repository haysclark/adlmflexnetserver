Unofficial Autodesk License Manager FLEXlm® Network Server container.
=====================================================================
[![Docker Automated buil](https://img.shields.io/docker/automated/haysclark/adlmflexnetserver.svg?maxAge=2592000)](https://hub.docker.com/r/haysclark/adlmflexnetserver/builds/)

A simple Docker container that runs Autodesk License Manager FLEXlm® Network Server.

Usage
-----

    docker run -d -t --mac-address="[LICENSE_MAC_ADRESS]" \
    -h [LICENSE_HOSTNAME] \
    -v [FLEXLM_LICENSE_PATH]:/var/flexlm \
    -p 2080:2080 -p 27000-27009:27000-27009 \
    haysclark/adlmflexnetserver

All arguments passed to the container are forwarded to 'lmgrd', thus you can provide your own license path or logging path by using the standard arguments.

> Note: 'lmgrd' is ALWAYS passed the '-z' argument so that it runs in the Foreground. Otherwise, Docker believes the task is over and the container will 'stop' immediately.

Troubleshooting
------------------
If you are unsure if the server is running correctly, you can log into the container.

    docker exec -it CONTAINER_ID /bin/bash

Once in bash run: 

    lmutil lmstat -a -c [LICENSE_PATH]

Resources
------------
[Official Docs](https://knowledge.autodesk.com/support/maya/downloads/caas/downloads/content/autodesk-network-license-manager-for-linux.html?v=2014)

Supports
----------
Applies to Autodesk Nastran 2015, Autodesk Nastran 2016, Autodesk Nastran 2017, Infrastructure Map Server 2014, Infrastructure Map Server 2015, Infrastructure Map Server 2016, Infrastructure Map Server 2017, Maya 2014, Maya 2015, Maya 2016, Maya 2017, Moldflow Insight 2015, Moldflow Insight 2016, Moldflow Insight 2017, MotionBuilder 2014, MotionBuilder 2015, MotionBuilder 2016, MotionBuilder 2017, Mudbox 2014, Mudbox 2015, Mudbox 2016, Mudbox 2017, Softimage 2014, Softimage 2015, Softimage 2016, VRED Design 2014, and VRED Products 2017