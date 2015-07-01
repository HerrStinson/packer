# Packer images for common operating systems

This repository contains a variety of Linux and Windows templates to be used with the [Packer](http://packer.io) 
machine image creation tool.

## Getting started

All templates are located in the main directory of the repository and are setup for both VirtualBox and VMware.

To build individual images, pass them to packer like so:

```shell
$ packer build <name of template>.json
```

To only build a single hypervisor version, pass the `--only` flag, like so:

```shell
$ packer build --only=vmware-iso <name of template>.json
```

To use the VMware builders with upload capability to a vCenter server, make a copy of the included `vmware-config-template.json` and put in your credentials. Then pass it to packer, like so:

```shell
$ packer build --only=vmware-iso -var-file vmware-config.json <name of template>.json
```

Full disclosure: Development happened on a Mac with VMware Fusion 6 and VirtualBox 4.3. Your mileage may vary.

## Available images

This repository currently houses templates for:

* Windows 2012 R2
* Ubuntu 14.04
* Oracle Enterprise Linux 6.6
* SLES 12
