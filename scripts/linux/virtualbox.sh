# Installing the virtualbox guest additions

sed -i -e "s/^allow_unsupported_modules 0/allow_unsupported_modules 1/g" \
  /etc/modprobe.d/10-unsupported-modules.conf

VBOX_VERSION=$(cat /home/vagrant/.vbox_version)
cd /tmp
mount -o loop /home/vagrant/VBoxGuestAdditions_$VBOX_VERSION.iso /mnt
sh /mnt/VBoxLinuxAdditions.run
umount /mnt
rm -rf /home/vagrant/VBoxGuestAdditions_*.iso
