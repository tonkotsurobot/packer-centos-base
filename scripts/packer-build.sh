#!/bin/bash

wget -P /tmp http://192.168.1.30:8000/scripts/vcenter_cred.sh
chmod u+x /tmp/vcenter_cred.sh
. /tmp/vcenter_cred.sh
packer build --force packer-centos.json