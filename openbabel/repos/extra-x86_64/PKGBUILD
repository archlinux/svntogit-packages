# $Id$
# Maintainer: damir <damir@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>

pkgname=openbabel
pkgver=2.1.1
pkgrel=1
pkgdesc="A library designed to interconvert between many file formats used in molecular modeling and computational chemistry."
arch=('i686' 'x86_64')
url="http://openbabel.sourceforge.net/"
license=('GPL')
depends=('gcc' 'libxml2')
options=('!libtool')
source=("http://puzzle.dl.sourceforge.net/sourceforge/openbabel/$pkgname-$pkgver.tar.gz")

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr install
}
md5sums=('a2a002c6913d6fb94fdc7dede2166194')
