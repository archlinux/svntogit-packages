# $Id$
#Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=xorg-util-macros
pkgver=1.1.5
pkgrel=1
pkgdesc="X.Org Autotools macros"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
source=(${url}/releases/individual/util/util-macros-${pkgver}.tar.bz2)
md5sums=('51952682d8b42aeda3af5cee0133ce2c')

build() {
  cd ${startdir}/src/util-macros-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
