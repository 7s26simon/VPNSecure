#########################
#	*** STOP DNS LEAKS ***#
#########################

# this script installs VPNSecure, openresolv script, openresolv, set permissions, disable IPv6
# How to run script: sudo sh stopLeak.sh

echo "Uncomment line below to install 64 bit version of VPNSecure"
#wget http://www.vpnsecure.me/files/install && sudo bash install
echo "Uncomment line below to install 32bit version of VPNSecure"
#wget http://www.vpnsecure.me/files/install32 && sudo bash install32
echo downloading resolv script
wget https://github.com/masterkorp/openvpn-update-resolv-conf/blob/master/update-resolv-conf.sh
ls -l update-resolv-conf.sh
chmod +x update-resolv-conf.sh
ls -l update-resolv-conf.sh
echo "updated permissions, moving script"
mv update-resolv-conf.sh /etc/openvpn/update-resolv-conf.sh
echo "installing openresolv"
apt install openresolv -y
echo "Disabling IPv6"
echo "net.ipv6.conf.all.disable_ipv6 = 1" > /etc/sysctl.d/99-sysctl.conf
echo "net.ipv6.conf.default.disable_ipv6 = 1" >>  /etc/sysctl.d/99-sysctl.conf
echo "net.ipv6.conf.lo.disable_ipv6 = 1" >> /etc/sysctl.d/99-sysctl.conf
cat /etc/sysctl.d/99-sysctl.conf
echo "IPv6 disabled. To be sure, go to network settings and also manually disable IPv6"
sysctl -p
echo "If you see 1, ok"
cat /proc/sys/net/ipv6/conf/all/disable_ipv6
echo "OpenResolv installed. Please reboot and connect to VPNSecure. Then go to https://www.dnsleaktest.com/ and you should see your VPN is not leaking DNS"
