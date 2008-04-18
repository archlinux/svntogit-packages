# $Id$
#Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=resourceproto
pkgver=1.0.2
pkgrel=1
pkgdesc="X11 Resource extension wire protocol"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
source=(${url}/releases/individual/proto/${pkgname}-${pkgver}.tar.bz2)
md5sums=('b823b314e37eb19dae1f297951d2e933')
sha1sums=('ac22c2e439067185ea169d20677f74321da7b34b')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
