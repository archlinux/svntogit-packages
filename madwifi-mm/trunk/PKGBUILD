# $Id$
# Originally by kleptophobiac <kleptophobiac@gmail.com>
# Modified by James Rayner for the repositories <iphitus@gmail.com>

_kernver=2.6.23-mm

pkgname=madwifi-mm
pkgver=0.9.3.1.99
pkgrel=1
pkgdesc="Madwifi drivers for Atheros wireless chipsets. For kernel26mm."
arch=(i686 x86_64)
url="http://madwifi.org"
depends=('madwifi-utils' 'kernel26mm')
makedepends=('sharutils')
provides=("madwifi-ng")
conflicts=("madwifi-ng")
replaces=("madwifi-ng")

install=madwifi-ng.install
source=(http://www.archlinux.org/~alexander/src/madwifi-0.9.3.1.99.tar.bz2)

build() {
  cd $startdir/src/madwifi-$pkgver
  sed -i 's|COPTS+|#COPTS+|' Makefile.inc
  make KERNELPATH=/lib/modules/$_kernver/build KERNELRELEASE=$_kernver modules|| return 1
  make KERNELPATH=/lib/modules/$_kernver/build KERNELRELEASE=$_kernver modules \
  DESTDIR=$startdir/pkg KERNELRELEASE=$_kernver install-modules
  sed -i -e "s/KERNEL_VERSION='.*'/KERNEL_VERSION='${_kernver}'/" $startdir/*.install
}
