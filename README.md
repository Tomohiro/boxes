Boxes
================================================================================

Linux boxes


Requirements
--------------------------------------------------------------------------------

Name       | Version  | URL
---------- | -------- | -------------------------------------------------------
VirtualBox | 4.2.16   | https://www.virtualbox.org
Packer     | 0.2.1    | http://www.packer.io
Vagrant    | 1.2.7    | http://www.vagrantup.com


Packer
--------------------------------------------------------------------------------

Packer files in `boxes/packer/`.

### Getting Started

Build a Vagrant box:

```sh
$ cd packer/CentOS-6.4-x86_64
$ packer build box.json        # Output to ./CentOS-6.4-x86_64.box
```

Add to Vagrant box list:

```sh
$ vagrant box add centos64 CentOS-6.4-x86_64.box
$ vagrant box list
centos64   (virtualbox)
```
