# $Id$
# Maintainer: damir <damir@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>

pkgname=lcab
pkgver=1.0b12
pkgrel=1
pkgdesc="A program to make Microsoft cabinet files (.cab) (aka cablinux)"
arch=("i686" "x86_64")
license=('GPL')
url="http://coding.wooyayhoopla.be/lcab/"
depends=("glibc")
conflicts=()
backup=()
install=
source=(http://coding.wooyayhoopla.be/lcab/sources/$pkgname-$pkgver.tar.gz)

build() {
  cd $startdir/src/$pkgname-$pkgver
  make || return 1
  mkdir -p $startdir/pkg/usr/bin
  cp lcab $startdir/pkg/usr/bin
}
md5sums=('9403e08f53fcf262e25641a9b900d4de')
