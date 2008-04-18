# $Id$
# Maintainer: Alexander Baldeck <alexander@archlinux.org>
# Contributer: dorphell <dorphell@archlinux.org>
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>
pkgname=cdtool
pkgver=2.1.8
pkgrel=1
pkgdesc="A package of command-line utilities to play and catalog audio CD-ROMs."
arch=(i686 x86_64)
depends=('bash')
source=(http://hinterhof.net/cdtool/dist/$pkgname-$pkgver.tar.gz)
url="http://hinterhof.net/cdtool/"

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
md5sums=('7b19b6f68d2c648296378b784d5f7681')
