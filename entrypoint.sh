#!/bin/bash

set -e

lmutil lmhostid

# lmgrd -z flag is required to 'Run in foreground.' so that
# Docker will not start sleeping regardless flags.
lmgrd -z $@
