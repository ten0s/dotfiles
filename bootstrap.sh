#!/bin/bash

sudo apt-add-repository -y ppa:ansible/ansible
sudo apt-get update -y
sudo apt-get install -y ansible git
sudo apt-get remove -y cowsay
