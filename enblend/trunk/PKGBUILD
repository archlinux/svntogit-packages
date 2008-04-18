# $Id$
# Maintainer: tobias <tobias@archlinux.org>
# Contributor: Dominik Ryba <domryba@post.pl>

pkgname=enblend
pkgver=3.0
pkgrel=3
pkgdesc="intelligent blend tool for overlapping picture"
arch=("i686" "x86_64")
license=('GPL')
depends=('libtiff' 'glew>=1.5' 'libxmi' 'freeglut' 'libgl' 'lcms')
makedepends=('boost')
source=(http://dl.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz
        enblend-3.0-amd64_compilation.patch)
url="http://enblend.sourceforge.net"
md5sums=('f80a12ff91a6122c5ea0d102443929da' 'b14bf09229298f59a9aed8e503b3e183')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  if [ "$CARCH" = "x86_64" ]; then
    patch -Np0 -i ../enblend-3.0-amd64_compilation.patch || return 1
  fi
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
