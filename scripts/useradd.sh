#!/bin/bash
useradd -m -u 60102 -g users -G wheel,audio,video,disk,storage,optical,scanner,rfkill,input,libvirt,kvm -s /bin/bash michael
