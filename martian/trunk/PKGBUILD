# $Id$
# Maintainer:
# Contributor: Steve Vialle <steve_v@orcon.net.nz>

pkgname=martian
pkgver=20061203
pkgrel=12
license=("GPL" "custom:Agere Systems license")
arch=('i686')
_kernver=2.6.24-ARCH
pkgdesc="Alternative drivers for the Mars chipset Lucent LT Winmodem (PCI). For stock kernel26" 
url="http://martian.barrelsoutofbond.org/"
install=martian.install 
source=(http://www.barrelsoutofbond.org/downloads/martian/martian-full-${pkgver}.tar.gz martian.rc.d
	kernel-2.6.24.patch) 
depends=('kernel26>=2.6.24.3-4' 'kernel26<=2.6.25-0' 'glibc' 'martian-utils')
options=('!strip')
replaces=('ltmodem')

build() { 

#Build
  cd $startdir/src/martian
  patch -Np0 -i ../kernel-2.6.24.patch || return 1
  sed -i -e "s#\$(shell uname -r)#$_kernver#g" $startdir/src/martian/kmodule/Makefile
  cd $startdir/src/martian && make KERNEL_DIR=/usr/src/linux-${_kernver} all || return 1 
#Install kernel modules
  install -D -m 644 $startdir/src/martian/kmodule/martian_dev.ko $startdir/pkg/lib/modules/${_kernver}/kernel/drivers/net/martian_dev.ko

#install helper app
#  install -D -m 755 $startdir/src/martian/helper/martian_helper $startdir/pkg/usr/sbin/martian_helper

#Install rc script
#  install -D -m 755 $startdir/src/martian.rc.d $startdir/pkg/etc/rc.d/martian
#
#  sed -i -e "s/KERNEL_VERSION=.*/KERNEL_VERSION=${_kernver}/g" $startdir/martian.install
}  

