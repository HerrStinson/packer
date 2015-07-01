#!/bin/bash

TEMPLATE=$1

if [ "$TEMPLATE" == "" ]; then
  echo "Please provide a template name as the first argument."
  exit 1
fi

read -p "vCenter Password: " -s VMWARE_PW
echo

if [ "$VMWARE_PW" == "" ]; then
  echo "Please provide your vCenter password."
  exit 2
fi

packer build -only=vmware-iso -var-file=vmware-config.json \
  $TEMPLATE
  #-var "vmware_username=$USER" -var "vmware_password=$VMWARE_PW" \
