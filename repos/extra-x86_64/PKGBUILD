# $Id$
# Maintainer: kevin <kevin@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>

pkgname=graphviz
pkgver=2.18
pkgrel=2
pkgdesc="Creates acircular graph images"
arch=('i686' 'x86_64')
license=('CPL')
 depends=('gd>=2.0.35' 'librsvg>=2.22.2' 'libxaw>=1.0.4' 'libtool>=2.2')
makedepends=('bison' 'flex')
url="http://www.graphviz.org/"
options=('!libtool' 'force')
source=(${url}/pub/${pkgname}/ARCHIVE/${pkgname}-${pkgver}.tar.gz)
install=graphviz.install
md5sums=('7df2705482c86fc7a9ee5f0446ed0b9e')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --without-gnomeui \
    --disable-tcl --disable-sharp --disable-ruby --disable-python \
    --disable-lua --disable-guile --disable-perl
  make || return 1
  make DESTDIR=${startdir}/pkg install

  # Remove docs.
  rm -rf ${startdir}/pkg/usr/share/graphviz/doc

  #install missing headers
#  install -m644 ${startdir}/src/${pkgname}-${pkgver}/lib/common/arith.h ${startdir}/pkg/usr/include/graphviz/
}
