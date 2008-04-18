# $Id$
# Maintainer: Judd Vinet <jvinet@zeroflux.org>
pkgname=ifenslave
pkgver=1.1.0
pkgrel=3
pkgdesc="Utility for bonding ethernet interfaces"
license=('GPL2')
arch=(i686 x86_64)
url="http://www.kernel.org"
depends=('glibc')
source=(http://www.archlinux.org/~tpowa/ifenslave/ifenslave.c bonding.conf.d)
md5sums=('49f757f658c6cbd1a5c125ea2bb5aa23'
         '397fccbf574d5082c7a3c8d3793dc000')


build() {
  cd $startdir/src
  gcc $CFLAGS -I/usr/src/linux/include ifenslave.c -o ifenslave || return 1
  install -D -m755 ifenslave $startdir/pkg/sbin/ifenslave
  install -D -m644 bonding.conf.d $startdir/pkg/etc/conf.d/bonding
}
