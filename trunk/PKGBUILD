# Maintainer: AndyRTR <andyrtr@archlinux.org>
# Contributor:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Yue

pkgname=libetonyek
pkgver=0.1.10
pkgrel=3
pkgdesc='Library and a set of tools for reading and converting Apple Keynote presentations'
arch=('x86_64')
url="https://wiki.documentfoundation.org/DLP/Libraries/libetonyek"
license=('MPL')
depends=('libxml2' 'zlib' 'libwpd' 'librevenge' 'liblangtag')
makedepends=('boost' 'cppunit' 'gperf' 'doxygen' 'glm' 'mdds')
source=(https://dev-www.libreoffice.org/src/$pkgname/$pkgname-$pkgver.tar.xz)
sha256sums=('b430435a6e8487888b761dc848b7981626eb814884963ffe25eb26a139301e9a')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --with-mdds=2.0
  make
}

check() {
  cd $pkgname-$pkgver
  make check
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
