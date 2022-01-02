wget https://download.fedoraproject.org/pub/fedora/linux/releases/35/Server/x86_64/iso/Fedora-Server-netinst-x86_64-35-1.2.iso -O /tmp/fedora.iso
sudo mkdir -p /mnt/fedora
sudo mount -t iso9660 -o loop /tmp/fedora.iso /mnt/fedora
sudo cp -pRf /mnt/fedora /tmp/iso
cat desktop-x86_64.cfg | sudo tee /tmp/iso/isolinux/isolinux.cfg > /dev/null
sudo genisoimage -U -r -v -T -J -joliet-long -V "Tau-Desktop" -volset "Tau-Desktop" -A "Tau-Desktop" -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -eltorito-alt-boot -e images/efiboot.img -no-emul-boot -o tau-desktop-x86_64.iso /tmp/iso