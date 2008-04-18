#$Id$
# Maintainer: tobias <tobias@arhlinux.org>

pkgname=exiv2
pkgver=0.16
pkgrel=2
pkgdesc="Exif and Iptc metadata manipulation library and tools."
arch=(i686 x86_64)
url="http://exiv2.org"
license=('GPL2')
depends=('gcc-libs' 'zlib' 'expat')
options=('!libtool')
source=(http://www.exiv2.org/${pkgname}-${pkgver}.tar.gz \
        exiv2_gcc-4.3.diff)
md5sums=('a6e72343885d990c593bd013c6c988f1' 'b0070a6be9566b76a2b25c07bd3dfc09')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  patch -Np1 -i ../exiv2_gcc-4.3.diff || return 1
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
