# $Id$
# Maintainer: Judd Vinet <jvinet@zeroflux.org>
pkgname=vconfig
pkgver=1.9
pkgrel=1.1
pkgdesc="VLAN configuration utility"
arch=(i686 x86_64)
url="http://www.candelatech.com/~greear/vlan.html"
depends=('glibc')
source=(http://www.candelatech.com/~greear/vlan/vlan.${pkgver}.tar.gz)
md5sums=('5f0c6060b33956fb16e11a15467dd394')

build() {
  cd $startdir/src/vlan
  make clean
  make || return 1
  install -D -m755 vconfig $startdir/pkg/usr/sbin/vconfig
  install -D -m644 vconfig.8 $startdir/pkg/usr/man/man8/vconfig.8
}
