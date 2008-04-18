# $Id$
# Originally by kleptophobiac <kleptophobiac@gmail.com>
# Modified by James Rayner for the repositories <iphitus@gmail.com>

pkgname=madwifi-utils
pkgver=0.9.4.3382
_kernver=2.6.24-ARCH
pkgrel=1
pkgdesc="Userspace tools of madwifi drivers for Atheros wireless chipsets."
arch=(i686 x86_64)
license=('GPL')
url="http://madwifi.org"
depends=('wireless_tools')
makedepends=('sharutils')
provides=("madwifi-ng-utils")
conflicts=("madwifi-ng-utils")
replaces=("madwifi-ng-utils")
# subversion source: svn checkout http://svn.madwifi.org/madwifi/trunk madwifi
source=(ftp://ftp.archlinux.org/other/madwifi/madwifi-${pkgver}.tar.bz2
	#http://downloads.sourceforge.net/sourceforge/madwifi/madwifi-$pkgver.tar.gz
	)
md5sums=('e490429c026b5faff06696f947d9a39d')

build() {
  [ "${CARCH}" == "i686" ] && export ARCH=i386

  export KERNELPATH=/lib/modules/${_kernver}/build
  #cd $startdir/src/madwifi-$pkgver
  cd $startdir/src/madwifi
  make tools|| return 1
  make DESTDIR=$startdir/pkg \
       BINDIR=/usr/bin \
       MANDIR=/usr/share/man \
       install-tools
}
