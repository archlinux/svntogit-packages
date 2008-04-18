# $Id$
# Maintainer: damir <damir@archlinux.org>
# Contributor: Frank Peters <frank.peters@comcast.net>

pkgname=gifsicle
pkgver=1.48
pkgrel=1
pkgdesc="Gifsicle twaddles GIF image files in a variety of ways -- with LZW compression."
arch=("i686" "x86_64")
license=('GPL2')
url="http://www.lcdf.org/gifsicle/"
source=(http://www.lcdf.org/$pkgname/$pkgname-$pkgver.tar.gz)
depends=('libsm' 'libx11')


build() {
     cd $startdir/src/$pkgname-$pkgver
     ./configure --prefix=/usr
     make prefix=$startdir/pkg/usr install
}


md5sums=('3857d3d920180f2b9bac32c7b1a2e276')
