#
# suse-cleanup.sh
#

# Clean up
# rm -f /home/vagrant/VBoxGuestAdditions_$VBOX_VERSION.iso /home/vagrant/postinstall.sh

# Add an online copy of the SLES DVD1 as a software repository, instead of the mounted DVD
zypper removerepo 'SLES12-12-0'
zypper addrepo 'http://demeter.uni-regensburg.de/SLES12-x64/DVD1/' 'SLES12-x64 DVD1 Online'
zypper addrepo 'http://demeter.uni-regensburg.de/SLES12-x64/DVD2/' 'SLES12-x64 DVD2 Online'
zypper refresh

# Zero out the free space to save space in the final image:
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY

echo -e "\nall done.\n"
exit
