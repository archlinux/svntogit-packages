# Maintainer: AndyRTR <andyrtr@archlinux.org>

pkgname=libabw
pkgver=0.1.3
pkgrel=3
pkgdesc="a library that parses the file format of AbiWord documents"
arch=('x86_64')
url="https://wiki.documentfoundation.org/DLP/Libraries/libabw"
license=('MPL')
depends=('librevenge' 'libxml2' )
makedepends=('doxygen' 'gperf' 'boost')
source=(https://dev-www.libreoffice.org/src/$pkgname/$pkgname-$pkgver.tar.xz)
sha256sums=('e763a9dc21c3d2667402d66e202e3f8ef4db51b34b79ef41f56cacb86dcd6eed')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd $pkgname-$pkgver
  make -k check
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
