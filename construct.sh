######################################################################
# Raspbian customized version for Chinese(Simplified) users
# Construction tool
# 
# ver 1.0 
# 
# Run this script on normal user pi, via SSH or Serial. 
######################################################################

# Avoid original raspi-config autostart on root trap
sudo rm /etc/profile.d/raspi-config.sh
sudo -i

# Locales, keyboard & timezone
# Locales
#  /etc/locale.gen
#  Comment out: en_GB.UTF-8 UTF-8
#  Uncomment: # en_US.UTF-8 UTF-8
#  Uncomment: # zh_CN.GBK GBK
#  Uncomment: # zh_CN.UTF-8 UTF-8
# Default locale
#  /etc/default/locale
#  LANG=en_GB.UTF-8 -> LANG=zh_CN.UTF-8 UTF-8
sed -i -e 's/en_GB.UTF-8 UTF-8/# en_GB.UTF-8 UTF-8/' /etc/locale.gen
sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
sed -i -e 's/# zh_CN.GBK GBK/zh_CN.GBK GBK/' /etc/locale.gen
sed -i -e 's/# zh_CN.UTF-8 UTF-8/zh_CN.UTF-8 UTF-8/' /etc/locale.gen
sed -i -e 's/LANG=en_GB.UTF-8/LANG=zh_CN.UTF-8 UTF-8/' /etc/default/locale
dpkg-reconfigure --frontend=noninteractive locales


reboot
###########################################################
# Locale changed, reboot here.
# (any way to avoid reboot?)
###########################################################
sudo -i

# Keyboard
#  /etc/default/keyboard
#  pc105 -> pc104
#  gb -> us
sed -i -e 's/pc105/pc104/' /etc/default/keyboard
sed -i -e 's/gb/us/' /etc/default/keyboard
dpkg-reconfigure --frontend=noninteractive keyboard-configuration
invoke-rc.d keyboard-setup start

# Timezone
#  /etc/timezone
#  -> Asia/Shanghai
echo "Asia/Shanghai" > /etc/timezone
dpkg-reconfigure --frontend=noninteractive tzdata

# APT and software packs
#  Change mirror to South Korea
#  Install: SCIM-Pinyin, TightVNCserver
echo "deb http://mirror.devunt.kr/raspbian/raspbian/ wheezy main contrib non-free rpi" > /etc/apt/sources.list
apt-get -y update
apt-get -y dist-upgrade
apt-get -y install scim-pinyin tightvncserver

# Install raspi-autoconfig script files
# ( Put files raspi-autoconfig-1stboot.sh, raspi-autoconfig.py and 
#   autoconfig.ini into /home/pi/ via SFTP first, and then run this 
#   script. )
# 
#  raspi-autoconfig-1stboot.sh, raspi-autoconfig.py
#   could be downloaded at https://github.com/shamiao/raspi-autoconfig
#  autoconfig.ini for Chinese users, with configured options by this script
#   omitted, could be downloaded at
#   https://github.com/shamiao/raspbian-zhcn-customized
cd ~pi
chown 0:0 autoconfig.ini
mv autoconfig.ini /boot/
chown 0:0 raspi-autoconfig-1stboot.sh
chmod 644 raspi-autoconfig-1stboot.sh
mv raspi-autoconfig-1stboot.sh /etc/profile.d/
chown 0:0 raspi-autoconfig.py
chmod +x raspi-autoconfig.py
mv raspi-autoconfig.py /usr/bin

halt
###########################################################
# Script end.
# (raspi-autoconfig will run on next startup)
###########################################################

