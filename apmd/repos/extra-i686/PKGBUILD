# $Id$
# Maintainer: dorphell <dorphell@archlinux.org>
pkgname=apmd
pkgver=3.0.2
pkgrel=5
pkgdesc="Set of tools for managing notebook power consumption"
depends=('glibc')
makedepends=('libxaw')
backup=('etc/apmd_proxy')
source=(http://www.worldvisions.ca/~apenwarr/apmd/$pkgname-$pkgver.tar.gz \
  apmd-$pkgver.patch apmd.rc)
md5sums=('23ce275766441c59b6b47c002f9098eb' 'a27ecf771d9dc5d4cf57b9c79972ec46'\
         'e84ca8f326aeb5b982c1f6585b183d70')

build() {
  cd $startdir/src/$pkgname
  patch -Np1 -i ../apmd-$pkgver.patch
  make || return 1
  mkdir -p $startdir/pkg/{usr,etc}
  make PREFIX=$startdir/pkg/usr APMD_PROXY_DIR=$startdir/pkg/etc install
  install -D -m755 ../apmd.rc $startdir/pkg/etc/rc.d/apmd
  rm -rf $startdir/pkg/usr/man/fr
}
