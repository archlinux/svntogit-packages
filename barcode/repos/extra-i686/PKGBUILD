# $Id$
# Maintainer: damir <damir@archlinux.org>

pkgname=barcode
pkgver=0.98
pkgrel=1
pkgdesc="GNU Barcode is a tool to convert text strings to printed bars."
url="http://www.gnu.org/software/barcode/barcode.html"
depends=(glibc)
conflicts=()
backup=()
install=
source=(ftp://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.gz)

md5sums=('7f10c3307b84a19a4ab2fa4b3f2974da')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr install
}
