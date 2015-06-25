#!/bin/bash

mkdir -p /usr/local/src
cd /usr/local/src
tar zxf /tmp/vmwaretools.tgz
cd vmware-tools-distrib
./vmware-install.pl --default
