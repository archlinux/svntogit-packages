# $Id$
# Maintainer : Tobias Powalowski <tpowa@archlinux.org>

pkgname=intel-536ep
name=intel-536EP
pkgver=2.56.76.0
pkgrel=54
_kernver=2.6.24-ARCH
pkgdesc="Intel Modem Drivers for 536EP chipset. For stock arch 2.6 kernel "
arch=(i686)
license=('custom:"INTEL536"')
url="http://linmodems.technion.ac.il/packages/Intel/"
depends=('intel-536ep-utils' 'kernel26>=2.6.24.3-4' 'kernel26<=2.6.25-0')
source=(http://linmodems.technion.ac.il/packages/intel/Philippe.Vouters/intel-536EP-2.56.76.0_23_02_2007.tgz kernel-2.6.24.patch)
install=intel-536EP.install

build() {
  cd $startdir/src/intel-536EP-2.56.76.0
  patch -Np0 -i ../kernel-2.6.24.patch || return 1
  # fix makefile
  sed -i -e "s/\`uname -r\`/${_kernver}/g" makefile
  sed -i -e "s/\`uname -r\`/${_kernver}/g" config_check
  make KERNEL_SOURCE_PATH=/lib/modules/${_kernver}/build KDIR=/lib/modules/${_kernver}/build 536 || return 1 
  #Install kernel module
  install -D -m 644  Intel536.ko $startdir/pkg/lib/modules/${_kernver}/kernel/drivers/net/intel536.ko || return 1
  sed -i -e "s/KERNEL_VERSION=.*/KERNEL_VERSION=${_kernver}/g" $startdir/intel-536EP.install
 }
