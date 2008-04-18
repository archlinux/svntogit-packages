# $Id$
# Maintainer : Tobias Powalowski <tpowa@archlinux.org>

pkgname=archboot
pkgver=2008.03
pkgrel=2
pkgdesc="Advanced, modular arch boot/install image creation utility"
arch=(i686 x86_64)
license=('GPL')
url="http://www.archlinux.org/"
depends=('mkinitcpio>=0.5.18-1' 'mksyslinux>=0.2-2' 'mkpxelinux>=0.2-1' 'mkbootcd>=2008.03-1' 'initscripts>=2008.03-4' 'cvs>=1.11.22-6' 'wget>=1.11-1' 'bash>=3.2.033-2' 'coreutils>=6.10-2' 'cryptsetup>=1.0.6-1' 'dialog>=1.1_20071028-1' 'e2fsprogs>=1.40.8-1' 'findutils>=4.2.33-1' 'gawk>=3.1.6-2' 'grep>=2.5.3-3' 'iputils>=20070202-4' 'jfsutils>=1.1.12-2' 'less>=418-1' 'lvm2>=2.02.33-1' 'mdadm>=2.6.4-1' 'module-init-tools>=3.2.2-6' 'nano>=2.0.7-1' 'ncurses>=5.6-6' 'net-tools>=1.60-13' 'gnu-netcat>=0.7.1-2' 'ntfsprogs>=2.0.0-2' 'pcmciautils>=014-4' 'procps>=3.2.7-4' 'psmisc>=22.6-1' 'reiserfsprogs>=3.6.20-3' 'sed>=4.1.5-3' 'snarf>=7.0-2' 'syslog-ng>=2.0.6-1' 'sysvinit>=2.86-4' 'tar>=1.19-2' 'util-linux-ng>=2.13.0.1-2' 'which>=2.19-2' 'kbd>=1.14.1.20080309-2' 'wireless_tools>=29-2' 'xfsprogs>=2.9.7-1' 'dnsutils>=9.4.2-1' 'hdparm>=8.6-1' 'memtest86+>=2.01-1' 'grub>=0.97-12' 'netkit-telnet>=0.17-7' 'openssh>=4.7p1-6' 'hwdetect>=0.9-1' 'portmap>=6.0-2' 'shadow>=4.0.18.2-2' 'bridge-utils>=1.2-2' 'ifenslave>=1.1.0-3' 'cpufrequtils>=002-3' 'links>=2.1pre33-1' 'tcp_wrappers>=7.6-8' 'dosfstools>=2.11-2' 'glibc>=2.7-9' 'kernel-headers>=2.6.24.3-1' 'kernel26>=2.6.24.4-1' 'xinetd>=2.3.14-3' 'naim>=0.11.8.3.1-1' 'kexec-tools>=1.101-7' 'ppp>=2.4.4-6' 'rp-pppoe>=3.8-3' 'lilo>=22.8-2' 'iptables>=1.4.0-2' 'capi4k-utils>=050718-6' 'isdn4k-utils>=3.2p1-3' 'ntfs-3g>=1.2310-1' 'pciutils>=2.2.8-3' 'usbutils>=0.73-5' 'vpnc>=0.5.1-2' 'openvpn>=2.0.9-3' 'bcm43xx-fwcutter>=006-2' 'wpa_supplicant>=0.5.10-1' 'rsync>=3.0.0-1' 'gzip>=1.3.12-4' 'libdownload>=1.3-1' 'libarchive>=2.4.12-1' 'device-mapper>=1.02.24-1' 'screen>=4.0.3-5' 'libelf>=0.8.10-3' 'pam>=0.99.9.0-2' 'cracklib>=2.8.10-5' 'nfs-utils>=1.1.0-4' 'nfsidmap>=0.20-2' 'readline>=5.2-7' 'acl>=2.2.47-1' 'attr>=2.4.41-1' 'pcre>=7.6-3' 'cpio>=2.9-3' 'fuse>=2.7.3-1' 'klibc>=1.5-5' 'libusb>=0.1.12-3' 'vi>=7.1.267-1' 'lzo2>=2.02-3' 'libsasl>=2.1.22-5' 'libldap>=2.3.40-1' 'gpm>=1.20.1-7' 'libevent>=1.3e-1' 'gcc-libs>=4.3.0-1' 'sdparm>=1.02-2' 'licenses>=2.3-1' 'pptpclient>=1.7.1-3' 'madwifi>=0.9.4.3382-3' 'madwifi-utils>=0.9.4.3382-1' 'rt2x00-rt61-fw>=1.2-2' 'rt2x00-rt71w-fw>=1.8-2' 'ndiswrapper>=1.52-2' 'ndiswrapper-utils>=1.52-1' 'zd1211-firmware>=1.4-2' 'wlan-ng26-utils>=0.2.8-2' 'wlan-ng26>=0.2.8-15' 'ipw2100-fw>=1.3-2' 'ipw2200-fw>=3.0-2' 'iwlwifi-3945-ucode>=2.14.1.5-2' 'iwlwifi-4965-ucode>=4.44.1.20-1' 'smbclient>=3.0.28A-1' 'bittorrent>=5.0.6-2' 'dhcpcd>=3.2.1-1' 'openssl>=0.9.8g-2' 'git>=1.5.4.4-1' 'dmraid>=1.0.0.rc14-4' 'linux-atm>=2.4.1-3' 'netcfg>=2.0.6-1' 'tiacx>=20080210-2' 'tiacx-firmware>=2-1' 'parted>=1.8.8-1' 'atl2>=2.0.4')
source=(ftp://ftp.archlinux.org/other/$pkgname/$pkgname-$pkgver-$pkgrel.tar.bz2 vmware-detect.c)
backup=('etc/archboot/archbootcd.conf' 'etc/archboot/archbootcd-lowmem.conf' 'etc/archboot/archpxelinux.conf' \
'etc/archboot/archsyslinux.conf' 'etc/archboot/install.conf' 'etc/archboot/install-lowmem.conf')
install=archboot.install

### to bump the depends list use this:
#for i in $(grep ^depends= PKGBUILD | sed  -e 's/depends=(//g' -e 's/)//g'); do sed -i -e "s/$(echo $i)/$(echo $i | sed -e "s/>=.*/>=$(pacman -Qi $(echo $i | sed -e "s/'//g" -e 's/>=.*//g') | grep ^Version | sed -e 's/.*: //g')'/g")/g" PKGBUILD; done

build()
{
  cd $startdir/src/$pkgname-$pkgver-$pkgrel

  if [ "$CARCH" = "x86_64" ]; then
    # fix tag for checkout
    sed  -i -e "s:CURRENT:CURRENT-64:g" install.conf
  fi
  mkdir -p $startdir/pkg/etc/archboot/
  for i in base capi4k cpufreq etc grub iptables isdn kexec lilo linux_atm naim net netcfg openvpn pacman pam ppp pppoe pptpclient remote shadow udev vpnc wireless; do
  cp -r $i $startdir/pkg/etc/archboot/$i
  done
  for i in hooks/*; do install -m644 -D $i $startdir/pkg/lib/initcpio/$i ; done
  for i in install/*; do install -m644 -D $i $startdir/pkg/lib/initcpio/$i ; done
  for i in *.conf; do install -m644 -D $i $startdir/pkg/etc/archboot/$i ; done
  for i in scripts/*; do install -m755 -D $i $startdir/pkg/etc/archboot/$i ; done
  for i in scripts/config/*; do install -m644 -D $i $startdir/pkg/etc/archboot/$i ; done
  # vmware-detect
  cd $startdir/src
  gcc -o vmware-detect vmware-detect.c
  install -D -m 755 vmware-detect $startdir/pkg/usr/bin/vmware-detect
}
md5sums=('0532832387d3f949e0d3c75c7ca33db8'
         '7e2b03463747cb22ab388e79a09fa0cb')
