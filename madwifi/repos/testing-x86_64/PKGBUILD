# $Id$
# Originally by kleptophobiac <kleptophobiac@gmail.com>
# Modified by James Rayner for the repositories <iphitus@gmail.com>

_kernver=2.6.25-ARCH;

pkgname=madwifi
pkgver=0.9.4.3382
pkgrel=4
pkgdesc="Madwifi drivers for Atheros wireless chipsets. For stock arch 2.6 kernel"
arch=(i686 x86_64)
license=('GPL')
url="http://madwifi.org"
depends=('madwifi-utils' 'kernel26>=2.6.25' 'kernel26<2.6.26')
makedepends=('sharutils')
install=madwifi-ng.install
# subversion source: svn checkout http://svn.madwifi.org/madwifi/trunk madwifi
source=(ftp://ftp.archlinux.org/other/madwifi/madwifi-${pkgver}.tar.bz2
	#http://downloads.sourceforge.net/madwifi/madwifi-${pkgver}.tar.gz
	)
md5sums=('e490429c026b5faff06696f947d9a39d')

build() {
  [ "${CARCH}" == "i686" ] && export ARCH=i386

  #cd $startdir/src/$pkgname-$pkgver
  cd $startdir/src/$pkgname
  sed -i -e 's/-Werror//g' Makefile.inc
  make KERNELPATH=/lib/modules/$_kernver/build KERNELRELEASE=$_kernver modules|| return 1
  make KERNELPATH=/lib/modules/$_kernver/build KERNELRELEASE=$_kernver modules \
       DESTDIR=$startdir/pkg KERNELRELEASE=$_kernver install-modules
  sed -i -e "s/KERNEL_VERSION='.*'/KERNEL_VERSION='${_kernver}'/" $startdir/*.install

  # install to wireless kernel directory
  mkdir -p $startdir/pkg/lib/modules/$_kernver/kernel/drivers/net/wireless/madwifi
  mv $startdir/pkg/lib/modules/$_kernver/net/* $startdir/pkg/lib/modules/$_kernver/kernel/drivers/net/wireless/madwifi
  rm -r $startdir/pkg/lib/modules/$_kernver/net/
}
