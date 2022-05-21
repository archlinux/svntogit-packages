# Maintainer: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Jeff 'codemac' Mickey <jeff@archlinux.org>

pkgname=cppunit
pkgver=1.15.1
pkgrel=3
pkgdesc="A C++ unit testing framework"
arch=('x86_64')
url="https://www.freedesktop.org/wiki/Software/cppunit"
license=('LGPL')
depends=('sh' 'gcc-libs')
makedepends=('doxygen')
options=('!emptydirs')
source=(https://dev-www.libreoffice.org/src/${pkgname}-${pkgver}.tar.gz)
sha256sums=('89c5c6665337f56fd2db36bc3805a5619709d51fb136e51937072f63fcc717a7')

build() {
   cd ${pkgname}-${pkgver}
   ./configure --prefix=/usr --disable-static
   sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
   make
}

check() {
  cd ${pkgname}-${pkgver}
  make check
}

package() {
   cd ${pkgname}-${pkgver}
   make DESTDIR="${pkgdir}" install
}
