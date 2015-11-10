## Prerequisites

In order to run the commands below you need to have **git** and [Ansible](http://www.ansible.com) installed.

## Setup Ansible

### [Latest Releases Via Apt (Ubuntu)](http://docs.ansible.com/ansible/intro_installation.html#latest-releases-via-apt-ubuntu)

<pre>
$ sudo apt-get install software-properties-common
$ sudo apt-add-repository ppa:ansible/ansible
$ sudo apt-get update
$ sudo apt-get install ansible
</pre>

### [Latest Release Via Yum](http://docs.ansible.com/ansible/intro_installation.html#latest-release-via-yum)

## Setup

<pre>
$ cd ~
$ git clone git@github.com:ten0s/dotfiles.git
</pre>

## Provision

<pre>
$ cd dotfiles
$ ansible-playbook provision.yml
</pre>
