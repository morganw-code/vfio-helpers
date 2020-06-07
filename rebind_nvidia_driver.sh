#!/bin/bash
declare -A drivers
drivers=(['0000:09:00.0']='nvidia' ['0000:09:00.1']='snd_hda_intel' ['0000:09:00.2']='xhci_hcd' ['0000:09:00.3']='nvidia-gpu')
for device in '0000:09:00.0' '0000:09:00.1' '0000:09:00.2' '0000:09:00.3'; do
    path="/sys/bus/pci/drivers/${drivers[$device]}/bind"
    echo -n $device >/sys/bus/pci/drivers/vfio-pci/unbind || echo "Failed to unbind $device"
    echo -n $device >$path || echo "Failed to bind $device at $path"
done

for id in '1022 1482' '1022 1483' '10de 1e81' '10de 10f8' '10de 1ad8' '10de 1ad9'; do
    echo -n $id >/sys/bus/pci/drivers/vfio-pci/remove_id || echo "Id '$id' is no bueno"
done

modprobe -r vfio-pci
systemctl restart sddm