# $Id$
# Maintainer: damir <damir@archlinux.org>

pkgname=gocr
pkgver=0.45
pkgrel=1
pkgdesc="open-source character recognition (OCR)"
arch=("i686" "x86_64")
license=('GPL')
url="http://jocr.sourceforge.net/index.html"
depends=('glibc' 'netpbm') 
conflicts=()
backup=()
install=
source=("http://puzzle.dl.sourceforge.net/sourceforge/jocr/gocr-$pkgver.tar.gz")

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr 
  make || return 1
  make DESTDIR=$startdir/pkg/usr install
}
md5sums=('134d459f64656b201ca66eebafa108f0')
