#!/usr/bin/env bash

set -Eeuo pipefail

if [[ $# -ne 1 ]]; then
    echo "usage: $(basename $0) <uuid | vmname>"
    echo
    echo "Available virtual machines:"
    vboxmanage list vms
    exit 1
fi

VM="${1}"
vboxmanage modifyvm     "${VM}" --cpuidset 00000001 000206a7 02100800 1fbae3bf bfebfbff
vboxmanage setextradata "${VM}" "VBoxInternal/Devices/efi/0/Config/DmiSystemProduct" "MacBookPro11,3"
vboxmanage setextradata "${VM}" "VBoxInternal/Devices/efi/0/Config/DmiSystemVersion" "1.0"
vboxmanage setextradata "${VM}" "VBoxInternal/Devices/efi/0/Config/DmiBoardProduct" "Iloveapple"
vboxmanage setextradata "${VM}" "VBoxInternal/Devices/smc/0/Config/DeviceKey" "ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc"
vboxmanage setextradata "${VM}" "VBoxInternal/Devices/smc/0/Config/GetKeyFromRealSMC" 1
vboxmanage setextradata "${VM}" "VBoxInternal2/EfiGraphicsResolution" 1920x1080
