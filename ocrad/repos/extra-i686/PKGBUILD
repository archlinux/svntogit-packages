# $Id$
# Maintainer: damir <damir@archlinux.org>

pkgname=ocrad
pkgver=0.17
pkgrel=1
pkgdesc="OCR (Optical Character Recognition) program implemented as a filter and based on a feature extraction method"
arch=("i686" "x86_64")
url="http://www.gnu.org/software/ocrad/ocrad.html"
license=('GPL3')
depends=('gcc-libs')
source=("http://ftp.gnu.org/gnu/ocrad/ocrad-$pkgver.tar.bz2")
md5sums=('687c213b3334d5a6c2dcef97805c5882')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr install
}

