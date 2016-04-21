#!/bin/bash

tags=${1-all}
verbose=${2}

ansible-playbook provision.yml --tags=${tags} ${verbose}
