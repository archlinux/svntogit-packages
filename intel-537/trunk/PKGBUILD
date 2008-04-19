# $Id$
# Maintainer : Tobias Powalowski <tpowa@archlinux.org>

_kernver=2.6.25-ARCH;

pkgname=intel-537
pkgver=2.60.80.0
pkgrel=55
pkgdesc="Intel Modem Drivers for 537 chipsets. For stock arch 2.6 kernel"
arch=(i686 x86_64)
license=('custom:"INTEL537"')
url="http://linmodems.technion.ac.il/packages/Intel/"
depends=('intel-537-utils' 'kernel26>=2.6.25' 'kernel26<2.6.26')
source=(http://downloadmirror.intel.com/9284/eng/Intel-537EP-2.70.95.0-suse9.3.tgz flip.patch compile.patch \
	module-parm.patch pm_unregister.patch asmlinkage.patch kernel-2.6.19.patch kernel-2.6.20.patch kernel-2.6.24.patch)
install=intel-537.install

build() {
  cd $startdir/src/Intel-537
  patch -Np0 -i ../flip.patch || return 1
  patch -Np0 -i ../compile.patch || return 1
  patch -Np1 -i ../module-parm.patch || return 1
  patch -Np1 -i ../pm_unregister.patch || return 1
  patch -Np1 -i ../asmlinkage.patch || return 1
  patch -Np0 -i ../kernel-2.6.19.patch || return 1
  patch -Np0 -i ../kernel-2.6.20.patch || return 1
  patch -Np0 -i ../kernel-2.6.24.patch || return 1
  # fix makefile
  sed -i -e "s/\`uname -r\`/${_kernver}/g" makefile
  sed -i -e "s/\`uname -r\`/${_kernver}/g" config_check
  make KDIR=/lib/modules/${_kernver}/build KERNEL_SOURCE_PATH=/lib/modules/${_kernver}/build 537 || return 1
  # Install kernel module
  install -D -m 644 Intel537.ko $startdir/pkg/lib/modules/${_kernver}/kernel/drivers/net/intel537.ko || return 1
  sed -i -e "s/KERNEL_VERSION=.*/KERNEL_VERSION=${_kernver}/g" $startdir/intel-537.install
 }
