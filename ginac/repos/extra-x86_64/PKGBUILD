# $Id$
# Maintainer: Thomas Baechler <thomas@archlinux.org>

pkgname=ginac
pkgver=1.4.1
pkgrel=1
pkgdesc="set of libraries to allow the creation of integrated systems that embed symbolic manipulations"
arch=('i686' 'x86_64')
url="http://www.ginac.de/"
license=("GPL")
depends=('cln>=1.2.0')
makedepends=('transfig')
source=(http://www.ginac.de/$pkgname-$pkgver.tar.bz2)
md5sums=('37356db3fe520498f2857e3ed6daec82')
options=(!libtool)

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make check
  make DESTDIR=$startdir/pkg install
}
