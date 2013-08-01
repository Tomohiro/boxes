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


Vagrant
--------------------------------------------------------------------------------

Vagrant files in `boxes/vagrant/`.


### Getting Started

Create new servers project:

```sh
$ mkdir new-box
$ vagrant init centos64
```

Edit the Vagrantfile:

```sh
$ vi Vagrantfile
```

Launch the machine:

```sh
$ vagrant up
```

### Require plugins

Install command like this:

```sh
$ vagrant plugin install {plugin-name}
```


#### Plugins

Plugin                    | Description
------------------------- | -----------------------------------------------------------
[vagrant-list][]          | Show list of Vagrant boxes
[vagrant-vbguest][]       | Keep your VirtualBox Guest Additions up to date
[sahara][]                | Sahara allows vagrant to operate in sandbox mode


[vagrant-list]:    https://github.com/joshmcarthur/vagrant-list
[vagrant-vbguest]: https://github.com/dotless-de/vagrant-vbguest↩
[sahara]: https://github.com/jedi4ever/sahara
