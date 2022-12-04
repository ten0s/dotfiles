#!/usr/bin/env bash

if [[ $# -ne 2 ]]; then
    echo "usage: $(basename $0) <uuid | vmname> <WxH>"
    echo
    echo "Available virtual machines:"
    vboxmanage list vms
    exit 1
fi

VM="${1}"
RES="${2}"
vboxmanage setextradata "${VM}" "VBoxInternal2/EfiGraphicsResolution" "${RES}"
