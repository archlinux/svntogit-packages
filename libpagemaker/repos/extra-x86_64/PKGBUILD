# Maintainer: AndyRTR <andyrtr@archlinux.org>

pkgname=libpagemaker
pkgver=0.0.4
pkgrel=3
pkgdesc="a library that parses the file format of Aldus/Adobe PageMaker documents"
arch=('x86_64')
url="https://wiki.documentfoundation.org/DLP/Libraries/libpagemaker"
license=('MPL')
source=(https://dev-www.libreoffice.org/src/${pkgname}/${pkgname}-${pkgver}.tar.xz
        libpagemaker-0.0.4-const-ref-exception.patch)
depends=('librevenge')
makedepends=('boost' 'doxygen')
sha256sums=('66adacd705a7d19895e08eac46d1e851332adf2e736c566bef1164e7a442519d'
            '91d9ce17b04e2fb5009967bb38da3405cb231b05c2cb29e204aaab328a58f7e2')

prepare() {
  cd ${pkgname}-${pkgver}
  # fix build - https://bugs.archlinux.org/task/62165
  patch -Np1 -i ../libpagemaker-0.0.4-const-ref-exception.patch
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

check() {
  cd ${pkgname}-${pkgver}
  make check
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

