#  qemu-img create -f qcow2 /home/michael/VMS/W10EntInst.qcow2 50G
virt-install \
  --name W10Ent_inst \
  --memory 4096 \
  --cpu host --hvm \
  --vcpus=2 \
  --os-type windows \
  --os-variant win10 \
  --disk /home/michael/VMs/W10EntInst.qcow2,bus=virtio --check path_in_use=off \
  --cdrom /home/michael/VMs/ISO/W10EntEn.iso \
  --disk /home/michael/VMs/ISO/virtio-drivers.iso,device=cdrom,bus=sata \
  --network network=default,model=virtio \
  --graphics spice --ram=1024