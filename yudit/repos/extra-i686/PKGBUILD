# $Id$
# Maintainer: damir <damir@archlinux.org>
# Contributor: damir <damir@archlinux.org>

pkgname=yudit
pkgver=2.9.0
pkgrel=1
pkgdesc="(Y)unicode text editor for all unices"
arch=('i686' 'x86_64')
url="http://www.yudit.org/"
depends=('libx11' 'gcc-libs')
license=('GPL')

source=(http://yudit.org/download/yudit-$pkgver.tar.gz)

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure
  make || return 1
  make prefix=$startdir/pkg/usr install || return 1
}

md5sums=('b214c19b98b8ed7854df8d1cf09b6261')
