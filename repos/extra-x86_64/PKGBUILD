# $Id$
#Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=xorg-fonts-cyrillic
pkgver=1.0.0
pkgrel=3
pkgdesc="X.org cyrillic fonts"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
depends=(xorg-fonts-encodings xorg-fonts-alias xorg-font-utils fontconfig)
install=xfonts.install
source=(${url}/releases/individual/font/font-cronyx-cyrillic-${pkgver}.tar.bz2
        ${url}/releases/individual/font/font-misc-cyrillic-${pkgver}.tar.bz2
        ${url}/releases/individual/font/font-screen-cyrillic-${pkgver}.tar.bz2
        ${url}/releases/individual/font/font-winitzki-cyrillic-${pkgver}.tar.bz2)
md5sums=(22b451e7230b8c003cfc496ee2d360cc 3596907d7a2a99c81d8de99bc4552b6a
         aea02d9dff03e0e1a3de85364367c0c6 b99b02aff36a88ca3379715423c60303)

build() {
  cd ${startdir}/src
  for dir in font-*-cyrillic-${pkgver}; do
    pushd ${dir}
      ./configure --prefix=/usr \
                  --with-mapfiles=/usr/share/fonts/util \
		  --with-fontdir=/usr/share/fonts/cyrillic
      make || return 1
      make DESTDIR=${startdir}/pkg install || return 1
    popd
  done
  rm -f ${startdir}/pkg/usr/share/fonts/*/fonts.*
    
}

