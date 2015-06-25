#
# postinstall.sh
#

date > /etc/vagrant_box_build_time

# remove zypper locks on removed packages to avoid later dependency problems
zypper --non-interactive rl  \*

# install vagrant key
echo -e "\ninstall vagrant key ..."
mkdir -m 0700 /home/vagrant/.ssh
cd /home/vagrant/.ssh
wget --no-check-certificate -O authorized_keys https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub
chmod 0600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant.users /home/vagrant/.ssh

# update sudoers
echo -e "\nupdate sudoers ..."
echo -e "\n# added by packer/postinstall.sh" >> /etc/sudoers
echo -e "vagrant ALL=(ALL) NOPASSWD: ALL\n" >> /etc/sudoers

# speed-up remote logins
echo -e "\nspeed-up remote logins ..."
echo -e "\n# added by packer/postinstall.sh" >> /etc/ssh/sshd_config
echo -e "UseDNS no\n" >> /etc/ssh/sshd_config

# install chef
# echo -e "\ninstall chef ..."
# gem install chef --no-ri --no-rdoc

# fixing PATH for vagrant
echo 'export PATH=/sbin:/usr/sbin:$PATH' >> /home/vagrant/.bashrc

# install the virtualbox guest additions
# echo -e "\ninstall the virtualbox guest additions ..."
# zypper --non-interactive remove `rpm -qa virtualbox-guest-*` >/dev/null 2>&1
# VBOX_VERSION=$(cat /home/vagrant/.vbox_version)
# mount -o loop /home/vagrant/VBoxGuestAdditions_$VBOX_VERSION.iso /mnt
# sh /mnt/VBoxLinuxAdditions.run
# umount /mnt
