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

## Using a custom Windows image

To overwrite the image used by the Windows template without touching the template itself, generate a local JSON file with the following contents:

```json
{
  "iso_url": "/path/to/iso/file/SW_DVD9_NTRL_Windows_Svrs_2012_R2_English_FPP_OEM_Std_DC_X19-57373.ISO",
  "iso_checksum": "af6a7f966b4c4e31da5bc3cdc3afcbec",
}
```

Then pass it to packer when building the template, like so:

```bash
$ packer build --only=vmware-iso -var-file windows-config.json Windows_2012_R2.json
```

Please be aware that you may also need to change the `Autounattend.xml` to carry your product key:

```xml
<ProductKey>
  <Key>your-product-key-here</Key>
</ProductKey>
```

## Available images

This repository currently houses templates for:

* Windows 2012 R2
* Ubuntu 14.04
* Oracle Enterprise Linux 6.6
* SLES 12
