# $Id$
# Maintainer: Jeff 'codemac' Mickey <jeff@archlinux.org>

pkgname=cvsps
pkgver=2.1
pkgrel=1
pkgdesc="Generating 'patchset' information from a CVS repository."
url="http://www.cobite.com/cvsps/"
license="GPL"
depends=('zlib')
makedepends=()
backup=()
source=(http://www.cobite.com/$pkgname/$pkgname-$pkgver.tar.gz)

build() {
  cd $startdir/src/$pkgname-$pkgver
  sed -e "s#prefix?=/usr/local#prefix?=$startdir/pkg/usr#" -i Makefile
  sed -e "s#/share##g" -i Makefile
  make || return 1
  make install
}

md5sums=('bde2110ed9f5d14de8f8cb04e9d596fe')
