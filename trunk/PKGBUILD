# $Id$
# Maintainer: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
pkgname=xf86dgaproto
pkgver=2.0.3
pkgrel=1
pkgdesc="X11 Direct Graphics Access extension wire protocol"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
source=(${url}/releases/individual/proto/${pkgname}-${pkgver}.tar.bz2)

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
md5sums=('42fdcebc66efac02ab4beec2b1b0ad6e')
