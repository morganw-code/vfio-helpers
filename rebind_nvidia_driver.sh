echo -n 0000:09:00.0 > /sys/bus/pci/drivers/vfio-pci/unbind || echo "Failed to unbind 0000:09:00.0"
echo -n 0000:09:00.1 > /sys/bus/pci/drivers/vfio-pci/unbind || echo "Failed to unbind 0000:09:00.1"
echo -n 0000:09:00.2 > /sys/bus/pci/drivers/vfio-pci/unbind || echo "Failed to unbind 0000:09:00.2"
echo -n 0000:09:00.3 > /sys/bus/pci/drivers/vfio-pci/unbind || echo "Failed to unbind 0000:09:00.3"

echo -n 1022 1482 > /sys/bus/pci/drivers/vfio-pci/remove_id || echo "id no bueno"
echo -n 1022 1483 > /sys/bus/pci/drivers/vfio-pci/remove_id || echo "id no bueno"
echo -n 10de 1e81 > /sys/bus/pci/drivers/vfio-pci/remove_id || echo "id no bueno"
echo -n 10de 10f8 > /sys/bus/pci/drivers/vfio-pci/remove_id || echo "id no bueno"
echo -n 10de 1ad8 > /sys/bus/pci/drivers/vfio-pci/remove_id || echo "id no bueno"
echo -n 10de 1ad9 > /sys/bus/pci/drivers/vfio-pci/remove_id || echo "id no bueno"

modprobe -r vfio-pci

echo -n 0000:09:00.0 > /sys/bus/pci/drivers/nvidia/bind || echo "Failed to bind 0000:09:00.0"
echo -n 0000:09:00.1 > /sys/bus/pci/drivers/snd_hda_intel/bind || echo "Failed to bind 0000:09:00.1"
echo -n 0000:09:00.2 > /sys/bus/pci/drivers/xhci_hcd/bind || echo "Failed to bind 0000:09:00.2"
echo -n 0000:09:00.3 > /sys/bus/pci/drivers/nvidia-gpu/bind || echo "Failed to bind 0000:09:00.3"

systemctl restart sddm