#!/bin/bash

tags=${1-all}

ansible-playbook provision.yml --tags=${tags}
