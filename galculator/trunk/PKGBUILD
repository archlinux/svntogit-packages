# $Id$
# Maintainer: aurelien <aurelien@archlinux.org>
pkgname=galculator
pkgver=1.3.1
pkgrel=1
pkgdesc="A GTK2-based scientific calculator"
arch=('i686' 'x86_64')
url="http://galculator.sourceforge.net/"
license=('GPL')
depends=('libglade')
source=(http://dl.sourceforge.net/sourceforge/galculator/${pkgname}-${pkgver}.tar.bz2)
md5sums=('683a4f0c2cb3d1f56b4c5610fc495c5f')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}

  # build and install.
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install
}

